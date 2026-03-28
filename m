Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B362F33F8DA
	for <kernel-janitors@vger.kernel.org>; Sat, 28 Mar 2026 19:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774724961; cv=pass; b=sP8HSEE3lmjHD3NyFlboOxE0frNiCGjJW1dM9pMaCbLETs7+C005XUzDzvdi9itk5LcidCmrATtlF0nVc2/qoPWg7SXckLoOMqkieEOQpTODDLYks6mONQTt01u1D9mZikF3FvHoNz2HPYfMdJDCw1WuNOIOR0fkJQuqnd8drt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774724961; c=relaxed/simple;
	bh=2KpCVyYc6GNvJTAuuJtrZA5Y2ayFgkcWH9mO+Ji+3W8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=POUE/dyvM+LPiyAdny4OofexCDJpfb0/HxF6fc2cfeWCZd5A5hHrvE8g9lROfI2qZmO4NnARNKy5nhPELoZSG9uMLd+WKuDbf2I9NyfNLqeXBJObj31zeoxCG0r1wUMgG1yDaLxIc8RvEQyQopd3Ky2iv+GGdoXKeqos1wUbHWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUf52m12; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUf52m12"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b97ba4c2be2so420243166b.1
        for <kernel-janitors@vger.kernel.org>; Sat, 28 Mar 2026 12:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774724957; cv=none;
        d=google.com; s=arc-20240605;
        b=HgWHrI5//eifbWUUn814hXEvwUPFeAlygDUVWyD99MzGLxPUsSub5tcO+op2YZdW0D
         21Fb4fa3EDhSFUbv0kSygA/cxOU73z0pgRRI+PtaK/9KYpgsP/2j1hd2eQRlGz2jMoJV
         MXp+hvjbtEyZZwXHsGr3l0D+2gBpiT4BlfdlrjlNzyUOJ331+/M5gkvuAQPrpVeVoN+u
         q2nx61cNkCS/bJaygQKvdVVC8/WCgylwfyOmYVNz+VO74JY+82JW0MVRXpFbqV1TuZsU
         WK64Z/k2wWBDa07hGvqKDIL0zHxlccew4A2+cx0eDq97p+zqMcKGiKpYSsTz1+MklaG0
         YiZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lXO6/hRHh7BsCewrQDrpe1DckAtiSdc42vyrTEtuOSo=;
        fh=Q6l3+RubHshejQRxLPX8TiOvrqlfI9pfnoNMiaQUZeE=;
        b=RL8wLZMeTEryG3lMSJtxf1wTzQ0Ux6vHm5XkAK5AnHGXz8cv/m3qGL6qVZX/Pa+Dtt
         yBGjC8wqadDKHiaycZWsAqIuBQmA46ZoVYho0bPwg7rq8ayEP8EDEWC5liO+ZCnrrgV8
         qDpwuILSLeFJyA7FRPegLKRm3bV8zwMfAg1w1hFWOm9Oi6X5tFOafBRokQ5OJ7gbO7iy
         LQwH6enq3JimkP0RX0X9Sp3+GipZRSvU+DnBu2XDy5USozmAg5Rtb349ymEkEZAIYKHm
         Czo56syvCa+usvsm6HettM7cveO7Vd8NgpAVOR1Am9ZFwZp612It3TF7NkFS938Mw6fi
         vhWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774724957; x=1775329757; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lXO6/hRHh7BsCewrQDrpe1DckAtiSdc42vyrTEtuOSo=;
        b=qUf52m12QbWk2tBdARDpdZfgoK4Eu7PissalSnwC+RkTW1aQ6QdrbdkjMDk39yM1jz
         X7AYvUcJkSiotodZvFi468SMnYy3E9auhtCQ1hPQgHxPKMS1Ay66cFbqj8b8PzHyMs8r
         933IO9Hs5axV4RghVplw1wMWUWAzqjD8YeumWisin8iza1le77McyjGUsGSmFHuR3M8F
         iRUU/ykk6Zojt5CTy4IgVR4qsmErGQFJiYMO2Agzzn/H4fwTl6Zh1amxNtjeVBMWrfpW
         6MyVRB7jYvRi2BGj+nsw4wIJbZvNpADmm3BdRKKiSgcyBFSL3I5xhJ/ZXFv5/Pg0D4jH
         51rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774724957; x=1775329757;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lXO6/hRHh7BsCewrQDrpe1DckAtiSdc42vyrTEtuOSo=;
        b=g5cF9MqTKVb1ZEIMadPT7tI2PHpTs5eVTAZygCxujUNmcSOyj4BSVZGSvNDRWf2GQu
         oD4KFfztRCLROMP5QwIHxNy4sswyvETX3EAXOU5BsoP3VCIgzTJpXzVROc6+/TQ7wi1D
         KPdGgW2voO31SayjWN4wZ5Hovut9qUUPMORgUvybjD5sPH+uSPUap80VOqTcvrLsiWya
         +FI7Vj3w9AOCHZTkTCm9X3Yai+67KBAVWtO9YJEcUsUmrA2MT4t0yDPKRKzBCHqRojYt
         3wVRnOexD78S2pmkah5rIZo4Opuf8lbotgi47/eAK3xFEOk66cIDfFWbV8zdEs7cY1h4
         wxSg==
