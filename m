Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB12C125B9
	for <kernel-janitors@vger.kernel.org>; Sat, 28 Sep 2024 10:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727517849; cv=none; b=D3112B5/eTXuqGME/W+J4iTieMt4AVS4EhNvO1Vr0SqVL7zyzhS0qbCBopn9+lAiFE5I9RBfOHdRz9oeryKzrYanx7X7+e1q0hmowHTHqo3FyGwi+aMxjbyVuXotY5vC9Jl8aQlJOYmABSTtC9YMoDTyIpGUaai+2UAITpKB5FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727517849; c=relaxed/simple;
	bh=4+1mwT5zLcDgrEjzOfG3P87kf1xwTT+nnr6GaCcnKBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G+cKORTDDeogSt3cQ2mWL7usInqQNKsjZN3k56PVkbBrVwHdADljkpaU5h9npLqUteX73j7HZXEecblQRNwJ3j6bZRz46QvBQqKVujUOKjj6wPYHLaYUwmOzt3sHR4N2RsePQKTmCiViig2Z5N9aZDy2GbOrfNTODQmPlk87gB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z59+6Mbn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z59+6Mbn"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cbc38a997so17726465e9.1
        for <kernel-janitors@vger.kernel.org>; Sat, 28 Sep 2024 03:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727517845; x=1728122645; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BtK7Ih0GNRwfLjqmfDTPx6+2O4u4ad9cD8UabTfETxE=;
        b=z59+6Mbn0z12d0b6sfK3VujYXpDl+fAONeq6/3sRkzxfclJOo0YdqcHN8qMLffwNIb
         nOnmj6tC1TN3jdRd0Mt6ATBTD5+sThmB0Y7lCFzUCOG0MxmHr2qRWO60kEiJNcvkDFos
         kjkW3K+K+Zr+j7c+sehw0q3cjzcsIEGMSmU7d1z7s/CIw9+70XtdxssTUjo4vbJ2Z0J7
         LAwg8sR67A5wyIOKgiNGMifq4ezv4IZ91S6Cd1I+yl93ekw4Wa/Md0ki/5AqTZCd47CQ
         ut0H0gO9AC5Wi+SNqMq6gopKeTUt4GDUHgrCwWUHvUK+bA6ESBvM1F6ptLfXtgLxHwmM
         JV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727517845; x=1728122645;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BtK7Ih0GNRwfLjqmfDTPx6+2O4u4ad9cD8UabTfETxE=;
        b=cy+gXUVUxaYScpbrvVpVSp6W3UbKY5RHA1lgooj22nXPK0ICpzMk0IAGvtzhsUxaTs
         JgiMC6IOtlcZPe6idoc/E59mhBAojUL4W7odT9kSczAFSCHBoXNca+lgoJ9Apko0XjYy
         MEYkNuNuDSbHFP2OTvbotpo2LNsy3Zd3hS+zugIcD2HdJipbMVVVze2fmmARZgfYCfGt
         roDKS5E3Id8BVaPibMU0osqedoh9hQtoKW3h+boijI5l2RmHA++YhAe7FlceJMatSCEs
         HQNEtXJHt9kedA+Rkz9gaf1AFyV+l9MdpNrIL3Rp8pGo8GY04q0Mh0P7nwa3A0P43AFD
         41sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBO4Wv9DqPI1i6EyhQNssTBAcQnU9nt8Ks4a4e6EcdnLnDLBfbk4ie95c4pETfXy9F0P6VQk+b1JBZreQjaII=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/AHBKCvTx3NrhJv50HF/nNZaVTt9zZD0mdtpQz3On2nvlK9AG
	x+iB4dRI8dW6mOHpc5jmXIcBlYLCKG12VM0PRwSo/yr1yaBlb6ra+P/84l+h7Pc=
X-Google-Smtp-Source: AGHT+IFU0bjRjLrQLfM0b06xv21LP9ly86RjBkJWZbMkiF/UDbns48K3HU5bwc/Yb08Uix53u3u4mg==
X-Received: by 2002:a05:600c:1d08:b0:42c:b697:a62c with SMTP id 5b1f17b1804b1-42f521ce1a4mr63768475e9.5.1727517845154;
        Sat, 28 Sep 2024 03:04:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ddb4csm97336095e9.6.2024.09.28.03.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 03:04:04 -0700 (PDT)
Date: Sat, 28 Sep 2024 13:04:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Julien Panis <jpanis@baylibre.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Chintan Vankar <c-vankar@ti.com>, Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2 net] net: ethernet: ti: am65-cpsw: Fix forever loop in
 cleanup code
Message-ID: <8e7960cc-415d-48d7-99ce-f623022ec7b5@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This error handling has a typo.  It should i++ instead of i--.  In the
original code the error handling will loop until it crashes.

Fixes: da70d184a8c3 ("net: ethernet: ti: am65-cpsw: Introduce multi queue Rx")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Reviewed-by: Roger Quadros <rogerq@kernel.org>
---
v2: The first version of this patch had white space corruption and didn't apply.

 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index cbe99017cbfa..d253727b160f 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -763,7 +763,7 @@ static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
 	k3_udma_glue_disable_rx_chn(rx_chn->rx_chn);
 
 fail_rx:
-	for (i = 0; i < common->rx_ch_num_flows; i--)
+	for (i = 0; i < common->rx_ch_num_flows; i++)
 		k3_udma_glue_reset_rx_chn(rx_chn->rx_chn, i, &rx_chn->flows[i],
 					  am65_cpsw_nuss_rx_cleanup, 0);
 
-- 
2.45.2

