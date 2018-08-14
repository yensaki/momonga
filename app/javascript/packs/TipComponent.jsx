import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

// export default class Tip extends React.Component {
//     return (
//         <div>
//             test
//         </div>
//     )
// }
class TipComponent extends React.PureComponent {
    render() {
        return (
            <div className='card col-md-6'>
                <div className='card-header'>
                    <h3 className='panel-title'>
                        {this.props.title}
                    </h3>
                </div>
                <div className='panel-body'>
                    {this.props.youtube_urls.map((url, i) => (
                        <div>
                            <iframe
                                src={url}
                                allow="autoplay; encrypted-media"
                                frameBorder='0'
                                width='480'
                                height='270'
                            />
                        </div>
                    ))}
                </div>
            </div>
        )
    }
}

TipComponent.propTypes = {
    title: PropTypes.string
}

// export interface Tip {
//     title: string
// }
//
// Tip.propTypes = {
//     title: PropTypes.string
// }

class TipIndex extends React.PureComponent {
    // state = {
    //     tips: [] as Perfect<Tip>[]
    // }

    render() {
        return (
            <div className="row">
                {this.props.tips.map((tip, i) => (
                    <TipComponent
                        key={i}
                        tip={tip}
                        title={tip.title}
                        youtube_urls={tip.youtube_urls}
                    />
                ))}
            </div>
        )
    }
}

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
