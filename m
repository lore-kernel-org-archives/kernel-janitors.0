From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 08 Feb 2006 07:02:03 +0000
Subject: [KJ][Patch] remove implicit sign bit in l64781.c
Message-Id: <1139382123.9409.45.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60797505448226352=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139380004.9409.40.camel@localhost.localdomain>
In-Reply-To: <1139380004.9409.40.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============60797505448226352==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day 

Below is a patch which removes the implicit sign bit on a single bit
field. The field 'first' is used as a flag to indicate a first attempt
at init. So the patch just converts it to unsigned.


Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc2/drivers/media/dvb/frontends/l64781.c.orig	2006-02-08 17:51:35.000000000 +1100
+++ linux-2.6.16-rc2/drivers/media/dvb/frontends/l64781.c	2006-02-08 17:53:34.000000000 +1100
@@ -37,7 +37,7 @@ struct l64781_state {
 	struct dvb_frontend frontend;
 
 	/* private demodulator data */
-	int first:1;
+	unsigned first:1;
 };
 
 #define dprintk(args...) \



--===============60797505448226352==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60797505448226352==--
