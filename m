Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YeJdh5ni"
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87BC490
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Dec 2023 04:42:12 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40a4848c6e1so45413765e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Dec 2023 04:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701693731; x=1702298531; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8x1dwoG6L6bxEjQMrtyUOBz/l2kp09gC7Z8V8HJ6Bn8=;
        b=YeJdh5ninM2QKZaPuVPWZQmau+UpYLchO5pRNMvWiqah6VlX8oIkPhEmnYGu+lB2Cl
         NEAXs2rQgLxS8nZf7dlAI2ZRbK1P68ikmj3ENClssaG4eFh23I0jgUtNkLp5yCqtIZ3B
         QxQpBab32f5e3YX946VrLRInUmkOgzktWhAvlF+FOOgyGWxn6zYlXGRsh7tcKlrRvj/t
         bQ3Ec6dqYSEmbNTFtavFTN5079EbMRvJl52WYyOW6H5OW3oLUcmsBhFgNbibFgVJnjyo
         zZMYlLvomHgKZgx09JUHaIyA2Wfu1b8WgSZ5up6uqgweSZMWRT60g7V3r0wGwtwvfspR
         1xPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701693731; x=1702298531;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8x1dwoG6L6bxEjQMrtyUOBz/l2kp09gC7Z8V8HJ6Bn8=;
        b=CkNB7JWrQX8qhLZTZTwqmqr+CPPdJx/BOOOCGcGUJx8aYQxkRzhls2A26im+Rw6sNL
         C5ccUKoBKAE7mNWpWkW0r+RfS5rVa1p09NJe55FSAAwS3QUMlVFTNBcLKq2jMaIf0EGa
         cfq09KIb6nI83bJPTZZf93JppHoS95GqhQmi9ZdFPRna2r+8drlBKE0GsBhYN511FkVE
         q8pKVq6KVTKWwHVmpQpMUEgjlqNpN/8bPQq5E6JN7npgaYUL29U89R0xYFMea+I3zEMN
         so1tJxjyO3/pLTG2LI1cOinGiyekYqa9tnqu7VXLcJFqwGpSemFCezhndKFKTBB12nf9
         p3Dg==
X-Gm-Message-State: AOJu0YxC58sJ0DOh4kTmq3KVlXohEL1YO9sxl6h3hHvOGwYtSwlnu3vS
	f8DVMnnHpR0HNwi3/3drmcnq2Q==
X-Google-Smtp-Source: AGHT+IGJz3N4/IoxBaz0NjZihjCP4keqQKfmadAcfgA7ZWA07jRl1+KY0bF/rDdOkf8aj+mgEiOyHQ==
X-Received: by 2002:a05:600c:450f:b0:40a:5c71:2c3e with SMTP id t15-20020a05600c450f00b0040a5c712c3emr2172252wmo.19.1701693731047;
        Mon, 04 Dec 2023 04:42:11 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f18-20020a05600c155200b004094d4292aesm14959419wmg.18.2023.12.04.04.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:42:10 -0800 (PST)
Date: Mon, 4 Dec 2023 15:42:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: audio-graph-card2: fix off by one in
 graph_parse_node_multi_nm()
Message-ID: <1032216f-902f-48f9-aa49-9d5ece8e87f2@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The > comparison should be >= to avoid writing one element beyond the end
of the dai_link->ch_maps[] array.  The dai_link->ch_maps[] array is
allocated in graph_parse_node_multi() and it has "nm_max" elements.

Fixes: e2de6808df4a ("ASoC: audio-graph-card2: add CPU:Codec = N:M support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
In this same function I was also concerned about these conditions:

if (cpu_idx > dai_link->num_cpus)
if (codec_idx > dai_link->num_codecs)

But I wasn't able to see out how those idx variables are actually
used.

 sound/soc/generic/audio-graph-card2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index d9e10308a508..78d9679decda 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -557,7 +557,7 @@ static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
 		struct device_node *mcodec_port;
 		int codec_idx;
 
-		if (*nm_idx > nm_max)
+		if (*nm_idx >= nm_max)
 			break;
 
 		mcpu_ep_n = of_get_next_child(mcpu_port, mcpu_ep_n);
-- 
2.42.0

