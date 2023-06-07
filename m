Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8267CC77B7A
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Jun 2023 14:58:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240878AbjFGO6F (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Jun 2023 10:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240877AbjFGO6E (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Jun 2023 10:58:04 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E386B1BFF
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Jun 2023 07:57:45 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f6ef9a928fso60977075e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Jun 2023 07:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686149864; x=1688741864;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15bcPlwJydkin0B+JJAsu+9McxnbVcGQs6T+4KYVyWQ=;
        b=qGqDR9tSf/ntbvkpkgaO42huIAJWHmk04412CvhnpxAwQb+CiKuF2lAVZw29BLhpWG
         wnEIyLfbZ6V/B3sHUTtyet7DHrb3nitMvWBbaZr/H5reMtDydgEwEGviYaeYGS9+xb3u
         kIXqzZgE/fUMwYd4hwFMmIkC5dye70I+oXc/GMESJ9gC60AhQrvQO9T3suMtQj7N5hBk
         Al/gAm95BjVudokd3ttDVMayJZuc+XjEdNIJkXQalNv29xxIE7fubija+2srf7PDj/lY
         +IYE61jg29t+nsXqNc20nwKC7YQziScASypHutUCduar0YEr9hY5dyOeE7tW9C4rKpFm
         0wgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686149864; x=1688741864;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15bcPlwJydkin0B+JJAsu+9McxnbVcGQs6T+4KYVyWQ=;
        b=HO2woqziNPTIyZEc2x8s8OWrLPLkVUPUYk1MjyU2e4VttT4gR1pvVvrMVwC892omC5
         dgBbUsqefs3bttf1AeCrrtAG5jksJJld1nF83VzJaOFUprG3BBAHFFR0Ifsj+4WMTOEr
         WEKOwwvlNV7ydwAjTqrx2EpUK1SZurf63hQIuV6yYHRUe/+ER4x/W9E0MN+u6QsqmG6K
         ErmQhArnKb52w4Po8DKHF62M5vt6R8Ui4GcpLq77DJFfRzVOsGH32uRjmXrR7wnr1X1Q
         WCGJ0C8V2iXJX+5EsPQuzhEj/aZLRbrolsd9zosrArBcOuZ8r6pbwQNzd4XCIh96cbP4
         TYHQ==
X-Gm-Message-State: AC+VfDxzojrKsiLUOZSJRrnKrEf3MboEmYQQG2tFOZoMpX6A3x9gotjk
        9UbOPbrEE8HEdQFhRZ7L9C2/ucmaQF18RT+F4PE=
X-Google-Smtp-Source: ACHHUZ4Om8wIr2+W8c2m5xch/rF8WjO/ue+qyFCuYy0t+JsljkFHxXGRUHuKnJgvRrjikjox6oNy/w==
X-Received: by 2002:a05:600c:ad6:b0:3f7:e629:9f3 with SMTP id c22-20020a05600c0ad600b003f7e62909f3mr4734068wmr.16.1686149864352;
        Wed, 07 Jun 2023 07:57:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y6-20020adfd086000000b0030631a599a0sm15633048wrh.24.2023.06.07.07.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 07:57:42 -0700 (PDT)
Date:   Wed, 7 Jun 2023 17:57:38 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Trevor Wu <trevor.wu@mediatek.com>
Cc:     Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] SoC: mediatek: mt8188-mt6359: clean up a return in
 codec_init
Message-ID: <42f2a995-3545-40bf-82a0-fd9b8abc16ce@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code triggers a Smatch static checker warning and does sort of
look like an error path.

sound/soc/mediatek/mt8188/mt8188-mt6359.c:597 mt8188_max98390_codec_init() warn: missing error code? 'ret'

However, returning 0 is intentional.  Make that explicit.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: At first I thought this was an error path but it is a not.

 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index bc4b74970a46..5ad8d2a5bbc4 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -594,7 +594,7 @@ static int mt8188_max98390_codec_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	if (rtd->dai_link->num_codecs <= 2)
-		return ret;
+		return 0;
 
 	/* add widgets/controls/dapm for rear speakers */
 	ret = snd_soc_dapm_new_controls(&card->dapm, mt8188_rear_spk_widgets,
-- 
2.39.2

