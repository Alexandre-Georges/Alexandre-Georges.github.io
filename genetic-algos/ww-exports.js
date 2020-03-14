!function(e){var t={};function n(o){if(t[o])return t[o].exports;var r=t[o]={i:o,l:!1,exports:{}};return e[o].call(r.exports,r,r.exports,n),r.l=!0,r.exports}n.m=e,n.c=t,n.d=function(e,t,o){n.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:o})},n.r=function(e){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},n.t=function(e,t){if(1&t&&(e=n(e)),8&t)return e;if(4&t&&"object"==typeof e&&e&&e.__esModule)return e;var o=Object.create(null);if(n.r(o),Object.defineProperty(o,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var r in e)n.d(o,r,function(t){return e[t]}.bind(null,r));return o},n.n=function(e){var t=e&&e.__esModule?function(){return e.default}:function(){return e};return n.d(t,"a",t),t},n.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},n.p="",n(n.s=1)}([function(e,t){e.exports={getRandomNumberBetween:(e,t)=>Math.floor(Math.random()*t)+e}},function(e,t,n){utils=n(0),genetics=n(2)},function(e,t,n){const o=n(0),r=n(3),a=n(4),s=n(5),u=(e,t)=>{const n=[];for(let o=0;o<e.populationSize;o++)n.push({state:t(e)});return n},l=(e,t,n)=>{const o=[];for(let r of t){const t=n(e,r);o.push(Object.assign({},r,{score:t.score,found:t.found,extras:t.extras}))}return o.sort((e,t)=>t.score-e.score)},i=(e,t,n)=>{let r=[];for(;r.length<e.populationSize;){const a=o.getRandomNumberBetween(0,t.length),s=o.getRandomNumberBetween(0,t.length),u=n(e,t[a],t[s]);r=r.concat(u)}return r},c=(e,t,n)=>{const o=[];for(let r in t){const a=t[r];Math.random()<e.mutationRate?o.push(n(e,a)):o.push(a)}return o},g=(e,t,n,o,r,a,s)=>{let u=!1;setTimeout(()=>{n=l(e,n,r.evaluate),a({generation:o,best:n[0]}),!0===n[0].found&&(s({generation:o,best:n[0]}),u=!0),n=r.chuck(e,n),n=i(e,n,r.breed),n=c(e,n,r.mutate),u||g(e,t,n,o+1,r,a,s)},t)},f=e=>"sentence"===e?r:"calculation"===e?a:"mastermind"===e?s:void 0;e.exports={createPopulation:u,evaluatePopulation:l,breedPopulation:i,mutatePopulation:c,start:(e,t,n,o,r)=>{const a=f(t),s=Object.assign({},a.getConfig(),n);let l=u(s,a.initState);g(s,e,l,1,a,o||a.stateCallback,r||a.endCallback)},getConfig:e=>f(e).getConfig()}},function(e,t,n){const o=n(0),r={allowedLetters:"qwertyuiopasdfghjklzxcvbnm ",answer:"sentence to find",populationSize:1e4,mutationRate:.5,geneMutationRate:.16};e.exports={getConfig:()=>r,initState:e=>{let t="";for(let n=0;n<e.answer.length;n++)t+=e.allowedLetters[o.getRandomNumberBetween(0,e.allowedLetters.length)];return t},evaluate:(e,t)=>{let n=0;for(let o=0;o<t.state.length;o++){const r=t.state[o];e.answer.match(r)&&(e.answer.charAt(o)===r?n+=10:n+=1)}return{score:n,found:n===10*e.answer.length}},breed:(e,t,n)=>{const r=[t,n],a=[];for(;a.length<t.state.length;)a.push(o.getRandomNumberBetween(0,2));const s={state:""};for(const e in a){const t=a[e];s.state+=r[t].state.charAt(e)}return[s]},mutate:(e,t)=>{const n={state:t.state};let r=0;for(;r<t.state.length;)Math.random()<e.geneMutationRate&&(n.state=n.state.substr(0,r)+e.allowedLetters[o.getRandomNumberBetween(0,e.allowedLetters.length)]+n.state.substr(r+1,n.state.length-r)),r++;return n},chuck:(e,t)=>{const n=t[0].score;let o=0;for(;o<5&&t[o].score>n/2;)o++;return t.slice(0,o+1)},stateCallback:e=>{console.log(`Generation ${e.generation}'s best individual : ${e.best.state}`)},endCallback:e=>{console.log(`Solution found after ${e.generation} generation(s) : ${e.best.state}`)}}},function(module,exports,__webpack_require__){const utils=__webpack_require__(0),DEFAULT_CONFIG={numbers:[5,6,2,9],answer:24,operations:["+","-","*","/"],populationSize:100,mutationRate:.5,geneMutationRate:.1},initState=e=>{let t=[];const n=Object.assign([],e.numbers);for(;n.length>1;)t.push(n.splice(utils.getRandomNumberBetween(0,n.length),1)[0]),t.push(e.operations[utils.getRandomNumberBetween(0,e.operations.length)]);return t.push(n[0]),t},evaluate=(config,individual)=>{const result=eval(individual.state.join(""));return null!==result&&Number.isInteger(result)?result===config.answer?{score:Number.MAX_VALUE,found:!0,extras:{result:result}}:{score:Number.MAX_VALUE-(config.answer-result),found:!1,extras:{result:result}}:{score:Number.MIN_VALUE,found:!1,extras:{result:null}}},breed=(e,t,n)=>{const o=[t,n],r=[];for(;r.length<t.state.length;)r.push(utils.getRandomNumberBetween(0,2));const a={state:[]};for(const e in r)if(e%2==0)a.state.push(o[0].state[e]);else{const t=r[e];a.state.push(o[t].state[e])}return[a]},mutate=(e,t)=>{const n={state:t.state};let o=0;for(;o<t.state.length;){if(Math.random()<e.geneMutationRate)if(o%2==0){const e=t.state[o],n=2*utils.getRandomNumberBetween(0,(t.state.length+1)/2);t.state[o]=t.state[n],t.state[n]=e}else n.state[o]=e.operations[utils.getRandomNumberBetween(0,e.operations.length)];o++}return n},chuck=(e,t)=>{const n=t[0].score;let o=0;for(;o<5&&t[o].score>n/2;)o++;return t.slice(0,o+1)};module.exports={getConfig:()=>DEFAULT_CONFIG,initState:initState,evaluate:evaluate,breed:breed,mutate:mutate,chuck:chuck,stateCallback:e=>{console.log(`Generation ${e.generation}'s best individual : ${e.best.state.join(" ")} = ${e.best.extras.result}`)},endCallback:e=>{console.log(`Solution found after ${e.generation} generation(s) : ${e.best.state.join(" ")} = ${e.best.extras.result}`)}}},function(e,t,n){const o=n(0),r={colours:["red","blue","yellow","green","white","black"],answer:["blue","yellow","black","red"],populationSize:10,mutationRate:.3,geneMutationRate:.2};e.exports={getConfig:()=>r,initState:e=>{let t=[];for(let n=0;n<e.answer.length;n++)t.push(e.colours[o.getRandomNumberBetween(0,e.colours.length)]);return t},evaluate:(e,t)=>{let n=0;for(let o=0;o<t.state.length;o++)e.answer[o]===t.state[o]&&(n+=10);return{score:n,found:n===10*e.answer.length}},breed:(e,t,n)=>{const r=[t,n],a=[];for(;a.length<t.state.length;)a.push(o.getRandomNumberBetween(0,2));const s={state:[]};for(const e in a){const t=a[e];s.state.push(r[t].state[e])}return[s]},mutate:(e,t)=>{const n={state:t.state};let r=0;for(;r<t.state.length;)Math.random()<e.geneMutationRate&&(n.state[r]=e.colours[o.getRandomNumberBetween(0,e.colours.length)]),r++;return n},chuck:(e,t)=>{const n=t[0].score;let o=0;for(;o<5&&t[o].score>n/2;)o++;return t.slice(0,o+1)},stateCallback:e=>{console.log(`Generation ${e.generation}'s best individual : ${e.best.state}`)},endCallback:e=>{console.log(`Solution found after ${e.generation} generation(s) : ${e.best.state}`)}}}]);