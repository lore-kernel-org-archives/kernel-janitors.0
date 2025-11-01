Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5CE2DE1F0
	for <kernel-janitors@vger.kernel.org>; Sat,  1 Nov 2025 13:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762003662; cv=none; b=bAqX0cCKFuNsWqTPfNnGC18np29or0gxCSkE7MITkUylWipHxNynOM8faA28Mn0duLopush7FpslrQZOKng2ZzNRfLmX2DfIiFIdsSZmnKBu8AKgzxoFz7y7lzyhznV8xd3PRc/ODHTV52aqloM2VbnuxQ2mJof3dkqzlxNcEs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762003662; c=relaxed/simple;
	bh=O7ACs0ldqUJpLVDp+21SQI0MSqblXSVfkxhdkXYAbio=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uGgesYGPmeqVAoiPE/mAVcMoZgsAbsmPsPcWj1pp/C+DgLh8f2mSUCP9QxsgvovFCzavkhQS2YilPqb2Tkm7j08flWfkKODKiAf+EcEjVhe+lPYALbb4gxs0qFhbRgYuWoTs3G6rew8HnuIETMnLtrntte9fIGTpur9pWkoQgTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LHWd44YO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LHWd44YO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477365fbdf9so6900295e9.1
        for <kernel-janitors@vger.kernel.org>; Sat, 01 Nov 2025 06:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762003659; x=1762608459; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YXhWn6yI771aYOLRcSIj3itITp8Yx3KJMWGw7nupRLE=;
        b=LHWd44YOQBGe+Aj0B9QLiXQI+7ubRnClAS2uvvUlbWOw3moe98NjJbjbA+4sbVMAO0
         wjJSQLhtt7ScrWdC7UqyPWEd7vNzUe83ifjbTdZ6cAAh4XhbuCL7pl8wyJNgVaNSCX9A
         WhZkZr9Z4pkDvzm2PpfkZWoq+auHCE9f9hJ0FSGsxHwcMSoI0XMp2w7PwD4jgRdhxuXv
         EMmvf8vC/vZa0kWk9reFIU9sk4YDOFPz8E3ZxuD5I/cZCwDAvQaMZzZaOA8BLa34ZiTK
         spgFB7k1J59jI7J+zkPP/+x9ErHPm2cn1NqDd0rYZEfncjQvbWH7JhNvLDy1n1i3tFkc
         e9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762003659; x=1762608459;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YXhWn6yI771aYOLRcSIj3itITp8Yx3KJMWGw7nupRLE=;
        b=WNATLUa+mOiX2v/ANVE7qZnOgLqtaC2Ysp6kBxbXYr8MCSAhaFLI0apSXw13UzUbki
         EKtdwTIKe09dO6r+r4SbsCAker0oDd9BCfaMFhWTRUiRcEvSAPubaPq0fIkY9QQ6rnVc
         F/Eahr0Bz6rhzXwpsRRmcfQToEdkfmb3t79qQTr+9OIfIEoukIzJx8R7vo9pRku6Wmp+
         3xnDTrGw/Hf+/aNqX5Yh6UHD0OD+vF+gRWFHAsSSOE5fFjnkb8IqiwWw0wepw047kySi
         uRK4rKcags3Fknx4yCs770NCdr1EkjQoLGbaB9OE4PH4hB+OieLn15znS3iSEom4NfmI
         A7Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUaBRotGjAXrMiL3PvinOZwsS/iL+owJjpS0MMXNsr8AbcK1GwcfxvDlUYGVG2rRqfb8J8/o+5a6jvCjqPqJtc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywelvef4nER6pd/zIeEmeFqxujc3rwfi+WBAOntfceAZthYG+vl
	FMvgked+n5+x34cWeyTB8m5rBgJPDc/t4PAm+rWlvWMZLlJHGjeAHY/DblwwbEkWZEQ=
