defmodule Feedme.AtomFeedTest do
  use ExUnit.Case, async: true
  alias Feedme.Reader

  @atom_feed """
    <feed xmlns="http://www.w3.org/2005/Atom" xmlns:openSearch="http://a9.com/-/spec/opensearchrss/1.0/" xmlns:blogger="http://schemas.google.com/blogger/2008" xmlns:georss="http://www.georss.org/georss" xmlns:gd="http://schemas.google.com/g/2005" xmlns:thr="http://purl.org/syndication/thread/1.0">
    <id>tag:blogger.com,1999:blog-19303585</id>
    <updated>2024-08-04T23:46:44.383+00:00</updated>
    <category term="pseudo-randomness"/>
    <category term="hardware"/>
    <category term="babbage"/>
    <category term="gaga"/>
    <category term="anti-spam"/>
    <category term="gnu make"/>
    <category term="retro"/>
    <category term="security"/>
    <category term="codes and ciphers"/>
    <category term="the geek atlas"/>
    <category term="rants and raves"/>
    <category term="alan turing"/>
    <category term="mathematics"/>
    <category term="climate change"/>
    <category term="perl"/>
    <category term="calculators"/>
    <category term="google go"/>
    <category term="minitel"/>
    <category term="toys"/>
    <category term="behind the screens"/>
    <category term="clocks"/>
    <category term="machine learning"/>
    <category term="babygaga"/>
    <category term="games"/>
    <category term="arc"/>
    <category term="my services"/>
    <category term="cansole"/>
    <category term="facebook"/>
    <category term="popfile"/>
    <category term="privacy"/>
    <category term="radio"/>
    <category term="well... actually"/>
    <title type="text">John Graham-Cumming's blog</title>
    <subtitle type="html"/>
    <link rel="http://schemas.google.com/g/2005#feed" type="application/atom+xml" href="http://blog.jgc.org/feeds/posts/default"/>
    <link rel="self" type="application/atom+xml" href="http://www.blogger.com/feeds/19303585/posts/default"/>
    <link rel="alternate" type="text/html" href="http://blog.jgc.org/"/>
    <link rel="hub" href="http://pubsubhubbub.appspot.com/"/>
    <link rel="next" type="application/atom+xml" href="http://www.blogger.com/feeds/19303585/posts/default?start-index=26&amp;max-results=25"/>
    <author>
      <name>Unknown</name>
      <email>noreply@blogger.com</email>
      <gd:image rel="http://schemas.google.com/g/2005#thumbnail" width="16" height="16" src="https://img1.blogblog.com/img/b16-rounded.gif"/>
    </author>
    <generator version="7.00" uri="http://www.blogger.com">Blogger</generator>
    <openSearch:totalResults>507</openSearch:totalResults>
    <openSearch:startIndex>1</openSearch:startIndex>
    <openSearch:itemsPerPage>25</openSearch:itemsPerPage>
    <entry>
      <id>tag:blogger.com,1999:blog-19303585.post-8870263574877874516</id>
      <published>2024-06-19T07:43:00.016+00:00</published>
      <updated>2024-06-20T12:38:31.606+00:00</updated>
      <category scheme="http://www.blogger.com/atom/ns#" term="hardware"/>
      <title type="text">Two ways to use  an LED as a light sensor with Arduino</title>
      <content type="html">&lt;p&gt;I needed to log when a light switched on and off during the night as part of debugging an oddly behaving movement sensor. To do that I built a really simple light sensor logger using an Arduino Leonardo, a large LED and a resistor or three. Here it is:&lt;/p&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhXokF70rNbNS2w0ei9bHqVGaFi6KVXF6Cjlnd3Hp9yhhSD38FrvHTbdFRYr1JE4GUTywylxdFse1dKiBoO98IY3IYqpq8MSaUq6iAyq36rGKzgnli8gUKw_QmgleW2eJlX6Ns6MOukC_K3HvjRXfakGLjoHmCKL3Bj_-ful7Rz779ZPTy8UH-qXQ/s800/light-sense-1.jpg" style="margin-left: 1em; margin-right: 1em;"&gt;&lt;img border="0" data-original-height="768" data-original-width="800" height="614" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhXokF70rNbNS2w0ei9bHqVGaFi6KVXF6Cjlnd3Hp9yhhSD38FrvHTbdFRYr1JE4GUTywylxdFse1dKiBoO98IY3IYqpq8MSaUq6iAyq36rGKzgnli8gUKw_QmgleW2eJlX6Ns6MOukC_K3HvjRXfakGLjoHmCKL3Bj_-ful7Rz779ZPTy8UH-qXQ/w640-h614/light-sense-1.jpg" width="640" /&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;And here's the entire Arduino code:&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;blockquote style="border: none; margin: 0px 0px 0px 40px; padding: 0px; text-align: left;"&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;void setup() {&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; Serial.begin(9600);&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; analogReference(EXTERNAL);&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;}&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&lt;br /&gt;&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;void loop() {&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; Serial.println(analogRead(A1));&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; delay(1000);&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;}&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;/blockquote&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;The main &lt;span style="font-family: courier;"&gt;loop()&lt;/span&gt; just reads the voltage across the LED from analog input A1 and writes it to the serial port. Then it waits for a second. The &lt;span style="font-family: courier;"&gt;setup()&lt;/span&gt; routine tells the ADC converter to use the voltage on AREF as the reference maximum voltage for the ADC.&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;The LED has a voltage of between about 0mV and 400mV depending on the amount of light.&amp;nbsp;&lt;/div&gt;
    &lt;br /&gt;
    &lt;iframe allow="accelerometer; gyroscope; autoplay; encrypted-media; picture-in-picture;" allowfullscreen="true" loading="lazy" src="https://customer-rww76yind8iym5aw.cloudflarestream.com/036d470ad7ea9dfb3e7207f81d19feaa/iframe?poster=https%3A%2F%2Fcustomer-rww76yind8iym5aw.cloudflarestream.com%2F036d470ad7ea9dfb3e7207f81d19feaa%2Fthumbnails%2Fthumbnail.jpg%3Ftime%3D%26height%3D600" style="border: none; height: 400px; left: 0; position: relative; top: 0; width: 100%;"&gt;&lt;/iframe&gt;
    &lt;br /&gt;
    &lt;div class="separator" style="clear: both;"&gt;&lt;span&gt;&lt;br /&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span&gt;By default the voltage range of the ADC on the Arduino Leonardo is 0V to 5V but it's possible to scale it with a call to &lt;/span&gt;&lt;span style="font-family: courier;"&gt;&lt;a href="https://www.arduino.cc/reference/en/language/functions/analog-io/analogreference/"&gt;analogReference&lt;/a&gt;()&lt;/span&gt;&lt;span&gt;.&lt;/span&gt;&lt;span&gt;Calling&amp;nbsp;&lt;/span&gt;&lt;span style="font-family: courier;"&gt;analogReference(INTERNAL)&lt;/span&gt;&lt;span&gt;&amp;nbsp;would set the range to 0V to 2.56V which is still a bit large given the small voltage across the LED. AREF to the rescue!&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;The AREF pin allows a range to be set for the ADC. It has an internal resistance of 32K and I added a 66K resistor (made from three resistors I had lying around) connected to the Arduino's 3.3V pin. The 66K and 32K form a voltage divider giving an AREF of 1.1V (which is the low end of valid AREF values). Then it's just necessary to call&amp;nbsp;&lt;span style="font-family: courier;"&gt;analogReference(EXTERNAL)&lt;/span&gt;.&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;Here's the output of the program when I had covered the LED with my hand and then uncovered it.&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh5C4KpjJPdeYzeMG_mGgLzz_rlRxpzg4NQA_kLMTs-YTcuotxyRdN-mSKALKT-RXDF-SsinkMmjWoZ5XdydL3OlNcc8msaA1-q4kU1PDf0Sfc7H7HG2bKcZsIWrmywzl5JKTew7STFQOU2U7J4B_OITOqG3MZdZxmIa54QelvvjHJK2h8dQjhkdA/s1908/light-sense-2.png" style="margin-left: 1em; margin-right: 1em;"&gt;&lt;img border="0" data-original-height="1314" data-original-width="1908" height="440" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh5C4KpjJPdeYzeMG_mGgLzz_rlRxpzg4NQA_kLMTs-YTcuotxyRdN-mSKALKT-RXDF-SsinkMmjWoZ5XdydL3OlNcc8msaA1-q4kU1PDf0Sfc7H7HG2bKcZsIWrmywzl5JKTew7STFQOU2U7J4B_OITOqG3MZdZxmIa54QelvvjHJK2h8dQjhkdA/w640-h440/light-sense-2.png" width="640" /&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;You can also use the built in Arduino Serial Plotter to get an instant chart. Here I covered the LED with my hand, took my hand away and then shone a torch directly into the LED.&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj2jnALyAtZGaxR_bgWBPHA4XvF-WN-u2uBru3P_1KMtVFQ_b_RdwgriJTjG4t3hn8cIdSURke7W_SRpq_mQjYK7kZLmTWSgrEcykLnIYSDDAbCWD2Q5bWNmpXpIM3H4ERg4jyFXb-IDDwkqV-_8haWN1najFGHfufcU-YM8M36uS6FLt35qagV5Q/s1908/light-sense-3.png" style="margin-left: 1em; margin-right: 1em;"&gt;&lt;img border="0" data-original-height="1314" data-original-width="1908" height="440" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj2jnALyAtZGaxR_bgWBPHA4XvF-WN-u2uBru3P_1KMtVFQ_b_RdwgriJTjG4t3hn8cIdSURke7W_SRpq_mQjYK7kZLmTWSgrEcykLnIYSDDAbCWD2Q5bWNmpXpIM3H4ERg4jyFXb-IDDwkqV-_8haWN1najFGHfufcU-YM8M36uS6FLt35qagV5Q/w640-h440/light-sense-3.png" width="640" /&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;br /&gt;&lt;/div&gt;To get timestamped output I am using &lt;a href="https://freeware.the-meiers.org/"&gt;CoolTerm&lt;/a&gt; which will automatically save to a file and add timestamps.&amp;nbsp;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh7jHD3aMjlC14A1AvxHpk2sD7BDr1cti8yHmEVQ2QYz0p0935ip3Br3hFKKi1VHxff5vYjBsOg4FgK3N7AfAoK9AhD0L-BDt_IZxAzPOWWImTyyOR3z8FMJZhhAvqbCiwfcfvRITmJGdaeAmjokKtMFK14E1J-_ahX_dwctcTCLacHzvkBeMCPHA/s1624/light-sense-5.png" style="margin-left: 1em; margin-right: 1em;"&gt;&lt;img border="0" data-original-height="1344" data-original-width="1624" height="530" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh7jHD3aMjlC14A1AvxHpk2sD7BDr1cti8yHmEVQ2QYz0p0935ip3Br3hFKKi1VHxff5vYjBsOg4FgK3N7AfAoK9AhD0L-BDt_IZxAzPOWWImTyyOR3z8FMJZhhAvqbCiwfcfvRITmJGdaeAmjokKtMFK14E1J-_ahX_dwctcTCLacHzvkBeMCPHA/w640-h530/light-sense-5.png" width="640" /&gt;&lt;/a&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;That light sensor via LED relies on the photovoltaic effect: when light strikes the PN junction inside the LED it creates a voltage (albeit a small one). But there's another way to measure the light hitting an LED.&lt;/div&gt;&lt;h3 style="clear: both; text-align: left;"&gt;&lt;br /&gt;&lt;/h3&gt;&lt;h3 style="clear: both; text-align: left;"&gt;Reverse bias&lt;/h3&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;If the LED is reverse biased (i.e. connected to a voltage source the wrong way round) then it won't light up but it will &lt;a href="https://playground.arduino.cc/Learning/LEDSensor/"&gt;act as a capacitor that charges when light hits it&lt;/a&gt;. So the idea is to reverse bias the LED using two digital pins on the Arduino (one set HIGH and one set LOW) and then remove the bias and measure how long the LED (acting as a capacitor) takes to discharge. The brighter the light the faster the discharge.&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;This can be achieved with a single LED connected between two digital pins like this: the +ve lead of the LED goes into the pin identified by LED_P and the -ve into the pin identified by LED_N.&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgzcPt_arHEonZr14PoYz7qDp3W-2aUlU_2CqeAoqIAnLASKQHAkYcrVsfhN2V1wWd9dX7u0P-HRPSPc5AQBv6exjrCakObSKg4C0_KRzPzWPUA1i37Dlx_5qdMjCGLNMZXJqIBFt2FXf82TFps23Qechway9f20uBX7lNX0LBaAsnzRw-3dSJkjA/s578/light-sense-6.jpg" style="margin-left: 1em; margin-right: 1em;"&gt;&lt;img border="0" data-original-height="478" data-original-width="578" height="530" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgzcPt_arHEonZr14PoYz7qDp3W-2aUlU_2CqeAoqIAnLASKQHAkYcrVsfhN2V1wWd9dX7u0P-HRPSPc5AQBv6exjrCakObSKg4C0_KRzPzWPUA1i37Dlx_5qdMjCGLNMZXJqIBFt2FXf82TFps23Qechway9f20uBX7lNX0LBaAsnzRw-3dSJkjA/w640-h530/light-sense-6.jpg" width="640" /&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;And here's the code.&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;blockquote style="border: none; margin: 0px 0px 0px 40px; padding: 0px; text-align: left;"&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;#define LED_N 4&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;#define LED_P 5&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&lt;br /&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;void setup()&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;{&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; Serial.begin(9600);&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;}&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&lt;br /&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;void loop()&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;{&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; unsigned long maxtime = 5000;&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; pinMode(LED_N, OUTPUT);&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; pinMode(LED_P, OUTPUT);&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; digitalWrite(LED_N, HIGH);&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; digitalWrite(LED_P, LOW);&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&lt;br /&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; pinMode(LED_N, INPUT);&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; digitalWrite(LED_N,LOW);&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&lt;br /&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; unsigned long elapsed = 0;&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; unsigned long start = millis();&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; while ((digitalRead(LED_N) != 0) &amp;amp;&amp;amp; (elapsed &amp;lt; maxtime)) {&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; &amp;nbsp; elapsed = millis() - start;&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; }&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; Serial.println(elapsed);&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&lt;br /&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; if (elapsed &amp;lt; maxtime) {&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; &amp;nbsp; delay(&lt;/span&gt;&lt;span style="font-family: courier;"&gt;maxtime - elapsed&lt;/span&gt;&lt;span style="font-family: courier;"&gt;);&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;&amp;nbsp; }&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;span style="font-family: courier;"&gt;}&lt;/span&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/blockquote&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;div class="separator" style="clear: both;"&gt;I found this worked better than the first version with more sensitive output. Note that smaller numbers mean brighter here (whereas in the previous code smaller meant darker). Here's a plot showing me covering the LED twice with my hand, followed by shining a torch at it. Each time I let the LED be exposed to ambient light between tests.&lt;/div&gt;&lt;div class="separator" style="clear: both;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhU9XtvQK_LGnB-qHkJAj7oeXNiYMjBLMIql4tUTfgkRSH993an_KUcFhchLh8sCiwXIJMHL52zAAXzXCk9UC65DY5KPT48Wo9qiX8svrTdu6CqGxoz1b4TH2dSHjk6SOeMhg8FdWz2PaZ1opmDmKy3Y2JFkgo2bmsI29p0LC5Y5yAVkXltJfYa5g/s1908/light-sense-4.png" style="margin-left: 1em; margin-right: 1em;"&gt;&lt;img border="0" data-original-height="1314" data-original-width="1908" height="440" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhU9XtvQK_LGnB-qHkJAj7oeXNiYMjBLMIql4tUTfgkRSH993an_KUcFhchLh8sCiwXIJMHL52zAAXzXCk9UC65DY5KPT48Wo9qiX8svrTdu6CqGxoz1b4TH2dSHjk6SOeMhg8FdWz2PaZ1opmDmKy3Y2JFkgo2bmsI29p0LC5Y5yAVkXltJfYa5g/w640-h440/light-sense-4.png" width="640" /&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;h3 style="clear: both; text-align: left;"&gt;In action&lt;/h3&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;Certainly looks like that motion sensor is turning the light on in the night uselessly.&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEguPSeXwgqstXmsa2s_b8K9nR3bMNPNekwykDxlX3o6_xjm3Tk0QMWvpZsx45ANjV9LSn0f9YnIA79IgKZ04dHZ3ashLcG2oC2YK8RfwkUSFtxWarNYRTqru7DH79E0b1aDqBAhJrjLSQAU0l66JOpbgmZOzGx4guMW8MAhvjGzQsLIAc7oGy7SLw/s1045/light-sense-7.png" style="margin-left: 1em; margin-right: 1em;"&gt;&lt;img border="0" data-original-height="646" data-original-width="1045" height="396" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEguPSeXwgqstXmsa2s_b8K9nR3bMNPNekwykDxlX3o6_xjm3Tk0QMWvpZsx45ANjV9LSn0f9YnIA79IgKZ04dHZ3ashLcG2oC2YK8RfwkUSFtxWarNYRTqru7DH79E0b1aDqBAhJrjLSQAU0l66JOpbgmZOzGx4guMW8MAhvjGzQsLIAc7oGy7SLw/w640-h396/light-sense-7.png" width="640" /&gt;&lt;/a&gt;&lt;/div&gt;&lt;/div&gt;</content>
      <link rel="replies" type="application/atom+xml" href="http://blog.jgc.org/feeds/8870263574877874516/comments/default" title="Post Comments"/>
      <link rel="replies" type="text/html" href="http://www.blogger.com/comment.g?blogID=19303585&amp;postID=8870263574877874516" title="3 Comments"/>
      <link rel="edit" type="application/atom+xml" href="http://www.blogger.com/feeds/19303585/posts/default/8870263574877874516"/>
      <link rel="self" type="application/atom+xml" href="http://www.blogger.com/feeds/19303585/posts/default/8870263574877874516"/>
      <link rel="alternate" type="text/html" href="http://blog.jgc.org/2024/06/two-ways-to-use-led-as-light-sensor.html" title="Two ways to use  an LED as a light sensor with Arduino"/>
      <author>
        <name>Unknown</name>
        <email>noreply@blogger.com</email>
        <gd:image rel="http://schemas.google.com/g/2005#thumbnail" width="16" height="16" src="https://img1.blogblog.com/img/b16-rounded.gif"/>
      </author>
      <media:thumbnail xmlns:media="http://search.yahoo.com/mrss/" url="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhXokF70rNbNS2w0ei9bHqVGaFi6KVXF6Cjlnd3Hp9yhhSD38FrvHTbdFRYr1JE4GUTywylxdFse1dKiBoO98IY3IYqpq8MSaUq6iAyq36rGKzgnli8gUKw_QmgleW2eJlX6Ns6MOukC_K3HvjRXfakGLjoHmCKL3Bj_-ful7Rz779ZPTy8UH-qXQ/s72-w640-h614-c/light-sense-1.jpg" height="72" width="72"/>
      <thr:total>3</thr:total>
    </entry>
    <entry>
      <id>tag:blogger.com,1999:blog-19303585.post-6968922646267599704</id>
      <published>2024-06-15T16:36:00.003+00:00</published>
      <updated>2024-06-15T16:36:27.119+00:00</updated>
      <category scheme="http://www.blogger.com/atom/ns#" term="retro"/>
      <title type="text">Acorn Computer Systems catalogue circa 1983</title>
      <content type="html">&lt;p&gt;I unearthed a catalogue that I'd picked up in around 1983 of &lt;a href="https://en.wikipedia.org/wiki/Acorn_System"&gt;Acorn Computer Systems&lt;/a&gt;. This catalogue overlaps the BBC Micro era (which was released in 1981) as it goes up to the final Acorn System 5 (released in 1983).&lt;/p&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjYB_ryt3FgR3bm1pwlfDV1jRwCeCUsS1mZT4i5TcAnMLi97PmT1pY10luDQifXwfB6Fj0ZSXRBQ9VoOkvtaGdVnmt7ewBTnwvOR4p4pFh_739x5QF68AsfJui7HOhTmfFyxXWmYI65F5pymISiQ6BvV-C4b-ApbQHJr_1chswGLAfu5wwTyePBmQ/s1820/acs-1.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"&gt;&lt;img border="0" data-original-height="1820" data-original-width="1284" height="640" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjYB_ryt3FgR3bm1pwlfDV1jRwCeCUsS1mZT4i5TcAnMLi97PmT1pY10luDQifXwfB6Fj0ZSXRBQ9VoOkvtaGdVnmt7ewBTnwvOR4p4pFh_739x5QF68AsfJui7HOhTmfFyxXWmYI65F5pymISiQ6BvV-C4b-ApbQHJr_1chswGLAfu5wwTyePBmQ/w452-h640/acs-1.png" width="452" /&gt;&lt;/a&gt;&lt;/div&gt;&lt;p&gt;The Acorn Computer Systems were based on the &lt;a href="https://en.wikipedia.org/wiki/Eurocard_(printed_circuit_board)"&gt;Eurocard&lt;/a&gt; format for PCBs that can be mounted in a standard chassis.&lt;/p&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhD9H3L4jE0uGxHaedCcbSJ_SgbU6JYz4oc2b4AJ8dPqUQZOQPeRXakUwiGR5PO5yuqN_x42FNkcbFS0J8lzilUEFFRLJDMFXRet23td9eTFXKGI1ykIZiQ1Ncs7Z5qPsqFR9S11CGTh6u8pcZMN6dQaQZYhJZ6I0t38UMjpzMlyZsqgkAHO3C18Q/s2576/acs-2.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"&gt;&lt;img border="0" data-original-height="1832" data-original-width="2576" height="456" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhD9H3L4jE0uGxHaedCcbSJ_SgbU6JYz4oc2b4AJ8dPqUQZOQPeRXakUwiGR5PO5yuqN_x42FNkcbFS0J8lzilUEFFRLJDMFXRet23td9eTFXKGI1ykIZiQ1Ncs7Z5qPsqFR9S11CGTh6u8pcZMN6dQaQZYhJZ6I0t38UMjpzMlyZsqgkAHO3C18Q/w640-h456/acs-2.png" width="640" /&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;The Eurocard format meant that you could design a system for your needs, including handling&amp;nbsp;&lt;a href="https://en.wikipedia.org/wiki/Prestel"&gt;Prestel&lt;/a&gt;/Teletext.&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhsON78AbO8VJDb3GukdR6KseGoFfxzzegqHcwKs9puAVI21QtObA67KglXU33UgJYyODviq0jaAMATccfey2Vxgee6FdLqvol0VNFhomGJuWVmUhgzRiPIp_vzHyCmJ0l35ldp6ivogczNXRHJcudL5OtbeB6Bl0N5KDUPN05iZrgw7_9WTE8jwA/s2576/acs-3.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"&gt;&lt;img border="0" data-original-height="1832" data-original-width="2576" height="456" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhsON78AbO8VJDb3GukdR6KseGoFfxzzegqHcwKs9puAVI21QtObA67KglXU33UgJYyODviq0jaAMATccfey2Vxgee6FdLqvol0VNFhomGJuWVmUhgzRiPIp_vzHyCmJ0l35ldp6ivogczNXRHJcudL5OtbeB6Bl0N5KDUPN05iZrgw7_9WTE8jwA/w640-h456/acs-3.png" width="640" /&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;And, of course, you could add RAM.&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgNqOO-CoDyKGq8YC3uMyVJDC0Uyc0Bm8LRM99hWEWoZxXL5M36AyX1pxdcvX1KskI_93IIE1FvYZVF0ESfsF1MfEJ20_iHsAguH3MMyPLma1mR3fZVm5NSAtrLfzNi4M1kK4m4V-_63roMoIq36wIkGOeZicdjwr7ORBdj6LfBIfxqe6Mja9mSFA/s2576/acs-4.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"&gt;&lt;img border="0" data-original-height="1832" data-original-width="2576" height="456" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgNqOO-CoDyKGq8YC3uMyVJDC0Uyc0Bm8LRM99hWEWoZxXL5M36AyX1pxdcvX1KskI_93IIE1FvYZVF0ESfsF1MfEJ20_iHsAguH3MMyPLma1mR3fZVm5NSAtrLfzNi4M1kK4m4V-_63roMoIq36wIkGOeZicdjwr7ORBdj6LfBIfxqe6Mja9mSFA/w640-h456/acs-4.png" width="640" /&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="separator" style="clear: both; text-align: left;"&gt;A complete scan of the catalogue is available &lt;a href="https://drive.google.com/file/d/1SuvuhgH5UQz12DHGqSy5rZFS4aavdGf7/view?usp=sharing"&gt;here&lt;/a&gt; as a PDF.&lt;/div&gt;</content>
      <link rel="replies" type="application/atom+xml" href="http://blog.jgc.org/feeds/6968922646267599704/comments/default" title="Post Comments"/>
      <link rel="replies" type="text/html" href="http://www.blogger.com/comment.g?blogID=19303585&amp;postID=6968922646267599704" title="1 Comments"/>
      <link rel="edit" type="application/atom+xml" href="http://www.blogger.com/feeds/19303585/posts/default/6968922646267599704"/>
      <link rel="self" type="application/atom+xml" href="http://www.blogger.com/feeds/19303585/posts/default/6968922646267599704"/>
      <link rel="alternate" type="text/html" href="http://blog.jgc.org/2024/06/acorn-computer-systems-catalogue-circa.html" title="Acorn Computer Systems catalogue circa 1983"/>
      <author>
        <name>Unknown</name>
        <email>noreply@blogger.com</email>
        <gd:image rel="http://schemas.google.com/g/2005#thumbnail" width="16" height="16" src="https://img1.blogblog.com/img/b16-rounded.gif"/>
      </author>
      <media:thumbnail xmlns:media="http://search.yahoo.com/mrss/" url="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjYB_ryt3FgR3bm1pwlfDV1jRwCeCUsS1mZT4i5TcAnMLi97PmT1pY10luDQifXwfB6Fj0ZSXRBQ9VoOkvtaGdVnmt7ewBTnwvOR4p4pFh_739x5QF68AsfJui7HOhTmfFyxXWmYI65F5pymISiQ6BvV-C4b-ApbQHJr_1chswGLAfu5wwTyePBmQ/s72-w452-h640-c/acs-1.png" height="72" width="72"/>
      <thr:total>1</thr:total>
    </entry>
    <entry>
      <id>tag:blogger.com,1999:blog-19303585.post-5445303529809922034</id>
      <published>2024-06-05T17:29:00.007+00:00</published>
      <updated>2024-06-07T16:20:02.448+00:00</updated>
      <title type="text">Fixing my iPhone 13 Pro cameras at -18C</title>
      <content type="html">&lt;p&gt;Look, I don't recommend you do this with your phone because bad things may happen, but the front and back cameras on my iPhone 13 Pro stopped working (in the camera app the image was black) and I "fixed" them myself using only a household appliance.&amp;nbsp;&lt;/p&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjO4w9hVxSZm6TGzsmvw1GUKUb4eN109N4zqYyIE_Ptj3ZqOS8whM9P6Dao0TQBFvakuNjRm-9_7HFkAuTOqQDqtRue0wpcP2p2yMyyfyOan4OTsyaWrVmkoqoLzJMuLN8LXDh8aAyiPyzJi-8aQv23U11opY56U-ylSyLFGmAC4pVOKf9kjGl_wg/s1082/255k-1.jpeg" style="margin-left: 1em; margin-right: 1em;"&gt;&lt;img border="0" data-original-height="1082" data-original-width="500" height="400" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjO4w9hVxSZm6TGzsmvw1GUKUb4eN109N4zqYyIE_Ptj3ZqOS8whM9P6Dao0TQBFvakuNjRm-9_7HFkAuTOqQDqtRue0wpcP2p2yMyyfyOan4OTsyaWrVmkoqoLzJMuLN8LXDh8aAyiPyzJi-8aQv23U11opY56U-ylSyLFGmAC4pVOKf9kjGl_wg/w185-h400/255k-1.jpeg" width="185" /&gt;&lt;/a&gt;&lt;/div&gt;&lt;p&gt;I was planning to get them replaced but to do that I'd need to replace the screen (because it has a crack in it) and it turned out to be €€€ so I figured I'd soldier on with a phone with a broken camera. Oddly, the flashlight still worked and FaceID.&lt;/p&gt;&lt;p&gt;But, hey, in the past I'd retrieved &lt;a href="https://blog.jgc.org/2023/08/retrieving-1tb-of-data-from-faulty.html"&gt;1TB of data using woodworking tools&lt;/a&gt; and this camera problem looked like yet another small connection fault to me. And connection faults like this shout "cool the thing down" to me, so I figured it was worth a try cooling the phone down (a lot). To be fair, I don't have a case on my phone have dropped it a few times.&lt;/p&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgJ-0hfZKAopa8bT_2U6yRCeIu5DMg3xLsOQxdx02inFIY4wuQvohZhTTFrxEDNzE4WmPvotdsXOklojkpKMSYnz-MlkvtBM97hlNRwFNedJ_2PBT9u658mCjlbSNZNjUtMfqBMv_gS3Q8dSaB-WMWRVxxjOVnRgk90IIj3PGVWr5HCl9xcNKsWkQ/s500/255k-3.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"&gt;&lt;img border="0" data-original-height="342" data-original-width="500" height="274" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgJ-0hfZKAopa8bT_2U6yRCeIu5DMg3xLsOQxdx02inFIY4wuQvohZhTTFrxEDNzE4WmPvotdsXOklojkpKMSYnz-MlkvtBM97hlNRwFNedJ_2PBT9u658mCjlbSNZNjUtMfqBMv_gS3Q8dSaB-WMWRVxxjOVnRgk90IIj3PGVWr5HCl9xcNKsWkQ/w400-h274/255k-3.jpg" width="400" /&gt;&lt;/a&gt;&lt;/div&gt;&lt;p&gt;Apple says the &lt;a href="https://support.apple.com/en-gb/guide/iphone/iphbbe12ba1/"&gt;iPhone can be stored at -20C switched off&lt;/a&gt; and a quick check of my freezer showed it was at -18C. So, one switched off iPhone in a ziplock bag and fifteen minutes later I had a phone with working cameras again.&lt;/p&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjiZ-5OQdBlGA7FvhMSapl4b5aFORcG4EBFqceijo_ckLLkK1QI_IXMHg-nfZTm1MFbsQHZE-hvQlKJTnsIjaNB9nMhaeQJ0GL0uacI_dz-z-mNx8NO58d7xv2DZjj0wRHGCFZiTV391Rs-iOPLBsfjNHaFcH9_DzbXO1jwAumMGJ-VHaIt3iKlUA/s747/255k-2.jpg" style="margin-left: 1em; margin-right: 1em;"&gt;&lt;img border="0" data-original-height="747" data-original-width="500" height="400" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjiZ-5OQdBlGA7FvhMSapl4b5aFORcG4EBFqceijo_ckLLkK1QI_IXMHg-nfZTm1MFbsQHZE-hvQlKJTnsIjaNB9nMhaeQJ0GL0uacI_dz-z-mNx8NO58d7xv2DZjj0wRHGCFZiTV391Rs-iOPLBsfjNHaFcH9_DzbXO1jwAumMGJ-VHaIt3iKlUA/w268-h400/255k-2.jpg" width="268" /&gt;&lt;/a&gt;&lt;/div&gt;&lt;p&gt;And a battery that needed recharging.&lt;/p&gt;</content>
      <link rel="replies" type="application/atom+xml" href="http://blog.jgc.org/feeds/5445303529809922034/comments/default" title="Post Comments"/>
      <link rel="replies" type="text/html" href="http://www.blogger.com/comment.g?blogID=19303585&amp;postID=5445303529809922034" title="0 Comments"/>
      <link rel="edit" type="application/atom+xml" href="http://www.blogger.com/feeds/19303585/posts/default/5445303529809922034"/>
      <link rel="self" type="application/atom+xml" href="http://www.blogger.com/feeds/19303585/posts/default/5445303529809922034"/>
      <link rel="alternate" type="text/html" href="http://blog.jgc.org/2024/06/fixing-my-iphone-13-pro-cameras-at-18c.html" title="Fixing my iPhone 13 Pro cameras at -18C"/>
      <author>
        <name>Unknown</name>
        <email>noreply@blogger.com</email>
        <gd:image rel="http://schemas.google.com/g/2005#thumbnail" width="16" height="16" src="https://img1.blogblog.com/img/b16-rounded.gif"/>
      </author>
      <media:thumbnail xmlns:media="http://search.yahoo.com/mrss/" url="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjO4w9hVxSZm6TGzsmvw1GUKUb4eN109N4zqYyIE_Ptj3ZqOS8whM9P6Dao0TQBFvakuNjRm-9_7HFkAuTOqQDqtRue0wpcP2p2yMyyfyOan4OTsyaWrVmkoqoLzJMuLN8LXDh8aAyiPyzJi-8aQv23U11opY56U-ylSyLFGmAC4pVOKf9kjGl_wg/s72-w185-h400-c/255k-1.jpeg" height="72" width="72"/>
      <thr:total>0</thr:total>
    </entry>
  </feed>
  """

  @rss_feed """
    <rss xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:sy="http://purl.org/rss/1.0/modules/syndication/" xmlns:slash="http://purl.org/rss/1.0/modules/slash/" xmlns:georss="http://www.georss.org/georss" xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#" xmlns:media="http://search.yahoo.com/mrss/" version="2.0">
    <channel>
      <title>The Story's Story</title>
      <atom:link href="https://jakeseliger.com/feed/" rel="self" type="application/rss+xml"/>
      <link>https://jakeseliger.com</link>
      <description/>
      <lastBuildDate>Tue, 06 Aug 2024 01:32:23 +0000</lastBuildDate>
      <language>en</language>
      <sy:updatePeriod> hourly	</sy:updatePeriod>
      <sy:updateFrequency> 1	</sy:updateFrequency>
      <generator>http://wordpress.com/</generator>
      <atom:link rel="search" type="application/opensearchdescription+xml" href="https://jakeseliger.com/osd.xml" title="The Story's Story"/>
      <atom:link rel="hub" href="https://jakeseliger.com/?pushpress=hub"/>
      <item>
        <title>“No Salt”</title>
        <link>https://jakeseliger.com/2024/08/05/no-salt/</link>
        <comments>https://jakeseliger.com/2024/08/05/no-salt/#comments</comments>
        <dc:creator><![CDATA[Jake Seliger]]></dc:creator>
        <pubDate>Mon, 05 Aug 2024 22:23:22 +0000</pubDate>
        <category><![CDATA[Books]]></category>
        <guid isPermaLink="false">http://jakeseliger.com/?p=9023</guid>
        <description><![CDATA[This is by my brother, Sam. I arrived to Arizona late Saturday, after learning that my brother has only a few days left before cancer ends him. Jake’s wife, Bess, confessed that she had neither the willpower or the energy to take care of the post-death rituals—in this case, cremation, followed by a celebration of [&#8230;]]]></description>
        <content:encoded><![CDATA[
  <p><em>This is by my brother, Sam. </em></p>
  <p>I arrived to Arizona late Saturday, after learning that my brother <a href="https://jakeseliger.com/2024/08/04/starting-hospice-the-end/">has only a few days left</a> before cancer <a href="https://jakeseliger.com/2023/07/22/i-am-dying-of-squamous-cell-carcinoma-and-the-treatments-that-might-save-me-are-just-out-of-reach/">ends him</a>. Jake’s wife, <a href="https://bessstillman.substack.com/">Bess</a>, confessed that she had neither the willpower or the energy to take care of the post-death rituals—in this case, cremation, followed by a celebration of life at some point in the future. Likely at <a href="https://jakeseliger.com/2023/08/21/i-know-what-happens-to-me-after-i-die-but-what-about-those-left-behind/">a memorial bench at Stuyvesant Park in New York City</a>, where he and Bess built their life together, met their core group of friends, and made their fondest memories.</p>
  <p>I do a lot of research, and finding a funeral home for my brother’s remains was and is quite a bit different than looking for, say, a great sushi restaurant. What should I look for out of a funeral home? Do they have five stars on Yelp? Do they seem “nice?”</p>
  <p>Several funeral homes that had good reviews online. The folks on the other end of the line seemed nice. They said the right things, which makes sense because they’ve got a sales funnel. And then they asked for a credit card. I get that funeral homes are businesses that need to make money, just as most of us do. It still feels callous and transactional. Send me an agreement, or something. I’ll DocuSign it. You’ll get your money. I’m barely functional at the moment—sleepwalking through my days as if I will somehow wake from this nightmare, watching my brother and his wonderful wife fall into despair.</p>
  <p><strong>Prior to his illness</strong>, Jake and I had been at odds for many years. I didn’t understand him, and neither did he. Both of us lacked the <a href="https://www.amazon.com/Adult-Children-Emotionally-Immature-Parents/dp/1626251703?ie=UTF8&amp;tag=thstsst-20&amp;linkCode=as2&amp;camp=1789&amp;creative=390957">emotional maturity</a> to form deep, meaningful relationships with other people. In my case, this manifested in self-destructive behaviors like drinking, partying, womanizing, and things of that nature. For Jake, he withdrew from most of society, finding more comfort from the pages of a novel or the many works he himself has written. He eventually found meaning in teaching, and focused on his relationship with Bess.</p>
  <p>In turn, I eventually found a partner and a wife who made me a better person. Somehow, both of us <a href="https://jakeseliger.com/2023/09/25/strange-trip-psychedelics-and-confronting-the-fear-of-death/">found our way to psychedelics</a> as a way of dealing with reality and exploring the deeper, more esoteric corners of the world. Over the last two years, Jake and I have talked extensively about our experiences with these substances. Therapy has never worked for me. <a href="https://www.wired.com/2000/05/mckenna/">As Terrence McKenna once said</a>, “The real truth, that dare not speak itself, is that no one is in control. Absolutely no one.”</p>
  <p>This is not meant to disparage therapists, advocates, or grief counselors. Each person must find their own way to deal with the reality that we perceive: what works for one may not work for others. Changing your life is difficult. It requires hard work. But your life may depend on it, so stop procrastinating and find something that works.</p>
  <p><strong><a href="https://jakeseliger.com/2023/08/21/i-know-what-happens-to-me-after-i-die-but-what-about-those-left-behind/">Besides psychedelics</a>, Jake</strong> and I have discovered over the past year that we share a love of cooking, particularly using modern gadgets like Instant Pots, sous vide, and interesting spices. Jake loves his <a href="https://www.amazon.com/gp/product/B01G5MZZ5Q?ie=UTF8&amp;tag=thstsst-20&amp;linkCode=as2&amp;camp=1789&amp;creative=390957">plug-in induction stovetop</a>, and thinks it worthwhile despite its cost. At one point I was supposed to go to the final auditions for a show called <a href="https://www.imdb.com/title/tt1694423/">MasterChef</a>, which pits amateur cooks against each other behind the gentle coaching of Gordon Ramsay. I foolishly accepted a job offer instead, but perhaps I’ll try again someday in honor of my brother.</p>
  <p>Which brings me to the title of this essay. When I arrived at their home yesterday, I observed Jake in the worst condition I’ve ever seen: emaciated, with obvious tumors rampaging throughout his neck and jaw. Bess is seven months pregnant, worrying about the impending death of her soulmate, clinging to what seems like an irrational hope of a miracle turnaround.</p>
  <p>I noticed an extremely uncharacteristic lack of food in their home—usually, when I walk in, Jake offers something to eat even when he knows I just ate—so I immediately went to the store to at least ensure that Bess had some food. Jake can scarcely take a sip of water, but says that “normal” food feels more wholesome going through his PEG tube than the brown, yet nutritious, <a href="https://www.functionalformularies.com/product/liquid-hope/">Liquid Hope</a> that gives him most of his daily calories.</p>
  <p>Jake still has a larder of dried goods, spices, and gadgets that would be the envy of even a professional chef. Fenugreek sourced directly from Egypt. Fermented locust beans from Nigeria. More forms of masala and curry than most Indian restaurants. I had ambitions to use these spices for what Jake labeled as “possibly his final real meal,”<sup data-fn="f8512c1c-7cae-4665-b5ba-b76a84e5b6e9" class="fn"><a href="#f8512c1c-7cae-4665-b5ba-b76a84e5b6e9" id="f8512c1c-7cae-4665-b5ba-b76a84e5b6e9-link">1</a></sup> only to realize that antibiotics have ruined his gastrointestinal system to the point that making anything exotic might bug his stomach.</p>
  <p>So I opted for something simple: a shakshuka. Tomatoes, vegetables, sauce, and mild flavorings, topped with feta cheese, eggs, and basil. I reached for the salt, and found the bottle empty. I’m not sure why, but I started weeping. No salt. No salt means that he’s not cooking. He’ll never cook again. Salt is the most basic ingredient. <a href="https://jakeseliger.com/2024/02/26/food-and-friends-part-i-food-is-social-life/">Food is (was, I guess) so important to him.</a> He cooked for Bess throughout the summer of 2023, when he couldn’t eat anything except by PEG tube.</p>
  <figure class="wp-block-image size-large"><a href="https://jakeseliger.com/wp-content/uploads/2024/08/hospice-and-the-end.jpg"><img width="1024" height="702" data-attachment-id="9004" data-permalink="https://jakeseliger.com/2024/08/04/starting-hospice-the-end/hospice-and-the-end/" data-orig-file="https://jakeseliger.com/wp-content/uploads/2024/08/hospice-and-the-end.jpg" data-orig-size="2048,1405" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="hospice and the end" data-image-description="" data-image-caption="" data-medium-file="https://jakeseliger.com/wp-content/uploads/2024/08/hospice-and-the-end.jpg?w=300" data-large-file="https://jakeseliger.com/wp-content/uploads/2024/08/hospice-and-the-end.jpg?w=550" tabindex="0" role="button" src="https://jakeseliger.com/wp-content/uploads/2024/08/hospice-and-the-end.jpg?w=1024" alt="" class="wp-image-9004" /></a></figure>
  ]]></content:encoded>
        <wfw:commentRss>https://jakeseliger.com/2024/08/04/starting-hospice-the-end/feed/</wfw:commentRss>
        <slash:comments>45</slash:comments>
        <media:content url="https://1.gravatar.com/avatar/7db06ea6c8b149f54c6756ea9881481c2631cf717b2db5a8c62f7f6f1e1223d4?s=96&amp;d=https%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D96" medium="image">
          <media:title type="html">Jake Seliger</media:title>
        </media:content>
        <media:content url="https://jakeseliger.com/wp-content/uploads/2024/08/hospice-and-the-end.jpg?w=1024" medium="image"/>
      </item>
      <item>
        <title>More isn't always better: death and over-treatment as a downside of agenticness</title>
        <link>https://jakeseliger.com/2024/07/29/more-isnt-always-better-death-and-over-treatment-as-a-downside-of-agenticness/</link>
        <comments>https://jakeseliger.com/2024/07/29/more-isnt-always-better-death-and-over-treatment-as-a-downside-of-agenticness/#comments</comments>
        <dc:creator><![CDATA[Jake Seliger]]></dc:creator>
        <pubDate>Mon, 29 Jul 2024 12:30:00 +0000</pubDate>
        <category><![CDATA[cancer]]></category>
        <category><![CDATA[Essays]]></category>
        <category><![CDATA[Personal]]></category>
        <guid isPermaLink="false">http://jakeseliger.com/?p=8951</guid>
        <description><![CDATA[i. Aren’t we clever? Bess and I felt so very smart. In April, we congratulated ourselves for navigating the healthcare system to get two doses of spot radiation that, in conjunction with clinical trial drug PDL1V, likely shrunk, and perhaps temporarily eliminated, the squamous cell carcinoma tumors in my neck that have been strangling me [&#8230;]]]></description>
        <content:encoded><![CDATA[
  <p>i. Aren’t we clever?</p>
  <p><strong>Bess and I felt so very smart</strong>. In April, we congratulated ourselves for navigating the healthcare system to get <a href="https://jakeseliger.com/2024/05/20/in-which-the-antibody-drug-conjugate-adc-pdl1v-shrinks-the-tumors-in-my-neck-and-buys-me-more-time/">two doses of spot radiation</a> that, in conjunction with clinical trial drug PDL1V, likely shrunk, and perhaps temporarily eliminated, <a href="https://jakeseliger.com/2023/07/22/i-am-dying-of-squamous-cell-carcinoma-and-the-treatments-that-might-save-me-are-just-out-of-reach/">the squamous cell carcinoma tumors in my neck</a> that have been strangling me to death for the last year. Between <a href="https://jakeseliger.com/2024/03/18/in-which-the-squamous-cell-carcinoma-tumors-in-my-neck-grow-by-20-in-two-months/">bad scans in March 2024</a> and entering the PDL1V trial on April 15, two new tumors erupted from the left side of my jaw. Their size made me doubt whether PDL1V would have enough time to work at all, and so we sought adjunct radiation in the hopes of buying more time. Moreover, some evidence shows that the chemo part of PDL1V may make tumors more susceptible to radiation.</p>
  <p>Clinical trials prefer that patients get only the treatment offered by the trial. Still, many allow exceptions for things like spot radiation, in order to help patients improve their quality of life and live long enough to see whether the trial drug is working. So Bess and I coordinated between the Mayo Clinic-Phoenix, which, if I have a primary care site, is it, and START-Utah, where PDL1V was being offered, to get up to five doses of spot radiation on the most ominous appearing neck tumors. This is where having lung mets comes in handy: because there were non-neck markers of disease, and the study could measure those as well.</p>
  <p>I got a radiation dose on April 20, and another on April 22, but the PDL1V and the radiation together <a href="https://jakeseliger.com/2024/05/09/the-recent-war-between-cancer-and-cancer-treatment-side-effects/">made me so sick</a> that I quit after the two radiation doses. Yet those two treatments were enough: we almost immediately saw liquefied tumor begin draining through a fistula in my skin. The bulky noose of my other, deeper tumors visibly shrank from where they’d been pressing outwards on my neck’s vital structures. It was an incredible reversal. My breathing improved. I could eat most blended foods by mouth, even slightly spicy ones. Bess and I took walks in the evening, anticipating that maybe I’d live long enough to meet our daughter when she arrives in October.</p>
  <p>A month of unanticipated optimism culminated in Bess and I <a href="https://jakeseliger.com/2024/06/13/manifest-the-manifold-markets-nerd-festival/">traveling to Berkeley for the Manifest conference</a>. We walked miles a day, enjoyed the cooler weather, and met with other internet writing wonks. I met people with whom I’d been trading e-mails and DMs for years. I hoped I was introducing Bess to the weirdos and writers who are her people. In-person access to the world of generative ideas and arguments is slim in Arizona, but now she knows how to find her people remotely. The future seemed to be opening a crack.</p>
  <p>If some is good, more must be better, right? I thought about whether radiation and PDL1V together might be able to eliminate the tumors in my neck, so we arranged my remaining sessions of spot radiation. We returned from Berkeley on June 10&nbsp;and drove straight to Mayo. Maybe I’d get two or three more doses of radiation, another few rounds of PDL1V to really put the screws to the leftover cancer cells, and then I’d enter a future of maintenance immunotherapy. It felt as if we’d not only found, but forged, the secret key that would open the door to the rest of our lives together.</p>
  <p>It was my last physically functional day.</p>
  <span id="more-8951"></span>
  <p>ii. Gambled and lost &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
  <p><strong>I woke up the morning of June 11</strong>&nbsp;to a bedside trash can filled with blood-tinged tissues. I was breathing, the blood was very light, and it seemed plausible that it was just tissue irritation from the combination of frequent spitting and radiation. I’d just fried my mucosa with a high-powered laser the day before. Bess agreed. I felt terribly off, and like I should quit, but I didn’t. he blood in my throat didn’t return, so, on June 12, I got a second dose of radiation, expecting results and side effects similar to those I’d had in April.</p>
  <p>But I crossed some invisible threshold on June 12 that, between then and now, has sent me close to my own death. I rapidly went from being able to eat entirely by mouth on June 9, to aspirating and choking so badly when trying to get food down that I’d likely have taken a couple hundred mg of Oxy out of frustration and&nbsp;misery&nbsp;had I not promised Bess I’d tell her prior to&nbsp;<a href="https://jakeseliger.com/2024/01/23/will-things-get-better-suicide-and-the-possibility-of-waiting-to-find-out/" target="_blank" rel="noreferrer noopener">self-termination</a>. The decision about death was almost made for me one afternoon while Bess was at work, when a food slurry sealed off my inflamed airway so that I started to black out before clearing it at the last moment.</p>
  <p>I started a course of steroids, which didn’t ameliorate any symptoms. My voice completely disappeared. I lost the little range of motion I had left in my neck. My body produced a constant sticky mucus, coating my mouth and throat all the time. The unpredictability of the misery was, at first, as bad as the symptoms. I’d be sitting doing nothing and with no warning, I‘d start coughing and couldn’t breathe. &nbsp;I’d try to breathe against a mucous-blocked airway, but no oxygen was getting past the goo.As I tried to draw breath in, slime was drawn further into my neck and lungs, prolonging the hacking-choking&nbsp;process. Later, the unpredictability gave way to an expectation of near-constant mucus plugs. I couldn’t go more than an hour without one. The noose once again tightened around my neck.</p>
  <p><strong>Much in cancer treatment is a controlled gamble</strong>, and the latest gamble generated extensive, probably permanent, losses, and those losses have shrunk my world into claustrophobia. I can’t tilt my head far enough back to eat any more. I can’t really sleep any more, because something about the radiation seems to have turned on the mucus-slime-saliva-goo function and unleashed a torrent of liquid and semi-liquid that slides into my airway the moment I tilt back even slightly, awakening me via asphyxiation The fall from June 9 to now has been horrible.</p>
  <p>I’ve written about how important&nbsp;<a href="https://jakeseliger.com/2024/04/22/the-emotional-trial-of-clinical-trials-part-1-its-like-online-dating-except-if-you-choose-wrong-you-die/" target="_blank" rel="noreferrer noopener">agenticness is</a>, especially in the setting of complex healthcare, because, outside of you and your family, no one else is going to care—really care—about what you do and how you do it. Bess wrote “<a href="https://bessstillman.substack.com/p/please-be-dying-but-not-too-quickly" target="_blank" rel="noreferrer noopener">Please be dying, but not too quickly: a clinical trial story</a>” to help people better advocate for themselves and navigate the clinical trial system that has kept me alive for the last year. An underlying theme in our writing is “do more, and don’t expect doctors or other healthcare people to do it for you.” Sometimes, however, that principle can get taken too far, as has happened to me.</p>
  <p>We ignored a key tenet in many things in life: “More is not always better,” and yet, like a fool, I succumbed to “more is better syndrome.” We both did.</p>
  <p>Intoxicated by the possibility of a future, we missed the red flag warnings of the past.</p>
  <p>iii. Red flags</p>
  <p>There were and are good reasons to think radiation would not be sufficient to eliminate all tumor.</p>
  <p><strong>1. Gross tumors in me have already been eliminated twice</strong>: once in Oct. 2022 (followed by radiation), again in May 2023 (pre -and post-ceded by pembrolizumab (“Keyruda”—a PD-1 drug)). The cancer returned both times. Cancer cells in this HNSCC are obviously not limited to the visible tumors; <a href="https://www.natera.com/oncology/signatera-advanced-cancer-detection/">a Signatera circulating tumor DNA</a> (ctDNA) test in June 2023 showed some tumor DNA, and by July 2023 we found gross tumor again. For me, gross tumors are not the whole story. One of the pathologic features of my tumor is “perineural invasion,” which means that microscopic tumor has taken up residence within, and is able to travel along, the nerves. If microscopic cancer cells are in my nerves, it’s not only possible, but probable, that they’ve ridden that highway to other parts of my body, awaiting the right tumor microenvironment that will allow them to erupt.</p>
  <p>Seagen PDL1V works differently than Keytruda; though it also binds to PD-1, it delivers a chemo payload. But it’s still another PD-1 drug. There was and is a reasonable chance it can’t eliminate all the cancer cells.&nbsp;Which is what happened to me.</p>
  <p><strong>2. I was&nbsp;</strong><a href="https://erictopol.substack.com/p/charlie-swanton-a-master-class-on" target="_blank" rel="noreferrer noopener"><strong>listening to a podcast with Eric Topol</strong></a><strong>&nbsp;and a cancer guy</strong>, who says: &#8220;Thinking about cancer rather than just sort of a single group of chaotically proliferating cells to a vision of cancer interacting both locally within a microenvironment but more distantly across organs and how organs communicate with the cancer through neuronal networks, for example, I think is going to be the next big challenge by setting the field over the next decade or two.&#8221;&nbsp;</p>
  <p>That’s vital. Given point #1, it’s pretty clear that my cancer is not just “of the tongue” or now “in the neck.” It’s distributed. More radiation into specific places in the neck wasn’t likely to get me to the complete response I’d imagined.&nbsp;I’d injected the full dose of <a href="https://www.yourdictionary.com/hopium">hopium</a>. I was blinded by <a href="https://jakeseliger.com/2023/12/07/tentative-fluttering-optimism-the-surprising-hot-r-d-ferment-in-head-and-neck-cancer-treatment/">optimism</a>.</p>
  <p><strong>3. On June 18 Bess and I saw the new Mayo head and neck onc</strong>, <a href="https://www.mayoclinic.org/biographies/chintakuntlawar-ashish-v-m-b-b-s-ph-d/bio-20206033">Dr. Chintakuntlawar</a>. He is cognizant of what’s going on, unlike Mayo’s previous head and neck oncologist, a doctor named Savvides who was an excellent counter-example to Mayo’s tagline that “the needs of the patient comes first.” Dr. C observed that that PDL1V is an experimental immunotherapy, so there’s little to no data. In other cancers, something like 30 – 50% of cancers recur when patients discontinue immunotherapies. When those people get back on the same immunotherapy, it often fails. Stop the immunotherapy and die.</p>
  <p><strong>None of these lines of evidence is final</strong> or dispositive, but, taken together, I wish I’d not been so enthralled at the possibility of complete response. Like Gandalf too-slowly realizing the nature of Saruman, we overestimated the likelihood that something being good once would continue being good.&nbsp;The same agenticness that has kept me alive for the last year became the thing that is killing me.</p>
  <p>But every decision we’ve made has been a gamble. Every study drug is potentially debilitating. Every next step a potential dead end. I could’ve had an allergic reaction Petosemtamab, the first study drug I took, and anaphylaxed back in September, dropping dead on the spot.</p>
  <p>Repeatedly dodging bad outcomes might have made me recklessly think the dice would keep rolling in my favor. <a href="https://bessstillman.substack.com/">Bess</a> says that she thought of the common risks that came with radiation, but focused on how spectacular the reward for those risks might be. She also says she never anticipated the risks being so rapid and horrific, so singularly destructive. She was thinking of the potential of future necrosis to my jaw bone, not the wholesale, immediate ruination of my quality of life. The risks of doing anything experimental can be severe. The risks of doing nothing certainly are. That doesn’t make bearing the weight of the decision any easier. The whiplash of my change in fortunes is difficult to express.</p>
  <p>iv. Troubleshooting</p>
  <p><strong>Since June 12, we’ve been trying desperately to troubleshoot</strong> my ever-worsening complications. Because of the constant aspiration whenever I&nbsp;tried to eat, I began dropping weight. At first, most of that loss seemed to be from water, so Bess gave me IV fluids at home (one bonus of living with an ER doc who has a medical supply account). Something about PDL1V seemed to perpetually dehydrate me, though I don’t understand why, or where all the infused water goes. As my swallow worsened, it became obvious that I couldn’t literally inhale nutrition as a means of survival; I was becoming grossly malnourished.&nbsp;</p>
  <p>In June, I went to Mayo for a swallow study performed by heroic speech pathologist Jessica Gregor, and, if I went slowly, my swallow appeared okay, which was at odds with how I felt. There was, however, what appeared to be “webbing” in the throat; the webbing is scar tissue that creates perforate barriers in my esophagus. Perhaps the webbing slowed the funnel, so liquid backs up, and then I aspirate. Maybe my acute symptoms, though horrible, might be secondary to early radiation damage and inflammation, and not permanent? The gastroenterologist, Dr. Bering, scheduled me for an esophageal dilation for July 1, in the hopes that it would solve the aspiration problems and prevent me from needing the awful PEG tube replaced.</p>
  <p>Unfortunately, through June my weight and my symptoms worsened acutely. Day-by-day, I was in denial about how bad things were becoming, and I kept looking for signs that I’d be able to swallow normally again. Still, long before my dilation, it became obvious I’d starve to death before the cancer killed me. A few days before my dilation, Bess called Dr. Bering to let her know the PEG tube I’d been trying to avoid was now necessary to keep me from dying. Could we do both? Incredibly, Dr. Bering was able to setup a PEG tube replacement the same day as the dilation. One single anesthesia session, with two small procedures: outside usual hospital protocol, and yet something the doctors were thankfully willing to do. Because my intubation was difficult<em>,&nbsp;</em>I ended up staying overnight in the ICU.</p>
  <p>A bronchoscopy performed that night by one of Bess’s colleagues as a favor revealed a Pseudomonas lung infection that required a course of antibiotics (this seemed like a minor detail at the time: subsequent events show it not to be). Then, because I terrified staff with a choking episode of the sort that had become routine since June 12, I ended up spending another night, then another to trial a CPAP (to say that it didn’t help is an understatement). Somehow a simple overnight from July 1 – 2 turned into July 1 – 4. &nbsp;</p>
  <p>On one hand, this was an incredibly efficient stay: three procedures in one day with one intubation. &nbsp;On the other, a prolonged admission —really, anything more than a night—comes with further deterioration. My weight continued to drop because I wasn’t able to get adequate tube feeds (hospitals don’t seem to understand how to manage anything that isn’t corn-syrup based Nutren 2.0).</p>
  <p>Even now, while I’m getting around 2200 calories a day through the PEG, my weight continues to ominously drop. Maybe the tumors are taking all the calories. Maybe starvation won’t kill me before the cancer does, because the cancer itself is starving me. Either way, this tumor wants to, and almost certainly will, prevail.</p>
  <p>v. Resolution</p>
  <p><strong>Since that hospital visit, nothing has seemed to stabilize.</strong> My body is still a mucous factory. My weight, despite pushing food through the PEG, is still dropping. My voice hasn’t returned.&nbsp;My head and neck hurt all the time,&nbsp;made worse by the incessant cough. I’m still spitting up green, infected-looking sputum.</p>
  <p>Since discharge I’ve been on two rounds of steroids, a panoply of pain medications, antibiotics (which we just learned yesterday my pseudomonal infection is resistant to), and all sorts of nebulized medications. Nothing is righting the ship.</p>
  <p>Sometimes you try so hard and it doesn’t work. That’s what Bess and I have been doing, and the grimly funny thing is that by trying so hard for the spot radiation, we actually had the exact opposite of the intended impact.</p>
  <p>It feels as though the problems have compounded, so that for each that is improved there are still five more to take its place. Every moment is pain, and, despite Bess’s hopes that it will prove otherwise, I don’t foresee my situation turning around. Small improvements, yes, but not enough.</p>
  <p>Every day passes in a painful gray blur. I do nothing but survive. I barely even survive, because I’m still losing weight. I’ve barely been able to write. Headaches consume my days.&nbsp;I can’t wake up properly. Foggy-headedness never abates. The mucous—I don’t know how to properly express the relentlessness of the mucous—never abates and constantly threatens to suffocate me. It’s an endless fount of misery that appears to have been switched on by the radiation.</p>
  <p>This is probably the last essay, unless something dramatic changes. The human body isn’t designed to survive like this. My whole life is pain and managing goo. That’s it.&nbsp;There is nothing.&nbsp;Nothing except slime, mucus, liquid, coughing, hacking, tissues, and pain. There is no time, space or energy for anything else.</p>
  <p>There’s a universe in which this second round of radiation only further beat back the tumors with side effects that were temporarily debilitating, but not permanently so; there’s another one in which the PDL1V kept working for months, so that the decision of what to do next, if anything, was delayed until after Bess gives birth to our daughter; Another, still, where the PDL1V never worked and I switched trials while I still had the strength to do so, and was one of the lucky patients in whom BGG-3055 has worked for almost 8 months. But I’m in this universe instead: the one in which the radiation has so destroyed my small reserves of strength and energy, weight and hope, that the likelihood of having enough energy to make it to a new trial in a week seems impossible. I can’t even walk down the hall without extreme pain and exhaustion. The two months it will take to welcome my daughter into the world may as well be an eternity. Every day is pain. And the reward for surviving the pain, is more pain.</p>
  <p>It&#8217;s possible that things might still miraculously turn around (and it’s also not always possible to predict what the “right” amount of treatment is). Bess maintains hope enough for both of us, though it’s a frantic, pleading hope that she admits is frequently illogical and based mostly on love and desperation. But she’s laser focused on the slim chance science and physiology may yet come through for me. The limited range of motion in my neck is likely from edema and not irreversible fibrosis (but there’s also new, palpable tumor on my right jaw). The antibiotic for my pseudomonal lung infection may help, and a few days of good sleep and increased calorie intake may, too. They may, but they most likely will not. I’ve seen my predictions and anticipations of doom falsified so far, but this time feels different. Bess, despite her impulse to search for answers to the seemingly unanswerable, feels it, too.</p>
  <p>I feel an existential completion. Wanting to stay and being able to stay are not the same things. No matter how agentic I’ve learned to become, not every problem has a solution. Every problem does, however, have a resolution. I think my resolution is close.</p>
  <hr class="wp-block-separator has-alpha-channel-opacity" />
  <p><em>If you’ve gotten this far, </em><a href="https://www.gofundme.com/f/help-the-fight-against-cancer-with-jake-s"><em>consider the Go Fund Me</em></a><em> that’s funding ongoing care. Anything that remains after I am gone will go to Athena when she is born in October. </em></p>
  <figure class="wp-block-image size-large"><a href="https://jakeseliger.com/wp-content/uploads/2024/07/arent-we-clever.jpg"><img width="1024" height="690" data-attachment-id="8954" data-permalink="https://jakeseliger.com/2024/07/29/more-isnt-always-better-death-and-over-treatment-as-a-downside-of-agenticness/arent-we-clever/" data-orig-file="https://jakeseliger.com/wp-content/uploads/2024/07/arent-we-clever.jpg" data-orig-size="6461,4355" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;3.5&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;ILCE-7CM2&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;1715305493&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;40&quot;,&quot;iso&quot;:&quot;200&quot;,&quot;shutter_speed&quot;:&quot;0.0125&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="arent we clever" data-image-description="" data-image-caption="" data-medium-file="https://jakeseliger.com/wp-content/uploads/2024/07/arent-we-clever.jpg?w=300" data-large-file="https://jakeseliger.com/wp-content/uploads/2024/07/arent-we-clever.jpg?w=550" tabindex="0" role="button" src="https://jakeseliger.com/wp-content/uploads/2024/07/arent-we-clever.jpg?w=1024" alt="" class="wp-image-8954" /></a></figure>
  ]]></content:encoded>
        <wfw:commentRss>https://jakeseliger.com/2024/07/29/more-isnt-always-better-death-and-over-treatment-as-a-downside-of-agenticness/feed/</wfw:commentRss>
        <slash:comments>29</slash:comments>
        <media:content url="https://1.gravatar.com/avatar/7db06ea6c8b149f54c6756ea9881481c2631cf717b2db5a8c62f7f6f1e1223d4?s=96&amp;d=https%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D96" medium="image">
          <media:title type="html">Jake Seliger</media:title>
        </media:content>
        <media:content url="https://jakeseliger.com/wp-content/uploads/2024/07/arent-we-clever.jpg?w=1024" medium="image"/>
      </item>
      <item>
        <title>Links: No one wants to talk about death, deep takes on the human condition, and more!</title>
        <link>https://jakeseliger.com/2024/07/16/links-no-one-wants-to-talk-about-death-deep-takes-on-the-human-condition-and-more/</link>
        <comments>https://jakeseliger.com/2024/07/16/links-no-one-wants-to-talk-about-death-deep-takes-on-the-human-condition-and-more/#comments</comments>
        <dc:creator><![CDATA[Jake Seliger]]></dc:creator>
        <pubDate>Wed, 17 Jul 2024 03:24:37 +0000</pubDate>
        <category><![CDATA[Links]]></category>
        <guid isPermaLink="false">http://jakeseliger.com/?p=8976</guid>
        <description><![CDATA[* &#8220;The Silence Doctors Are Keeping About Millennials’ Death.&#8221; Germane to me for obvious reasons; our culture denies both death and grief and seems not able to incorporate either, particularly when death is premature. My own end feels so close, particularly because my days, such as they are, are filled with pain and exhaustion. * &#8220;How [&#8230;]]]></description>
        <content:encoded><![CDATA[<p>* &#8220;<a href="https://www.theatlantic.com/health/archive/2024/07/millennials-cancer-death/678896/">The Silence Doctors Are Keeping About Millennials’ Death</a>.&#8221; Germane to me for obvious reasons; our culture denies both death and grief and seems not able to incorporate either, particularly when death is premature. My own end <a href="https://jakeseliger.com/2024/07/29/more-isnt-always-better-death-and-over-treatment-as-a-downside-of-agenticness/">feels so close</a>, particularly because my days, such as they are, are filled with pain and exhaustion.</p>
  <p>* &#8220;<a href="https://farmanimalwelfare.substack.com/p/how-can-we-get-the-world-to-talk">How can we get the world to talk about factory farming</a>?&#8221; We probably can&#8217;t, until we can replace conventional meat with lab-grown meat. Then we&#8217;ll spend a lot of time about how bad people were to animals in the old days. Also, &#8220;<a href="https://www.theatlantic.com/newsletters/archive/2024/07/america-has-never-really-known-what-to-make-of-vegetarians/678969">A Hundred Years of Mocking Vegetarians</a>: For a rare lifestyle choice, vegetarianism tends to drive people pretty bonkers.&#8221; Vegetarians are basically morally correct, and that makes the rest of us uncomfortable, so we lash out.</p>
  <p>* &#8220;<a href="https://archive.ph/csOhz">Immunotherapy Is Transforming Cancer Treatment and Oncology</a>.&#8221;</p>
  <p>* &#8220;<a href="https://www.slowboring.com/p/human-history-in-the-very-long-run-1d4">Human history in the very long run</a>.&#8221; I&#8217;m sad that I only get to see half the slice of human history I ought to see.</p>
  <p>* <a href="https://nealstephenson.substack.com/p/cow-milking-cud-chewing-and-flying">Neal Stephenson&#8217;s writing process</a>.</p>
  <p>* &#8220;<a href="https://www.newyorker.com/magazine/2021/09/06/magazine20000417hells-kitchen?">What working in a New York City restaurant was like circa 2000</a>&#8221; (<em>NY&#8217;er</em>, $). Early Bourdain, before TV made him into something different.</p>
  <p>* &#8220;<a href="https://www.anarchonomicon.com/p/vibecamp-and-porcfest-an-ethnography">Vibecamp &amp; Porcfest: An Ethnography of The Internet&#8217;s Edge</a>.&#8221; Offensive at times.</p>
  <p>* <a href="https://x.com/Tendar/status/1809924688199479698">Russia is losing a lot, hard, in Ukraine</a>. Plus, &#8220;<a href="https://theins.ru/en/politics/272870">Leaks reveal how Russia&#8217;s foreign intelligence agency runs disinformation campaigns in the West</a>.&#8221;</p>
  <p>* <a href="https://slate.com/business/2024/07/high-speed-rail-amtrak-transportation-policy-china-japan-europe.html">How to Build High-Speed Rail in America</a>.</p>
  <p>* <a href="https://www.thefitzwilliam.com/p/james-joyce-was-a-complicated-man">On James Joyce</a>.</p>
  <p>* <a href="https://www.sambowman.co/p/twenty-million-londoners-the-solution">London needs 20 million+ people</a>.</p>
  <p>* &#8220;<a href="https://www.immutep.com/detail/immutep-reports-positive-results-in-first-line-head-and-neck-squamous-cell-carcinoma-patients-with-negative-pd-l1-expression.html">Immutep Reports Positive Results in First Line Head and Neck Squamous Cell Carcinoma Patients with Negative PD-L1 Expression</a>.&#8221; These results are amazing: PD-L1 expression of greater than 1 is advised and perhaps necessary for Keytruda to have some chance of working. Mine was 5 in one test and 20 in another, and I failed Keytruda (or rather it failed me). These are really the kinds of results that, for a fatal diagnosis like head and neck cancer. &#8220;Efti&#8221; is the name of the drug.</p>
  <p>* <a href="https://www.wsj.com/politics/elections/elon-musk-has-said-he-is-committing-around-45-million-a-month-to-a-new-pro-trump-super-pac-dda53823">Tesla continues to become a partisan brand</a>, which is likely to hurt it in the both the short and long term.</p>
  <p>* <a href="https://www.maximum-progress.com/p/romae-industriae">More on why Rome missed an Industrial Revolution</a>.</p>
  <p>* &#8220;<a href="https://www.complexsystemspodcast.com/episodes/writing-history-byrne-hobart/">Writing the first draft of financial history with Byrne Hobart</a>.&#8221; Hobart and patio11 together!</p>
  <p>* <a href="https://thezvi.substack.com/p/housing-roundup-9-restricting-supply">Restricting housing supply is a bad idea</a>.</p>
  <p>* &#8220;<a href="https://jakeseliger.com/2023/10/31/puzzles-about-oncology-and-clinical-trials/">Puzzles about oncology and clinical trials</a>.&#8221; Me from 2023, still sadly relevant.</p>
  ]]></content:encoded>
        <wfw:commentRss>https://jakeseliger.com/2024/07/16/links-no-one-wants-to-talk-about-death-deep-takes-on-the-human-condition-and-more/feed/</wfw:commentRss>
        <slash:comments>2</slash:comments>
        <media:content url="https://1.gravatar.com/avatar/7db06ea6c8b149f54c6756ea9881481c2631cf717b2db5a8c62f7f6f1e1223d4?s=96&amp;d=https%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D96" medium="image">
          <media:title type="html">Jake Seliger</media:title>
        </media:content>
      </item>
    </channel>
  </rss>
  """

  @atom_item %{
    "authors" => [
      %{"email" => "noreply@blogger.com", "name" => "Unknown", "uri" => nil}
    ],
    "categories" => [
      %{
        "label" => nil,
        "scheme" => "http://www.blogger.com/atom/ns#",
        "term" => "hardware"
      }
    ],
    "content" => %{
      "base" => nil,
      "content_type" => "html",
      "lang" => nil,
      "src" => nil,
      "value" => "<p>This is the content</p>"
    },
    "contributors" => [],
    "extensions" => %{
      "media" => %{
        "thumbnail" => [
          %{
            "attrs" => %{
              "height" => "72",
              "media" => "http://search.yahoo.com/mrss/",
              "url" =>
                "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhXokF70rNbNS2w0ei9bHqVGaFi6KVXF6Cjlnd3Hp9yhhSD38FrvHTbdFRYr1JE4GUTywylxdFse1dKiBoO98IY3IYqpq8MSaUq6iAyq36rGKzgnli8gUKw_QmgleW2eJlX6Ns6MOukC_K3HvjRXfakGLjoHmCKL3Bj_-ful7Rz779ZPTy8UH-qXQ/s72-w640-h614-c/light-sense-1.jpg",
              "width" => "72"
            },
            "children" => %{},
            "name" => "media:thumbnail",
            "value" => nil
          }
        ]
      },
      "thr" => %{
        "total" => [
          %{
            "attrs" => %{},
            "children" => %{},
            "name" => "thr:total",
            "value" => "3"
          }
        ]
      }
    },
    "id" => "tag:blogger.com,1999:blog-19303585.post-8870263574877874516",
    "links" => [
      %{
        "href" => "http://blog.jgc.org/feeds/8870263574877874516/comments/default",
        "hreflang" => nil,
        "length" => nil,
        "mime_type" => "application/atom+xml",
        "rel" => "replies",
        "title" => "Post Comments"
      },
      %{
        "href" => "http://www.blogger.com/comment.g?blogID=19303585&postID=8870263574877874516",
        "hreflang" => nil,
        "length" => nil,
        "mime_type" => "text/html",
        "rel" => "replies",
        "title" => "3 Comments"
      },
      %{
        "href" => "http://www.blogger.com/feeds/19303585/posts/default/8870263574877874516",
        "hreflang" => nil,
        "length" => nil,
        "mime_type" => "application/atom+xml",
        "rel" => "edit",
        "title" => nil
      },
      %{
        "href" => "http://www.blogger.com/feeds/19303585/posts/default/8870263574877874516",
        "hreflang" => nil,
        "length" => nil,
        "mime_type" => "application/atom+xml",
        "rel" => "self",
        "title" => nil
      },
      %{
        "href" => "http://blog.jgc.org/2024/06/two-ways-to-use-led-as-light-sensor.html",
        "hreflang" => nil,
        "length" => nil,
        "mime_type" => "text/html",
        "rel" => "alternate",
        "title" => "Two ways to use  an LED as a light sensor with Arduino"
      }
    ],
    "published" => "2024-06-19T07:43:00.016Z",
    "rights" => nil,
    "source" => nil,
    "summary" => nil,
    "title" => %{
      "base" => nil,
      "lang" => nil,
      "type" => "Text",
      "value" => "Two ways to use  an LED as a light sensor with Arduino"
    },
    "updated" => "2024-06-20T12:38:31.606Z"
  }

  @atom_item_not_nested_content %{
    "authors" => [
      %{"email" => "noreply@blogger.com", "name" => "Unknown", "uri" => nil}
    ],
    "categories" => [
      %{
        "label" => nil,
        "scheme" => "http://www.blogger.com/atom/ns#",
        "term" => "hardware"
      }
    ],
    "content" => "<p>This is the content</p>",
    "contributors" => [],
    "extensions" => %{
      "media" => %{
        "thumbnail" => [
          %{
            "attrs" => %{
              "height" => "72",
              "media" => "http://search.yahoo.com/mrss/",
              "url" =>
                "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhXokF70rNbNS2w0ei9bHqVGaFi6KVXF6Cjlnd3Hp9yhhSD38FrvHTbdFRYr1JE4GUTywylxdFse1dKiBoO98IY3IYqpq8MSaUq6iAyq36rGKzgnli8gUKw_QmgleW2eJlX6Ns6MOukC_K3HvjRXfakGLjoHmCKL3Bj_-ful7Rz779ZPTy8UH-qXQ/s72-w640-h614-c/light-sense-1.jpg",
              "width" => "72"
            },
            "children" => %{},
            "name" => "media:thumbnail",
            "value" => nil
          }
        ]
      },
      "thr" => %{
        "total" => [
          %{
            "attrs" => %{},
            "children" => %{},
            "name" => "thr:total",
            "value" => "3"
          }
        ]
      }
    },
    "id" => "tag:blogger.com,1999:blog-19303585.post-8870263574877874516",
    "links" => [
      %{
        "href" => "http://blog.jgc.org/feeds/8870263574877874516/comments/default",
        "hreflang" => nil,
        "length" => nil,
        "mime_type" => "application/atom+xml",
        "rel" => "replies",
        "title" => "Post Comments"
      },
      %{
        "href" => "http://www.blogger.com/comment.g?blogID=19303585&postID=8870263574877874516",
        "hreflang" => nil,
        "length" => nil,
        "mime_type" => "text/html",
        "rel" => "replies",
        "title" => "3 Comments"
      },
      %{
        "href" => "http://www.blogger.com/feeds/19303585/posts/default/8870263574877874516",
        "hreflang" => nil,
        "length" => nil,
        "mime_type" => "application/atom+xml",
        "rel" => "edit",
        "title" => nil
      },
      %{
        "href" => "http://www.blogger.com/feeds/19303585/posts/default/8870263574877874516",
        "hreflang" => nil,
        "length" => nil,
        "mime_type" => "application/atom+xml",
        "rel" => "self",
        "title" => nil
      },
      %{
        "href" => "http://blog.jgc.org/2024/06/two-ways-to-use-led-as-light-sensor.html",
        "hreflang" => nil,
        "length" => nil,
        "mime_type" => "text/html",
        "rel" => "alternate",
        "title" => "Two ways to use  an LED as a light sensor with Arduino"
      }
    ],
    "published" => "2024-06-19T07:43:00.016Z",
    "rights" => nil,
    "source" => nil,
    "summary" => nil,
    "title" => %{
      "base" => nil,
      "lang" => nil,
      "type" => "Text",
      "value" => "Two ways to use  an LED as a light sensor with Arduino"
    },
    "updated" => "2024-06-20T12:38:31.606Z"
  }

  describe "parse_atom_feed/2" do
    test "parses Atom feed" do
      parsed_feed = Reader.parse_atom_feed("https://dummy/feed.rss", @atom_feed)
      assert Enum.count(parsed_feed) == 3
    end
  end

  describe "parse_rss_feed/2" do
    test "parses RSS feed" do
      parsed_feed = Reader.parse_rss_feed("https://dummy/feed.rss", @rss_feed)
      assert Enum.count(parsed_feed) == 3
    end
  end

  describe "get_published_at/1" do
    test "gets the publish date" do
      published_at = Reader.get_published_at(@atom_item)
      assert published_at == {:ok, ~U[2024-06-20 12:38:31.606Z]}
    end
  end

  describe "parse_body/1" do
    test "parses the body when content is a map" do
      body = Reader.parse_body(@atom_item)
      assert body == "<p>This is the content</p>"
    end

    test "parses the body when content is a string" do
      body = Reader.parse_body(@atom_item_not_nested_content)
      assert body == "<p>This is the content</p>"
    end
  end

  describe "parse_date/1" do
    test "parses the ISO extended date" do
      date = Reader.parse_date("2024-08-04T23:46:44.383+00:00")
      assert date == {:ok, ~U[2024-08-04 23:46:44.383Z]}
    end

    test "parses the RFC1123 date" do
      date = Reader.parse_date("Tue, 06 Aug 2024 01:32:23 +0000")
      assert date == {:ok, ~U[2024-08-06 01:32:23Z]}
    end

    test "parses unsupported date" do
      date = Reader.parse_date("2024-01-01")
      assert date == {:error, "Unsupported date format"}
    end
  end
end
