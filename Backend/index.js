// .env 파일의 환경 변수 로드
require('dotenv').config();

// Express.js 웹 프레임워크를 사용하기 위한 기본 모듈
const express = require("express");
const mongoose = require("mongoose")

// Express 애플리케이션 생성 후 app변수에 할당
const app = express();

// HTTP 요청의 본문(body)을 JSON 형식으로 파싱
app.use(express.json());

// HTTP 요청의 본문을 URL-encoded 형식으로 파싱
app.use(express.urlencoded({
    extended: true
}));

const productData = [];

// mongodb+srv://kangminchan99:<password>@cluster0.opsnezo.mongodb.net/?retryWrites=true&w=majority

// connect to mongoose
mongoose.set('strictQuery', true);
mongoose.connect(process.env.MONGODB_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
.then(() => {
  console.log("Connected");
})
.catch((error) => {
  console.error("Error connecting to mongoose:", error);
});



//post api
// HTTP POST 메서드로 /api/add_product 경로에 대한 라우트를 정의
app.post("/api/add_product", (req, res) => {
    console.log("Result", req.body);

    // 클라이언트가 보낸 데이터를 바탕으로 새로운 상품 데이터 객체 pdata를 생성
    const pdata = {
        "id": productData.length + 1,
        "pname": req.body.pname,
        "pprice": req.body.pprice,
        "pdesc": req.body.pdesc,
    };

    productData.push(pdata);
    console.log("Final", pdata);

    // 응답 객체 res를 사용하여 클라이언트에게 응답을 보냅니다
    res.status(200).send({
        "status_code": 200,
        "message": "Product added successfully",
        "product": pdata
    })


})

// get api
app.get("/api/get_product", (req, res) => {
    if (productData.length > 0) {
        res.status(200).send({
            'status_code': 200,
            'products': productData
        })
    } else {
        res.status(200).send({
            'status_code': 200,
            'products': []
        })
    }
})


// update api put

app.post("/api/update/:id", (req, res) => {

    let id = req.params.id * 1;
    let producToUpdate = productData.find(p => p.id === id);
    let index = productData.indexOf(producToUpdate);

    productData[index] = req.body;

    res.status(200).send({
        'status': "success",
        'message': "product updated"
    })
})

app.post("/api/delete/:id", (req, res)=> {
    let id = req.params.id * 1;
    let producToUpdate = productData.find(p => p.id === id);
    let index = productData.indexOf(producToUpdate);

    productData.splice(index, 1);

    res.status(204).send({
        'status': 'success',
        'message': 'product deleted'
    });
})


// 콜백함수 - 2000번 포트에서 실행되는 Express 웹 서버를 만들기 or mongoose 연결
app.listen(2000, () => {
    console.log("Connected to server at 2000")
})