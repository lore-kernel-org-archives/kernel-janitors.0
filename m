Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FA1313272
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Nov 2025 11:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763120244; cv=none; b=MgEA36M3y4QtumRIyyQ1hAiOsjMpur+MkKf5f1A9Wo/Xo2cgLu/2nw5h6j1JBwu5b6a0Qt1BCZDBKdMzx8WxmIs6Oe0F1lvlFy1GBiFgbdou7TDmpscf6TMFNl9+pH2owfw2uz36BbxT10ncTsqBZ04yYBeONq9nVhrDEJu/Uls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763120244; c=relaxed/simple;
	bh=YOqQYfs4nuQmvSgoRMMjC8XlPFHhX1Q2biOJY+6ams8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qSszl61jgRoJqG9xDk57Sb391h8zVOmAZgNDCZ7o/jnI4ZwLyOSfHHSS1N1SCZMW4Ux/k2puVHTpuMTpPr2q90/mm5LdSp6nI6EtKVpSzix4WC842CVHuVHH3usl+dtque0nreZQVFKP+fLa4puJW4/gLbhSJeu0ugCko5IwF18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xy61F5MS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EHlchJRT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xy61F5MS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EHlchJRT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763120241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9P5NBgI6mcvaRko/BuipRaZLnCkAOoZG9QxXhEGpNPI=;
	b=Xy61F5MS4KrUDymBapDwLAYdersb4Mxri5bsfwfD5QmP2ij0g+s1Py9RIzv06GjND5COJ3
	iJ7A0jvivRiQRt5996NGeH7jJIMajAluo61GYqvXookcVabsYd8jSI5Cf59n3Mpi2TxbF+
	pbN+LsvHlDng7/3BTKcDg2kGZIMUeME=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-ystZ-ubqPsG1YOq1OL71KA-1; Fri, 14 Nov 2025 06:37:20 -0500
X-MC-Unique: ystZ-ubqPsG1YOq1OL71KA-1
X-Mimecast-MFC-AGG-ID: ystZ-ubqPsG1YOq1OL71KA_1763120239
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6411fc67650so3156400a12.0
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Nov 2025 03:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763120239; x=1763725039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9P5NBgI6mcvaRko/BuipRaZLnCkAOoZG9QxXhEGpNPI=;
        b=EHlchJRTRq+CNR4yzkDyvXPsLwezEowx6jwSAbLYW2xNgQcw0fJ6QkhWHoplMYhKHV
         72TRJxk6UB5Jo5gxK2oOkFT1YrxuATO0hCuJHexLc2M4GrZpUvWK5XYqvRhnC/7DIHqf
         26d0cTNQNGvTQrOijZ8Pq4H9zGXonSQFgMhCasnv02Tw5RAL1e0FyBHxRKJxcDftyM4o
         nTNpM+wdSN4WRQoX0uviQVznJLGPJpYfbLcbZJaku2nh3Y4AjpRxWGfBsFNOvySlF5zG
         cQprCRbAaK1Pwgqhbs++WGPcAE+XMoWZ2IZOF4Lt6y0fl3jXKEqmCNVWIKBkfG7LQrA6
         XL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763120239; x=1763725039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9P5NBgI6mcvaRko/BuipRaZLnCkAOoZG9QxXhEGpNPI=;
        b=ra5W1yraiofxhB8B8W8g72rM3HakXO0snvC2xJtDd0iOpgWiF8tm5Bu9tZcqF9vGTX
         kxRoy3tadjMWGmZ5H+H1dS+WLsvyOAUCoaMz0VH6h5Blzlrx1zTOQBJu8KONJ9UGSWqw
         hRMge0/8SbC986GS3uFLYRSTvMv7sdesIIEYAX8sJr4wPdQ1DTKPgU94FVS67ol4E7t3
         8m+dJ7SfHQ0PK29m0Dy5O13vRUG1AreNwa+n6ikF+ha9KbkWn0mMiYhlKhHLwwJmjxTD
         tlhstKXFCwo8n4AObI3fPK6kVA054s8DHQiotBCSUSpDVUvbIG/sAIw+dXiwqerGHZxG
         vRSA==
X-Gm-Message-State: AOJu0Yye/I/lWb6TC9uPZXqsCZGGDz6VVe/QgoB33ezi7JrQBFT2GxmE
	+4BrRfovfW+KidROU8FUoVurULe1GzDCgrJ+GtaKuv+UsmmfVTzGh3siL3jsYjhl/tlqrOuNPxt
	IgEC9Pxv/PYuLRDLf4eOfSSW8qmvxCKcwD0bJ/iE5vV2hRmeRDpgkVC2X43g6qzHAyiTi3g==
