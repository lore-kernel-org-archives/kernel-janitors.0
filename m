Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40275336B
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Jul 2024 16:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721837303; cv=none; b=k/XdGbucQaxs5S5NyncrkorzcR28Bb9wlnqq3YTrmhdJxhkgfwh2MFjtxNCfUQslLftr4RSzwcJLnXcTqaxnNbw/a4ai8pHLRCJzTl2nHYjQ0CRwaCDxosPOpSDL7UvClUq9FoiVH1teKbgnryl/GkRpBRCeqPsgvKi8D7DjVGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721837303; c=relaxed/simple;
	bh=ndst8U0aqaVE2fCttziktT33gS2XO754m38Daa0sVJE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ciLXMcYqyKrUoorkOsdWXu3uhUVFIZeJszQToHOo+q6GoCPpd2ciFf1NMSmzN9GSHryTtlglorGib2VFI7db7v34vOLwTSgoCTbR2s8yQ1Z/RzBKFmWLorJ4qzvrokV8ZsBVBRgiOIPZmd1P8rwGiB0tESAhnksuG1YmsJs7d1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f9Wnsf14; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f9Wnsf14"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-708e75d8d7cso3943739a34.3
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Jul 2024 09:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721837301; x=1722442101; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OFUzCqXp4LUYgYIMte0bv+Giz/nJSTprZA6Id25g/X0=;
        b=f9Wnsf14+8RNf5DFBVCTGS6nrgD132ljg/NnkdUOEZRVIrxcITpu7gAPBRzcMGB0/e
         0B1E/Sa0fQdyIu6Dpi4x9SVOYtJiKaAIfH3Wzib/tJG5oopRT3Px1prNzgllOPjOVzBC
         tKh6zcHVLHDTUAWOyFriX3iG013piNqzLMK2xYnttWnnU7wANhQlm1558UmfLbAC6QFJ
         DdVdX59rq45+vYo3MClp9u2LlQKnJAXDZp+7N4CJVQ0rRLkN057iDxnPJqP9Qx3fv5Ge
         gnEtHPWfaSBuAKrbVpDnKKDF/GLVWSYr42aIHIF6QHMLEhzcYzp1NOKpWHamc7flfgyF
         5Rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721837301; x=1722442101;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OFUzCqXp4LUYgYIMte0bv+Giz/nJSTprZA6Id25g/X0=;
        b=f5VO5b3AKJlmfjEOsqE/KKyF0wxM4Q6U5p2Yd6jUK2dJxNb1mIp3+ZQr0n+2VYCABg
         Ttky/x/LfFpQS1TxQple/kbcxQstVgR5kiJuU36QOGQPoV6Jrjg8NbnPIocw6OGUETuQ
         /xPt5oZEd9BMoUxwIS58e0PqHbyFDC7qds8tkDhw3H9McxAjR5ztY2AB6Ducv3ggv/CZ
         bwlLo+cTAi526pmv8oOWYoid/dsRnXq6jdRyDZPdUnlyeuZew2s10N6iNypaISEpola/
         JXVdGfU4YLYZyMi9YLnhWyuBWBS/bYtHOr+f43eHvdDSu64YPpzGBPTp/0DenlTBNhUk
         ByNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhsPeRmoPIsq54SIkIAjN915f2us7RGyh/zNR8clLVra5bHBiSLBM8cw5Ugh6j/vP9jwfTKiC3xbafkHO6LoO+uGuTOElkh2TjBFOsEWjm
X-Gm-Message-State: AOJu0Yy3i08gkVqAtLn+L55OO2SREhmhNFYVrfXGTtg0y/HDiXozsset
	8fZjB12n3J9CfH/JgxV4/Kr64eKK+yNAzIYONaabH5j0F6rf/hyg3Z7oNzvdehM=
X-Google-Smtp-Source: AGHT+IHowiqFMAkZdXvPHkV21jBtt7drxbOHtZgKOU668QUsqbER2NYAajL3QZ8PPG0U73SMiNfNXg==
X-Received: by 2002:a05:6830:488f:b0:704:4658:5d1 with SMTP id 46e09a7af769-7092e6c664bmr239202a34.12.1721837301140;
        Wed, 24 Jul 2024 09:08:21 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:23ae:46cb:84b6:1002])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-708f60a501csm2469880a34.5.2024.07.24.09.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 09:08:20 -0700 (PDT)
Date: Wed, 24 Jul 2024 11:08:18 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karsten Keil <kkeil@suse.de>
Cc: Karsten Keil <isdn@linux-pingi.de>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-XXX] mISDN: Fix a use after free in hfcmulti_tx()
Message-ID: <8be65f5a-c2dd-4ba0-8a10-bfe5980b8cfb@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Don't dereference *sp after calling dev_kfree_skb(*sp).

Fixes: af69fb3a8ffa ("Add mISDN HFC multiport driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/isdn/hardware/mISDN/hfcmulti.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/isdn/hardware/mISDN/hfcmulti.c b/drivers/isdn/hardware/mISDN/hfcmulti.c
index 0d2928d8aeae..e5a483fd9ad8 100644
--- a/drivers/isdn/hardware/mISDN/hfcmulti.c
+++ b/drivers/isdn/hardware/mISDN/hfcmulti.c
@@ -1901,7 +1901,7 @@ hfcmulti_dtmf(struct hfc_multi *hc)
 static void
 hfcmulti_tx(struct hfc_multi *hc, int ch)
 {
-	int i, ii, temp, len = 0;
+	int i, ii, temp, tmp_len, len = 0;
 	int Zspace, z1, z2; /* must be int for calculation */
 	int Fspace, f1, f2;
 	u_char *d;
@@ -2122,14 +2122,15 @@ hfcmulti_tx(struct hfc_multi *hc, int ch)
 		HFC_wait_nodebug(hc);
 	}
 
+	tmp_len = (*sp)->len;
 	dev_kfree_skb(*sp);
 	/* check for next frame */
 	if (bch && get_next_bframe(bch)) {
-		len = (*sp)->len;
+		len = tmp_len;
 		goto next_frame;
 	}
 	if (dch && get_next_dframe(dch)) {
-		len = (*sp)->len;
+		len = tmp_len;
 		goto next_frame;
 	}
 
-- 
2.43.0