X-Gm-Gg: ASbGncvWzV4Dk1FpBk22DBr0/EA1aX1Ipj06n03tS3T/vLj4CQ1vKuzud1uppyNRDE3
	jAhWiPPBIf/R3El8K2BpjpGlCBQowE6B09rkCkBA/oY5jqXwukr/cOnHpuSQIV6ZEsIN4PqXH8E
	CbuT674rM0+C75fK0XBKMkI5i4Gd2e4eyKXX0tPiLkACEJ7dGbdlgWs8AQrwOQxFVhvhYydGF28
	ZyjMYF5j3e5aUaclgZ86E6ipTpk2532xFZGfi/TWBqFwy2OXRm+cLRhkC7c6n+08dLPd7U+b8so
	FmrGtNiwPoAFEroWiIa0fMjRVMMxHOEDArwZJMYDPCAmw93Xvary8Y/3eBiTLJ2gjKWZZIp/r8+
	bkS5S99qKBRL2A8n2bpDdo6eGVLw5MJDt1XDL3nxDTw6x/fFjttDIvuH0OXZCDJzt9ouYNcr+4b
	hX4K9TgQ==
X-Google-Smtp-Source: AGHT+IHqXes4RC0d/pZNok2qTFXjlWakyDJ5XbPAbjHTCzlugL+3ND+rGETKmKuLd5fEQQ0F3CoHKA==
X-Received: by 2002:a05:600c:4e56:b0:46e:2cfe:971c with SMTP id 5b1f17b1804b1-477302d3677mr58158665e9.0.1762003658683;
        Sat, 01 Nov 2025 06:27:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4773c53ec2csm48606565e9.11.2025.11.01.06.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 06:27:38 -0700 (PDT)
Date: Sat, 1 Nov 2025 16:27:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: codecs: aw88261: pass pointer directly instead of
 passing the address
Message-ID: <aQYKxl2f-zGVdYFC@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

It's a little bit cleaner to just pass "aw88261" instead of the address
of it "&aw88261".

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/aw88261.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 43556f66549e..8600b21ea618 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1184,7 +1184,7 @@ static void aw88261_parse_channel_dt(struct aw88261 *aw88261)
 	aw_dev->channel = channel_value;
 }
 
-static int aw88261_init(struct aw88261 **aw88261, struct i2c_client *i2c, struct regmap *regmap)
+static int aw88261_init(struct aw88261 *aw88261, struct i2c_client *i2c, struct regmap *regmap)
 {
 	struct aw_device *aw_dev;
 	unsigned int chip_id;
@@ -1207,7 +1207,7 @@ static int aw88261_init(struct aw88261 **aw88261, struct i2c_client *i2c, struct
 	if (!aw_dev)
 		return -ENOMEM;
 
-	(*aw88261)->aw_pa = aw_dev;
+	aw88261->aw_pa = aw_dev;
 	aw_dev->i2c = i2c;
 	aw_dev->regmap = regmap;
 	aw_dev->dev = &i2c->dev;
@@ -1221,7 +1221,7 @@ static int aw88261_init(struct aw88261 **aw88261, struct i2c_client *i2c, struct
 	aw_dev->fade_step = AW88261_VOLUME_STEP_DB;
 	aw_dev->volume_desc.ctl_volume = AW88261_VOL_DEFAULT_VALUE;
 	aw_dev->volume_desc.mute_volume = AW88261_MUTE_VOL;
-	aw88261_parse_channel_dt(*aw88261);
+	aw88261_parse_channel_dt(aw88261);
 
 	return ret;
 }
@@ -1250,7 +1250,7 @@ static int aw88261_i2c_probe(struct i2c_client *i2c)
 	}
 
 	/* aw pa init */
-	ret = aw88261_init(&aw88261, i2c, aw88261->regmap);
+	ret = aw88261_init(aw88261, i2c, aw88261->regmap);
 	if (ret)
 		return ret;
 
-- 
2.51.0

