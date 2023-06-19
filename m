Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8AEFEB64D9
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jun 2023 09:47:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbjFSJrF (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Jun 2023 05:47:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbjFSJrC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jun 2023 05:47:02 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27BC1E7D
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 02:46:55 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f875b267d9so263503e87.1
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 02:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687168013; x=1689760013;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mgTyLdDdb0JKbsxmvr5ig7MQKF/koVbYtzKG0qR1FQE=;
        b=FVSBtbAnIdD2JGB4L/8m+3kxtOJ+IVlztZLyrAd45QBrUrMok51/Yf8vs+cbfu0eSq
         QzhNIPfEx2XC+0HQ88oo9L6zaw7P+nRl5e6QxtBBN6H7Uil0TlLu0V3Hm+tL/SUVYHgl
         mbkRNHJV98U0GL/ApfmGaTflPTKQelNz8g/vWtUEJKcN10Y6r743it0OxOw5OmQXcZY0
         fZS9ugYrYrnlwWhIHAwdWcIqvM6Z6EIuHR+6Nj5+eVbcxQ891A32fNPOWD4gectUmAHQ
         k/2uapwbSfrNtu4VjdlSXH8kibjlxJdd7YI966e3h7m2OOv3IZAEgyfw19G62pvA778s
         jcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687168013; x=1689760013;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgTyLdDdb0JKbsxmvr5ig7MQKF/koVbYtzKG0qR1FQE=;
        b=DrLAXHg8oDUPkBpV0bXVtnmiyPNcKws0oqQ7s0heRNtioIr9CAIq8KglKmK5WzGnyP
         0JMQ5YOeJUeumZWkBU2ImDVeA9JuUB9THM8oc6nAh4OYY1YrFzRvAIN8V8u+j79sVs1m
         Ut0jAvh0THhblZWBjaJiPwsqu3/Th7gI6yM3biZaYIXesYFAEG5eYogVm2llckUDOvR7
         UPMFWVS+usjO0NOuxCD3aUccHNs1VMRCsktrRR5vr8D9HzdcrUeYrWNyKSsE2I9ZcVtZ
         nsw/1x4tjmpsMmrwZVSf1oSMosCJIsWssFXfADED+UcS2miGZLcKGHcvy2oGFWeTFZRC
         mXng==
X-Gm-Message-State: AC+VfDxq7AMqmL+2zGi42Ek77Qlpa88uF5BdOgB6q22hMrUVkrneVith
        Q/GUyZTUZq+eNxEbb4+1e6LYMQ==
X-Google-Smtp-Source: ACHHUZ40EMBWSgG/syJoSDMA4KN+4am/NO7LwY/DaZosq1p3vH68GpBXmJJFgzekNgpty8d1Whc2ZA==
X-Received: by 2002:a19:431e:0:b0:4f8:6dfd:faa0 with SMTP id q30-20020a19431e000000b004f86dfdfaa0mr1329253lfa.2.1687168013203;
        Mon, 19 Jun 2023 02:46:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u16-20020a7bc050000000b003f080b2f9f4sm10197630wmc.27.2023.06.19.02.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 02:46:51 -0700 (PDT)
Date:   Mon, 19 Jun 2023 12:46:48 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Ryan Lee <ryans.lee@analog.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: max98388: fix error code in probe()
Message-ID: <d44c8388-b12b-4045-95de-0d4bc7b428ac@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This seems like a copy and paste bug.  Return the correct variable.
It should be "ret" instead of PTR_ERR(max98388->regmap).

Fixes: 6a8e1d46f062 ("ASoC: max98388: add amplifier driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/max98388.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98388.c b/sound/soc/codecs/max98388.c
index 8062a7115007..74fbaf7d7c39 100644
--- a/sound/soc/codecs/max98388.c
+++ b/sound/soc/codecs/max98388.c
@@ -960,7 +960,7 @@ static int max98388_i2c_probe(struct i2c_client *i2c)
 	ret = regmap_read(max98388->regmap,
 			  MAX98388_R22FF_REV_ID, &reg);
 	if (ret < 0)
-		return dev_err_probe(&i2c->dev, PTR_ERR(max98388->regmap),
+		return dev_err_probe(&i2c->dev, ret,
 				     "Failed to read the revision ID\n");
 
 	dev_info(&i2c->dev, "MAX98388 revisionID: 0x%02X\n", reg);
-- 
2.39.2

