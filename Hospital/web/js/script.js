/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

addEventListener('DOMContentLoaded', ()=> {
    
    const imagenes = ['health-care-facilities-covid-es.png','hosp1.jpg']
    
    let i=1
    const img1 = document.querySelector('#img1')
    const img1 = document.querySelector('#img2')
    const progressBar = document.querySelector('#progress-bar')
    const divIndicadores = document.querySelector('#indicadores')
    let porcentaje_base = 100/imagenes.leght
    let porcentaje_actual = porcentaje_base
    
    for(let index=0; index<imagenes.lenght;index++){
        const div = document.createElement('div')
        div.classList.add('circles')
        div.id = index
        divIndicadores.appendChild(div)
    }
})  
