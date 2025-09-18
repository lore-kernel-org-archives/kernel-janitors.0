Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A74922A4E5
	for <kernel-janitors@vger.kernel.org>; Thu, 18 Sep 2025 09:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758188914; cv=none; b=WxFg1vjFZoqM3T2zcPy/d7tqPun/2F95uelB6fVQ3If7iQUqkJx5QhHL2wl8ewjOqvn7MqB9BWjjz3hMgmB3OCM9uKlXl02PK3yvskCg/wViUahNEGf8BBttQErDTePiwFdAY+ZcWzxz2Hgib2KlUKb9d/7E+BRhFoHyO6gMCbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758188914; c=relaxed/simple;
	bh=iUOnXzAnIbz12WMKiHCmVwMEY+TGpgiWwPuQO/o7Ofc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NdG2LdISe18G91dmng236fKyCLPYb5BT0PLOFNHuzT8y7lO9qPTlCiTdughz+c+UFflDJvbn+rCfvcmI/gr4Ka6L/VlOpdUN8Y/nOf++EoTsTYT3zQGPp8hS0KwuPCRzhMZZmvk35YCGr50grJDD+fNWlayxTDY+hSYof092ZLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r+arTYz0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r+arTYz0"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b9814efbcso12348115e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Sep 2025 02:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758188911; x=1758793711; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FRKX/a9t7ARzNjcgVwY27xm/KGPFcrC2ZLWzVexu+GA=;
        b=r+arTYz0c+clTxfqZjOXw1/NTcn/y+hfsNFHTGQC1Kq17gZkb/R12l2fW4+3DhbVd2
         h2wxTEsHKs7jtPWRARPpP86AT8S/MF7eH1g1pOcbSuuS7luMcWWA5grRuyfNgxC2/3lm
         On99ALYgJfokFIbbyVbXPpSnRPcuhJV3A+eGJXLnxf6pWMms5fKR3FIthwfp/m19+wdT
         +lPJupqSaLbJV2dkTgjOW0s208Geygsm2/tMXyhnpxN/aIUBi7CZjHfMfIKxa52AHdy/
         nTBu34evmIg8MrNMb8yWtO0XFZf6NK8i7WUnVxt/vbBHbnDb4yDjgzI8gSVQOtDnmr8V
         VW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758188911; x=1758793711;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FRKX/a9t7ARzNjcgVwY27xm/KGPFcrC2ZLWzVexu+GA=;
        b=TlpExWdYAK4uozROuzAdcRWm6zXvSNTgjMBkevS8zmizCSPTbPY5/6B+mq4KbHA5Ku
         UgVANL03yXH+i0hqa7QayME8TdFeCbP/Lu0t/j+jdUgmQIbOSPfqRS0oZ/gc6980+ohL
         YyEDSFLDcIsZF9pUSy+tvCu57KZ9RrBt+Jn3T2oL20NJM8AkCR8MeLvt2GYv2gU7e7BW
         oqPjDURt+RZQ2XVMzuMypZT9nQo/nlv3+SXvBdJf14AjduZzLB33QLx2qpGRvfwVTGWw
         HUp1p9sNzA3W1twxuqUsAFHTzCX+P4e+S0Jo2ccWZrgRhKdsZWCMOsIMwiz1VfxaBu+/
         WY2g==
X-Forwarded-Encrypted: i=1; AJvYcCUbLxHOiWIyHHLWaYdCyRsFEI/V4XcUFQt+kk54X2FqN+9VNkzNIIQ4kpdVkJSMD70ADDvbphrWHF00SF/WwTE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp1qdZ2cQd8ajAHdaQ0FrToWoEARnb03+HA/HFNXM1ie5d0ba1
	kH7S3EDlejOlsgaSAkkpnkZudD1mRpL0gFysagwj5drTMcOU3I+eFcYjZriyAkHrH8g=
X-Gm-Gg: ASbGncv6mrLWfS74Lxjpo/Bb7p9HTlFv2GPKo1CowhC/p9w/IMPotgW9o0kC6srt2kX
	ZYe4tGkDdB7NxeS5OqjigrcOtqD0Et1CMbBLiAbPBBK2TjHM/m+RzL6EvlznK5Z4J4lw87mASIc
	8kIm2aD/S2M4l9gwOwCjzJ3etuBTuZVnWViTMh0WHcaQj+UW0Tv76qADtrgwhEEaVIv143WFT/V
	h2KFLZZNRQP+9d9lU50JaCzxj856CBnVTA5KD9jhCnqyEBmKWM1zDpN2f9t96yoT6jTkqdQP4N+
	fj/ppkCR1Wni7c8PGda7DnFXByRdmtVHc4HZK83ZK6rwlWj78Ac9n3UGWHkIaXzENUjFF2m3GQ+
	/0qeieLXypcWZYHoSmORS5KGcQXhlVaP8bjm/WgH06lnIYg==
