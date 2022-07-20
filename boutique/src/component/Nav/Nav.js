
import './Nav.css';
import { slide as Menu } from 'react-burger-menu';
import { NavLink } from 'react-router-dom';
import { useState } from 'react';
import Logo from '../../assets/logo.png';
import React from 'react';

const Nav = () =>
{
    const [navbar, setNavbar] = useState(false);

    function toogleMenu(){
        const oMenu = document.getElementById('menu');
        oMenu.style.display = oMenu.offsetWitdth ? 'none' : 'block';
    }

    return (
        <>
            <nav className={navbar ? 'navbar active' : 'navbar'}>
                <div className='navTop'><p className='pNav'>Livraison Offerte dès 55€ d'achat ! -10% sur toute la boutique code : bienvenue</p></div>
                <div className='navCenter'>
                    <NavLink to="/" className='brand'><img src={Logo} /></NavLink>
                    <ul id='menu' className='nav-links'>
                        <li><NavLink to="/" className='link-item'>Accueil</NavLink></li>
                        <li className='link-item'>Eco-Responsable
                            <ul className='menu2'>
                                <li>Lingettes</li>
                                <li>Filet de lavage</li>
                                <li>Les personnalisables</li>
                                <li>Bagagerie</li>
                            </ul>
                        </li>
                        <li>T-Shirt
                            <ul className='menu2'>
                                <li>Classique</li>
                                <li>Personnalisé</li>
                            </ul>
                        </li>
                        <li>Pull
                            <ul className='menu2'>
                                <li>Pull</li>
                                <li>Pull à capuche</li>
                            </ul>
                        </li>        
                        <li>UNIVERS ENFANT
                            <ul className='menu2'>
                                <li>Peluche</li>
                                <li>Body</li>
                                <li>T-shirt</li>
                            </ul>
                        </li>
                        <li>Accessoires
                            <ul className='menu2'>
                                <li>Divers</li>
                                <li>Bracelet</li>
                                <li>Boucles d'oreilles</li>
                                <li>Pendentif</li>
                            </ul>
                        </li>
                    </ul>

                    <NavLink to="/" className='right-item'>Recherche</NavLink>
                    <NavLink to="/" className='right-item'>Profil</NavLink>
                    <NavLink to="/Panier" className='right-item'>Panier</NavLink>

                </div>
                <div className='navBottom'></div>
            </nav>
            <Menu className='burger'>
                <nav>
                    <NavLink to="/" className='brand'></NavLink>
                    <ul className='nav-links'>
                        <li><NavLink to="/" className='link-item'>Accueil</NavLink></li>
                        <li><NavLink to="/Ecoresponsable" className='link-item'>Eco-Responsable</NavLink></li>
                        <li><NavLink to="/Tshirt" className='link-item'>T-Shirt</NavLink></li>
                        <li><NavLink to="/Pull" className='link-item'>Pull</NavLink></li>
                        <li><NavLink to="/Enfant" className='link-item'>UNIVERS ENFANT</NavLink></li>
                        <li><NavLink to="/Accessoire" className='link-item'>Accessoires</NavLink></li>


                    </ul>

                    <NavLink to="/" className='right-item'>Recherche</NavLink>
                    <NavLink to="/" className='right-item'>Profil</NavLink>
                    <NavLink to="/Panier" className='right-item'>Panier </NavLink>
                </nav>



            </Menu>

        </>

    )

};

export default Nav;