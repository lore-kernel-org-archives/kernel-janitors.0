From: "suchita  sharma" <suchita_sharma@rediffmail.com>
Date: Mon, 24 Jan 2005 08:16:52 +0000
Subject: [KJ] mpool problem in mpc8260 atm driver
Message-Id: <20050124081652.18261.qmail@webmail7.rediffmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37573489336440846=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============37573489336440846==
Content-Type: multipart/alternative;
    boundary="----------=_1106554564-25884-187"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1106554564-25884-187
Content-type: text/plain;
	charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

=20=20
 Hi ,

    I am using  mpc8260 atm driver . In my card local sdram is there which =
is used for connection tables ,Buffer descriptors etc .To map that memory a=
rea i am using ioremap and using mpool functions for allocating and freeing=
 the memory . sometimes it is working fine with 10 or more than 10 connecti=
on and sometimes it is failed saying Kernel access bad area . can anybody s=
uggest something ??


------------=_1106554564-25884-187
Content-type: text/html;
	charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<P>
&nbsp; <BR>
 Hi ,<BR>
<BR>
&nbsp; &nbsp; I am using&nbsp; mpc8260 atm driver . In my card local sdram =
is there which is used for connection tables ,Buffer descriptors etc .To ma=
p that memory area i am using ioremap and using mpool functions for allocat=
ing and freeing the memory . sometimes it is working fine with 10 or more t=
han 10 connection and sometimes it is failed saying Kernel access bad area =
. can anybody suggest something ??
</P>


<br><br>
<A target=3D"_blank" HREF=3D"http://clients.rediff.com/signature/track_sig.=
asp"><IMG DEFANGED_SRC=3D"http://ads.rediff.com/RealMedia/ads/adstream_nx.c=
gi/www.rediffmail.com/inbox.htm@Bottom" BORDER=3D0 VSPACE=3D0 HSPACE=3D0></=
a>

------------=_1106554564-25884-187--

--===============37573489336440846==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37573489336440846==--
