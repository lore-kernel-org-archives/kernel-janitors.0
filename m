Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD0B1D63F5
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 11:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758626926; cv=none; b=HrrW3b6LogdLjELIw7Jt8q3m0AsTCwbrOMrilOxkxyXlbmC+ALThhGhe1ZSFbIcyvqgWQhxflbBY+Pu8LMwZAN0dMS/PW946TT3ZD8+h9Q+9k/s9Ma6WDC+pCa1ftHq+iQfmxAbsDC6xCTnkJPudsR6GGJUV2hQ+J/zfqArd+QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758626926; c=relaxed/simple;
	bh=Fg9loJYTcGYlx0MTZ4vFLQtkph2uQSlIxlL1lZRCrKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t9yjRctDo73I1mnf6Czr/zPXBwO1TdoiWYYutI6N21auA+1ypTFy2LDdFLj+oQaSRDlGC6riiz3hW+kR687HjFHJOcvAA80ZFoalNEVY3lthmqtwAkCKb5cXDLvp+3DTkVtqHXHm7/6uktlyBA4OKxUQ8eo4iymB5hb05ikPv7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=peVkHwHB; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="peVkHwHB"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3f44000626bso2023760f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 04:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758626923; x=1759231723; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p3nLbAifVjvlMsTe05tZfwI7NIrolTzFIj3PkRr+oLU=;
        b=peVkHwHBt0/q22w/jyzHTnWjgKqW6VyEPmt9TnZJT2ZaVvqMTS1bGhHPERAky601YQ
         f4U7VbynEit/PxiEEatHQw4eQmqfH+5BD1WJkFUEvCHpwBuRJISAa1lSIs/iPDGG9v0Z
         Z1QIsF7rhKfE1XwSPq9WHnpLjiju1D5s8XmtNeSC9iyAtGOiQRxNf/rcAltnOkhNo1y2
         S/6yXY2xOyLHLNVSL36ix1pDyxlWtcAfBzkFkJHoU/GqYE1VVot05WF03S7pNrQmrMrc
         Hz5CgelKN6OW2dkpgCnl+xEg877WipbPuAZ0UjGOzu1CmlZI90u7/iPhbSlGcZ1wBp+F
         nTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758626923; x=1759231723;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p3nLbAifVjvlMsTe05tZfwI7NIrolTzFIj3PkRr+oLU=;
        b=FMqgS1XjjuVQOxJVVxi9YX+yx8AbvgoHL6iX2ZvjmcYYiPqZcaydGHfCpkB3lL5MLP
         C63cH/PIIHdsneomkkEeJFnhRMqjhkPxQLi+ZMUXEodbV1MKzp7YjTHL8dKffs6UqIcX
         Fr8mvf0O+RxclxvMCO7v/VFUcbuOnW4rwPTDly8EjNFpl68BMKbpg8Try0Xtq+gjKUpV
         BgDDN1vzQYR5T6VjOR7l7qUB92ht/ZjhVhXu6/JpduWhZYSzI68G8aMiYzsfxoY6sMSU
         ZwsDPVxWJ24IFxOOWf8ujznk6qE4fxeoMQgSiCofnmN1FH1CTQJibm4jyLdaCvQNus3t
         duGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhghOLHFR2f4HV5ChMmhfn/YCLPWyG1bAgFYO5v14f4CPU62L20WxKTcuSqv8+jSgv6JlKxh9NWZzlftXMqdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYKfgsXCGWCOYizszvzb5CzHT9Ed+GD7Z+YXTz3lQXPfNikrGH
	G84nKATRwgXLm4ZggGmoBotPgPgRsq9qYOvx+ckb1ANlsIupDbSnaDv/RJ72baFsfaU=
X-Gm-Gg: ASbGncuXkT+wZYf7jcfFWgpnTUlgk3nso/mjdeFA4OwJbG248YYIdFTV6zeeJ4F8Bi4
	b+hXcqM88yhDVgRD2iFn35SfgJTFwwvrJsg4gkcaQRscdyzAU8MVYEqaUK+1mlM+hAbuG4RB4MB
	xMFIcOyFUajuoAsHsE/+CnK9H6PxsLeOfYIR85H6x8XHnzg3LEKvMerwIH4ZOY89UPkEcAzZOUH
	6XmHZ/kuofbsDe5qshTwzs5vCmoQIPYftbpyauA2gyzVeGuobu/SPFdZJdOlj+0i4YUBNQB9yH+
	TjNO6fr6FRugYSzZE+isuAZTb9Is4c8QJGqcGT6poz+d/HtM7SVGjSwW0OuxSTGH+ET6r2reCjC
	Mh97ZG5XtUWtEFtxGFjkPT0mLt0ij
X-Google-Smtp-Source: AGHT+IEreieYRZZVcV4W0b1/dif/w7q6qOys4eC2iEOI56szcrpHxrUi/D3jSCJ+aNlIHebwRh6vfA==
X-Received: by 2002:a5d:5f87:0:b0:3ff:d5c5:6b03 with SMTP id ffacd0b85a97d-405ca770ea6mr1817809f8f.35.1758626922991;
        Tue, 23 Sep 2025 04:28:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee0fbf1d35sm25228491f8f.55.2025.09.23.04.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:28:42 -0700 (PDT)
Date: Tue, 23 Sep 2025 14:28:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] ASoC: codecs: wcd-common: fix signedness bug in
 wcd_dt_parse_micbias_info()
Message-ID: <aNKEZ3VqJ8js208v@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The error handling does not work because common->micb_vout[] is an array
of u32.  We need a signed variable to store negative error codes.

Fixes: 4f16b6351bbf ("ASoC: codecs: wcd: add common helper for wcd codecs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/wcd-common.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
index 9bbfda828377..9016e974582f 100644
--- a/sound/soc/codecs/wcd-common.c
+++ b/sound/soc/codecs/wcd-common.c
@@ -62,12 +62,13 @@ static int wcd_get_micbias_val(struct device *dev, int micb_num, u32 *micb_mv)
 
 int wcd_dt_parse_micbias_info(struct wcd_common *common)
 {
-	int i;
+	int ret, i;
 
 	for (i = 0; i < common->max_bias; i++) {
-		common->micb_vout[i] = wcd_get_micbias_val(common->dev, i + 1, &common->micb_mv[i]);
-		if (common->micb_vout[i] < 0)
-			return -EINVAL;
+		ret = wcd_get_micbias_val(common->dev, i + 1, &common->micb_mv[i]);
+		if (ret < 0)
+			return ret;
+		common->micb_vout[i] = ret;
 	}
 
 	return 0;
-- 
2.51.0

