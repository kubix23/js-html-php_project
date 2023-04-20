var treść = document.getElementById("treść");
var menu = document.getElementById("menu");
var tabela = [];
var strona = 1;
var max;
var login = false;
var koszyklist =[];

let crypt = window.crypto;


function round(num){
    return Math.round(num *100)/100
}
//_________________________-
/*
let keyPair = crypt.subtle.generateKey(
    {
      name: "RSA-OAEP",
      modulusLength: 4096,
      publicExponent: new Uint8Array([1, 0, 1]),
      hash: "SHA-256"
    },
    true,
    ["encrypt", "decrypt"]
)

async function keyPar(){
    return await keyPair.then((res) => {
        return res
    })  
}

async function encryptMessage(encoded) {
    console.log(CryptoKeyPair.privateKey)
    return await crypt.subtle.encrypt(
        {
        name: "RSA-OAEP"
        },
        (await keyPar()).publicKey,
        encoded
    );
}

async function EncMessage(message) {
    let enc = new TextEncoder();
    let encodeMessage = enc.encode(message)
    return await encryptMessage(encodeMessage);
}

async function decryptMessage(ciphertext) {
    return await crypt.subtle.decrypt(
        {
        name: "RSA-OAEP"
        },
        (await keyPar()).privateKey,
        ciphertext
    );
}

async function DecMessage(ciphertext) {
    let dec = new TextDecoder;
    let decodeMessage = await decryptMessage(ciphertext)
    return dec.decode(decodeMessage);

}

*/

//_________________________-

//capatch
function canvas(){
    let str = new Array(5).join().replace(/(.|$)/g,()=>{ return ((Math.random() * 36) | 0).toString(36);});
    
    /*EncMessage(str).then((str)=>{
        var bkb = new DataView(str);
        console.log(bkb)*/
        var data = new URLSearchParams
        data.append('captch',str)

        fetch('./access.php',{
            method: 'post',
            body: data,
            headers:{
                "Cache-Control": "no-cache, must-revalidate",

            }
        })/*.then((res)=>{
            return res.text()
        }).then((res)=>{
            console.log(res)
        })*/
    
    const canvas = document.getElementsByTagName('canvas')[0];
    const ctx = canvas.getContext('2d');
    
    canvas.style.backgroundColor='white';
    canvas.style.maxWidth=`${menu.clientWidth*1.3}px`;
    canvas.style.height = '120px';
    canvas.style.cursor = 'pointer ';
    
    canvas.height = canvas.clientHeight

    ctx.font=`${canvas.clientHeight*0.8}px sans-serif`;
    var center = (canvas.width/2) - (ctx.measureText(str).width)/2;
    ctx.fillText(str, center, canvas.clientHeight*0.80 ,canvas.clientWidth);
    
    var lineX = () => {
        ctx.beginPath();
        ctx.lineWidth = 15;
        ctx.setLineDash([5,30]);
        ctx.lineCap = 'round';
        ctx.moveTo(0, canvas.height * Math.random());
        ctx.lineTo(canvas.width, (canvas.height * Math.random()));
        ctx.closePath();
        ctx.stroke();
        ctx.setLineDash([]);
        }
    var lineY = () => {
        ctx.beginPath();
        ctx.lineWidth = 15;
        ctx.setLineDash([5,30]);
        ctx.lineCap = 'round';
        ctx.moveTo(canvas.width* Math.random(),0);
        ctx.lineTo((canvas.width * Math.random()),canvas.height);
        ctx.closePath();
        ctx.stroke();
        ctx.setLineDash([]);
        }
        lineX();
        lineX();
        lineY();
        lineY();
    
        ctx.font='15px sans-serif';
        ctx.font ='200 19px fantasy';
        ctx.fillStyle='orange';
        ctx.fillText('|Capatch|    Kliknij,aby zresetować', 5, 18);
    }

