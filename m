Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6A71547FF
	for <kernel-janitors@vger.kernel.org>; Sat, 30 Nov 2024 10:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732960880; cv=none; b=Un4ybVN1IJBbKgXZ/gIIK2roSXH3/ARDn1sbth6Az6Mf0kZnbiBLQBbUf60xvJVq5zqGy4ab0cVkSbPpNG1RA5vuoRP21cfyYzoU1oDE3BWlxV3GzcODPcqCFjhdYEehbYxMz+pBAydI3adTX02pozyTgyVY62jqYB5LjyfUpbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732960880; c=relaxed/simple;
	bh=pwCVrSo2d63QozkbYlTrgoal5OaXwx+yCaGWKkdfnss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TGR4pDt6lyNukl1prsVwgZf/0C58yvRXabtrlx9xpnR+5GWEFCdwn7D12W7shSQeeihL2uxLt/YqddTWafHuXQZNxK0YkQ12A4r9kSPSzgNvTO7IqEb9D4JSV6ARjcp4m+V0q2AbQ1Tmr/hFGuixkIUxWm9f0NdnHXvYHq8B7fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xJDwtJWJ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xJDwtJWJ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aaddeso3154421a12.2
        for <kernel-janitors@vger.kernel.org>; Sat, 30 Nov 2024 02:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732960877; x=1733565677; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aK0dV1gfejvgX5AVRAv0AO9jA2ssYUcI54wSBwP2RLM=;
        b=xJDwtJWJ5nVVYoF8BeAwKwPx19hTzgGsYMyVveS/HUx/+9EhIYH5A/O1785udRsVQe
         AMUgPTTC8wFIg11nGNEPm29CLucQOHlZWF6CaserezMgX9bMvWBoUoNCcldIi2m3Sxva
         s0Vlif+LVIFuiamCOKtOPO9u37LmTIiu8HPte1A86ZgQPtVPjyuHvBoTZck3cOYfh5As
         PowTScUTXytEOhD9GNC5CXfPs9AyhTbFsvMk1jbHGg/deDV0MhhNEYpziiF09MSb6B7s
         Mx823j+dqBIkBVwLJfwWlAAC210nBtQWZy1IewM3Z4sXY2vg9CsvPZ/spqHsV+rx+CXl
         WkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732960877; x=1733565677;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aK0dV1gfejvgX5AVRAv0AO9jA2ssYUcI54wSBwP2RLM=;
        b=EaB8zmWLkEwvjPHIopKFiL17TjJaSYuw63xmi+HwyZf+pQOoEmtzvGFwn+olmCq0xk
         qh11rbg0OFR/JFEKX8VcF02BKcMhqUQYqKqMpkGeqNbNRGuHyYQDGNbe+Mo5NKLrcCgd
         lHkvnHHiQ7O3ZENw8mZ8Yfg2zoilEsTuVY9IROqsG60gye/LFVwZxWLjQTYuzIwDIc4C
         NeK34l3ljgLhGmu1Wi86Qe5u0PI2HmJd6WHpEyXMa3ZpR4niEYNDHJiReWA0QXTHKccW
         LLzag07TB85wN+m481YMs93Qc4WEPqryHXyrklYX1mYE5hkV8NRt0sjQxG+cx6au0wsc
         78vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCg+FTY/rDAt9Z12UqrB/mi4QyaIauYyvemNZQbUMdt4/WVT/p3X9RLUeFGEGKQCLVvhGIowwRpaE5iZ10Q2k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2hEg94+NLh7imJ4KnpRb7pQGknmFdiuXPVAGEJZPGWDOMf3YZ
	G2u/Vxbdn6n28liWZN3bE7A5Sk8abfGDGRTms02RxjkGpJeJXESRvsieLxImyQI=
X-Gm-Gg: ASbGncurBYjaZmfn0a01EeO9FoUXq8kg1wrZ+c5ZSA1NjYznwaHDJdgv2Hfcxra7xa2
	op7Xv4usVcJyFK2uiwcAtmcld6MTO0Q04UQZ897avvualV6SptxNve9VJ2A+kMADcHwA759hZzM
	6EkbjYd2gFUiBjvKb3gAjRnMfTv96XodWbV2nNXBc8fdep2CdrcJbZe+33GLV/IlyrPkmmwim+H
	fC7fr4pRflzKVdxm3v6Ld7BVHhl9n2y3kztxMc9ZWb89OfnG+wqSRciAO40UhQcs3Bb91Oz
X-Google-Smtp-Source: AGHT+IEtv6gd869K+dRtqKZE6OGZWNVbaOzagbrsUDx5xx6VOeUmeXvzJOk8eFEsMgnWDlwVcluldw==
X-Received: by 2002:a05:6402:2116:b0:5cf:e3cf:38af with SMTP id 4fb4d7f45d1cf-5d080b8d46fmr14459310a12.2.1732960876730;
        Sat, 30 Nov 2024 02:01:16 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097d9f5fdsm2670060a12.15.2024.11.30.02.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 02:01:16 -0800 (PST)
Date: Sat, 30 Nov 2024 13:01:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] PCI: rockchip-ep: Fix error code in
 rockchip_pcie_ep_init_ob_mem()
Message-ID: <8b0fefdf-0e5b-42bb-b1ee-ccdddd13856d@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -ENOMEM if pci_epc_mem_alloc_addr() fails.  Don't return success.

Fixes: c35a85126116 ("PCI: rockchip-ep: Refactor rockchip_pcie_ep_probe() memory allocations")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pci/controller/pcie-rockchip-ep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-rockchip-ep.c b/drivers/pci/controller/pcie-rockchip-ep.c
index 1064b7b06cef..34162ca14093 100644
--- a/drivers/pci/controller/pcie-rockchip-ep.c
+++ b/drivers/pci/controller/pcie-rockchip-ep.c
@@ -784,6 +784,7 @@ static int rockchip_pcie_ep_init_ob_mem(struct rockchip_pcie_ep *ep)
 						  SZ_1M);
 	if (!ep->irq_cpu_addr) {
 		dev_err(dev, "failed to reserve memory space for MSI\n");
+		err = -ENOMEM;
 		goto err_epc_mem_exit;
 	}
 
-- 
2.45.2

