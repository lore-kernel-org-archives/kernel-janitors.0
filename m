Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A1113D50C
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Apr 2024 16:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713888932; cv=none; b=skCQHIrmmSmUt3GwmNErhthDXqVaiUZjmeTwyzW2lo83cUVGGAmI+jW9Zp7tD1U6kOH2ZdIWja/lolj0G1BkanOuYJJmuJPASnPtGPoa4SzvjxsoSDSQppO/hqhGnct8HZaXIwsk4Nev2DdlIP5XPrG+vXkYkRQdF4s8Fp5aIms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713888932; c=relaxed/simple;
	bh=S6u7TUoJndgs324GM/4c0tBOIKnsQDEABUMIoYBWjzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g7X33Ag5uzre4b4WIKBbqklSjQ7nAFpcdavhWlmTuwbGe3+08wtfOFNiYTNrqtsnqd6xvYqZdGX1ie5eTF7kdonQySN9qhaM6+XgehbJLQPpZjpM3WCyyrfadkfMibNttatN/KDgs88RKqUI5yUhMDv+t56uEYUo4WQHSc29NaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q6QAKhK+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q6QAKhK+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41a72f3a20dso16204635e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Apr 2024 09:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713888927; x=1714493727; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aGBFoVzf1KRLH5Odstgg3LFS1yioFZbFNqqfkb5RbTI=;
        b=q6QAKhK+suqIeUVbwTs5vvV8tE1uD+3tZyxcwblAXMJxMp1v6+wwrrJQyOqdD207iH
         5nVeh2vlW8oYtoayriywLaphxpJYEDNx923bMnGl9Imf6BUblx+5304qvHa+8YF0Y6J9
         dLE0AfrNnOQSQLmMhrataigZHfp38/a+EH8r8yAlJ6OzkD4GEw3MZ6rLWCf7A9LK3TRG
         aScm6j9g50S4UkMpucRiD9g4a/FiZUM5iQW9e4vq0Dv+eHVvapQZJH7p0jv/GNu5I6RX
         TgSb6SZRP9OK5AU0sABE6p8PQWaOzwV8J6hRjcwgJjA+ZFJXLazB+gKlAZOZppl+NvYZ
         1CAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713888927; x=1714493727;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aGBFoVzf1KRLH5Odstgg3LFS1yioFZbFNqqfkb5RbTI=;
        b=pDCK9CvUkVIU6Zm8WmH/7QIBJuwQKBT3dIi/0kuCIrUbUhzjs2S0kiU7CZ4ZdE4863
         wNP9Ld6cfPBTDArpmUjRCV5LYFolDsoR5a9OThpz5DuNCgaIz7u1EFM6Yc2Vcn/GEntb
         hP899pZVMnWaLS0EDV9Z9urEgnEqFnbcv37mvIwTEmvlalC1sZyQNyAX/95G06D8trU1
         DK94cVga7J6vyNxJOT31Ez1pA75WflQHmcfV0pi1a3nr1s7+xzc15AXk2XXPfJswoYWp
         EZEBQnkjsLfSht2OCYVrqdkXPe8aYf/uxUQ2YyNqvWwpU+DGmMUtgqTyGTzRzff/nyMW
         dsew==
X-Forwarded-Encrypted: i=1; AJvYcCVi4flCCnkHgMuMmf9Usd/5npjQ+FIiEzZopYFhSLrKVvQRxXdo5StcR/yF1wMwBNeikYbxQ7RoI74LPv1saxClnBAnsKj0+5eAT2VPhjmV
X-Gm-Message-State: AOJu0YyARvphBMFU9JSDhw8YaV2b+XBnc8DiRePzdhMpOj2xaOMu28QC
	8Debe83gLNXNuEpgL+60ME7BqBpxdWFciOGt4O2usoNJZPzjwMlwnke7IpHYYeg=
X-Google-Smtp-Source: AGHT+IE0GJcrYh2uj7iVpjzuFMPPNn/sVzz8Si2u+zGBXWE4Gnyuc9CrWVmaNdxpA3mmLcqKuzOVcA==
X-Received: by 2002:a05:600c:474a:b0:41a:a298:2369 with SMTP id w10-20020a05600c474a00b0041aa2982369mr1951245wmo.11.1713888927099;
        Tue, 23 Apr 2024 09:15:27 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id t13-20020a05600c198d00b00417da22df18sm24349591wmq.9.2024.04.23.09.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 09:15:26 -0700 (PDT)
Date: Tue, 23 Apr 2024 19:15:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Roger Quadros <rogerq@ti.com>
Cc: MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, Jan Kiszka <jan.kiszka@siemens.com>,
	Diogo Ivo <diogo.ivo@siemens.com>, Rob Herring <robh@kernel.org>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] net: ti: icssg-prueth: Fix signedness bug in
 prueth_init_rx_chns()
Message-ID: <05282415-e7f4-42f3-99f8-32fde8f30936@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The rx_chn->irq[] array is unsigned int but it should be signed for the
error handling to work.  Also if k3_udma_glue_rx_get_irq() returns zero
then we should return -ENXIO instead of success.

Fixes: 128d5874c082 ("net: ti: icssg-prueth: Add ICSSG ethernet driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I had previously fixed the issues with the tx_chns() version of this but
I didn't realize there was an rx version.  These functions got moved
around in net-next so that's why I noticed this bug...  Moving the
code around makes applying this to net-next kind of pain.

 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index cf7b73f8f450..b69af69a1ccd 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -421,12 +421,14 @@ static int prueth_init_rx_chns(struct prueth_emac *emac,
 		if (!i)
 			fdqring_id = k3_udma_glue_rx_flow_get_fdq_id(rx_chn->rx_chn,
 								     i);
-		rx_chn->irq[i] = k3_udma_glue_rx_get_irq(rx_chn->rx_chn, i);
-		if (rx_chn->irq[i] <= 0) {
-			ret = rx_chn->irq[i];
+		ret = k3_udma_glue_rx_get_irq(rx_chn->rx_chn, i);
+		if (ret <= 0) {
+			if (!ret)
+				ret = -ENXIO;
 			netdev_err(ndev, "Failed to get rx dma irq");
 			goto fail;
 		}
+		rx_chn->irq[i] = ret;
 	}
 
 	return 0;
-- 
2.43.0

