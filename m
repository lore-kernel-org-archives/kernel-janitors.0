From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 05 Mar 2006 21:02:44 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/acorn/
Message-Id: <1141592564.17717.21.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30600876221958284=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============30600876221958284==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch converts drivers/acorn/ to kzalloc usage.
Compile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/drivers/acorn/char/pcf8583.c.orig	2006-03-05 16:07:42.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/acorn/char/pcf8583.c	2006-03-05 16:07:51.000000000 +0100
@@ -55,11 +55,10 @@ pcf8583_attach(struct i2c_adapter *adap,
 		}
 	};
 
-	c = kmalloc(sizeof(*c), GFP_KERNEL);
+	c = kzalloc(sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return -ENOMEM;
 
-	memset(c, 0, sizeof(*c));
 	c->addr		= addr;
 	c->adapter	= adap;
 	c->driver	= &pcf8583_driver;



--===============30600876221958284==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30600876221958284==--
