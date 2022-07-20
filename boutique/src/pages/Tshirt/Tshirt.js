import './Tshirt.css';
import Nav from "../../component/Nav/Nav";
import Footer from "../../component/Footer/Footer";
import lotus from  '../../assets/lotus.png'
import ProductsByCategories from '../../component/ProductsByCategories/ProductsByCategories';
const Tshirt = () =>
{

  return (
    <div>
      <Nav />
      <div className='tshirt'>
      <img src={lotus}/>
      <h1>T-shirt</h1>
      <img src={lotus}/>
      </div>
      <ProductsByCategories/>
      <Footer />
    </div>

  )

};

export default Tshirt;