function rejestruj(){
    if(!document.cookie.split(';').includes(' rejestracja=tak')){
        var menu_content = menu.innerHTML;
        menu.innerText = '';

        let form = document.createElement('form');
        form.id = 'logowanie';
        form.action = 'javascript:void(0);';
        form.style.height ="54%";
        let input_login = document.createElement('input');
        let input_password = document.createElement('input');

        input_password.type = 'password'
        let input_imienazwisko = document.createElement('input');
        let input_ulica = document.createElement('input');
        let input_miasto = document.createElement('input');
        let canv = document.createElement('canvas');
        let cap = document.createElement('input');
        let button = document.createElement('button');
        let button2 = document.createElement('button');

        input_login.pattern = '\\w{5,}';
        input_password.pattern = '(?=^.{8,}$)((?=.*\\d)|(?=.*[a-zA-zęóąśłżźćńĘÓĄŚŁŻŹĆŃ]+))(?![.\\n])(?=.*[A-ZĘÓĄŚŁŻŹĆŃ])(?=.*[a-zęóąśłżźćń]).*$';
        input_imienazwisko.pattern = '(\\w|\\s)*';
        input_ulica.pattern = '.*(?:\\d)';
        input_miasto.pattern = '[a-zA-zęóąśłżźćńĘÓĄŚŁŻŹĆŃ]*';
        cap.pattern = '(\\w)*';

        input_login.placeholder = "Login (Bez znaków specjalnych, minimum 5)";
        input_login.required = true;
        input_password.placeholder = "Hasło (Duże i małe litery,znak specjalny/liczba,minimum 8)";
        input_password.required = true;
        input_imienazwisko.placeholder = "Imię i Nazwisko";
        input_imienazwisko.required = true;
        input_ulica.placeholder = 'Ulica i numer mieszkania/domu';
        input_ulica.required = true;
        input_miasto.placeholder = 'Miasto';
        input_miasto.required = true;
        cap.placeholder = "Wpisz Capatch";
        cap.required = true;
        canv.addEventListener('click',()=>{
            canvas();
        })
        button.innerText = "OK";
        button.id = "";
        button.type = 'submit';

        form.addEventListener('submit',()=>{
            var valid;
            
            let data = new URLSearchParams();
            data.append('login',input_login.value);
            data.append('password',input_password.value);
            data.append('imienazwisko',input_imienazwisko.value);
            data.append('ulica',input_ulica.value);
            data.append('miasto',input_miasto.value);
            data.append('captch',cap.value);


            fetch('./rejestracja.php',{
                method:'post',
                body:data
            })
            .then((response) => {return response.text();})
            .then((text) => {
                canvas();
                cap.value = '';
                input_password.value = ''
                if(text == 'ok'){
                    menu.innerHTML = menu_content;
                    canvas();
                }else if(text == 'noCaptch'){
                    alert('Wpisz capatch, zły capatch')
                }else if(text == 'cheater'){
                    alert('Nie edytuj kodu')
                }else if(text == 'double'){
                    alert('Rejestrowałeś się już')
                }

            }).catch((err) =>{
                console.log(err)
            })
        })
        button2.innerText = 'Wróć'
        button2.addEventListener('click',()=>{
            menu.innerHTML = menu_content;
            canvas();
        })

        form.appendChild(input_login);
        form.appendChild(input_password);
        form.appendChild(input_imienazwisko);
        form.appendChild(input_ulica);
        form.appendChild(input_miasto);
        form.appendChild(canv);
        form.appendChild(cap);
        form.appendChild(button);
        form.appendChild(button2);

        menu.appendChild(form)

        canvas();
    }else{
        alert('Rejestrowałeś się już.')
    }
}


