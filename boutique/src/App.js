import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import './App.css';
import Accueil from './pages/Accueil/Accueil'
import Register from './component/Register/Register'
import Accessoire from './pages/Accessoire/Accessoire';
import Ecoresponsable from './pages/Ecoresponsable/Ecoresponsable';
import Enfant from './pages/Enfant/Enfant';
import Panier from './pages/Panier/Panier';
import Pull from './pages/Pull/Pull';
import Tshirt from './pages/Tshirt/Tshirt';
import Product from './pages/Product/Product';
import ThisProductPage from './pages/ThisProductPage/ThisProductPage';

function App()
{
  return (
    <>
      <Router>
        <Routes>
          
          <Route path='/' element={<Accueil />}></Route>
          <Route path='/Accessoire' element={<Accessoire />}></Route>
          <Route path='/Accessoire/:name' element={<ThisProductPage />}></Route>
          <Route path='/Ecoresponsable' element={<Ecoresponsable />}></Route>
          <Route path='/Ecoresponsable/:name' element={<ThisProductPage />}></Route>
          <Route path='/Enfant' element={<Enfant />}></Route>
          <Route path='/Enfant/:name' element={<ThisProductPage />}></Route>
          <Route path='/Pull' element={<Pull />}></Route>
          <Route path='/Pull/:name' element={<ThisProductPage />}></Route>
          <Route path='/Tshirt' element={<Tshirt />}></Route>
          <Route path='/Tshirt/:name' element={<ThisProductPage />}></Route>
          <Route path='/produits' element={<Product />}></Route>
          <Route path='/produits/:name' element={<ThisProductPage />}></Route>
          <Route path='/Panier' element={<Panier />}></Route>
          
        </Routes>
      </Router>
    </>
  )
}

export default App;
