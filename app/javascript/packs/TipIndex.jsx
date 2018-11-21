import React from 'react'
import Axios from "axios";
import TipComponent from "./TipComponent"

export default class TipIndex extends React.PureComponent {
    constructor(props) {
        super(props)
        this.state = {
            q: ''
        }
        this.onSearch = this.onSearch.bind(this)
        this.onChange = this.onChange.bind(this)
        this.input = React.createRef()
    }

    render() {
        return (
            <div>
                <div className='container'>
                    <div className='form-group'>
                        <input type='text' name='q' className='form-control' ref={this.input} />
                    </div>
                    <div className='form-group'>
                        <button
                            type="submit"
                            name="commit"
                            className="btn btn-primary"
                            onClick={this.onSearch}
                            onChange={this.onChange}
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
        Axios.get('/tips.json', {
            params: {
                q: this.input.current.value
            }
        })
        .then(response => {
            console.log('status:', response.status)
            console.log('body:', response.data)
            this.setState({tips: response.data})
        })
    }

    onChange = function(e) {
        this.setState({q: e.target.value})
    }
}
