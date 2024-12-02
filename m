Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762E91F9F76
	for <kernel-janitors@vger.kernel.org>; Mon,  2 Dec 2024 09:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733130450; cv=none; b=ND7Axk6HooDdFhUP3U/ksdadmVJZeUTUpW6M70O12ObhkjXyFHtq04fFdMfMMBHZZAnxFAMP1rMXw5tCru1/vmeiqukuY/CyeOsO07FHHRaSXKdqxGD8flPckb/478Sda6Z/QmsdloW7bUSteUwob1Hp28m9xDrH3cYt9Bgyahk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733130450; c=relaxed/simple;
	bh=eDatTayJdQZOiMDh398vW8A73/RB5IYaI7qGAmHkcV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U/wWUvqTO8JIrO2oRGaqiAUnw/WS1DMsJSuq30yCzJqGRnivEhJmsdAvvh7RbSg70Q3MbcZm+yK25HQPjgZWXseg+1n63S4rgHhwr+Gto4ozEbPsD1ie+EbhojcCaB9o0uyppRCtyC/Yj3Zn9mCkZL8Uq3eEeDNu/3zAW1ptvTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GjXKHDQK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GjXKHDQK"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-434aa222d96so50520725e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 02 Dec 2024 01:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733130447; x=1733735247; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BR7917va66KYfi/dxTW86XB5ZaenGMbVA2IyXvz+JIw=;
        b=GjXKHDQKQd5ZXfD05lLstT6GVkN4nM2KruJwqhgp6+QdzuLMAOJt4xcM9pkdoaB0Uh
         yelJU1omDuWAMXjn4+4RloQ5PAJkDnqB2WZivKcCcdCpGunmeeKdlRpk9N9FVSvk/LLj
         LYERcITvoR+pdxfSTAbSQhp5LLNh7F814tePm4iANAt+62NE7Kh0HXqzA8WV3WnEOEnE
         zIgXVM5iTH1j9JE+Ic0ovTuGMnTxRIM5S9Fr65fIaI/lIZQ7dtB2Q2NbhlcuqSQ1WWyR
         s8CwgJXzYUN+S3ZxggeHE5xGNrokVeou4RGRMVB+7LNebWSblGkCYFURQpM/oKE5MpiW
         ndKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733130447; x=1733735247;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BR7917va66KYfi/dxTW86XB5ZaenGMbVA2IyXvz+JIw=;
        b=AEszatLUzs2THwWXN5sSN9HaC2DDkTacdYEnqpKU85x6rq1FKOYOVDn7zzJW1M4o5A
         1HuN1KA8gsloeUdQSF7n1o9fCgT0iyIWNC6iMcaYkZM3Z40pkie4Fa9+CSskpDq5dxAg
         BJOWpB/bjzELpYhl5wUJllX/IpDprCM80DCo/0qUCn6RpFWvFgOdOTrS2ky87MHZmL2J
         9G81mDu9QQ7FOjbn1ZDJaHnYxgToFYhH+o6zcrCu8aaL2Z/0I37kXBQ170YOspq93lK0
         aExaexl135BW3xr8jh4zTJg/g2vDnhBK7LxqIix6LvhY7HBp1IAuS6A1Yp7UXXTSC3eS
         AB2w==
X-Forwarded-Encrypted: i=1; AJvYcCUkTjgsw3K9DF+RQyT4ojbbahw5J6rjI1O55bRbPaI70H+KOuotqEUdztTt3khM+d+roR2mcMbRP4any0y/NZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGqOCnOFjAqLauJk9kPBpBnRwAL41d5G4j0dc4gTZjm+RUeCiX
	FdZi3pqP4ZobBQ3RfjZjYSWSLIyqIg3BvuQWihDrsPqdjiWE0XjE63KC9Ii/OkM=
X-Gm-Gg: ASbGncs1A13xSBSrG3qj4WG7JDCrRQ0dw1M339SZGJLO7mK8QStvEGpVCMfrjJko8dw
	Wi2J3XNJlqVL9oqbR/MusY/AxuZtlJmafB7K9ywJj+UYdyI3nPkyghVjgCoogpuV68DS6VXnY1T
	D5EvrNhYL3zz/heSmRtTIXFq+AvDrHNjGvYQCAneVQQyjPmlcPGX26kAXlTKqpAgQKJil3sX0EU
	ueEcd6H3GINkCXuNfyy2IXg6OacnzPI8uOW+bTntNDdKbJnnYlDp7w=
X-Google-Smtp-Source: AGHT+IErHtjKyBNSf/XUWvWl1AoW/h4AU63KtH1xNYUNQzmKxpbD3bUa+ZybCCBWlQeaV0PJJSm5wQ==
X-Received: by 2002:a05:6000:156e:b0:385:f062:c2d4 with SMTP id ffacd0b85a97d-385f062c49emr4402219f8f.37.1733130446807;
        Mon, 02 Dec 2024 01:07:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa78120dsm175382645e9.24.2024.12.02.01.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 01:07:26 -0800 (PST)
Date: Mon, 2 Dec 2024 12:07:22 +0300
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
Subject: [PATCH v2] PCI: rockchip-ep: Fix error code in
 rockchip_pcie_ep_init_ob_mem()
Message-ID: <Z014ylYz_xrrgI4W@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Return -ENOMEM if pci_epc_mem_alloc_addr() fails.  Don't return success.

Fixes: 945648019466 ("PCI: rockchip-ep: Refactor rockchip_pcie_ep_probe() memory allocations")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
v2: Update the git hash for the Fixes tag because the tree was rebased I guess.

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

