Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B6834CFA7
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732142; cv=none; b=AZDf/sRWpA2wbSgj6NVhw0C9KvEkxP/Z4lGngIoxNUoA2bTAuEC2Rqq4YL09LwdApGX75Few/LumfftvBuzuqDcVuTq2bAEsJjcvSm8mS/aUg0gedD80MdclfofH8CER0ijiWWedSb6XJ9OOPR6SsjKCzCHDkVbL1br7KEmodHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732142; c=relaxed/simple;
	bh=drNEbA3TGFTz25pvYcWW3qcdRYeCRjiFF+YwTp5NrEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K91gaQVneiGMLiZ73aA4mjoNpbZE+0UTBrz2rl+q4yWEmJZ8vdShdXA2XGML9dCAXjqcjRmiASh/YfhfUm1+29h7Gl4yNVD3uRLTwfpKGIxRHCkDaxguv8fcKaUyvjlhx7JB6rOtHO2FvArOp5WhnBAlsdxpo8qPLfQZL9IxkQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bgza6aNi; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bgza6aNi"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b2a0c18caso1316270f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 05:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763732139; x=1764336939; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qf7aj+yc10CQJFCUa9U/IQT8bJQVst3NQGAAJzT7Ug8=;
        b=bgza6aNiKjTKHTmhAnHTBMa7gight++KoqJE4Mn2VeUMqsbsDSilaTiXltJJ6MjTkF
         gxlLecbECbo4+NiMcX9SWoRrD+XtwrJBPYpzaQOthC357sYCUKRClqaRXl7wWIHO88Gl
         zBgdNd/WplYLS4XsK7mbWCG3yDIrcinAksWIMZCKGQuaUrdjUmlVd349i5qyt7t0P7zH
         gDYoqFBeJTrFSZI1g566VXxanzbgn8h7wWI/uiz1TrXMZv8EoFlsRoGZG3lTF59zz43s
         8qiSmMwXll3XGXEAlz4YIxtpd1c85d19yCGxgKC5oD9cWSTrZ1sfG0+fgoyxOzHJOftY
         EOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763732139; x=1764336939;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qf7aj+yc10CQJFCUa9U/IQT8bJQVst3NQGAAJzT7Ug8=;
        b=Aajh52MQGP4S06WhxpBEWP5k4IAub4M4EKPd/oDD7GilP6+Fz6wmTz+BDESMMBzppx
         R7gCL8+njETIU9y2xdVMWXsb/vX6L0AqhE8rQ2z3gdp9QF+h5zHuF/PxG3x8RQDfW7qb
         tq6q6kFbdKA7t0cn4s39bv2JssS2YwnT9AiiMecTAEVkmDoYfThTbF80cj53M70f/5jK
         kVN73PMSUYi0iHnNbZIHU7EkRI/Xjxn1RgtWfqHv3eBAszYAu/2YZVVn0OOHSVNyo2CK
         uTCNFdkXq/gPb1eJM+81inWXiqa0sqNrWB6uScH5EEgCg4xi8WwHCvfRt9mJ3Je24qwZ
         hgJA==
X-Forwarded-Encrypted: i=1; AJvYcCVti/chpSjUKtftWSz4Vp15T7fuG42Pp8lCtk5CEE4rXpVqG1+CjmxzSrKdM+VE3lcCj9gGPy/11ISPMGsQuH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdK6N6+SKdboj15LVSjA+MtBvLhUJEF2TFHz0Xg8VKCV+ycJL4
	6FbGBADa1hG2elDmfI2z5oXpNkHZwC5pcfDG74qskBGcHGZkB3NjPHzlVAlR4wl15dM=
X-Gm-Gg: ASbGncvBABQd5rLytO8aDlGjCpeuePUPtmD4eKDyQu4R9QhSm6kwHLdTIg6IIQgOKY2
	dzsfCSxIt3gJmjPU7v+GDqTg2Hr5B61q64uJLvySmY471ZT57sHrnoEvobPIpx0acO1+SYh4jR9
	YgSHjqej+qmpjX+UiA2KeEjT1bEK88yyGnTmzZ9mipVlrEnMS/0UK6FHjt+oqWipsoXOC3GtnjS
	EhLV0DLo4661leXN/cEj6U4wibujvH0qyDRvcBwvEcU1UvNeDTSzCnzkpo2jHMzVhS8L+L2N3Co
	CtLPQjckDAxeF9iFUoMQ2/VYsmKn2+kfj/REyVI87bqGsZCRWn1EtFBqFPEWz8aUkajUTHmXBqm
	f79miHhn3shO9RAmSz4pzb3Xn+PtautzSI6M5naQhlM8LM+3QCYkyeBcfHFglyS2IHENRtYiOLH
	nGT0ZunGY1yxm+y7O3
X-Google-Smtp-Source: AGHT+IFMJQ1wANIBmqRUOFCIS/jFxvbxo35wZufea9yE3HbGd15lQ3zQbTa6IMYdQDLdKJljttL+tg==
X-Received: by 2002:a05:6000:4012:b0:428:5673:11e0 with SMTP id ffacd0b85a97d-42cc1d1999dmr2595402f8f.40.1763732138738;
        Fri, 21 Nov 2025 05:35:38 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7fa41d2sm10902508f8f.22.2025.11.21.05.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:35:38 -0800 (PST)
Date: Fri, 21 Nov 2025 16:35:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hans Zhang <hans.zhang@cixtech.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] PCI: sky1: Fix error codes in sky1_pcie_resource_get()
Message-ID: <aSBqp0cglr-Sc8na@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return negative -ENODEV instead of positive ENODEV.

Fixes: 25b3feb70d64 ("PCI: sky1: Add PCIe host support for CIX Sky1")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pci/controller/cadence/pci-sky1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-sky1.c b/drivers/pci/controller/cadence/pci-sky1.c
index 99a1f3fae1b3..d8c216dc120d 100644
--- a/drivers/pci/controller/cadence/pci-sky1.c
+++ b/drivers/pci/controller/cadence/pci-sky1.c
@@ -65,7 +65,7 @@ static int sky1_pcie_resource_get(struct platform_device *pdev,
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
 	if (!res)
-		return dev_err_probe(dev, ENODEV, "unable to get \"cfg\" resource\n");
+		return dev_err_probe(dev, -ENODEV, "unable to get \"cfg\" resource\n");
 	pcie->cfg_res = res;
 
 	base = devm_platform_ioremap_resource_byname(pdev, "rcsu_strap");
@@ -82,7 +82,7 @@ static int sky1_pcie_resource_get(struct platform_device *pdev,
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "msg");
 	if (!res)
-		return dev_err_probe(dev, ENODEV, "unable to get \"msg\" resource\n");
+		return dev_err_probe(dev, -ENODEV, "unable to get \"msg\" resource\n");
 	pcie->msg_res = res;
 	pcie->msg_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(pcie->msg_base)) {
-- 
2.51.0

