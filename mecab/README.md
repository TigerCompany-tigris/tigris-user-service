# MeCab Web server

docker-compose로 사용할 수 있는 mecab 서비스

* server-komecab
    - MeCab를 이용할 수 있는 RESTful 서버
    - 세종사전과 새로운 사전 mecab-nia-dic를 선택할 수 있음(TBD)


## 동작/종료 방법
```shell-session
$ docker-compose up -d
```
```shell-session
$ docker-compose down
```

## 실행방법
HTTP request

```
POST /mecab/v1/parse-ko-dic
```

request header

```
Content-Type: application/json
```

request body

```
{
  "sentence": 문자열
}
```

## 실행 예시 1.세종말뭉치
```shell-session
$ curl -X POST http://localhost:5000/mecab/v1/parse-ko-dic \
       -H "Content-type: application/json" \
       -d '{"sentence": "함수형 프로그래밍"}'  | jq .
```


```
{
  "DICT": "KO-DIC",
  "MESSAGE": "SUCCESS",
  "RESULTS": [
    {
      " ": "*",
      "원형": "*",
      "품사": "NNG",
      "품사-세분류1": "*",
      "품사-세분류2": "F",
      "품사-세분류3": "함수",
      "형태소": "함수",
      "활용구": "*",
      "활용형": "*"
    },
    {
      " ": "*",
      "원형": "*",
      "품사": "XSN",
      "품사-세분류1": "*",
      "품사-세분류2": "T",
      "품사-세분류3": "형",
      "형태소": "형",
      "활용구": "*",
      "활용형": "*"
     },
     {
       " ": "*",
       "원형": "*",
       "품사": "NNG",
       "품사-세분류1": "*",
       "품사-세분류2": "T",
       "품사-세분류3": "프로그래밍",
       "형태소": "프로그래밍",
       "활용구": "*",
       "활용형": "*"
     }
   ],
   "STATUS": 200
}
```
