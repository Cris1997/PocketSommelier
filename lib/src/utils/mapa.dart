
import 'package:flutter/material.dart';


final String IP = "10.102.225.210:5000";


final Map<int,String> Uris = {
1:"https://res.cloudinary.com/escom/image/upload/v1580838434/catalogo/1.jpg",
2:"https://res.cloudinary.com/escom/image/upload/v1580838495/catalogo/2.jpg",
3:"https://res.cloudinary.com/escom/image/upload/v1580838874/catalogo/3.jpg",
4:"https://res.cloudinary.com/escom/image/upload/v1580838434/catalogo/4.jpg",
5:"https://res.cloudinary.com/escom/image/upload/v1580838594/catalogo/5.jpg",
6:"https://res.cloudinary.com/escom/image/upload/v1580838493/catalogo/6.jpg",
7:"https://res.cloudinary.com/escom/image/upload/v1580838434/catalogo/7.jpg",
8:"https://res.cloudinary.com/escom/image/upload/v1580838433/catalogo/8.jpg",
9:"https://res.cloudinary.com/escom/image/upload/v1580838439/catalogo/9.png",
10:"https://res.cloudinary.com/escom/image/upload/v1580838439/catalogo/10.jpg",
11:"https://res.cloudinary.com/escom/image/upload/v1580838444/catalogo/11.jpg",
12:"https://res.cloudinary.com/escom/image/upload/v1580838496/catalogo/12.png",
13:"https://res.cloudinary.com/escom/image/upload/v1580838438/catalogo/13.png",
14:"https://res.cloudinary.com/escom/image/upload/v1580838440/catalogo/14.jpg",
15:"https://res.cloudinary.com/escom/image/upload/v1580838442/catalogo/15.png",
16:"https://res.cloudinary.com/escom/image/upload/v1580838439/catalogo/16.jpg",
17:"https://res.cloudinary.com/escom/image/upload/v1580838449/catalogo/17.png",
18:"https://res.cloudinary.com/escom/image/upload/v1580838463/catalogo/18.png",
19:"https://res.cloudinary.com/escom/image/upload/v1580838450/catalogo/19.jpg",
20:"https://res.cloudinary.com/escom/image/upload/v1580838448/catalogo/20.jpg",
21:"https://res.cloudinary.com/escom/image/upload/v1580838457/catalogo/21.png",
22:"https://res.cloudinary.com/escom/image/upload/v1580838451/catalogo/22.jpg",
23:"https://res.cloudinary.com/escom/image/upload/v1580838458/catalogo/23.png",
24:"https://res.cloudinary.com/escom/image/upload/v1580838471/catalogo/24.png",
25:"https://res.cloudinary.com/escom/image/upload/v1580838453/catalogo/25.jpg",
26:"https://res.cloudinary.com/escom/image/upload/v1580838872/catalogo/26.png",
27:"https://res.cloudinary.com/escom/image/upload/v1580838589/catalogo/27.png",
28:"https://res.cloudinary.com/escom/image/upload/v1580838458/catalogo/28.jpg",
29:"https://res.cloudinary.com/escom/image/upload/v1580838528/catalogo/29.png",
30:"https://res.cloudinary.com/escom/image/upload/v1580838462/catalogo/30.jpg",
31:"https://res.cloudinary.com/escom/image/upload/v1580838465/catalogo/31.jpg",
32:"https://res.cloudinary.com/escom/image/upload/v1580838478/catalogo/32.png",
33:"https://res.cloudinary.com/escom/image/upload/v1580838484/catalogo/33.jpg",
34:"https://res.cloudinary.com/escom/image/upload/v1580838754/catalogo/34.png",
35:"https://res.cloudinary.com/escom/image/upload/v1580838480/catalogo/35.jpg",
36:"https://res.cloudinary.com/escom/image/upload/v1580838485/catalogo/36.jpg",
37:"https://res.cloudinary.com/escom/image/upload/v1580838766/catalogo/37.jpg",
38:"https://res.cloudinary.com/escom/image/upload/v1580838487/catalogo/38.jpg",
39:"https://res.cloudinary.com/escom/image/upload/v1580838495/catalogo/39.jpg",
40:"https://res.cloudinary.com/escom/image/upload/v1580838598/catalogo/40.png",
41:"https://res.cloudinary.com/escom/image/upload/v1580838547/catalogo/41.png",
42:"https://res.cloudinary.com/escom/image/upload/v1580838500/catalogo/42.png",
43:"https://res.cloudinary.com/escom/image/upload/v1580838503/catalogo/43.jpg",
44:"https://res.cloudinary.com/escom/image/upload/v1580838508/catalogo/44.png",
45:"https://res.cloudinary.com/escom/image/upload/v1580838596/catalogo/45.png",
46:"https://res.cloudinary.com/escom/image/upload/v1580838764/catalogo/46.png",
47:"https://res.cloudinary.com/escom/image/upload/v1580838558/catalogo/47.png",
48:"https://res.cloudinary.com/escom/image/upload/v1580838592/catalogo/48.png",
49:"https://res.cloudinary.com/escom/image/upload/v1580838604/catalogo/49.png",
50:"https://res.cloudinary.com/escom/image/upload/v1580838608/catalogo/50.png",
51:"https://res.cloudinary.com/escom/image/upload/v1580838605/catalogo/51.png",
52:"https://res.cloudinary.com/escom/image/upload/v1580838886/catalogo/52.png",
53:"https://res.cloudinary.com/escom/image/upload/v1580838866/catalogo/53.png",
54:"https://res.cloudinary.com/escom/image/upload/v1580838812/catalogo/54.png",
55:"https://res.cloudinary.com/escom/image/upload/v1580838761/catalogo/55.png",
56:"https://res.cloudinary.com/escom/image/upload/v1580838769/catalogo/56.png",
57:"https://res.cloudinary.com/escom/image/upload/v1580838780/catalogo/57.png",
58:"https://res.cloudinary.com/escom/image/upload/v1580838785/catalogo/58.png",
59:"https://res.cloudinary.com/escom/image/upload/v1580838773/catalogo/59.jpg",
60:"https://res.cloudinary.com/escom/image/upload/v1580838779/catalogo/60.png",
61:"https://res.cloudinary.com/escom/image/upload/v1580838871/catalogo/61.jpg",
62:"https://res.cloudinary.com/escom/image/upload/v1580838784/catalogo/62.jpg",
63:"https://res.cloudinary.com/escom/image/upload/v1580838794/catalogo/63.png",
64:"https://res.cloudinary.com/escom/image/upload/v1580838793/catalogo/64.png",
65:"https://res.cloudinary.com/escom/image/upload/v1580838957/catalogo/65.png",
66:"https://res.cloudinary.com/escom/image/upload/v1580838852/catalogo/66.png",
67:"https://res.cloudinary.com/escom/image/upload/v1580838798/catalogo/67.jpg",
68:"https://res.cloudinary.com/escom/image/upload/v1580838847/catalogo/68.png",
69:"https://res.cloudinary.com/escom/image/upload/v1580838814/catalogo/69.jpg",
70:"https://res.cloudinary.com/escom/image/upload/v1580838822/catalogo/70.png",
71:"https://res.cloudinary.com/escom/image/upload/v1580838823/catalogo/71.jpg",
72:"https://res.cloudinary.com/escom/image/upload/v1580838867/catalogo/72.png",
73:"https://res.cloudinary.com/escom/image/upload/v1580838903/catalogo/73.png",
74:"https://res.cloudinary.com/escom/image/upload/v1580838858/catalogo/74.png",
75:"https://res.cloudinary.com/escom/image/upload/v1580838864/catalogo/75.png",
76:"https://res.cloudinary.com/escom/image/upload/v1580838861/catalogo/76.jpg",
77:"https://res.cloudinary.com/escom/image/upload/v1580838871/catalogo/77.png",
78:"https://res.cloudinary.com/escom/image/upload/v1580838871/catalogo/78.jpg",
79:"https://res.cloudinary.com/escom/image/upload/v1580839042/catalogo/79.png",
80:"https://res.cloudinary.com/escom/image/upload/v1580838889/catalogo/80.jpg",
81:"https://res.cloudinary.com/escom/image/upload/v1580838875/catalogo/81.jpg",
82:"https://res.cloudinary.com/escom/image/upload/v1580838873/catalogo/82.jpg",
83:"https://res.cloudinary.com/escom/image/upload/v1580838895/catalogo/83.jpg",
84:"https://res.cloudinary.com/escom/image/upload/v1580838874/catalogo/84.jpg",
85:"https://res.cloudinary.com/escom/image/upload/v1580838875/catalogo/85.jpg",
86:"https://res.cloudinary.com/escom/image/upload/v1580838890/catalogo/86.png",
87:"https://res.cloudinary.com/escom/image/upload/v1580838875/catalogo/87.jpg",
88:"https://res.cloudinary.com/escom/image/upload/v1580838877/catalogo/88.jpg",
89:"https://res.cloudinary.com/escom/image/upload/v1580838884/catalogo/89.png",
90:"https://res.cloudinary.com/escom/image/upload/v1580838908/catalogo/90.jpg",
91:"https://res.cloudinary.com/escom/image/upload/v1580838878/catalogo/91.jpg",
92:"https://res.cloudinary.com/escom/image/upload/v1580838894/catalogo/92.jpg",
93:"https://res.cloudinary.com/escom/image/upload/v1580838889/catalogo/93.jpg",
94:"https://res.cloudinary.com/escom/image/upload/v1580839033/catalogo/94.png",
95:"https://res.cloudinary.com/escom/image/upload/v1580838906/catalogo/95.png",
96:"https://res.cloudinary.com/escom/image/upload/v1580838894/catalogo/96.jpg",
97:"https://res.cloudinary.com/escom/image/upload/v1580838891/catalogo/97.jpg",
98:"https://res.cloudinary.com/escom/image/upload/v1580838908/catalogo/98.png",
99:"https://res.cloudinary.com/escom/image/upload/v1580838904/catalogo/99.png",
100:"https://res.cloudinary.com/escom/image/upload/v1580838895/catalogo/100.jpg",
101:"https://res.cloudinary.com/escom/image/upload/v1580838908/catalogo/101.png",
};

