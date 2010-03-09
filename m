From: Julia Lawall <julia@diku.dk>
Date: Tue, 09 Mar 2010 21:14:58 +0000
Subject: [PATCH 4/5] drivers/staging/otus: drop redundant memset
Message-Id: <Pine.LNX.4.64.1003092214350.4974@ask.diku.dk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="-511516320-430609882-1268169298=:4974"
List-Id: <kernel-janitors.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@suse.de>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---511516320-430609882-1268169298=:4974
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Julia Lawall <julia@diku.dk>

The region set by the call to memset is immediately overwritten by the
subsequent call to memcpy.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e1,e2,e3,e4;
@@

- memset(e1,e2,e3);
  memcpy(e1,e4,e3);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/otus/wwrap.c |    1 -
 1 file changed, 1 deletion(-)

diff -u -p a/drivers/staging/otus/wwrap.c b/drivers/staging/otus/wwrap.c
--- a/drivers/staging/otus/wwrap.c
+++ b/drivers/staging/otus/wwrap.c
@@ -955,7 +955,6 @@ int zfLnxCencSendMsg(struct sock *netlin
 	/*=CC=EE=D0=B4=CA=FD=BE=DD=B1=A8=CF=E0=B9=D8=D0=C5=CF=A2*/
 	nlh =3D NLMSG_PUT(skb, 0, 0, WAI_K_MSG, size-sizeof(*nlh));
 	pos =3D NLMSG_DATA(nlh);
-	memset(pos, 0, len);
=20
 	/*=B4=AB=CA=E4=B5=BD=D3=C3=BB=A7=BF=D5=BC=E4=B5=C4=CA=FD=BE=DD*/
 	memcpy(pos, msg,  len);
---511516320-430609882-1268169298=:4974--
