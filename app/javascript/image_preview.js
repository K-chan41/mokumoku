document.addEventListener('DOMContentLoaded', () => {
    const elements = document.querySelectorAll('.js-file-select-preview')
    if (!elements) return

    elements.forEach((element) => {
        const previewElement = document.querySelector(element.dataset.target)
        element.addEventListener('change', (e) => {
            const reader  = new FileReader();
            reader.onloadend = () => {
                previewElement.src = reader.result;
            }
            const file = e.target.files[0]
            if (file) {
                reader.readAsDataURL(file);
            }
        })
    })
})