final List<String> urls = [
"https://res.cloudinary.com/escom/image/upload/v1580838434/catalogo/1.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838495/catalogo/2.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838874/catalogo/3.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838434/catalogo/4.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838594/catalogo/5.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838493/catalogo/6.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838434/catalogo/7.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838433/catalogo/8.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838439/catalogo/9.png",
"https://res.cloudinary.com/escom/image/upload/v1580838439/catalogo/10.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838444/catalogo/11.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838496/catalogo/12.png",
"https://res.cloudinary.com/escom/image/upload/v1580838438/catalogo/13.png",
"https://res.cloudinary.com/escom/image/upload/v1580838440/catalogo/14.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838442/catalogo/15.png",
"https://res.cloudinary.com/escom/image/upload/v1580838439/catalogo/16.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838449/catalogo/17.png",
"https://res.cloudinary.com/escom/image/upload/v1580838463/catalogo/18.png",
"https://res.cloudinary.com/escom/image/upload/v1580838450/catalogo/19.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838448/catalogo/20.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838457/catalogo/21.png",
"https://res.cloudinary.com/escom/image/upload/v1580838451/catalogo/22.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838458/catalogo/23.png",
"https://res.cloudinary.com/escom/image/upload/v1580838471/catalogo/24.png",
"https://res.cloudinary.com/escom/image/upload/v1580838453/catalogo/25.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838872/catalogo/26.png",
"https://res.cloudinary.com/escom/image/upload/v1580838589/catalogo/27.png",
"https://res.cloudinary.com/escom/image/upload/v1580838458/catalogo/28.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838528/catalogo/29.png",
"https://res.cloudinary.com/escom/image/upload/v1580838462/catalogo/30.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838465/catalogo/31.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838478/catalogo/32.png",
"https://res.cloudinary.com/escom/image/upload/v1580838484/catalogo/33.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838754/catalogo/34.png",
"https://res.cloudinary.com/escom/image/upload/v1580838480/catalogo/35.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838485/catalogo/36.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838766/catalogo/37.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838487/catalogo/38.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838495/catalogo/39.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838598/catalogo/40.png",
"https://res.cloudinary.com/escom/image/upload/v1580838547/catalogo/41.png",
"https://res.cloudinary.com/escom/image/upload/v1580838500/catalogo/42.png",
"https://res.cloudinary.com/escom/image/upload/v1580838503/catalogo/43.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838508/catalogo/44.png",
"https://res.cloudinary.com/escom/image/upload/v1580838596/catalogo/45.png",
"https://res.cloudinary.com/escom/image/upload/v1580838764/catalogo/46.png",
"https://res.cloudinary.com/escom/image/upload/v1580838558/catalogo/47.png",
"https://res.cloudinary.com/escom/image/upload/v1580838592/catalogo/48.png",
"https://res.cloudinary.com/escom/image/upload/v1580838604/catalogo/49.png",
"https://res.cloudinary.com/escom/image/upload/v1580838608/catalogo/50.png",
"https://res.cloudinary.com/escom/image/upload/v1580838605/catalogo/51.png",
"https://res.cloudinary.com/escom/image/upload/v1580838886/catalogo/52.png",
"https://res.cloudinary.com/escom/image/upload/v1580838866/catalogo/53.png",
"https://res.cloudinary.com/escom/image/upload/v1580838812/catalogo/54.png",
"https://res.cloudinary.com/escom/image/upload/v1580838761/catalogo/55.png",
"https://res.cloudinary.com/escom/image/upload/v1580838769/catalogo/56.png",
"https://res.cloudinary.com/escom/image/upload/v1580838780/catalogo/57.png",
"https://res.cloudinary.com/escom/image/upload/v1580838785/catalogo/58.png",
"https://res.cloudinary.com/escom/image/upload/v1580838773/catalogo/59.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838779/catalogo/60.png",
"https://res.cloudinary.com/escom/image/upload/v1580838871/catalogo/61.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838784/catalogo/62.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838794/catalogo/63.png",
"https://res.cloudinary.com/escom/image/upload/v1580838793/catalogo/64.png",
"https://res.cloudinary.com/escom/image/upload/v1580838957/catalogo/65.png",
"https://res.cloudinary.com/escom/image/upload/v1580838852/catalogo/66.png",
"https://res.cloudinary.com/escom/image/upload/v1580838798/catalogo/67.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838847/catalogo/68.png",
"https://res.cloudinary.com/escom/image/upload/v1580838814/catalogo/69.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838822/catalogo/70.png",
"https://res.cloudinary.com/escom/image/upload/v1580838823/catalogo/71.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838867/catalogo/72.png",
"https://res.cloudinary.com/escom/image/upload/v1580838903/catalogo/73.png",
"https://res.cloudinary.com/escom/image/upload/v1580838858/catalogo/74.png",
"https://res.cloudinary.com/escom/image/upload/v1580838864/catalogo/75.png",
"https://res.cloudinary.com/escom/image/upload/v1580838861/catalogo/76.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838871/catalogo/77.png",
"https://res.cloudinary.com/escom/image/upload/v1580838871/catalogo/78.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580839042/catalogo/79.png",
"https://res.cloudinary.com/escom/image/upload/v1580838889/catalogo/80.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838875/catalogo/81.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838873/catalogo/82.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838895/catalogo/83.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838874/catalogo/84.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838875/catalogo/85.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838890/catalogo/86.png",
"https://res.cloudinary.com/escom/image/upload/v1580838875/catalogo/87.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838877/catalogo/88.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838884/catalogo/89.png",
"https://res.cloudinary.com/escom/image/upload/v1580838908/catalogo/90.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838878/catalogo/91.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838894/catalogo/92.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838889/catalogo/93.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580839033/catalogo/94.png",
"https://res.cloudinary.com/escom/image/upload/v1580838906/catalogo/95.png",
"https://res.cloudinary.com/escom/image/upload/v1580838894/catalogo/96.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838891/catalogo/97.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838908/catalogo/98.png",
"https://res.cloudinary.com/escom/image/upload/v1580838904/catalogo/99.png",
"https://res.cloudinary.com/escom/image/upload/v1580838895/catalogo/100.jpg",
"https://res.cloudinary.com/escom/image/upload/v1580838908/catalogo/101.png",
];