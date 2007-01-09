From: "Sudheer YSV" <sudheer.ysv@gmail.com>
Date: Tue, 09 Jan 2007 03:58:05 +0000
Subject: [KJ] Regarding in_interrupt()
Message-Id: <adfc68cb0701081946q56cb32e4y3bdfb1888fb028eb@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0379381490=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============0379381490==
Content-Type: multipart/alternative;
    boundary="----------=_1168314429-15709-293"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1168314429-15709-293
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hi,

As you know  in_interrupt() returns non zero if the kernel is in interrupt
context.(ie in interrupt handler or bottom half).
But in a SMP systems, if one CPU is in interrupt context and another CPU is
in process contex, then what will be the
result of in_interrupt().


Regards
Sudheer

------------=_1168314429-15709-293
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<br clear="all"><br>hi,<br><br>As you know&nbsp;<span DEFANGED_style="font-weight: bold;"> in_interrupt()</span> returns non zero if the kernel is in interrupt context.(ie in interrupt handler or bottom half).<br>But in a SMP systems, if one CPU is in interrupt context and another CPU is in process contex, then what will be the 
<br>result of <span DEFANGED_style="font-weight: bold;">in_interrupt().<br><br><br>Regards<br>Sudheer<br></span>

------------=_1168314429-15709-293--

--===============0379381490==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0379381490==--
