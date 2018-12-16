import React from 'react'
import PropTypes from 'prop-types'

export default class TipComponent extends React.PureComponent {
    static propTypes = {
        title: PropTypes.string,
        url: PropTypes.string
    }

    render() {
        return (
            <div className='card col-md-6'>
                <div className='card-header'>
                    <h3 className='panel-title'>
                        <a href={this.props.url}>
                            {this.props.title}
                        </a>
                    </h3>
                </div>
                <div className='panel-body'>
                    {this.props.youtube_urls.map((url, i) => (
                        <div className='youtube-iframe'>
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
