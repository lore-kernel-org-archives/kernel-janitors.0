Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AE2274B5A
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 23:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752620476; cv=none; b=sQr7C8T+iHx097Oe7zlGEYEaMkg8w8AC2KGoZhX9qo0pK1dnMrUdULjvFe/lEhsSYbdt2dK+tvdmUQwmWA5DVA9k1lGPur3EynScrrymQoqfXuA5lvCzN7hQg1AkICsX89LtsTOkyKumnMiCMXa6VpLEF6v9sc4OQ7ZJhBFlL1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752620476; c=relaxed/simple;
	bh=u3Mpdz2pmtyGUWJnzrCAlKzTsLeej4d/Sc2BmFxp/a0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i4kxtpRaaiG0JdcyG9DkxJxZmQXn9ibMvQls9qiJcV0GTdgBIcgVnHpytbbl7rP0f9gJdt46jYtwBPDVmrKDVN9WcEgUPfAha4g45FmnJlpP4czklpxocLTx4qsN2JvykTJ91xWntvb3bqCCuSw9/g56zbbJpoPJ2+/SRKEdnEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NTcHzCPh; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NTcHzCPh"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2d09d495c6cso2203453fac.3
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 16:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620473; x=1753225273; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HMxhWC+6DIUyTBowpY7tH1U7/VAQSY6aI1DyTbhk/6w=;
        b=NTcHzCPh/zGWicsn0r5425ojf/BhrwXqmJXOTQC5BA6rcF+l1iCtyLhHpYBM78IQGJ
         6Lndy/90f54PSSGAR17B+0sUcqtN8eiwTmUGEleJkVXGQv0Q/qDEiqcwyp1bziAhU4SD
         icTLRbKr3SoouFIFb9lXpE7xnB1ADBv5IlgbJfYcQrCZLlrsfOGnJrYl9pudfGJJZwXV
         6VP/POt7aClBHDBOaoQREtc9dVYqtyP7gTUzDGAdisl6ymeOkZo9raj0FRbTqZ9Nxdl4
         ugN2FHzUOYX9zdo2YeeePFbHI2Uh31JDRjSc5nHgHOnsg77+TbSggJxXFnJH+4HG1Y5u
         wq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620473; x=1753225273;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HMxhWC+6DIUyTBowpY7tH1U7/VAQSY6aI1DyTbhk/6w=;
        b=NNWKi0xe1yLsngN0YQV59BFkWJCV65WCv+ufrUc/b97jY/B8iYlMcV2Q1tJbLhkNzD
         H6/CCFM3EP0HxZ3JPtDKcrRQ2aqP4SoIiN8feDJ5KodGIN+eRQRuYfVOW7gJVJXF42uj
         rAQmXnMi4ESx9Tun6ypXQgyPv/te9qQUd9R1SCPZsSxkSbEG461XLHfwPFWOZKy6NRUD
         a7se8dq3x7RdwJt+RvGyBLeF0OEjqdSkS+EcFupQB1aqyzRgO2RkUxg/6DfVOXWOnX6a
         aghoOmB2VPTIKnxgLAQgP7b2N62fCULo6nkV1o38djFup6cOzfHOQRhTGX06eAUcM0CV
         HEJA==
X-Forwarded-Encrypted: i=1; AJvYcCV/rUSsSVrUN91S8MlgsnhkDJVkfyq4pDmSDA+pBK9ayuwZneyOqiB7Q5Dhpa70oa8YTrNgTUjFzWR2vR9Yofc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjz1gqcgGUgLBGYicSzMrRK22DUPPjJJmokCvoC/+b/SasR3gQ
	27wxk9MYQcgMosJhV0TCCWJZwgiFKgOo41PBIQY0DNecqZ6ir6mILrtam9BWfRpMRrw=
X-Gm-Gg: ASbGncsebL3mEpZ92ilzhUnnJgbZiEh03vy0daUW0cysRUj4pTQO1ulY0ahp332Z+fE
	8tImRDme5jWoAYtlK4mIgC09fd4gYpLQQQ6Gg0skDVqTtQe/tBBNPUiwpH0ZgeQGOjhq1pMiEEG
	gRgmHBG2iGxTbqduzTNihPJu/2NMUK1tyL2t0WOYGNwHeis51IidhGDffiwBj1mP1SMJqsPmnEW
	v/vX3xyaAmbOa5xfXE9xwkuTg/ZwHiMgSCtW3JymvjpXI8HpcwqwSj8epvEboR98WYUxB2OqRNX
	nYEIS619OClBFN4Abq6xLl4UovRoUvieqqAmmOUc7F4DI2RrK/RdcUX95Qo7ged18NLdx1gWmj6
	T8komYHJt88GFRygU4cRjE3ZLk9jO
X-Google-Smtp-Source: AGHT+IEls5whNRzvN01o90WxbCX3ovBdPRxqs7+TUz1Rw8UbE0E1ggiOCz+d99TGSZRB8SxM8NuTEg==
X-Received: by 2002:a05:6870:d0c2:b0:2e8:eccb:fe1c with SMTP id 586e51a60fabf-2ffb24ae8c1mr586050fac.31.1752620472817;
        Tue, 15 Jul 2025 16:01:12 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ff11686cc3sm2964968fac.27.2025.07.15.16.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 16:01:11 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:01:10 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: airoha: Fix a NULL vs IS_ERR() bug in
 airoha_npu_run_firmware()
Message-ID: <fc6d194e-6bf5-49ca-bc77-3fdfda62c434@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_ioremap_resource() function returns error pointers.  It never
returns NULL.  Update the check to match.

Fixes: e27dba1951ce ("net: Use of_reserved_mem_region_to_resource{_byname}() for "memory-region"")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 4e8deb87f751..5b0f66e9cdae 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -179,8 +179,8 @@ static int airoha_npu_run_firmware(struct device *dev, void __iomem *base,
 	}
 
 	addr = devm_ioremap_resource(dev, res);
-	if (!addr) {
-		ret = -ENOMEM;
+	if (IS_ERR(addr)) {
+		ret = PTR_ERR(addr);
 		goto out;
 	}
 
-- 
2.47.2

