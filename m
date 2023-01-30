Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1FDC54EED
	for <kernel-janitors@archiver.kernel.org>; Mon, 30 Jan 2023 09:22:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235759AbjA3JWK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 30 Jan 2023 04:22:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235627AbjA3JWB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 30 Jan 2023 04:22:01 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 661BA86B7
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Jan 2023 01:22:00 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso1493800wmp.3
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Jan 2023 01:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GGUEVcAPqc3ntFlXLDsn+VtadZ+2wmI0bSmlamuFI1w=;
        b=heFkggjZxYLMIntkP1VjyCKEUKwu6aOiFm6NB0rJJTLoOYIZISDNYEAWvEFRajqXL6
         kK44PaSkuRHigjnWxLRS/ggB91RDuh9mj6z7mSYuDD7Lj8QDNc3g2tgc56ly8yXs+8q8
         5aR9YePGg2D9zhTP63ufenslUPaZ3NKjakW9ZY0BiIWoOUnmSEtUdBKfao8RP8DyhOa3
         dL2heRT+utCzhrG1XFB2AvkaUiT6imMgmUykFjSJQSmsTsCznfhlglGlumwFAXTFHSe6
         yyL0T9Kv5nvTeA5EZK4Q6Fli3hha8qxzv87z+OijRYGSFirWEroUrC9NnKaH6LhZSuKw
         9A5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGUEVcAPqc3ntFlXLDsn+VtadZ+2wmI0bSmlamuFI1w=;
        b=elXuo/wnAKkGznpDMRL8mU4x5KD3InwDOyHVQCReiIWj2Wo/p4lzFnAPaz3HLObDf9
         pQcRNEPG9e2Tno6OU1mZjwZoQvm9wiH6YPwDzTVr43ByPpesmcmyVhA2ZS3hIYh/rVi+
         YmVaPYF+CypGaaQ/OKWyNq+oYljjlJRKRrM508bXHhrxzVwSwMS/8cSFxqYtl6tTVbeR
         f5DAMCow8R23gu98KJV1hZC7+AhqiP6ovopWc0g43Rkj7gttfDzfh0qCcx07EU+7tvU3
         BtdyMvoY2aSy2CC+g9hV7ZC1klIm+iLaT1drXTcaKqx4SqBVO7BpPj80VfOGhqmyElHZ
         N+/g==
X-Gm-Message-State: AFqh2krB9eG8pHHwiBPnVHelg6G5lx7txo7mGCPVEkP9pXeHO37iT8KG
        OnXQrssVkxSIe7fClG/6TGxg4Ua2lkr/gA==
X-Google-Smtp-Source: AMrXdXvH4jwg86yGTRFJ5HRm3uZIAeg7hodaP8VUpLyT2Nuwyprlwgapu+iRrvgaS05M5aPObfeymg==
X-Received: by 2002:a05:600c:5114:b0:3db:254e:59a9 with SMTP id o20-20020a05600c511400b003db254e59a9mr39478716wms.15.1675070518868;
        Mon, 30 Jan 2023 01:21:58 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id d11-20020a05600c3acb00b003db30be4a54sm15357905wms.38.2023.01.30.01.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 01:21:58 -0800 (PST)
From:   Colin Ian King <colin.i.king@gmail.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        KiseokJo <kiseok.jo@irondevice.com>, alsa-devel@alsa-project.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [PATCH][next] ASoC: SMA1303: Fix spelling mistake "Invald" -> "Invalid"
Date:   Mon, 30 Jan 2023 09:21:57 +0000
Message-Id: <20230130092157.36446-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There are spelling mistakes in dev_err messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/sma1303.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index d3ee831e88f0..3d8e3900f5c3 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -500,7 +500,7 @@ static int sma1303_aif_in_event(struct snd_soc_dapm_widget *w,
 			sma1303->amp_mode = SMA1303_STEREO;
 			break;
 		default:
-			dev_err(sma1303->dev, "%s : Invald value (%d)\n",
+			dev_err(sma1303->dev, "%s : Invalid value (%d)\n",
 								__func__, mux);
 			return -EINVAL;
 		}
@@ -640,7 +640,7 @@ static int sma1303_aif_out_event(struct snd_soc_dapm_widget *w,
 				change = true;
 			break;
 		default:
-			dev_err(sma1303->dev, "%s : Invald value (%d)\n",
+			dev_err(sma1303->dev, "%s : Invalid value (%d)\n",
 								__func__, mux);
 			return -EINVAL;
 		}
-- 
2.30.2

