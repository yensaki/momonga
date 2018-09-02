import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import Axios from 'axios'

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
            <div>
                <div className='container'>
                    <div className='form-group'>
                        <input type='text' name='q' className='form-control' />
                    </div>
                    <div className='form-group'>
                        <button
                            type="submit"
                            name="commit"
                            className="btn btn-default"
                            onClick={this.onSearch}
                        >検索</button>
                    </div>

                </div>
                <div className='container'>
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
                </div>
            </div>
        )
    }

    onSearch = function(e) {
        e.preventDefault
        const component = this
        Axios.get('/tips.json')
            .then(response => {
                console.log('status:', response.status)
                console.log('body:', response.data)
                component.setState({tips: response.data})
            })
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
