Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D82C7EE23
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Jun 2023 09:42:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238188AbjFGJmG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Jun 2023 05:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238084AbjFGJmE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Jun 2023 05:42:04 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851701723
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Jun 2023 02:42:00 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f730c1253fso33423125e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Jun 2023 02:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686130919; x=1688722919;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G6Lo+18sIXzxNcuFSTXduKxmc08cyUDjNGZNtZkUahY=;
        b=AwLzbIm1zg0K9edsLuu1NPocZIg/6ycVQovwysMtzw1bJxOUTxjkJrih+FSr6FZL0S
         oVilKsEKAD/Y6IbWIJZBBNFhrz6P5rEMXlaQ3OPDg/Yqlvbz5ZBuANiBDrcpSre/F1Fw
         pXbSiPDfbmN/8xL919riWuZgDoVDRT2BKp0tZDKEJjH0O/YjAkZzTJtyICE94xEOb741
         aL/VIR6a++MpCXo/Rblos5rTbmlJlhRiMrKqJXjfecy6eEofY3JAkDU2LCsSQvGyAUEL
         zHEPAkEfJxgZ8HzN1ObF4l1/T5/CgOi7ZLqZsrhg0idw3yyZj2eudGlAKt6DhSv7aWKC
         aAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686130919; x=1688722919;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6Lo+18sIXzxNcuFSTXduKxmc08cyUDjNGZNtZkUahY=;
        b=Azl0R+08JlgHe/+BcxkupSBHWRA2rCNJhx9U1/VoiHN9bWQmrRFihGDiVnbjm7cfsy
         F6ZQspVeNT4A26ETg8FYDBcP6Zmbns5YeNaZdjwicuAOLRRBevCmSQCyMExMNh8vJJ6o
         Db/O+98A1QsXcl4Kp7up6uPfZW4eAKNp06ZTI+fwTz9ff5PdiZYQze/4ypVsBjhe62ki
         zpZphpqFQEiWjX5V6uar0EQV0d97pxBdlkEak3I7Y5+rgkrBkr5nxgRHFZv+TxUjxi6f
         Id/p6Vn64W/m/ylCPhO4IIBavI9jjs02pPMLblGO7fdkp4HhuAXTtuUTIu8BhD2JnEPR
         80NQ==
X-Gm-Message-State: AC+VfDzcyxUpxip/m0qcaK4flVUlrWyayHV81jxrBPcKnLpnL68aRYpE
        0QweLQ+Cx1t825ekfM408vXYaA==
X-Google-Smtp-Source: ACHHUZ6Xh/LwcZ+rZVHzsTOg4l/H6d1/H3rWqOqZY6ABx67wn1KYIBuLFgv2YJrWxIXpyw52rn7ENg==
X-Received: by 2002:a05:600c:287:b0:3f4:2452:966a with SMTP id 7-20020a05600c028700b003f42452966amr4432811wmk.27.1686130918955;
        Wed, 07 Jun 2023 02:41:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y8-20020a7bcd88000000b003f4ecf1fcbcsm1541154wmj.22.2023.06.07.02.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:41:56 -0700 (PDT)
Date:   Wed, 7 Jun 2023 12:41:52 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Trevor Wu <trevor.wu@mediatek.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8188-mt6359: Fix error code in codec_init
Message-ID: <f1d2f4c5-895d-4ad3-ab0f-b7ea4a74b69b@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Return -EINVAL on this error path instead of returning success.

Fixes: 9f08dcbddeb3 ("ASoC: mediatek: mt8188-mt6359: support new board with nau88255")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This is based on static analysis and not tested.

 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index bc4b74970a46..ae02bbcd5d4e 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -594,7 +594,7 @@ static int mt8188_max98390_codec_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	if (rtd->dai_link->num_codecs <= 2)
-		return ret;
+		return -EINVAL;
 
 	/* add widgets/controls/dapm for rear speakers */
 	ret = snd_soc_dapm_new_controls(&card->dapm, mt8188_rear_spk_widgets,
-- 
2.39.2

