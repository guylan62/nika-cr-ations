import './Ecoresponsable.css';
import Nav from "../../component/Nav/Nav";
import Footer from "../../component/Footer/Footer";
import ProductsByCategories from '../../component/ProductsByCategories/ProductsByCategories';
import lotus from  '../../assets/lotus.png';

const Ecoresponsable = () =>
{

  return (
    <div>
      <Nav />
      <div className='ecoresponsable'>
      <img src={lotus}></img>
      <h1>Eco-Responsable</h1>
      <img src={lotus}></img>
      </div>
      <ProductsByCategories />
      <Footer />
    </div>

  )

};

export default Ecoresponsable;