X-Gm-Gg: ASbGncurDqK6p+AhlOL2Jbp/iy8ELuDQOgumLP5pBnyphLMFYLDBnK64wXKWc/Pk6w7
	3fLW09GGNZvFWNhr0HwbJ4oOrN7L0RoV9RVWLY/V9hcRym0Li2iTpmGSr4jICIluSRIXgi2e4+V
	W3zgNJYUeyUqACqqG7eoQQLEa9wC/RUPEgRs6dvIerXTKgPGdMD9lxHlsA7RJ16Iw35Hy5yt9yR
	EZqjoLci5sna2qF54sXbl+2JOue7MzQCDU8Bx9SAhODxeLrlbEj4Gw1ZgB10e6SfG8mkHjQRwrJ
	KetuNuVNKG9XWns3mVDjtsB2tNr8xvGqmDajrKbka658hTa4uG1HoHN9nQjdHCgQka3yc35/GGO
	wxefVTA2bSPK2CqVjo3h0R9EbhOGbuNduiWk4p4xdfuAIrtKB
X-Received: by 2002:a05:6402:35d0:b0:639:4c9:9c9e with SMTP id 4fb4d7f45d1cf-64350e21802mr2451535a12.10.1763120238808;
        Fri, 14 Nov 2025 03:37:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFVe/uB9+9/3gzdFTMbVi34GIzV2jyTunZWZuVMHQ6OHKZN/e4SH5jply2KeE6Cp1DqAHYdw==
X-Received: by 2002:a05:6402:35d0:b0:639:4c9:9c9e with SMTP id 4fb4d7f45d1cf-64350e21802mr2451507a12.10.1763120238393;
        Fri, 14 Nov 2025 03:37:18 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b19dcsm3358424a12.27.2025.11.14.03.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:37:17 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Frank Li <Frank.Li@nxp.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Peter Rosin <peda@axentia.se>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	asahi@lists.linux.dev,
	patches@opensource.cirrus.com
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: refer to trivial-codec.yaml in relevant sections
Date: Fri, 14 Nov 2025 12:37:12 +0100
Message-ID: <20251114113713.231513-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 4acbfcf11cbe ("ASoC: dt-bindings: consolidate simple audio codec to
trivial-codec.yaml") aggregates a few sound device-tree bindings, i.e., txt
and yaml files, into a common trivial-codec.yaml, but misses to adjust the
references in ANALOG DEVICES INC ASOC CODEC DRIVERS, ARM/APPLE MACHINE
SOUND DRIVERS, NXP TFA9879 DRIVER and WOLFSON MICROELECTRONICS DRIVERS,
which refer to files removed by the commit above.

Make these sections refer to trivial-codec.yaml, in order to inform the
maintainers on changes to the device-tree binding relevant to the
hardware drivers.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 836ec73c604d..311c418a76ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1770,6 +1770,7 @@ S:	Supported
 W:	http://wiki.analog.com/
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/sound/adi,*
+F:	Documentation/devicetree/bindings/sound/trivial-codec.yaml
 F:	sound/soc/codecs/ad1*
 F:	sound/soc/codecs/ad7*
 F:	sound/soc/codecs/adau*
@@ -2419,9 +2420,9 @@ M:	Martin Povišer <povik+lin@cutebit.org>
 L:	asahi@lists.linux.dev
 L:	linux-sound@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
-F:	Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
 F:	Documentation/devicetree/bindings/sound/apple,*
+F:	Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
+F:	Documentation/devicetree/bindings/sound/trivial-codec.yaml
 F:	sound/soc/apple/*
 F:	sound/soc/codecs/cs42l83-i2c.c
 F:	sound/soc/codecs/cs42l84.*
@@ -18843,7 +18844,7 @@ NXP TFA9879 DRIVER
 M:	Peter Rosin <peda@axentia.se>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml
+F:	Documentation/devicetree/bindings/sound/trivial-codec.yaml
 F:	sound/soc/codecs/tfa9879*
 
 NXP-NCI NFC DRIVER
@@ -27915,6 +27916,7 @@ F:	Documentation/devicetree/bindings/extcon/wlf,arizona.yaml
 F:	Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
 F:	Documentation/devicetree/bindings/mfd/wm831x.txt
 F:	Documentation/devicetree/bindings/regulator/wlf,arizona.yaml
+F:	Documentation/devicetree/bindings/sound/trivial-codec.yaml
 F:	Documentation/devicetree/bindings/sound/wlf,*.yaml
 F:	Documentation/devicetree/bindings/sound/wm*
 F:	Documentation/hwmon/wm83??.rst
-- 
2.51.1

