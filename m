Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C539B1A727E
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Sep 2024 09:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727344253; cv=none; b=Mi7/nd9baNzZUZpkNfI+EfM8YEH3ID7gzZ/mCIJdukHNSybCW9YXCWiLa2PtZNqvSOoRqZZlAHmRAigYyJaKXRIbdURgwsrnN+68EafofpkfJs321nL5Ss9264R/Mk4nrbgdD6ZXPZikd9oU9yrtqD5pcDSF3sAXZBYIRTBA32A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727344253; c=relaxed/simple;
	bh=3cvkulumzJ6UdUrBeMHHDpezKdFQ0Akz+kdIuBNYxXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uUz8lue9SPs8+T38dF3O0+oQZeLIHMB8K4WJt0GDUcn1rLRLUzsaDA9gXByv/bar0DCoK/30+rATDwKRRmEO6nm5GU+X+tHPfJLXii7uCkij6ibxuwPiCcA/4jCm2qZAeUKGQT+YPTrSeibCIxH89IlU23TQhKJFyyfy94q9SpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qxd8tN66; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qxd8tN66"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cafda818aso7409355e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Sep 2024 02:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727344250; x=1727949050; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AiyN9NWxSHbtdh7dFvLb4E3Ssa1wgf9JiJ/fTzuLzmA=;
        b=Qxd8tN665nGhssp3zI9X6VQUF3IPVNAevegGHtgXdeuCgnS9J9UfFsIr3JFIGBYAN+
         PMMnGDiiSAGwxELvN8wBSrtSuQVSI10SfpUZuUOScylPLCCC8tEx1KR3QPyRv5Wq0e0E
         XkLaqyCJazOTKyYvyCEz+a/hJT1F7Up9Tdw/6t+l2Q5YCQnYkevyf6wEOVdhSJhvVbZe
         QCcOKGw5hdjRTt+Iiv0kICiFKyQpTMBkqhs2sIMhsJniqOq2w0nPzuHLKfnJhBZR3Jk5
         QC/8XRvST/3vykfmVD2TWp7X4KN8ixehRmFEdnf+kv5qhTqwfnkeLtEmFRDnopk//KHO
         HxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727344250; x=1727949050;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AiyN9NWxSHbtdh7dFvLb4E3Ssa1wgf9JiJ/fTzuLzmA=;
        b=I6+wK68Z2F+JV12O3JEDfCiN3NldORpHpl2XQo0CuoDquDHrrkpyl4ZQ7wMv42GZgm
         QsFFuUDG9g1PEoOvDvGwsxtnH4NLbwjCusOqnNdm3A0qTtXfqc3cY22nvzhHmgs1pA3F
         0p8eQA/zQ1jD8/yx9Wd4vPwrw1jDFLgTmEsX++5jubhM1Fm7FO5ip/wyHc+pKn5WNsEt
         leA5XzH6f/o+0VfI3n95nm3Ga0duYKGNKSnkfMz8AwLr1Ca9996716K3SIEDa58IsmUX
         cWjmOq9xNUzomrwGK8Xx73bbu1a6CjfNMiNnfydSfyLRdkbedFPseqk+gNdj8L3YMS/0
         Fb2A==
X-Forwarded-Encrypted: i=1; AJvYcCUXPj/l184NFgUesZrdqv9Eh0wfdXDiEazj9RHaVifRyzuHnVI57KOEbFMQWW8pfLJZQbbUqGDpFw9lCPF91Xo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw3iqSxsgh5GvlkFg1oG4yEvLFa4otozByfZM3HGzNxDlnm7zo
	uGS1fgFTAWpLIa0u/V5y2L9xgTqekU7CSZyIIn1S7+v/q5N2PvxMZFj/nuiSQ68=
X-Google-Smtp-Source: AGHT+IFCLIBXqKbOosYLGD7dpaW2Fa6+GR8VForuOcP/Zs87zlTaweE53g2UooMLElMqWLL8yLKfjg==
X-Received: by 2002:a05:600c:548e:b0:42c:b95c:65b7 with SMTP id 5b1f17b1804b1-42e9610c908mr41002805e9.8.1727344250067;
        Thu, 26 Sep 2024 02:50:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ddb85sm42060725e9.2.2024.09.26.02.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 02:50:49 -0700 (PDT)
Date: Thu, 26 Sep 2024 12:50:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Julien Panis <jpanis@baylibre.com>,
	Chintan Vankar <c-vankar@ti.com>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] net: ethernet: ti: am65-cpsw: Fix forever loop in
 cleanup code
Message-ID: <ae659b4e-a306-48ca-ac3c-110d64af5981@stanley.mountain>
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
---
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