X-Google-Smtp-Source: AGHT+IHXja+pZTgNTOTckYTv2vp7ew+2RtTFibAkrz6i7j2uNLlasmLdSudrmUnD6HjK82+q28mc+Q==
X-Received: by 2002:a05:600c:43c5:b0:45d:d295:fddc with SMTP id 5b1f17b1804b1-464f7027ee6mr16687145e9.4.1758188910448;
        Thu, 18 Sep 2025 02:48:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-461391232e7sm72907635e9.6.2025.09.18.02.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:48:30 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:48:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Roger Quadros <rogerq@ti.com>
Cc: MD Danish Anwar <danishanwar@ti.com>,
	Parvathi Pudi <parvathi@couthit.com>,
	Roger Quadros <rogerq@kernel.org>,
	Mohan Reddy Putluru <pmohan@couthit.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Basharath Hussain Khaja <basharath@couthit.com>,
	"Andrew F. Davis" <afd@ti.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: ti: icssm-prueth: unwind cleanly in probe()
Message-ID: <aMvVagz8aBRxMvFn@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This error handling triggers a Smatch warning:

    drivers/net/ethernet/ti/icssm/icssm_prueth.c:1574 icssm_prueth_probe()
    warn: 'prueth->pru1' is an error pointer or valid

The warning is harmless because the pru_rproc_put() function has an
IS_ERR_OR_NULL() check built in.  However, there is a small bug if
syscon_regmap_lookup_by_phandle() fails.  In that case we should call
of_node_put() on eth0_node and eth1_node.

It's a little bit easier to re-write this code to only free things which
we know have been allocated successfully.

Fixes: 511f6c1ae093 ("net: ti: icssm-prueth: Adds ICSSM Ethernet driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/ti/icssm/icssm_prueth.c | 30 +++++++++-----------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
index 65d0b792132d..293b7af04263 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
@@ -1390,7 +1390,8 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 	prueth->mii_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-rt");
 	if (IS_ERR(prueth->mii_rt)) {
 		dev_err(dev, "couldn't get mii-rt syscon regmap\n");
-		return -ENODEV;
+		ret = PTR_ERR(prueth->mii_rt);
+		goto put_eth;
 	}
 
 	if (eth0_node) {
@@ -1398,7 +1399,7 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 		if (IS_ERR(prueth->pru0)) {
 			ret = PTR_ERR(prueth->pru0);
 			dev_err_probe(dev, ret, "unable to get PRU0");
-			goto put_pru;
+			goto put_eth;
 		}
 	}
 
@@ -1407,7 +1408,7 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 		if (IS_ERR(prueth->pru1)) {
 			ret = PTR_ERR(prueth->pru1);
 			dev_err_probe(dev, ret, "unable to get PRU1");
-			goto put_pru;
+			goto put_pru0;
 		}
 	}
 
@@ -1415,7 +1416,7 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 	if (IS_ERR(pruss)) {
 		ret = PTR_ERR(pruss);
 		dev_err(dev, "unable to get pruss handle\n");
-		goto put_pru;
+		goto put_pru1;
 	}
 	prueth->pruss = pruss;
 
@@ -1569,18 +1570,15 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 	}
 	pruss_put(prueth->pruss);
 
-put_pru:
-	if (eth1_node) {
-		if (prueth->pru1)
-			pru_rproc_put(prueth->pru1);
-		of_node_put(eth1_node);
-	}
-
-	if (eth0_node) {
-		if (prueth->pru0)
-			pru_rproc_put(prueth->pru0);
-		of_node_put(eth0_node);
-	}
+put_pru1:
+	if (eth1_node)
+		pru_rproc_put(prueth->pru1);
+put_pru0:
+	if (eth0_node)
+		pru_rproc_put(prueth->pru0);
+put_eth:
+	of_node_put(eth1_node);
+	of_node_put(eth0_node);
 
 	return ret;
 }
-- 
2.51.0

