From: "Shaobo Liu" <shaobo.liu@binghamton.edu>
Date: Thu, 18 Jan 2007 19:27:05 +0000
Subject: [KJ] question about race condition
Message-Id: <200701181927.l0IJR6TA004900@bingnet2.cc.binghamton.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0943881693=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============0943881693==
Content-Type: multipart/alternative;
    boundary="----------=_1169148477-16437-731"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1169148477-16437-731
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I have a question about concurrence confusing me a lot.
 
As we know, when a resource is shared by multiple processes, we need some
mechanism to protect 
shared resource. 
For example, process A and process B both share a data structure DS.
Both A and B want write new data into DS. 
 
Usually we use a mutex to protect DS, 
here the mutex is defined as:
        
DECLARE_MUTEX(mut);
 
for process A
{
 
.....
down_interruptible(&mut);
A operates on DS;
up(&mut);
 
.......
}
 
 
for process B
{
 
.....
down_interruptible(&mut);
B operates on DS;
up(&mut);
 
.......
}
 
If the above pseudo code is run on a multi-core system, and if one core
tries "down_interruptible(&mut) " 
in process A,  with  another core trying "down_interruptible(&mut);" in
process B exactly at the same time, both A and B
will get the semaphore simultaneously, and then operate on DS.
 
It seems we have no way to protect the shared resource at all.
The similar logics also fit in with other locking mechanism such as mutex,
spinlock, and atomic variables.
 
Can you tell me my misunderstaning about above scenario.
 
Thanks. 

 


------------=_1169148477-16437-731
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html DEFANGED_xmlns:o=3D"urn:schemas-microsoft-com:office:office" DEFANGED=
_xmlns:w=3D"urn:schemas-microsoft-com:office:word" DEFANGED_xmlns=3D"http:/=
/www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<DEFANGED_style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
pre
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</DEFANGED_style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1><pre><font size=3D2 face=3D"Courier New"><span
DEFANGED_style=3D"font-size:10.0pt">I have a question about concurrence con=
fusing me a lot.<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt"><o:=
p>&nbsp;</o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">As =
we know, when a resource is shared by multiple processes, we need some mech=
anism to protect <o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">sha=
red resource. <o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">For=
 example, process A and process B both share a data structure DS.<o:p></o:p=
></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">Bot=
h A and B want write new data into DS. <o:p></o:p></span></font></pre><pre>=
<font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt"><o:=
p>&nbsp;</o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">Usu=
ally we use a mutex to protect DS, <o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">her=
e the mutex is defined as:<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></font></pre><pre=
><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">DEC=
LARE_MUTEX(mut);<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt"><o:=
p>&nbsp;</o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">for=
 process A<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">{<o=
:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt"><o:=
p>&nbsp;</o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">...=
..<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">dow=
n_interruptible(&amp;mut);<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">A o=
perates on DS;<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">up(=
&amp;mut);<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt"><o:=
p>&nbsp;</o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">...=
....<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">}<o=
:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt"><o:=
p>&nbsp;</o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt"><o:=
p>&nbsp;</o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">for=
 process B<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">{<o=
:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt"><o:=
p>&nbsp;</o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">...=
..<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">dow=
n_interruptible(&amp;mut);<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">B o=
perates on DS;<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">up(=
&amp;mut);<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt"><o:=
p>&nbsp;</o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">...=
....<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">}<o=
:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt"><o:=
p>&nbsp;</o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">If =
the above pseudo code is run on a multi-core system, and if one core tries =
&quot;down_interruptible(&amp;mut) &quot; <o:p></o:p></span></font></pre><p=
re><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">in =
process A,&nbsp; with&nbsp; another core trying &quot;down_interruptible(&a=
mp;mut);&quot; in process B exactly at the same time, both A and B<o:p></o:=
p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">wil=
l get the semaphore simultaneously, and then operate on DS.<o:p></o:p></spa=
n></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt"><o:=
p>&nbsp;</o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">It =
seems we have no way to protect the shared resource at all.<o:p></o:p></spa=
n></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">The=
 similar logics also fit in with other locking mechanism such as mutex, spi=
nlock, and atomic variables.<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt"><o:=
p>&nbsp;</o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">Can=
 you tell me my misunderstaning about above scenario.<o:p></o:p></span></fo=
nt></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt"><o:=
p>&nbsp;</o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span DEFANGED_style=3D"font-size:10.0pt">Tha=
nks. <o:p></o:p></span></font></pre>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span DEFANGED_style=3D"fo=
nt-size:10.0pt;
font-family:Arial"><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------------=_1169148477-16437-731--

--===============0943881693==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0943881693==--
