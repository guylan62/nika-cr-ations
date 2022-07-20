import logo from '../../assets/logo.png'
import { NavLink } from 'react-router-dom';
import './Footer.css'
const Footer = () => {

        return(
            <>
            <div className="footer">
             <NavLink to="/" className='brand'><img src={logo} /></NavLink>
                <div className='service'>
                    <div className='title'> Service </div>
                    <NavLink to="/">bla bla bla</NavLink>
                    <NavLink to="/">bla bla bla</NavLink>
                    <NavLink to="/">bla bla bla</NavLink>
                    <NavLink to="/">bla bla bla</NavLink>
                </div>
                <div className='societe'>
                     <div className='title'> Société </div>
                <NavLink to="/">bla bla bla</NavLink>
                <NavLink to="/">bla bla bla</NavLink>
                <NavLink to="/">bla bla bla</NavLink>
                <NavLink to="/">bla bla bla</NavLink>
                </div>
                <div className='sociaux'>
                      <div className='title'> Réseaux Sociaux </div>
                    <NavLink to="/">facebook</NavLink>
                    <NavLink to="/">twitter</NavLink>
                    <NavLink to="/">snap</NavLink>
                
                </div>
            </div>
            </>
            
        )

};

export default Footer;