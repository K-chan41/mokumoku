import { Calendar } from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
// import './main.css';

const fetchEvents = () => {
    return new Promise(async (resolve, reject) => {
        try {
            const response = await fetch("/api/me/events")
            const data = await response.json()
            resolve(data)
        } catch {
            const message = "エラーが発生しました。運営にお問い合わせください。"
            alert(message)
            reject(message)
        }
    })
}

document.addEventListener('DOMContentLoaded',  async () => {
    const calendarEl = document.getElementById('calendar');
    if (!calendarEl) return;

    const { events } = await fetchEvents()
    const calendar = new Calendar(calendarEl, {
        plugins: [ interactionPlugin, dayGridPlugin, timeGridPlugin, listPlugin ],
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: false
        },
        initialDate: new Date(),
        // navLinks: true, // can click day/week names to navigate views
        editable: true,
        dayMaxEvents: true, // allow "more" link when too many events
        locale: 'ja',
        events: events
    });
    calendar.render();
});
