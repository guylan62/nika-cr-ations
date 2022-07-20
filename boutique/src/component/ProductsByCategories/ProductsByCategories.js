import { useEffect, useState } from 'react';
import axios from 'axios';
import { Link } from "react-router-dom";

export default function ProductsByCatergories() {
    const [posts, setPosts] = useState(null);

    useEffect( () => {
        getAllData();
        }, []);
    
        const getAllData = () => {
        axios.get("http://localhost:3001/")
        .then(res => {
            const p = res.data;
            setPosts( p );
    })}
return (
    <>
        <section className="product-list">
            {posts && posts.map( p => {
                return (
                <ul className="product-item" key={p.Id_product}>
                    <Link to={p.name} href="" target="_blank" className="product-link">
                        <figure className="product-info">
                            <div className="product-info-img">
                                <img src="https://www.petit-bateau.fr/dw/image/v2/BCKL_PRD/on/demandware.static/-/Sites-PB_master/default/dw2d377f7a/PB/5625705F1.jpg?sw=1390&sh=1622&sm=fit" alt="description image"/>
                            </div>
                            <figcaption className="product-info-description">
                                <h2 className="title">{p.name}</h2>
                                <p className="description">{p.description}</p>
                            </figcaption>
                            <div className="price-box">
                                <div className="price">
                                    <div>
                                        <ins>{p.price_excl_tax} Є</ins>
                                    </div>
                                </div>
                                <button href="#" className="btn btn-buy">Buy now <i className="fas fa-arrow-right"></i></button>
                            </div>
                        </figure>
                    </Link>
                </ul>
                )
            })}
        </section>
    </>
    );
}