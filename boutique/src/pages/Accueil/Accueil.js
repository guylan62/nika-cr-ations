import Footer from "../../component/Footer/Footer";
import Nav from "../../component/Nav/Nav";
import TopItem from "../../component/Top/TopItem";
import About from "../../component/About/About.js";
import Mif from "../../assets/MIF.png";
import Handmade from "../../assets/fait-main.png";
import Domicile from "../../assets/domicile.png";
import './Accueil.css';


const Accueil = () => {

    return (
        <>      
        <Nav/>
        <About />
        <TopItem title="Populaire" img="https://www.petit-bateau.fr/dw/image/v2/BCKL_PRD/on/demandware.static/-/Sites-PB_master/default/dw2d377f7a/PB/5625705F1.jpg?sw=1390&sh=1622&sm=fit"/>
        <TopItem title="Eco-Responsable" img="https://www.petit-bateau.fr/dw/image/v2/BCKL_PRD/on/demandware.static/-/Sites-PB_master/default/dw2d377f7a/PB/5625705F1.jpg?sw=1390&sh=1622&sm=fit"/>
        <TopItem title="Fait Main" img="https://www.petit-bateau.fr/dw/image/v2/BCKL_PRD/on/demandware.static/-/Sites-PB_master/default/dw2d377f7a/PB/5625705F1.jpg?sw=1390&sh=1622&sm=fit"/>
        <div className="logo">
            <img src={Mif}></img>
            <img src={Handmade}></img>
            <img src={Domicile}></img>
        </div>
        <div className="Nika-text">
        <p>  La plupart de mes créations sont toutes fabriquées par mes soins. Elles peuvent présenter des différences. Ce ne sont pas des défauts mais le gage de qualité d’un vrai travail fait main. Une partie des articles à un stock minimal mais la majorité des articles seront réalisés à la commande avec un délai minimum d'une semaine. Du Made In France et Made In “Fait Main”. Confectionné de façon artisanale avec des matières premières choisies avec attention dans le respect de l’environnement.</p>
        </div>
        <Footer/>
        </>
    )

};

export default Accueil;