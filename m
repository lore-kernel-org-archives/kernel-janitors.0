Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C405218AAF
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Nov 2025 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763120219; cv=none; b=CdVr4NY1y9SMBJWOQUdWzPfqL02s5a54usRcHxPc/bV8tDIThk9OC9HTzIZQBLyxqq1baJI9iojQEaXce90pxjFDsaJoleY3qQ967oNpqduD3DQliINLNt5zmgQFS1aYJPPt5kiWgBm4Df3dlI1RmVIHVRD2sdYhqnYtRu4e8BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763120219; c=relaxed/simple;
	bh=YOqQYfs4nuQmvSgoRMMjC8XlPFHhX1Q2biOJY+6ams8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MJAfH8l+Jhz1EaE9lxwMaEhb5Z//apfOtYsJq07iBPiKNA7w8T7C/r6OPZ4aaBIGadpXh0hbwev2hWFWhpFieeZ9hhLyMo8B9nH0YkIUVJJckkhcjsmWNsgsALkZiEkKomkLxDJfaBsf9KGgd1/la97Z540LOdpO6Kc8s+Dt7S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cr/RH+V+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WeYD7r3C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cr/RH+V+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WeYD7r3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763120217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9P5NBgI6mcvaRko/BuipRaZLnCkAOoZG9QxXhEGpNPI=;
	b=Cr/RH+V+5Wd5XNdL1ASEGglGkclKI/rY/nZaYmCDMp+nC6AmOVyxO0kADAsGcw0qoWoxRd
	xHmBow08gRVtdPhbCBPTU20KLdeT8Y62DhI3m4GKcdpwoJ61tPHwgyHx9/sOhYFOFbcoBd
	GQ6Wgx4uJTiok9w8FyB00fACnAr0Cj8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-vj5u4ESBPZ-jA76k8oQRow-1; Fri, 14 Nov 2025 06:36:56 -0500
X-MC-Unique: vj5u4ESBPZ-jA76k8oQRow-1
X-Mimecast-MFC-AGG-ID: vj5u4ESBPZ-jA76k8oQRow_1763120215
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b7352e034e4so154016366b.3
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Nov 2025 03:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763120215; x=1763725015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9P5NBgI6mcvaRko/BuipRaZLnCkAOoZG9QxXhEGpNPI=;
        b=WeYD7r3Cv6s4LjkJjyVdlJ82lO02vq9TC0OLxFH9V7t5gP1FcBSP1IgmOvypnN03vz
         JLY612NXC8CLaDfw5ex7IXibm/hryy7CQV5YZ9EVpDdRIgrU9xUrKy3YvJgEn4s7Uvbn
         Yv19mj/5AnTP0YW8Zwv6UeNtAxFA0VLvlxYjR6OfcmeL9a2GISB+ClLNO57RHWGkUCvV
         o6M+ZLXHQn8SS31DdtHAGIUJ/Ro76a1MW/6Y09v2J0m6cVX+NUrr5UHPDJwZl1Fo/rqU
         r3E4CCiRTaOaVj9gzzM9C7dFM8KbpaROryij+qYVg7r3BTLccqZUAxi8SY6jXy4iR2gu
         v6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763120215; x=1763725015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9P5NBgI6mcvaRko/BuipRaZLnCkAOoZG9QxXhEGpNPI=;
        b=lCl3K2c37vlG13IxetemxxiBysDvbt+Hi7nemv8nsGdTVi5isH+AwsLW9nYD8XCVA3
         BuETtWdaGkWvss8xJS0o1SRXK7ICtw+cmArLzDfmg15gBaFf92CCUtAXgzz3apq8qaE6
         1R3c0UO8BZvlNn+Sqcqj86rmLg755Kn+oIZMdAeC4ZXEib/y/PJIkaLQVb3CvRrl7xjj
         hgMICA16vVkf0gQTqirDlpC5D/zawp+xWT55kKx/5c2bnMe7DTlTApjj+D/2fioUhPWE
         o9JhCRxrZdrDi/bso1wU5oYuQmZr2eIsID4jd6kKRS2qt3Ooc0c7FZOaqQSj41nRgqGy
         NCAA==
X-Gm-Message-State: AOJu0Yxjw13LUqnBBUe/GJFeK8WpmB91p/8iC+PInhx99FSi3kc0OMCq
	J+ieMiwaRV9mRb+YG5PZbdQusOgbIX3kYwmmJtOVDh39aEEYl8gSLa3sPioB5OH+xnq0mBI4kbt
	658Oh50pVw9mIvOpzUZt+BPp7uMX8TIRHOCrLTlbEoFBQ0ADEQSq8J2RNUBC4pkt1L7oUyw==
X-Gm-Gg: ASbGncuOl4+p9jWP/XdrXPFXcfJvsl6XiE29Kabx5UMzWPwuXaeAuYZa5EN8L78xP4K
	sGgcEjtn6QizxapZ7b0eIbaCm1PnrCqPsM3TTpXSXtu44W1Je9VkKCa155sJX6dWg2pUfT0u6sk
	aXDpth78FP91lZ7Ii6DOyjZBdD4fnX1LzcTI4WqEjaNA12oXyOftjcObzcJgNLsiJBGkzDv3xGm
	9bb6hyDsUKIjrmJlc2gqDKy6dwE1DtRZndcqUD7YxRSRuZqLwj38Qmfnw7MeL5opApZPLZAVwVP
	qz35O8kHIlsPzXoGzV3i8Yg5+LE/JvmeLElmrKaeO+V88JRfBBRhu4KVV2giWorMW2HbLeM0N06
	6dAVny4eFF/8TltC5Hu54cy3DN2OxvZPJqWZ6lXWq+Q5An9o8
X-Received: by 2002:a17:907:3f0a:b0:b71:b4a1:b29d with SMTP id a640c23a62f3a-b736796a40amr241980866b.64.1763120214734;
        Fri, 14 Nov 2025 03:36:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGncWVaDUYmrZnQ3gSDBk8EIFCOicAB84qOiU3rPLLBv82jXFCsdviDxrNodVDC2Ot4XM+Oyw==
X-Received: by 2002:a17:907:3f0a:b0:b71:b4a1:b29d with SMTP id a640c23a62f3a-b736796a40amr241977566b.64.1763120214298;
        Fri, 14 Nov 2025 03:36:54 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad41d9sm371942366b.27.2025.11.14.03.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:36:53 -0800 (PST)
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
Date: Fri, 14 Nov 2025 12:36:41 +0100
Message-ID: <20251114113647.231481-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
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

