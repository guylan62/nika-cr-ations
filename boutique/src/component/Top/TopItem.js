import './TopItem.css'
import lotus from '../../assets/lotus.png'

const topItem = (props) =>{

return (
    <>
        <div className="top-item">
            <div className="top-info">
            <img src={lotus}></img>
            <div className="title">{props.title}</div>
            <img src={lotus}></img>
            </div>
            <div className="img-shop">
            <img src={props.img}></img>
            <img src={props.img}></img>
            <img src={props.img}></img>
            </div>
        </div>
    
    </>
)

}

export default topItem;