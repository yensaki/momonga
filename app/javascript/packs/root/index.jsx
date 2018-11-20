import React from "react"
import ReactDOM from "react-dom"
import TipIndex from "../TipIndex"

document.addEventListener('DOMContentLoaded', () => {
    const main = document.querySelector('#js-main')
    const props = JSON.parse(main.dataset.props)

    ReactDOM.render(
        <TipIndex
            tips={props}
        />,
        main
    )
})
