import Nav from "../../component/Nav/Nav";
import Footer from "../../component/Footer/Footer";
import './Accessoire.css';
import lotus from  '../../assets/lotus.png';
import ProductsByCategories from "../../component/ProductsByCategories/ProductsByCategories";


const Accessoire = () =>
{

  return (
    <div>
      <Nav />
      <div className='accessoire'>
      <img src={lotus}/>
      <h1>Accessoire</h1>
      <img src={lotus}/>
      </div>
      <ProductsByCategories/>
      <Footer />
    </div>

  )

};

export default Accessoire;

