Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8A6D2FA
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 09:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NN7CV4ri"
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBBE2FE
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 02:03:56 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-507ad511315so6089098e87.0
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 02:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698656635; x=1699261435; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v89Lx0nnRnikLvWqxmhW7wcOZukLbdhFPSiRTXL1lHo=;
        b=NN7CV4riom6XJ1/Z9hLm2NzN2WqD4NFfzAXxsln9P49Y/t5Ke7Bybqoo2ic/af0uYR
         S1fN43684ORZdDgtwwuWEW9yHrTi1KUlCLWqpEbkqKN1hfmwYfNvtX6sWr7WIM5OFqVb
         su5bGJC+cbr99mk4zaJMSOp8UpadgfWZU+QbYWgqOfhT+GBKibFwfTIajaav3SlTqOb9
         6sdYamJZ1a3Lg0ET7dhmsyRij/LDKjE2hc5j9elqucIG+pPrkFpl97sZBnRCOP+V0Tg7
         4Pj6RGp1I2AzrZ6uqPkoKHl+84wsZkvBsAchz5+FsBkT/rFvAiX6ncSTodfHbS88onYN
         MstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698656635; x=1699261435;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v89Lx0nnRnikLvWqxmhW7wcOZukLbdhFPSiRTXL1lHo=;
        b=KBXMxy+wwYU7nlflUli5g+B7SMrCVxSYppixlTewPHl9LlWZxXOeHhVL0E+07xz3BR
         dQ7FgahAlcvOzGKIkD0/g7AIf5TSSK8hs83N06wUiZGSQFKFyrSyibGEJT8G4kI2xdIl
         EqshVAJm7I7wuKHj/0IJEHpdHUJMxdlGuPbuXEeqQEWT4lzYkTz6MkVjpVRg6/RIc8ih
         O2pU/jBteHXxWp7LZ/BGl7CKzOYiBgUyFC+ptTEsqVmCHkuMYLLcvoaICFqUIrEIZ3nP
         7hAhdDOoju7sj/CUTJoi+7Mb6NWYhySblC0IbvngmLlZuCaa5kkaNPAiA62aIbOPYBfn
         oi+A==
X-Gm-Message-State: AOJu0Yw9E5L9u/DZhd9AgzlQB88pK3dyLWAvBN+tCOaSYnm/ei+S9L19
	xzeZmgI7xjns40sTLwyf4KV1yA==
X-Google-Smtp-Source: AGHT+IE5ZI1vDjkcP0o9VY5/v14Jj/rmPNLp5S9UELxzLUu6iCb8fILaPYxWCo+qYRLoXtPMCPSyLw==
X-Received: by 2002:a05:6512:2394:b0:503:95b:db0a with SMTP id c20-20020a056512239400b00503095bdb0amr8694778lfv.12.1698656634997;
        Mon, 30 Oct 2023 02:03:54 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w16-20020adfee50000000b0032db1d741a6sm7738662wro.99.2023.10.30.02.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 02:03:54 -0700 (PDT)
Date: Mon, 30 Oct 2023 12:03:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Yang Li <yang.lee@linux.alibaba.com>, linux-sound@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: amd: acp: remove unnecessary NULL check
Message-ID: <e376a712-e0c6-446f-9e0b-c444dd795cbb@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The list iterator in a list_for_each_entry() loop can never be NULL.
Remove the check and pull the code in a tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/amd/acp/acp63.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index b871a216a6af..4d342441a650 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -283,18 +283,16 @@ static int __maybe_unused acp63_pcm_resume(struct device *dev)
 
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
2.42.0

