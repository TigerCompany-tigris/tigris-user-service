# MeCab Web server

docker-compose로 사용할 수 있는 mecab 서비스

* server-komecab
    - MeCab를 이용할 수 있는 RESTful 서버
    - 세종사전과 새로운 사전 mecab-nia-dic를 선택할 수 있음(TBD)

## 폴더 구성
```
.
├── README.md
├── docker-compose.yml
└─server-komecab
    ├── Dockerfile
    ├── requirements.txt
    └── server.py

```

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
POST /mecab/v1/parse-nia-dic
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
#TBD 결과를 붙여 넣자
```

## 실행 예시 mecab-ipadic-neologd
mecab-ipadic-neologd는 고유명사사전을 실행

```shell-session
$ curl -X POST http://localhost:5000/mecab/v1/parse-nia-dic \
       -H "Content-type: application/json" \
       -d '{"sentence": "함수형 프로그래밍"}'  | jq .
```

```
#TBD 결과를 붙여 넣자
```
