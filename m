From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 12 Apr 2006 14:04:29 +0000
Subject: [KJ][Patch] fix 2nd overflow in ak4114.c
Message-Id: <1144850670.8222.20.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37637592687098431=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============37637592687098431==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list

I am sorry but I have done it again. The next coverity bug is in the
same file and I didn't notice till I had sent out the first patch.


Anyway here is a separate patch for the second bug. After doing the
first patch this one looks right, although I am not so sure this time.





Coverity found a static overflow in ak4114.c @ line 137.

The patch below limits the array usage to that allocated for it.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- 2.6.17-rc1-git5/sound/i2c/other/ak4114.c.orig	2006-04-12 23:12:43.000000000 +1000
+++ 2.6.17-rc1-git5/sound/i2c/other/ak4114.c	2006-04-12 23:46:58.000000000 +1000
@@ -134,7 +134,8 @@ void snd_ak4114_reg_write(struct ak4114 
 	if (reg <= AK4114_REG_INT1_MASK)
 		reg_write(chip, reg, (chip->regmap[reg] & ~mask) | val);
 	else if (reg >= AK4114_REG_TXCSB0 && reg <= AK4114_REG_TXCSB4)
-		reg_write(chip, reg, (chip->txcsb[reg] & ~mask) | val);
+		reg_write(chip, reg, 
+			(chip->txcsb[reg-AK4114_REG_TXCSB0] & ~mask) | val);
 }
 
 void snd_ak4114_reinit(struct ak4114 *chip)



--===============37637592687098431==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37637592687098431==--