//produkty lista
function produkt(lp){
    let div = document.createElement('div');
    div.className = 'produkt';
    div.style.backgroundColor = `rgb(
        27,
        ${parseInt(166*((Math.random()/3)+1))},
        93
    )`

    //nazwa produktu
    let h1 = document.createElement('h1');
    h1.innerText = tabela[lp][1];
    div.appendChild(h1);

    //cena
    let cena = document.createElement('h2');
    cena.innerText = tabela[lp][4] + ' zł';
    cena.className = `cena`;
    div.appendChild(cena);

    //opis
    let short = document.createElement('p');
    let opis = document.createElement('a');
    opis.setAttribute('opis_nr',lp);
    short.setAttribute('opis_nr',lp);
    short.innerText = 
        tabela[lp][2]
        .substring(0,170)
        .split(' ',25).toString()
        .replaceAll( /,(?=\w)/gi,' ');

    opis.innerText =' (Więcej...)'
    
    opis.addEventListener('click',(ref)=>{
        let ko =ref.target.getAttribute('opis_nr');
        let roz = document.getElementById('roz');
        let parent = ref.target.parentNode;

        if(roz){
            let a = roz.getElementsByTagName('p')[0].lastChild
            a.innerText =' (Więcej...)'
            roz.getElementsByTagName('p')[0].innerText = 
            tabela[roz.getElementsByTagName('p')[0].getAttribute('opis_nr')][2]
            .substring(0,170)
            .split(' ',25).toString()
            .replaceAll( /,(?=\w)/gi,' ');

            roz.getElementsByTagName('p')[0].appendChild(a);
            roz.id = '';
        }

        if(roz != parent.parentNode && parent.innerText != '(Więcej...)'){
            let a = parent.getElementsByTagName('a')[0];
            a.innerText = ' (Mniej...)';
            parent.innerText = tabela[ko][2];
            parent.appendChild(a);
            
            document.getElementsByClassName('produkt')[ko].id = 'roz';
        }
    })

    short.appendChild(opis);
    div.appendChild(short);

    if(login && tabela[lp][3]){//zalogowany
        //dostępna ilość
        let label = document.createElement('label');
        label.for = `ilość${tabela[lp][0]}`;
        label.className = "maxilość";
        label.innerText = ` / ${tabela[lp][3]}`

        //wybierana wartość
        let ilość = document.createElement('input');
        ilość.type = 'number';
        ilość.value = '1'
        ilość.min = '1'
        ilość.max = tabela[lp][3];
        ilość.id = `ilość${tabela[lp][0]}`;
        ilość.className = `ilość`;
        ilość.addEventListener('change', (ref)=>{
            var liczba = ref.target.valueAsNumber;
            if(liczba > parseInt(tabela[lp][3])){
                ilość.value = tabela[lp][3];
            }else if(liczba < '1' || isNaN(liczba)){
                ilość.value = 1
            }else if(liczba !== parseInt(liczba)){
                ilość.value = parseInt(liczba);
            }
            razem.innerText = round(ilość.value * tabela[lp][4]) + ' zł';
        })
        div.appendChild(ilość);
        div.appendChild(label);


        //cana * ilość sztuk wybranych;
        let razem = document.createElement('h3');
        razem.innerText = tabela[lp][4] + ' zł';
        razem.className = "suma";
        div.appendChild(razem);

        //dodawanie do koszyka
        let koszykadd = document.createElement('button');
        koszykadd.innerText = 'Dodaj do Koszyka';
        koszykadd.className = 'koszykadd';

        koszykadd.addEventListener('click',(ref)=>{
            let doubled = koszyklist.findIndex(value=>{
                return value[0] == tabela[lp][1];
            });

            if(doubled == -1){
                koszyklist.push([tabela[lp][1],[parseInt(ilość.value),tabela[lp][3]],parseFloat(razem.innerText),tabela[lp][0]]);
            }else{
                if( koszyklist[doubled][1][0] + parseInt(ilość.value) <= koszyklist[doubled][1][1]){

                    koszyklist[doubled][1][0] += parseInt(ilość.value);
                    koszyklist[doubled][2] += parseFloat(razem.innerText);
                    koszyklist[doubled][2] = round(koszyklist[doubled][2]);
                }
            }
            document.cookie = `koszyk=${JSON.stringify(koszyklist)}`
            lista();
        });

        div.appendChild(koszykadd);
    }else if(login && !(tabela[lp][3])){
        let razem = document.createElement('h3');
        razem.innerText = 'Brak towaru';
        razem.className = "out_of_stock";
        div.appendChild(razem);
    }

    treść.appendChild(div);    
}


