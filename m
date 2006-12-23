From: "=?ISO-8859-1?Q?Daniel_Marjam=E4ki?=" <daniel.marjamaki@gmail.com>
Date: Sat, 23 Dec 2006 08:50:05 +0000
Subject: [KJ] [PATCH] sound/pci/ac97/ac97_codec.c: Refactoring
Message-Id: <80ec54e90612230050g41b9f33dg7729cfbd46116954@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Signed-off-by: Daniel Marjam=E4ki <daniel.marjamaki@gmail.com>
--- linux/sound/pci/ac97/ac97_codec.c	2006-11-29 22:57:37.000000000 +0100
+++ linux-2.6.19/sound/pci/ac97/ac97_codec.c	2006-12-23 10:36:07.000000000 =
+0100
@@ -205,24 +205,16 @@ static int snd_ac97_valid_reg(struct snd
 	switch (ac97->id) {
 	case AC97_ID_AK4540:
 	case AC97_ID_AK4542:
-		if (reg <=3D 0x1c || reg =3D 0x20 || reg =3D 0x26 || reg >=3D 0x7c)
-			return 1;
-		return 0;
+		return (reg <=3D 0x1c || reg =3D 0x20 || reg =3D 0x26 || reg >=3D 0x7c);
 	case AC97_ID_AD1819:	/* AD1819 */
 	case AC97_ID_AD1881:	/* AD1881 */
 	case AC97_ID_AD1881A:	/* AD1881A */
-		if (reg >=3D 0x3a && reg <=3D 0x6e)	/* 0x59 */
-			return 0;
-		return 1;
+		return (reg < 0x3a && reg > 0x6e);	/* 0x59 */
 	case AC97_ID_AD1885:	/* AD1885 */
 	case AC97_ID_AD1886:	/* AD1886 */
 	case AC97_ID_AD1886A:	/* AD1886A - !!verify!! --jk */
 	case AC97_ID_AD1887:	/* AD1887 - !!verify!! --jk */
-		if (reg =3D 0x5a)
-			return 1;
-		if (reg >=3D 0x3c && reg <=3D 0x6e)	/* 0x59 */
-			return 0;
-		return 1;
+		return (reg =3D 0x5a || reg < 0x3c || reg > 0x6e);	/* 0x59 */
 	case AC97_ID_STAC9700:
 	case AC97_ID_STAC9704:
 	case AC97_ID_STAC9705:
@@ -230,9 +222,7 @@ static int snd_ac97_valid_reg(struct snd
 	case AC97_ID_STAC9721:
 	case AC97_ID_STAC9744:
 	case AC97_ID_STAC9756:
-		if (reg <=3D 0x3a || reg >=3D 0x5a)
-			return 1;
-		return 0;
+		return (reg <=3D 0x3a || reg >=3D 0x5a);
 	}
 	return 1;
 }
@@ -276,9 +266,8 @@ EXPORT_SYMBOL(snd_ac97_write);
  */
 unsigned short snd_ac97_read(struct snd_ac97 *ac97, unsigned short reg)
 {
-	if (!snd_ac97_valid_reg(ac97, reg))
-		return 0;
-	return ac97->bus->ops->read(ac97, reg);
+	return (snd_ac97_valid_reg(ac97, reg)) ?
+	          ac97->bus->ops->read(ac97, reg) : 0;
 }

 /* read a register - return the cached value if already read */
@@ -2381,10 +2370,7 @@ static void update_power_regs(struct snd
 		}
 	}
 	for (i =3D 0; i < PWIDX_SIZE; i++) {
-		if (power_up & (1 << i))
-			bits =3D 0;
-		else
-			bits =3D power_regs[i].mask;
+		bits =3D (power_up & (1 << i)) ? 0 : power_regs[i].mask;
 		snd_ac97_update_bits(ac97, power_regs[i].power_reg,
 				     power_regs[i].mask, bits);
 	}

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
