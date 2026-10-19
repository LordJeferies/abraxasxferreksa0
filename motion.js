"use strict";
(()=>{
 const reduced=matchMedia('(prefers-reduced-motion: reduce)'),fine=matchMedia('(pointer:fine)'),wide=matchMedia('(min-width:701px)');
 const root=document.documentElement,button=document.querySelector('.motion-control');let paused=reduced.matches,frame=null,x=0,y=0;
 function render(){frame=null;const on=!paused&&!reduced.matches&&!document.hidden;const dx=on&&fine.matches&&wide.matches?x:0,dy=on&&fine.matches&&wide.matches?y:0;const scroll=on?Math.min(18,scrollY*.035):0;root.style.setProperty('--scene-x',(-dx*10).toFixed(2)+'px');root.style.setProperty('--scene-y',(-dy*7+scroll).toFixed(2)+'px');root.style.setProperty('--luka-x',(dx*7).toFixed(2)+'px');root.style.setProperty('--luka-y',(dy*5).toFixed(2)+'px');}
 function queue(){if(frame===null)frame=requestAnimationFrame(render);}
 function state(){document.body.classList.toggle('effects-paused',paused||reduced.matches);button.setAttribute('aria-pressed',String(paused||reduced.matches));button.textContent=reduced.matches?'Movimiento reducido':paused?'Activar efectos':'Pausar efectos';button.disabled=reduced.matches;queue();}
 addEventListener('pointermove',e=>{x=e.clientX/innerWidth*2-1;y=e.clientY/innerHeight*2-1;queue();},{passive:true});document.addEventListener('pointerleave',()=>{x=y=0;queue();});addEventListener('scroll',queue,{passive:true});addEventListener('resize',queue,{passive:true});document.addEventListener('visibilitychange',queue);button.addEventListener('click',()=>{paused=!paused;state();});reduced.addEventListener('change',()=>{paused=reduced.matches;state();});state();
})();