//zmienianie stron
function page(){
    var i = 1
    let span = document.createElement('span');
    span.id = 'page';
    for(i=strona; i<10+strona;i++){
        let div = document.createElement('button');
        div.className = 'kafelek';
        
        //przyciski lewe
        if(i==strona+1){
            div.innerText = '<'
            if(strona == 1){div.disabled='true';}
            div.addEventListener('click',()=>{
                strona -= 1;
                start();
            })
        };
        if(i==strona){
            if(strona == 1){div.disabled='true';}
            div.innerText = '<<';
            div.addEventListener('click',() =>{
                strona = 1;
                start();
            })
        };

        //generowanie listy
        if(i>=strona+2 && i<=strona+7 && strona == 1){
            //1
            div.innerText= i-2;
            div.id = `strona${i-2}`;
        }else if(i>=strona+2 && i<=strona+7 && strona == 2){
            //2
            div.innerText= i-3;
            div.id = `strona${i-3}`;
        }else if(i>=strona+2 && i<=strona+7 && strona >2 && strona< max-2){
            //x>2 x<max-2
            div.innerText= i-4;
            div.id = `strona${i-4}`;
        }else if(i>=strona+2 && i<=strona+7 && strona == max-2){
            //max-2
            div.innerText= i-5;
            div.id = `strona${i-5}`;
        }else if(i>=strona+2 && i<=strona+7 && strona == max-1){
            //max-1
            div.innerText= i-6;
            div.id = `strona${i-6}`;
        }else if(i>=strona+2 && i<=strona+7 && strona == max){
            //max
            div.innerText= i-7;
            div.id = `strona${i-7}`;
        }
        if(i>=strona+2 && i<=strona+7){
            div.addEventListener('click',(ref)=>{
                strona = parseInt(ref.target.innerText);
                start();
            })
        }

        //przyciski prawe
        if(i==strona+8){
            if(strona == max){div.disabled='true';}
            div.innerText = '>';
            div.addEventListener('click',()=>{
                strona += 1;
                start();
            })
        };
        if(i==strona+9){
            if(strona == max){div.disabled='true';}
            div.innerText = '>>';
            div.addEventListener('click',()=>{
                strona = max;
                start();
            })
        };

        //aktywna strona
        if(strona == 2){i= i-1;};
        if(strona == 1 && i == 3){div.classList.add('aktywny');}
        if(strona == 2 && i == 4){div.classList.add('aktywny');}
        if(strona > 2 && strona < max-2 && i == strona+4){div.classList.add('aktywny')}
        if(strona == max-2 && i==strona+5){div.classList.add('aktywny')}
        if(strona == max-1 && i==strona+6){div.classList.add('aktywny')}
        if(strona == max && i==strona+7){div.classList.add('aktywny')}
        if(strona == 2){i= i+1;};
        
        span.appendChild(div);
    }
    span.getElementsByClassName('aktywny')[0].disabled='true';
    treść.appendChild(span);
}

//POST
function POST(){
    let data = new URLSearchParams();
    data.append('login',document.getElementById('login').value);
    data.append('password',document.getElementById('password').value);
    data.append('capatch',document.getElementById('captchtext').value);
    document.getElementById('captchtext').value = "";
    fetch('./access.php',{
        method: 'post',
        body: data
    })
    .then((response) => {
        return response.text();
    })
    .then((text) => {

        logowanie(text);
    })
    .catch((error) => {
        console.log(error)
    });
}

//Logowanie
function logowanie(zalogowany){
    wynik = menu.getElementsByTagName('h3');
    if(zalogowany >= 0){
        login = true;
       Kontent()
       koszyk();
    }else if(zalogowany == 'noCaptch'){
        wynik.innerText = 'Zły Captch'
    }else{ 
        login = true;
        wynik.innerText = 'Będny login lub hasło'
    }
}

function Kontent(){

    treść.innerHTML = '';
    page();
    for (i = 0; i < 10; i++){
        produkt(i)
    }
    page();
}

//koszyk,menu,wylogowanie itp.
function koszyk(){
    var logowanie = menu.innerHTML;
    menu.innerText = ''

    //koszyk
        let koszyk = document.createElement('span')
        koszyk.id = 'icons';

        let svg1 = document.createElementNS('http://www.w3.org/2000/svg','svg')
        svg1.setAttribute('viewBox','0 0 576 512');
        svg1.id='menu1'

        let path1 = document.createElementNS('http://www.w3.org/2000/svg','path');
        path1.setAttribute('fill','currentColor');
        path1.setAttribute('d','M528.12 301.319l47.273-208C578.806 78.301 567.391 64 551.99 64H159.208l-9.166-44.81C147.758 8.021 137.93 0 126.529 0H24C10.745 0 0 10.745 0 24v16c0 13.255 10.745 24 24 24h69.883l70.248 343.435C147.325 417.1 136 435.222 136 456c0 30.928 25.072 56 56 56s56-25.072 56-56c0-15.674-6.447-29.835-16.824-40h209.647C430.447 426.165 424 440.326 424 456c0 30.928 25.072 56 56 56s56-25.072 56-56c0-22.172-12.888-41.332-31.579-50.405l5.517-24.276c3.413-15.018-8.002-29.319-23.403-29.319H218.117l-6.545-32h293.145c11.206 0 20.92-7.754 23.403-18.681z');
        
        svg1.addEventListener('click',(res)=>{
            if(menu.offsetWidth <= 400){
                treść.style.marginLeft = `${treść.parentElement.scrollWidth - treść.offsetWidth}px`;
                treść.style.position = 'apsolute'
                menu.className='kfocusmin';
                
            }else{
                menu.className='kfocus'
            }

            //click poza menu
            document.addEventListener('click',function(res){
                if(res.path.reverse()[4] != document.getElementById('menu')){
                    treść.style.marginLeft = '0';
                    menu.className='';
                    treść.style.position = ''
                    document.removeEventListener('click',arguments.callee);
                }
            })

        })

        svg1.tabIndex = '-1';
        path1.tabIndex = '-1';

        svg1.appendChild(path1);
        koszyk.appendChild(svg1);

    //wylogowanie
        let svg2 = document.createElementNS('http://www.w3.org/2000/svg','svg')
        svg2.setAttribute('viewBox','0 0 512 512');
        svg2.id='menu2'

        let path2 = document.createElementNS('http://www.w3.org/2000/svg','path');
        path2.setAttribute('fill','currentColor');
        path2.setAttribute('d','M497 273L329 441c-15 15-41 4.5-41-17v-96H152c-13.3 0-24-10.7-24-24v-96c0-13.3 10.7-24 24-24h136V88c0-21.4 25.9-32 41-17l168 168c9.3 9.4 9.3 24.6 0 34zM192 436v-40c0-6.6-5.4-12-12-12H96c-17.7 0-32-14.3-32-32V160c0-17.7 14.3-32 32-32h84c6.6 0 12-5.4 12-12V76c0-6.6-5.4-12-12-12H96c-53 0-96 43-96 96v192c0 53 43 96 96 96h84c6.6 0 12-5.4 12-12z');
        
        svg2.addEventListener('click',()=>{
            fetch('./sesdistroy.php').then((res) =>{
                koszyklist.length = 0;
                document.cookie = 'koszyk= ;expires= 01 Jan 1970 00:00:01 GMT';
                menu.innerHTML = logowanie;
                canvas()
            })
        })
        
        svg2.append(path2)
        koszyk.append(svg2)

    menu.appendChild(koszyk);

    let div = document.createElement('div');
    div.style.overflow = 'auto';
    div.style.height = '100%';
    menu.appendChild(div);
    lista()

}

