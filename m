Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2DE2D12EF
	for <kernel-janitors@vger.kernel.org>; Sat,  1 Nov 2025 13:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762003648; cv=none; b=fYSEgAQWaivY0HsHkRd9hJ4xAz8LOSfuDtmnSY9zXhsVPsNSeOK0PqZ0A9ZMZeKuTO5+hU3rBu7koBHlf0xhJ8iEZXJ0XEa8IYc1hD5cQyonYQnST/eEIVX/9xhTh5FNqevt79Lpc8wnDTYywXXnCDJhlsOVuES+eXmkJp54XLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762003648; c=relaxed/simple;
	bh=2PAOIcseLes8QDrU/0O6eI7V5prSun82KB4s861oRuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AMNX3l1NjoVnfQYCxCZIv0WoL7/+waHs0aK7QLhLx6WByex7l4itlfEIOxNTnxxP5Qc2TIOQrtqkSlfy3GRphjE7IdAapQdvJ5o+YeIZHgMSCFyQgfQa1FP7Ybexj/uzDa8VHG9Ym0IdI3vMQYk2qnBa3eygxLGXAnxqaghJtgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=COgWpTbr; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="COgWpTbr"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso2551031f8f.1
        for <kernel-janitors@vger.kernel.org>; Sat, 01 Nov 2025 06:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762003645; x=1762608445; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZyMxV1dKZKD1oc5wPyS8VTSoTsg2uKzYIVyhunCik3c=;
        b=COgWpTbrcqgzwX2Q+EcM6HVZGj/VVCGfWNXebemnOn93dWbftxvne3uRNQ/BwOHHoJ
         f3pn1eul9/bTok3ptHlFHEWQuQQApYj07pUIFzPCIkyeEYEK//mymz6kDDPcsVllJ8at
         76uhYeUZFQ18JT05jkE/Nt8/UyK8I2+wsQOq3jnRPOf3t7pAb2hGhBWrxtY8/XdNhkVO
         kGj/QJcTweZCsRbgdjOI8A1baBc3hEn0yMzj0x+vi0CuacFUDBkLWQKGPdWE3zAGE4zJ
         dVl28KvrX8g68mCs45AZy5r/tFCrPUcCyvt5HVjOdImVdrZg+o0imLcNzHxHPSphtIny
         EU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762003645; x=1762608445;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyMxV1dKZKD1oc5wPyS8VTSoTsg2uKzYIVyhunCik3c=;
        b=CZ8XLsFKzPqIHT057uL0AV+NHarO5zYgW01EAp9doAl/37t4GOmcETFfBm3CUGkCuH
         jEF8b/+ARwDm76mKTZXa4nL0eh/xOmLnoCJ5v+BeJgv2qdgIYGcbRfZEk7TNolWJAPdt
         EdG+4+gnVzj7naupynCrv/U+h+SVmBR9DQfP+yJKIz0WBmz+Yh7Ke61G1TxNrjmbD4Sn
         affBGsJTDW2We31Ss2mnJtxllNW3Z1Ea21gV6eCSEjK5CWGSTG8or2nuV0OV6H/mk34E
         2MV19hiZ8nHm/V6jzhOMNZpfU8edzwjoFQ8s5uJUCN/jcSmhgVC5OxI0Qw2j9+S//4vT
         tgqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKrc7KrezM+F5yLU2qZmyjDRgUe1uRZMspmQghW4OyTxFY/NTplRj7CfrThan3GtYA4uqJtx0q0a1jo+BQ+Cg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqxO8ejhPFYcqpeeayDGXYD6rgzQPsXXRghWGrIFYOzUsypWU/
	EQPXG8dm5f0RAa+J1oQQMbMTzhlKKNpVKSF7MxO9qULDeGX+SnEVoWoAbxf+dFIi9Nc=
X-Gm-Gg: ASbGncsf5mklUhqclJXiZFpezmtv19OPT5qMKmhjEjDruVKn6LrauG9nlKC8hC2ZMAK
	LOyTu2GFFzcCCJO0AmIj5rz4LnRbswn1vTMePtPh2ootxDvZfZNBSrcErS3uPfUuoN2FpnRaloc
	2rusdyuFn8Kse0+POlv2XrQD94vneQQKDhrKfy1IRbRFkqsOaQnEa0qxnyhifrJt0ZsnN21GPFz
	BEoY21RGFuniir22TJf+ld+B2kgInbvUY3w9H614p1a7uojKmxZTO3+PD2UxD2OHbByQlgWG1il
	q9junZtZvIaE6s7QUZko8viYCLTZc+tDaj5/PD2f/GxbvfdmpqwIRLBQUj3wZZw7BeqckbmFJv5
	8jfqUgAdtHFsdyrW4EdArDdiy2IsTpYlXF+LjFj6UzwDvjr3ORWsO5kk3cMHqMUkjU+/3+OZsxV
	k9KqieIYTG7Apqjfyg
X-Google-Smtp-Source: AGHT+IEqQsJBFv5uwUWvnqKuKWaeqqvXllSedT2UBK/+ULtHgNwi01zCsS4nKdErZ6SQJVrrjAvBXQ==
X-Received: by 2002:a05:6000:1acd:b0:429:a89d:ecef with SMTP id ffacd0b85a97d-429b4c43672mr8852365f8f.13.1762003644568;
        Sat, 01 Nov 2025 06:27:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429c8910c42sm3140228f8f.7.2025.11.01.06.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 06:27:24 -0700 (PDT)
Date: Sat, 1 Nov 2025 16:27:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: codecs: simplify aw87390_init() argument a bit
Message-ID: <aQYKuQuKekmoUrHP@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Just pass "aw87390" instead of the address of it.  It's a bit simpler.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/aw87390.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
index 460b782e96a1..d7fd865c349f 100644
--- a/sound/soc/codecs/aw87390.c
+++ b/sound/soc/codecs/aw87390.c
@@ -360,7 +360,7 @@ static void aw87390_parse_channel_dt(struct aw87390 *aw87390)
 	aw_dev->channel = channel_value;
 }
 
-static int aw87390_init(struct aw87390 **aw87390, struct i2c_client *i2c, struct regmap *regmap)
+static int aw87390_init(struct aw87390 *aw87390, struct i2c_client *i2c, struct regmap *regmap)
 {
 	struct aw_device *aw_dev;
 	unsigned int chip_id;
@@ -384,7 +384,7 @@ static int aw87390_init(struct aw87390 **aw87390, struct i2c_client *i2c, struct
 	if (!aw_dev)
 		return -ENOMEM;
 
-	(*aw87390)->aw_pa = aw_dev;
+	aw87390->aw_pa = aw_dev;
 	aw_dev->i2c = i2c;
 	aw_dev->regmap = regmap;
 	aw_dev->dev = &i2c->dev;
@@ -398,7 +398,7 @@ static int aw87390_init(struct aw87390 **aw87390, struct i2c_client *i2c, struct
 	aw_dev->prof_index = AW87390_INIT_PROFILE;
 	aw_dev->status = AW87390_DEV_PW_OFF;
 
-	aw87390_parse_channel_dt(*aw87390);
+	aw87390_parse_channel_dt(aw87390);
 
 	return 0;
 }
@@ -426,7 +426,7 @@ static int aw87390_i2c_probe(struct i2c_client *i2c)
 					"failed to init regmap\n");
 
 	/* aw pa init */
-	ret = aw87390_init(&aw87390, i2c, aw87390->regmap);
+	ret = aw87390_init(aw87390, i2c, aw87390->regmap);
 	if (ret)
 		return ret;
 
-- 
2.51.0

