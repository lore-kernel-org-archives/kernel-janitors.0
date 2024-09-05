Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A54189509
	for <kernel-janitors@vger.kernel.org>; Thu,  5 Sep 2024 06:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725516868; cv=none; b=M0L5aiHrEY4Pcs0+SqscNlcpHRFyhUpfvYuFxkY5R9qYTDs/4gSNnQGlpC9mEpvlQbODGZuzlwdrbZF4Bhr8Az4mRcov0jI4iS7c/uD36dxLehkUGv1nGlqAW1+sp2nH++fXWwXk2G79lIUINDAsZ7tSlcA4Hzw2gxg6+S8cft0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725516868; c=relaxed/simple;
	bh=GfDRxqeaMtq3PWS6iZRqG8YKYpdk8GQd93tVDpaB1ug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sZRZsN+EB3f2X6uenw9tc1FUKbOkOUuzTZAXTxsU0xnYz/HlHCp+uy6vxgX34rT7aNKXXZYarP1oRLNSwCUuJ832CWexat2tjRJQSuyLLuirrLpfdJsB8DQcD1sm5nTJoe7yPWjUXlTLvp38HcYLdER8KccC8UL+Y3PpMvoY394=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rnShDLbB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rnShDLbB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso2392025e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 04 Sep 2024 23:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725516865; x=1726121665; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/Lxt8VqGrytVzBL5XseBoCNcLc6CIjxkLw5rUMc2sk=;
        b=rnShDLbBKm5bVRm7oDk+rA4UmSMSjAV4gs41cmpKh98yuDeYlwVTbDZjUVlJgQZrRS
         LINeNk7HWKTDpRNJHqGhnAwZphkP8EjwnawXK9nz0IQNxOmQ/498T52rbqInwgwE5F9p
         xNN6ruWpSyho/+WfK9vE75YYzVi+lJlGI0kStoYG0wbE8vaKKq70VCpePRQm/Ba6NRz9
         64gURkWPPZHDwJBGI7XIvWaMRSgJ2+FFrdQ2yKe7kBc3lBOpm/pwnjL9FNY4PezZ9bWt
         JRQ5ajMudrV35M3Kwpds01Se9V13MepKwLxQ706XjHRco8sVAvbAuBXgyDJkAD60t395
         zNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725516865; x=1726121665;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/Lxt8VqGrytVzBL5XseBoCNcLc6CIjxkLw5rUMc2sk=;
        b=QWDdKGvOpQPAJ4hnaxtUfra+aLsmoFJqX+1jqnextBZ6Uu1DSDxnQbuE0ydvV2iuY5
         1STCzp0zq4M+D7twzgNP0vaaC972a5yAYSauESDr5JIvKVf7saasBtowxC6rro8t9YDv
         hoDPYOL/DRt+z1VNlFiPdnJGdEz8CoiqQqLuT878JDOkk4J6JAawImBfCV+OhB6HfYAy
         nzpNBmbiNNSbwBhoTX9xQuiPWucylrBmQVGid6OVxaq3bWpIS1ykF8UvHkvNGrnhWsxL
         WDfYTS4MZ9PXGjE+K+1eQ/ryy3N2qQiNf+6x4UazxQW87jd6yXhKjQpSyDAtnJjILE1r
         Kh1g==
X-Forwarded-Encrypted: i=1; AJvYcCVr3/84zYYiY2MUVVNwp2Xy0Z/BR7w18fuIMnAlv49aOBAFpRLZett/ljyXRPOP3KpKX8FqPuZV0a9Y1CpqJbc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt8AUv+maPE0SAv8UCYF0i7qbJ+fz0pWodJrMaLJldA4ldmw+o
	S9+9oW82WseTgw7mQihRC8wd8820AeStss2KjemYdgG5a1uSZwjn0rQEDZ/wt1c=
X-Google-Smtp-Source: AGHT+IGDfAHsx+JoAeRrK+WA1/YGuEyP9t4liu0cEB3n/KIEB1lXwv4i3jF2DMP4kKQptzdBSaQPJw==
X-Received: by 2002:a05:600c:1d19:b0:427:ab29:30cf with SMTP id 5b1f17b1804b1-42c8de5f599mr51096585e9.4.1725516864975;
        Wed, 04 Sep 2024 23:14:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df79b6sm222034195e9.22.2024.09.04.23.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 23:14:24 -0700 (PDT)
Date: Thu, 5 Sep 2024 09:14:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Jacob Keller <jacob.e.keller@intel.com>, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: ftgmac100: Fix potential NULL dereference in
 error handling
Message-ID: <3f196da5-2c1a-4f94-9ced-35d302c1a2b9@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We might not have a phy so we need to check for NULL before calling
phy_stop(netdev->phydev) or it could lead to an Oops.

Fixes: e24a6c874601 ("net: ftgmac100: Get link speed and duplex for NC-SI")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index f3cc14cc757d..0e873e6f60d6 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1565,7 +1565,8 @@ static int ftgmac100_open(struct net_device *netdev)
 	return 0;
 
 err_ncsi:
-	phy_stop(netdev->phydev);
+	if (netdev->phydev)
+		phy_stop(netdev->phydev);
 	napi_disable(&priv->napi);
 	netif_stop_queue(netdev);
 err_alloc:
-- 
2.45.2

