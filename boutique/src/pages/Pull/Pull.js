import './Pull.css';
import Nav from "../../component/Nav/Nav";
import Footer from "../../component/Footer/Footer";
import lotus from  '../../assets/lotus.png';
import ProductsByCategories from '../../component/ProductsByCategories/ProductsByCategories';
const Pull = () =>
{

  return (
    <div>
      <Nav />
      <div className='pull'>
      <img src={lotus}/>
      <h1>Pull</h1>
      <img src={lotus}/>
      </div>
      <ProductsByCategories/>
      <Footer />
    </div>

  )

};

export default Pull;

