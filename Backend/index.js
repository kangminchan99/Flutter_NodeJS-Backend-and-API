// Express.js 웹 프레임워크를 사용하기 위한 기본 모듈
const express = require("express");

// Express 애플리케이션 생성 후 app변수에 할당
const app = express();

// 콜백함수 - 2000번 포트에서 실행되는 Express 웹 서버를 만들기
app.listen(2000, ()=> {
    console.log("Connected to server at 2000")
})