//Lista zakupów
function lista(){
    menu.lastChild.innerHTML = '';
    //cooki lista
    if(document.cookie.split(';')[document.cookie.split(';').length -1].split('=')[0] == ' koszyk'){
        koszyklist = JSON.parse(document.cookie.split(';')[document.cookie.split(';').length -1].split('=')[1]); 
    }      
    //----
    //lista
    for(let i=0; i<koszyklist.length;i++){
        let produkt = document.createElement('div');
        produkt.className = 'koszykProdukt';

        let nazwa = document.createElement('h3');
        nazwa.innerText = koszyklist[i][0];
        let ilość = document.createElement('h4');
        ilość.innerText = 'Liczba: ' + koszyklist[i][1][0];
        let cena = document.createElement('p');
        cena.innerText = round(koszyklist[i][2]) + ' zł';
        let delate = document.createElement('button');
        delate.innerText = 'X';
        delate.addEventListener('click',res =>{
            res.target.parentNode.remove();
            koszyklist.splice(i);
            menu.lastChild.lastChild.remove();
            zamów();
            document.cookie = `koszyk=${JSON.stringify(koszyklist)}`;
        })

        produkt.appendChild(nazwa);
        produkt.appendChild(ilość);
        produkt.appendChild(cena);
        produkt.appendChild(delate);
        
        menu.lastChild.appendChild(produkt);
    }
    //----
    var zamów = ()=>{
        if(menu.lastChild.innerText){
            let submit = document.createElement('button')
            submit.innerText = "ZAMÓW";
            submit.className="zamow"
            submit.addEventListener('click',res =>{
                koszyklist = [];
                data = new URLSearchParams;
                data.append('zamow',JSON.stringify(koszyklist))

                fetch('./zamawianie.php',{
                    method:'post',
                    body: data,
                })
                .then(()=>{
                    menu.lastChild.innerHTML = "";
                    document.cookie = 'koszyk= ;expires= 01 Jan 1970 00:00:01 GMT'
                })
                .catch(err =>{
                    alert(error)
                });
            })
            menu.lastChild.appendChild(submit)
        }
    }
    zamów()
}

function fullacces(){
    fetch('./zalogowany.php',{
        method: 'post',
    })
    .then((response) => {
        return response.text();
    })
    .then((text) => {
        console.log(text)
        if(text){
            login = true;
            koszyk();
            Kontent();
        }
    })
}

function start(){
    let data = new URLSearchParams();
    data.append('strona',strona);

    fetch('./tabela.php',{
        method: 'post',
        body: data
    })
    .then((exe)=>{
        return exe.text()
    })
    .then((res)=>{
        ans= JSON.parse(res);
        tabela = ans[0];

        max = ans[1]/10;
        Kontent();
    })
}
 start();
 fullacces();
 canvas();