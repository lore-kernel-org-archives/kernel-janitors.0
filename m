Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DAF52F8E
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Apr 2024 08:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712563830; cv=none; b=JO4QMRz2C6cLRa2365oV5FQ6l2+H9n8jsU+oSqsPx8mU5ENsfFsVlyKwartFmJI7HpdX59hRYIJfkVgux3UtnmrNvV55YRLuKOqKpeWz9DLHWIeechbyTHd6AQsuvX3JFTjH5et1OxXVvEF3MO2Gup7FxZz9llAhmsnp402zl/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712563830; c=relaxed/simple;
	bh=virOewUX4t0oSLmoki5IIgzfGSQ60/H3437FkDr3qko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pHA2zEQEn9Q1fs5q034zPUrh3MQM1uE9csu1L3uKAiIXP9My06Z0+gKSkgP3hIzR65Z02e5K9qFwlyf2oUziE0HOOHMwLxHUUWrbEutV024+6PO7niDDY9CzPsVzlIYaE1vq1Uy8Zfq835454nGB3ki1JT9uTQNpp4r2bwMxVOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JtK9dDMH; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JtK9dDMH"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-563cb3ba9daso4073908a12.3
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Apr 2024 01:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712563828; x=1713168628; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SO3oSKHhB+QUpEgYOl7F+vhVd4MWO5gWULhDTn9lHJk=;
        b=JtK9dDMHhI40zGAm112hD9FH+/Um82S5KZTsm3vXdSoVMMsXwePpUt/H4ASWhyXgH8
         anE5e4xDNptqeEcyFZLOftnk9m+qbNFZ2Sy/4fgI+ErCudRGXKyn1G8p6nONzJK5nmZ1
         M9FxZpGGc6F14bAjkhEGD/1eoc6rwsg/lT8nGs+lODyaUGT62X5xxiZh2V6FU0o0EPRb
         SWqwE+ZfP7Ftu1uWPbAzbziLNF+TNsdBRLktzTNzPhfnDrVTQ/xvB9V/aOCOLHSvZeZT
         2WlwsVdfBrm50l5LYBzDATMNhfcaQkTCsc0oPUYS+pSBBpbt97kxBjrP/dmxA+dXnEfQ
         5lmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712563828; x=1713168628;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SO3oSKHhB+QUpEgYOl7F+vhVd4MWO5gWULhDTn9lHJk=;
        b=VPy9X5rVlypidNPwsXAH9py3hzMxBSboGTr6VqSNJxuFEdnDlTwwI1K11XgtDNgqwh
         4Rq/Vdoe88kNPbYl1U3ftgOG1BVSl7X8I7WNlRJthFu/DpJ5wgK0c4AuIVSY7idTlo2+
         bYavAnuJhqT0IbHALmcVNMS4QIsyJ+X8N+rrUs6O/vyoQT/9YZ2p44U76Owz5biLkBRO
         JO/+NkL3WYu30dJ+BSnWXw/pQeGm+2vAxSpnO6jq0Ax6rekNv/jGmTPbzHWU+JTn2wJq
         IiXQAVyFGmaWKNfzrgnE1CbRfLs2T6EkMpTKXuavn5/4ppLm8BxYgutX69fIA9e/wrut
         j8JA==
X-Forwarded-Encrypted: i=1; AJvYcCV8XhJrIzzr9teHWgM9HZKF6DCLYhhfJWOO/lIrfurLwNfJMZA25PA78A7aZyLSlIKlGnQa/LvsJ2Q3S5RvbTgNtGIMkwcMgWAHFWjUJJ0A
X-Gm-Message-State: AOJu0YwAeJNXPIY5Rp2h+I2rRIHfjOgHq3rUkrNNsfc8MgGqWtWynx7R
	tqKq/i8soCfxAQpGGZZi4YQBhgXgayW7I4mbQ5t3Ue2KtS9rC8ArYTOtnXrIWok=
X-Google-Smtp-Source: AGHT+IGBP2Eb1evno6OQER1fBynnrKOVTRDH6lrULwXK4u5X7YCnyIyHK40Fs4HT+0CKsXZ9E+hNfQ==
X-Received: by 2002:a17:906:ae4f:b0:a47:4bd6:9857 with SMTP id lf15-20020a170906ae4f00b00a474bd69857mr4337354ejb.64.1712563827422;
        Mon, 08 Apr 2024 01:10:27 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id r11-20020a1709067fcb00b00a4e9359fbe8sm4091818ejs.44.2024.04.08.01.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 01:10:27 -0700 (PDT)
Date: Mon, 8 Apr 2024 10:38:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: soc-card: Fix a reversed if condition
Message-ID: <155bb76e-dc57-4a5c-b0eb-acee5ebde9f4@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This if condition is reversed.  But fortunately, it has very little
impact on runtime behavior.

Fixes: ef7784e41db7 ("ASoC: soc-card: Add KUnit test case for snd_soc_card_get_kcontrol")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/soc-card-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-card-test.c b/sound/soc/soc-card-test.c
index 075c52fe82e5..a9fe7d243807 100644
--- a/sound/soc/soc-card-test.c
+++ b/sound/soc/soc-card-test.c
@@ -148,7 +148,7 @@ static int soc_card_test_case_init(struct kunit *test)
 	priv->card->owner = THIS_MODULE;
 
 	ret = snd_soc_register_card(priv->card);
-	if (!ret)
+	if (ret)
 		return ret;
 
 	return 0;
-- 
2.43.0

