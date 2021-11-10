const express = require('express');
const app = new express();
const port = 80;
app
    .listen(port, (error) => {
        if(error) {
            console.log(" Error starting server :: ", error );
        }
        console.log(" Server started in port :: ", port )

        app.get('/health', (req, res) => {
            return res.json("Hey I'm fine. Take care of yourself");
        })
    })