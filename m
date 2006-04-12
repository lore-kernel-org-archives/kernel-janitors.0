From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 12 Apr 2006 13:37:24 +0000
Subject: [KJ][patch] fix array overflow in ak4114.c
Message-Id: <1144849044.8222.10.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61811921646359957=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============61811921646359957==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list

Coverity found a static overflow in ak4114.c @ line 46.

After looking at this a little it seems like someone has typed in the
wrong symbolic name (twice), as they were trying to save the TX state
register info.


The patch below changes the relevant AK4114_REG_RXCSB0 values to
AK4114_REG_TXCSB0. Which both makes more sense and fixes the array
overflow.


Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- 2.6.17-rc1-git5/sound/i2c/other/ak4114.c.orig	2006-04-12 23:12:43.000000000 +1000
+++ 2.6.17-rc1-git5/sound/i2c/other/ak4114.c	2006-04-12 23:16:56.000000000 +1000
@@ -42,8 +42,8 @@ static void reg_write(struct ak4114 *ak4
 	ak4114->write(ak4114->private_data, reg, val);
 	if (reg <= AK4114_REG_INT1_MASK)
 		ak4114->regmap[reg] = val;
-	else if (reg >= AK4114_REG_RXCSB0 && reg <= AK4114_REG_TXCSB4)
-		ak4114->txcsb[reg-AK4114_REG_RXCSB0] = val;
+	else if (reg >= AK4114_REG_TXCSB0 && reg <= AK4114_REG_TXCSB4)
+		ak4114->txcsb[reg-AK4114_REG_TXCSB0] = val;
 }
 
 static inline unsigned char reg_read(struct ak4114 *ak4114, unsigned char reg)



--===============61811921646359957==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61811921646359957==--
