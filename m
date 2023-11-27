Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mUCf86Hh"
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09734AA
	for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 04:56:28 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-409299277bbso30770975e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 04:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701089786; x=1701694586; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tP2t/kYtlEwSamszENbZNCB37/rUPT3TVZUIwyv3H7c=;
        b=mUCf86Hh7Fj7Qw0V879sDzs0k9t/5gBqQGaaCeYfkl/TcFlAYbKSToONqiPlgHULMO
         Fo3ShSXO8aJd6wuWoFxptlfUT3Y317Ua+RauuxFesMRNkhx0bMBnR/824dIJf3KVPx2R
         6vR64dAfozVMls+uZLGEl/zZjCFhFZw6aGHFPkt0nCHtbk7hlXAynC0uU6fXF4EYMSKl
         T3lOaLn4/qh/bC1PEWyH+jteEFTg+PZy35t9OP0a3xoXLOTY//+epO2pTim5cpgtbwy/
         KKhYDIT63Fw9RSsNRTSi6xK8j88NyWz4Y6HD8I7AaTZ6H3+Ylv0b4EZDCpG28cG0NWK/
         qOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089786; x=1701694586;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tP2t/kYtlEwSamszENbZNCB37/rUPT3TVZUIwyv3H7c=;
        b=VAmJQVRVcEOGPvS3/Lm+5+gLhPNP0C9dFXFSq8psgJ67YINamr9sFEFnTC44qpNPpx
         CxypJCA5MrqCuhKHUNY/iNsrMcUkhUpPe/jQ1qC3m5z8LLkiNz7WDQRAYBaTqNWcR4uY
         Zvsfxtc4MY4R8oVD6SnCpAgTMTzeZQ0sn6Ypxw+JBb59L2XBMvNMEu5jacneOdVdfGq2
         g21mWhBr4doPSc/Fy2Em+uHaVoy4XPT+fdV4Ddd1q80vmCLWhzrk5mwNFNtz7/O9DseG
         KD7tSUqz9LZd0tNSnIn14nQqt32+9rjMXUgf4N2shc5RURdizaQJCMI6Gwl3cWtVUqe7
         D01A==
X-Gm-Message-State: AOJu0YwYiCDYfCx6KQtRSLyC4Bf2YDttsmKA1bBRpCmaMOUXEYLEvX+U
	yJL3L8FkQIUkTsN2YKYu7thseQ==
X-Google-Smtp-Source: AGHT+IEBnJJc0eW1yDOIRLEA6HCZWX7esHVoOSHD5CtYbx0DUnTF47qWTGzVvvCRJLnDf8f57lSGhg==
X-Received: by 2002:a05:600c:5488:b0:408:403a:34dc with SMTP id iv8-20020a05600c548800b00408403a34dcmr8829868wmb.37.1701089786489;
        Mon, 27 Nov 2023 04:56:26 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k10-20020a05600c1c8a00b004042dbb8925sm14497219wms.38.2023.11.27.04.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 04:56:26 -0800 (PST)
Date: Mon, 27 Nov 2023 15:56:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Yang Li <yang.lee@linux.alibaba.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: amd: acp: Remove unnecessary NULL check
Message-ID: <bda284d2-05c4-47ab-9611-a58a70fe58ae@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The list iterator cannot be NULL so there is no need to check.  Delete
the check and pull the code in a tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/amd/acp/acp70.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index 0d7cdd4017e5..f65955215487 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -215,18 +215,16 @@ static int __maybe_unused acp70_pcm_resume(struct device *dev)
 
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

