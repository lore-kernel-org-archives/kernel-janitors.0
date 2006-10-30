From: Giangiacomo Mariotti <giangiacomo_mariotti@yahoo.com>
Date: Mon, 30 Oct 2006 12:22:26 +0000
Subject: Re: [KJ] [PATCH] cleaning of HANDLE_STACK definition
Message-Id: <20061030122226.55465.qmail@web90305.mail.mud.yahoo.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0787759081=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061029191459.92665.qmail@web90313.mail.mud.yahoo.com>
In-Reply-To: <20061029191459.92665.qmail@web90313.mail.mud.yahoo.com>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============0787759081==
Content-Type: multipart/alternative;
    boundary="----------=_1162211012-21038-434"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1162211012-21038-434
Content-Type: text/plain; charset=ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Darren Jenkins wrote:
>While you are spot on here and that explains what the code did before
>the patch, I think the point that Matthew Wilcox was getting at is
>that _after_ this patch the "do { } while (0)", now apears to wrap a
>_single_ "while (cond) { }" statement, making it surperflous.
Yes,this was my point too,but then I tryied to maintain the general style o=
f the code fragment,
so now the code is conformant to the kernel code style and it's clearer tha=
n before.








------------=_1162211012-21038-434
Content-Type: text/html; charset=ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html><head><DEFANGED_style_0 <!-- DIV {margin:0px;} --></DEFANGED_style></=
head><body><div DEFANGED_style=3D"font-family:times new roman, new york, ti=
mes, serif;font-size:12pt"><div DEFANGED_style=3D"font-family: times new ro=
man,new york,times,serif; font-size: 12pt;">Darren Jenkins wrote:<br><div D=
EFANGED_style=3D"font-family: times new roman,new york,times,serif; font-si=
ze: 12pt;"><div>&gt;While you are spot on here and that explains what the c=
ode did before<br>&gt;the patch, I think the point that Matthew Wilcox was =
getting at is<br>&gt;that _after_ this patch the "do { } while (0)", now ap=
ears to wrap a<br>&gt;_single_ "while (cond) { }" statement, making it surp=
erflous.<br>Yes,this was my point too,but then I tryied to maintain the gen=
eral style of the code fragment,<br>so now the code is conformant to the ke=
rnel code style and it's clearer than before.<br><br></div></div><br></div>=
</div><br></body></html>
------------=_1162211012-21038-434--

--===============0787759081==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0787759081==--
