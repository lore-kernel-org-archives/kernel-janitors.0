Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F571CD0C
	for <kernel-janitors@vger.kernel.org>; Fri, 26 Jan 2024 08:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706258446; cv=none; b=o6dH5/jc96InDgHywGwLMI5sz+lyzML1F9tDOG10tiWpXVjED3HiYOL9QSECxOeJnAsAXx4kUdzZqTDAEkEjNwrLH7+Z9RT6VT2kk/r/rakAd6ym+LI8m3Iuugu2c3W3f1ACZ1XmIrIV5OKo4L1iKA+Uql7BYok4qx/QzjcE2UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706258446; c=relaxed/simple;
	bh=HdOkxYHBGdOriH1GG4cA3n+x/WczKYLs05GJtHkGUu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S8ifPxzNKZ4rbnzd8HYeS/JAcZO6B+BGvgYSEi0R5I5hkZN5MpHKTOyo8h+UELI4edEtf5dZqbtCmtKehxZ0JiWXe6fgRFwxm/UH8fKJ56861QerIzxWuUGx0zVahdzTumg4YS7ybXwHVkxENaj8BkfB4a0KF9HWRVuWaF1CzHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YnwjDeMZ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YnwjDeMZ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-337d99f9cdfso197139f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Jan 2024 00:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706258442; x=1706863242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EM7me6hr0DgfYBqYZ1m5/5Y61fSb6nrf7rD27pa9FgQ=;
        b=YnwjDeMZv3BaKmVcvXYhajTfyPBqBOHwdefKPMdptCwayOJ0v4G2bg5DzjglXRHd0A
         btCfEYpP+g9HhCMC9n0oS1aMhXuQZJaiJs5QMmJAegVoaHL+KqvifGgyCgJrnMxPjUyh
         oFC5SnSyIYGEsxdaszRRTKivYG3flJ/gKnfrODIuRwBHbJ/VuSsW7epfAH7qpvKM7Hjb
         hxW/WVj1zBCN1fPim8YQFYCHh5GahCW+wQLEHmHhLrh2tbMLBTSTF4XqgZH7QcV3t2ed
         /f6PHul8tuZQd6W4C9S+ogwrOFYXXY7AZCpZMT8DcyMkx5kh5ymHcRZfgyKmjdLNN9gC
         gafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706258442; x=1706863242;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EM7me6hr0DgfYBqYZ1m5/5Y61fSb6nrf7rD27pa9FgQ=;
        b=WwiLjOwfIMLKdBuwD9BIT8i4PkyYB3RC5txrumwswrL63z8Ms298Nc7u9jDJxVKvGK
         e7qoOkEa2gKMEJcdw2q21LaDNgzYGMIbqY5LadUAdYbxIyhqwZuM7Wry3AnDZ1rqk95J
         oCwbwCVlxChfTNXKu4qxn603K++h/JuJqvZu/FQv9sLQ/iw+C/ogua84oaON4z+mfU6O
         EAfT6P8+JPQ8pT4fP6rrwxw74TviRnKisYaAHM8MefpzM4sDC8Lio6nz3NAsWKBzbqYQ
         +svwnTnN2iiHGCbRAg+d8JAbKh+VSZX1iEdFiMtuYfVWTx5FetrQ0hkp11kHsF93ej6j
         vIPQ==
X-Gm-Message-State: AOJu0Yzf8oDLSEZVLWGLomZkM1v25SEzu1MN7vO3pkpcATFliK9xs2ye
	Ob0as6n7Y1hH6l/Nd9aGH9KYujkPQR4er9BhpDXlJlmgqIu4fMfFid6oHTRGXOg=
X-Google-Smtp-Source: AGHT+IGHPb2CxwM2qpL6dKONYAgUO/n/8kVqCQ5TFvAG633n4nCm8O00Evt6e+Evh/2zxBYBS61Bmw==
X-Received: by 2002:adf:fa10:0:b0:339:2b28:32e2 with SMTP id m16-20020adffa10000000b003392b2832e2mr605254wrr.42.1706258441917;
        Fri, 26 Jan 2024 00:40:41 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id j11-20020a5d618b000000b003393592ef8dsm753877wru.54.2024.01.26.00.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 00:40:41 -0800 (PST)
Date: Fri, 26 Jan 2024 11:40:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v5 1/2] PCI: dwc: Fix a 64bit bug in
 dw_pcie_ep_raise_msix_irq()
Message-ID: <af59c7ad-ab93-40f7-ad4a-7ac0b14d37f5@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email haha only kidding

The "msg_addr" variable is u64.  However, the "aligned_offset" is an
unsigned int.  This means that when the code does:

        msg_addr &= ~aligned_offset;

it will unintentionally zero out the high 32 bits.  Use ALIGN_DOWN()
to do the alignment instead.

Cc: stable@vger.kernel.org
Fixes: 2217fffcd63f ("PCI: dwc: endpoint: Fix dw_pcie_ep_raise_msix_irq() alignment support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
v5: Add the #include.
v4: Add stable and r-b from Niklas
v3: Use ALIGN_DOWN()
v2: fix typo in commit message

 drivers/pci/controller/dwc/pcie-designware-ep.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 5befed2dc02b..d6b66597101e 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -6,6 +6,7 @@
  * Author: Kishon Vijay Abraham I <kishon@ti.com>
  */
 
+#include <linux/align.h>
 #include <linux/bitfield.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -551,7 +552,7 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	}
 
 	aligned_offset = msg_addr & (epc->mem->window.page_size - 1);
-	msg_addr &= ~aligned_offset;
+	msg_addr = ALIGN_DOWN(msg_addr, epc->mem->window.page_size);
 	ret = dw_pcie_ep_map_addr(epc, func_no, 0, ep->msi_mem_phys, msg_addr,
 				  epc->mem->window.page_size);
 	if (ret)
-- 
2.43.0

