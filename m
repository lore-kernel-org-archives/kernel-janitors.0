Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E2DEB64D7
	for <kernel-janitors@archiver.kernel.org>; Fri, 23 Jun 2023 12:09:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbjFWMJ6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 23 Jun 2023 08:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbjFWMJ4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Jun 2023 08:09:56 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C25FB1987
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Jun 2023 05:09:54 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-307d58b3efbso559657f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Jun 2023 05:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687522193; x=1690114193;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jwcTA8wrnkUB5oKuM0EHXCbz62y5Uq5RpVKOIFS0yUc=;
        b=SVRBa7pJFL+rAVwXlqDHwhAIxMKJcSWM18ZW5rUOe1HPbUIfEovOnx4vaXqyHrqs92
         DoR4F2HLzXcLTnDJSc2FVAjKZUJhRQcgfyTWa1U3CXhYvyTQ2QhjxtoGaMB5kchu8AfJ
         f2eRit+9jtyVz6/v06GE0ywTfXMKj4SYemEcDxEsz1o2AIz6DRxjYlgDY7q2kuXzXsk0
         /9JBtTfe/NA/YI5t+OeosQb5vk274/kUlW8cCjxlt8ZmnWY3qJQYKAHPCi9BdH0KWkiH
         Y3dTFCznye2pFPvg9aTIhH1iPNixbYBdZEYTH6m6jcMzXKp1p4uPg2Wrm6NMbv53NOxQ
         +Faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687522193; x=1690114193;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jwcTA8wrnkUB5oKuM0EHXCbz62y5Uq5RpVKOIFS0yUc=;
        b=NIIPZ9tSmyOkPIxBBPcXtr3HAuDf1M03ZQOavAVWtA4QVm6UP58T3MHzmBvFXDpazW
         7IwnoBcxlOIk/9npoWpjuZaMd+O7nVMzWednkjDAuFdM7gY8KFSTH8sivOq39r8FTjEf
         z/uRVObjaQ89WLZHKqUv19fa3LggZPaQqi2oSiD9QEZMXoZMRPFUdn5WTAa/pLg+HJDY
         iXXLhJyVSDIlEWZv9Q57cuirdCU9Llo8temh0zebAHrkbGnhjSmKd6M14ObhY0nmBUUk
         h26rhY7BpNBkfBEHssYR04/Pt/PyE7FbDr/p67KZ0uSetcf3Z/l+66drQeBfxQCQMMHL
         aaVQ==
X-Gm-Message-State: AC+VfDycs26MrowNHdLg+16k+u/cRX2bjvTjtQVrCBQc88vgiOfYHOV9
        EaPcjV2ahyRlZWPOz6pzJjlWHw==
X-Google-Smtp-Source: ACHHUZ6aHzHysbbGQDIPKppLrrjLdadCJ+DdUYs9OMKQXDlIKhuyvhKIL7ttjNAAUrJCkHrfcbJHNw==
X-Received: by 2002:a05:6000:1a42:b0:30f:c94e:88f6 with SMTP id t2-20020a0560001a4200b0030fc94e88f6mr4045205wry.0.1687522193191;
        Fri, 23 Jun 2023 05:09:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p16-20020a5d6390000000b003113943bb66sm9298909wru.110.2023.06.23.05.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 05:09:51 -0700 (PDT)
Date:   Fri, 23 Jun 2023 15:09:48 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Shenghao Ding <13916275206@139.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: tas2781: Fix error code in tas2781_load_calibration()
Message-ID: <729bb6b3-bc1d-4b3d-8b65-077a492c753c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Return -EINVAL instead of success on this error path.

Fixes: 915f5eadebd2 ("ASoC: tas2781: firmware lib")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/tas2781-fmwlib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index cbf0aef2c001..eb55abae0d7b 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -1924,6 +1924,7 @@ int tas2781_load_calibration(void *context, char *file_name,
 	if (!fw_entry->size) {
 		dev_err(tas_priv->dev, "%s: file read error: size = %lu\n",
 			__func__, (unsigned long)fw_entry->size);
+		ret = -EINVAL;
 		goto out;
 	}
 	fmw.size = fw_entry->size;
-- 
2.39.2

