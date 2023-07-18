Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C6BEB64DC
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 Jul 2023 07:04:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbjGRHE1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 Jul 2023 03:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231448AbjGRHE0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jul 2023 03:04:26 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE671B6
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 00:04:24 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b73564e98dso80544661fa.3
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 00:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689663863; x=1692255863;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W8TB27ZmvdRSRiDtaXR1gH8ehYqkCg1wepT/QIsq0qo=;
        b=DWWqQQJ7EoVLljoW2XhZIz37uamQ7qO7E2TapcyR8xzWy0955J6zb3G+64fcy1td7t
         H7mSGk+Ppi395eqGfkGJ+dd1bjF7sJ3cRF0AwpDFg8raFXuqtyroDI/Edt3H/sNcRj/Z
         Q+zISIBAxKVilClC9eORF5bfCU02OEf9Do6VdinXqzadI+bLjC11g1Jdr2Uj1C1REaAo
         jyKY/98nen6nmJMUPbJKY5CvfGV+XMizFWJB30XjOe7QNw10KHJYaZg2kgNOGk56ay3G
         Oy3a4G//9b3zI4QxafIxmsw7OJTsll4rxhwA+cYdr0G0vLeAuQU19xeKTcWyOVUSDG+u
         dS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689663863; x=1692255863;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W8TB27ZmvdRSRiDtaXR1gH8ehYqkCg1wepT/QIsq0qo=;
        b=fm6Jxkt/nDIVVEyi8Iz8zPWadX/T/BWRZPWdxMVeFkNe96r7OhXbseaXMrz8mTX26t
         SJvqHv+3mPUBi1l9/tuVIZkSNSqNR/FnsyY/EkWAUsHwDod2fTgKohSkLP6cMlSa6D6B
         dQvtRC5X39h8MvUjOhUb2E30ni54/4zGYINlDoOKsNVaL4oVSnJlpDgcVa6ElM9c3bGi
         qwpM4QSH2Y2kfqvC5zvw9Jh8LuXYWuJDhhMzufQmAySuBGR19mGtAAVTbEtGC1KSmjjQ
         xja+S90wRmJKoDzDdKEZTxJvA59RUYIz6VyiLkeoPsyB750LZ/Fy+tImtiNk+HaNpI3x
         N7Jw==
X-Gm-Message-State: ABy/qLa93NPR/1pw2DOqEyXC9JO8buMu+F0TKlQhBWqT5fuom3/TZBi6
        5H4NESLpOKNpPzo7Gw/Cddpfyw==
X-Google-Smtp-Source: APBJJlHslYGVSSyNVJNDxI5bYBfnub9XVSwa1X5s1acoNR8jSAVh7ahaAw9VVrUzXgplaGVGmAX06A==
X-Received: by 2002:a05:651c:120e:b0:2b6:fa60:85a1 with SMTP id i14-20020a05651c120e00b002b6fa6085a1mr9941521lja.21.1689663863227;
        Tue, 18 Jul 2023 00:04:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i10-20020a5d522a000000b003143aa0ca8asm1485018wra.13.2023.07.18.00.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 00:04:21 -0700 (PDT)
Date:   Tue, 18 Jul 2023 10:04:18 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Syed Saba Kareem <Syed.SabaKareem@amd.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Yang Li <yang.lee@linux.alibaba.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: amd: acp: delete unnecessary NULL check
Message-ID: <b0c5b0ca-68da-47e6-a8b0-e0714f0de119@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The list iterator can't be NULL.  Delete the check and pull the code
in one tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/amd/acp/acp-rembrandt.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index 21e67ed956d1..cc8284f417c0 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -266,18 +266,16 @@ static int __maybe_unused rmb_pcm_resume(struct device *dev)
 	acp6x_master_clock_generate(dev);
 	spin_lock(&adata->acp_lock);
 	list_for_each_entry(stream, &adata->stream_list, list) {
-		if (stream) {
-			substream = stream->substream;
-			if (substream && substream->runtime) {
-				buf_in_frames = (substream->runtime->buffer_size);
-				buf_size = frames_to_bytes(substream->runtime, buf_in_frames);
-				config_pte_for_stream(adata, stream);
-				config_acp_dma(adata, stream, buf_size);
-				if (stream->dai_id)
-					restore_acp_i2s_params(substream, adata, stream);
-				else
-					restore_acp_pdm_params(substream, adata);
-			}
+		substream = stream->substream;
+		if (substream && substream->runtime) {
+			buf_in_frames = (substream->runtime->buffer_size);
+			buf_size = frames_to_bytes(substream->runtime, buf_in_frames);
+			config_pte_for_stream(adata, stream);
+			config_acp_dma(adata, stream, buf_size);
+			if (stream->dai_id)
+				restore_acp_i2s_params(substream, adata, stream);
+			else
+				restore_acp_pdm_params(substream, adata);
 		}
 	}
 	spin_unlock(&adata->acp_lock);
-- 
2.39.2