X-Gm-Message-State: AOJu0Yx65g2HGOstyLxyYgBGkYm3qpuE2gYD+LSzmPgqb5hTNYOSCpDT
	p1Yy++cxLtCS5mRx9XmVV+OC41+h+kPk8vuKFBARGb59rb8ilDPthc5cm0sTnJOFjo5FcPc4h3D
	unUFiR/rM5O6MdmJ9SIA3X6jYRaXTkRRIz5M4gTc=
X-Gm-Gg: ATEYQzws6z5OeYsPF1RAXr7BDLhnsw60JMYvq7G1DQkfnmY1Fa1Ys4o3S28htYxdWuA
	8/nuPAaq/KFoF8FI8XgjdUnLyJCv5jeWe23Y4HaRso8mgvYbUhCN66qvL8vWBAL8fwzH4r5NEF1
	rBUvRFH3lutaYmej8dh3Gvc/G847oFJ154FUjCyix973n3ghVpPYDKpafi+Vqe5UKHGBlm5BgFj
	KZgL+fl6w4qq/ayIBbADgYTDd691PjGTU+9bmJcs+F1tfe1jeaGKB+nhB18h/BOXegQVFLqscrU
	5xzR0wyF5+gN94wyzVkAhedTlBt9B9E4gwUpGV2Bw3yMSqEbhKW9iRmZj4CuG/PhW5LY2QcHfCW
	wMDyT1AWZNlaSu0k5xbvx8w==
X-Received: by 2002:a17:907:d481:b0:b97:1009:7536 with SMTP id
 a640c23a62f3a-b9b50312670mr366187566b.15.1774724955891; Sat, 28 Mar 2026
 12:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Adrian McMenamin <adrianmcmenamin@gmail.com>
Date: Sat, 28 Mar 2026 19:09:05 +0000
X-Gm-Features: AQROBzB_wYyuht01uMUfv9rmpl0fN0zCAHnajDIZMZmUfbWA5azMby7NmiUH_No
Message-ID: <CACwZE5SoPg6oAgt6ok1vMfrZdCfwLTztoWbrLAnZ1y1BZOzkew@mail.gmail.com>
Subject: [PATCH] Update email addresses and firmware URL for Dreamcast drivers
To: kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

None of what follows alters compiled code, it merely updates contact
details and the address for sound firmware. Hopefully this is the
correct list for this. If not, please let me know


Use current email and firmware address for various Dreamcast drivers



diff --git a/Documentation/fb/pvr2fb.rst b/Documentation/fb/pvr2fb.rst
index 315ce085a585..6887044044d1 100644
--- a/Documentation/fb/pvr2fb.rst
+++ b/Documentation/fb/pvr2fb.rst
@@ -63,4 +63,4 @@ on any 2.6 series kernel.

 Paul Mundt <lethal@linuxdc.org>

-Updated by Adrian McMenamin <adrian@mcmen.demon.co.uk>
+Updated by Adrian McMenamin <adrianmcmenamin@gmail.com>
diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
index 4ba4dd06cbf4..cab4c7af2bbd 100644
--- a/drivers/cdrom/gdrom.c
+++ b/drivers/cdrom/gdrom.c
@@ -876,6 +876,6 @@ static void __exit exit_gdrom(void)

 module_init(init_gdrom);
 module_exit(exit_gdrom);
