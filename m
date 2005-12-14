From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 14 Dec 2005 16:52:08 +0000
Subject: [KJ] [Patch] check u32 < 0 in hwmon/fscpos.c
Message-Id: <1134579128.24284.4.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44866154943923275=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============44866154943923275==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

yet another check < 0. Since data->pwm is u8 i removed the
check. Maybe v should be u8 and simple_strtoul() casted to u8,
so we can remove both checks. If this is the case, i would create
a patch to convert all those cases in the file.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc5-git2/drivers/hwmon/fscpos.c.orig	2005-12-14 17:45:47.000000000 +0100
+++ linux-2.6.15-rc5-git2/drivers/hwmon/fscpos.c	2005-12-14 17:45:53.000000000 +0100
@@ -229,7 +229,6 @@ static ssize_t set_pwm(struct i2c_client
 	unsigned long v = simple_strtoul(buf, NULL, 10);
 
 	/* Range: 0..255 */
-	if (v < 0) v = 0;
 	if (v > 255) v = 255;
 
 	down(&data->update_lock);



--===============44866154943923275==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44866154943923275==--
