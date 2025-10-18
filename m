Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942FA26F2B8
	for <kernel-janitors@vger.kernel.org>; Sat, 18 Oct 2025 06:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760768716; cv=none; b=nM/p+n6lDJYbDq0v6OAgA59FUTsZR8fc1/bBvYuxgLgAzmMY9HcbHZjQsxSlA4xMJ7Txt5wzstqvQSS6nYbVauqoQLz85p1gQJHrSmIn67LUoiJF5mPBFUqcp5frQnTCsYt0Y3VcYTvj4Va/owwqrYTNem3wxygULTLIMIko5Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760768716; c=relaxed/simple;
	bh=bBK06m919fcrgtih+JVTXodl3XFTa8xsFxWUlcI5j+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cb5D93JoTdF7FJGhuctELnDC6JrklpJpqONAhR3NmN/bfHWxqETJwCHrCsARLHcJ0WeGItq5/mJu6rdbMlkCjRgSD3XDPxlULFfmw8tgm3dxZU0qwJBI6eMSukT4feps0psnCFpCmoTEkpYxpUoCd1mDIHSh1wxbqC2XA6uzhbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CljpQGQc; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CljpQGQc"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so1627855f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Oct 2025 23:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760768712; x=1761373512; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IOjOlRS5epVikQ4z5SQ9kGD1JPQvt2c8mE5ArTmJEf0=;
        b=CljpQGQc/nyojHlCfT0Ze05TRRzMSN1Sv15PowzH9VCFP9SB3ErGTQqamPNTcYHyt2
         L6yKPlR0I9k0zxC8HmHh2wxreJuG0FjspGTTicgBFSpSukqin/X04ZpSIitzn1dRLtJs
         xKBMlEnUus90vuYRvETno0wEZ2zZsFZ+5vIkwRxqLKiHQtSLU5IE9c3NnAAK/sXemuGc
         3oe+GxDsqpltFJDk8/cfVvF2I2ffN5TYgicuwhKfa/tkkhkIGebTJGYcL7F7BhSo3OrG
         03d41S/cevvzBO96d7dT46fsPovofFga7826q5TRrFlIY2quaSnFWbaFkwdxlURTbfC5
         gvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760768712; x=1761373512;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IOjOlRS5epVikQ4z5SQ9kGD1JPQvt2c8mE5ArTmJEf0=;
        b=ItoagfDqR4DUbsPIM3rOIozbxyj2bQKuPJsvk/fU1z9Vk4eAHfHanrawqFF7RU3m+a
         ftzTnj6JgdjTmM9ZmG6nkNOFwDl1rUdLyZXkREfmyv7VddBLJOKIzk7dmIrD5unzyXjA
         8rb5oF+sMyk5YHZq2mtLlfO+djcO/YdVBqcPO1wAxIovffuCEwadUmLpDHy3OY1xHW1Y
         GsWM/vzcIEReopz7LGCg5+r8BLHZAVOn6uyDtL89fGiCFAKZO1os1jlGfqNJcwg/9N5E
         q+htmNljxiKk6dV0/c8oI3J5ZbuUH798/Bgs9RO/XGBaVVkqRKEW8vAyX2G+BncSpCbz
         z0SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ4DrvjATJE5ePX0WpP77L7GaBhKSSzvkNEBnrHhmEQP67sX5fGU1PKpAAuAjOxdlwWy7NmOQTHx2LgN3YZYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWd0vU/PrrmaHVbIOk0VUqs+6GEmNhxoBlVGkji/w8MKG8yHtX
	+GSVGxAibYt1LagGCItKVY5AslOaKPqNgXCFEURG64vBSo6RIJl3RvvmEkCct0btX1M=
X-Gm-Gg: ASbGnct6fkdiKuVWHTPHi1MhAIjt8bS7umrAdMpb9WvwcJ1H5JIMRP14ztEl/GQ2Q9q
	jHzr/1QjwCv2HVlZovUiCqPEckC1ecAU+37mo91R5JN/gC5qCfGQaGVI3saDbWHLXjVLfwpzWMl
	5fGDxndAppdZoXqo/aNYHA3NBMgli3hsJn2Ug0wzALpIFxf1zQAiejMaYoZxrAG489WRfRRRvAc
	tpzv9vMRoabi3Ny0zH8w37zd071oMxxjpoFVHPFZqrScbPILH5ZpfizuriDC/6iad+OJZG8j8Rj
	vNsvY7khqTddXnZhOAtEeYXBHmyC+9K6MeedjQBsl+vPKwxuApHV0iWcd1IpEiDOrX0Rso/uzb3
	x3wuTZ6ARqJ9y4JevPf2j/huqYT1jU/yXd1xav58NL/885ebiV+K+ugH/ECO+22fnImb509PzCG
	+sA2MNaw==
X-Google-Smtp-Source: AGHT+IHiJtFCilIcqVXt1blvDDyHCgj8C07mXYG9xI18dPYdiNmhymktEi4vcR2/aM4gupMNGoVXIQ==
X-Received: by 2002:a05:6000:26ca:b0:428:3c66:a013 with SMTP id ffacd0b85a97d-4283c66a3f8mr683531f8f.55.1760768711850;
        Fri, 17 Oct 2025 23:25:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471144b5c34sm126120075e9.10.2025.10.17.23.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 23:25:11 -0700 (PDT)
Date: Sat, 18 Oct 2025 09:25:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] ASoC: codecs: va-macro: Clean up on error path in
 probe()
Message-ID: <aPMyw_ryay9LA5SW@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Do some clean up before returning the error code.

Fixes: 281c97376cfc ("ASoC: codecs: va-macro: Rework version checking")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/lpass-va-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index eb4981255f2b..77a372dfb117 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1632,7 +1632,7 @@ static int va_macro_probe(struct platform_device *pdev)
 		/* read version from register */
 		ret = va_macro_set_lpass_codec_version(va);
 		if (ret)
-			return ret;
+			goto err_clkout;
 	}
 
 	if (va->has_swr_master) {
-- 
2.51.0