-MODULE_AUTHOR("Adrian McMenamin <adrian@mcmen.demon.co.uk>");
+MODULE_AUTHOR("Adrian McMenamin <adrianmcmenamin@gmail.com>");
 MODULE_DESCRIPTION("SEGA Dreamcast GD-ROM Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/input/joystick/maplecontrol.c
b/drivers/input/joystick/maplecontrol.c
index 7f36f73844a9..c393aecccbf4 100644
--- a/drivers/input/joystick/maplecontrol.c
+++ b/drivers/input/joystick/maplecontrol.c
@@ -15,7 +15,7 @@
 #include <linux/timer.h>
 #include <linux/maple.h>

-MODULE_AUTHOR("Adrian McMenamin <adrian@mcmen.demon.co.uk>");
+MODULE_AUTHOR("Adrian McMenamin <adrianmcmenamin@gmail.com>");
 MODULE_DESCRIPTION("SEGA Dreamcast controller driver");
 MODULE_LICENSE("GPL");

diff --git a/drivers/input/keyboard/maple_keyb.c
b/drivers/input/keyboard/maple_keyb.c
index 80a5181313e1..7531ff1b2008 100644
--- a/drivers/input/keyboard/maple_keyb.c
+++ b/drivers/input/keyboard/maple_keyb.c
@@ -19,7 +19,7 @@ static DEFINE_MUTEX(maple_keyb_mutex);

 #define NR_SCANCODES 256

-MODULE_AUTHOR("Adrian McMenamin <adrian@mcmen.demon.co.uk");
+MODULE_AUTHOR("Adrian McMenamin <adrianmcmenamin@gmail.com");
 MODULE_DESCRIPTION("SEGA Dreamcast keyboard driver");
 MODULE_LICENSE("GPL");

diff --git a/drivers/input/mouse/maplemouse.c b/drivers/input/mouse/maplemouse.c
index c99f7e234219..93defe596691 100644
--- a/drivers/input/mouse/maplemouse.c
+++ b/drivers/input/mouse/maplemouse.c
@@ -15,7 +15,7 @@
 #include <linux/timer.h>
 #include <linux/maple.h>

-MODULE_AUTHOR("Adrian McMenamin <adrian@mcmen.demon.co.uk>");
+MODULE_AUTHOR("Adrian McMenamin <adrianmcmenamin@gmail.com>");
 MODULE_DESCRIPTION("SEGA Dreamcast mouse driver");
 MODULE_LICENSE("GPL");

diff --git a/sound/sh/aica.c b/sound/sh/aica.c
index 9438c3a68ee9..ed262e2263d1 100644
--- a/sound/sh/aica.c
+++ b/sound/sh/aica.c
@@ -2,10 +2,10 @@
 /*
 *
 * Copyright Adrian McMenamin 2005, 2006, 2007
-* <adrian@mcmen.demon.co.uk>
+* <adrianmcmenamin@gmail.com>
 * Requires firmware (BSD licenced) available from:
-* http://linuxdc.cvs.sourceforge.net/linuxdc/linux-sh-dc/sound/oss/aica/firmware/
-* or the maintainer
+* https://www.alsa-project.org/files/pub/firmware/
+* (aica_firmware.bin)
 */

 #include <linux/init.h>
@@ -29,7 +29,7 @@
 #include <mach/sysasic.h>
 #include "aica.h"

-MODULE_AUTHOR("Adrian McMenamin <adrian@mcmen.demon.co.uk>");
+MODULE_AUTHOR("Adrian McMenamin <adrianmcmenamin@gmail.com>");
 MODULE_DESCRIPTION("Dreamcast AICA sound (pcm) driver");
 MODULE_LICENSE("GPL");
 MODULE_FIRMWARE("aica_firmware.bin");
diff --git a/sound/sh/aica.h b/sound/sh/aica.h
index 021b132e088e..75e25dbf58a8 100644
--- a/sound/sh/aica.h
+++ b/sound/sh/aica.h
@@ -3,7 +3,7 @@
  * Header file for ALSA driver for
  * Sega Dreamcast Yamaha AICA sound
  * Copyright Adrian McMenamin
- * <adrian@mcmen.demon.co.uk>
+ * <adrianmcmenamin@gmail.com>
  * 2006
  */
