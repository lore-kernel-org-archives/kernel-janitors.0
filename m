Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB53B22F06
	for <kernel-janitors@vger.kernel.org>; Wed, 17 Jan 2024 18:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705516335; cv=none; b=W+jCG+71pjtqdvdYrykDJG4+9n+HUnpmyIpBQbNJ52iaGoeyDPpddYgeS5/u6QFlf+K0Ug9MQ5nBCIwRh3ufMCLZRy9kzCTKF7IgstkS+hWvxVQAJU0I0F9uwq94nP6IXtH2SF+mqldcNeT0l4W0FjdK1O995BcGcHMhJ1AJ6p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705516335; c=relaxed/simple;
	bh=GJoKVb2+DXUwHo6EryFUbR0bKGFrwQdlvWC+jGiPY6k=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Mailer; b=RdbDjd8Ji37Dgb427daZy391i6jINzaZgjlF1/Xmd73hfW5+O9ES6tNjVB+YO2oM4VsqK5bxIoB3ep03717nE9rDXKStQcP+dzLqzvhGTm0L6s9ZvzLP/j5xFD5Bq4b3C3Rwcm0k6HIVlJ+2MquMb4KAxYgBmBx02kxqoEUizd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TwTr7tL+; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TwTr7tL+"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3376f71fcbbso9142448f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Jan 2024 10:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705516332; x=1706121132; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dowglsIPVbYVAFa4rVjn+rlDsEzlw1XXMllVZiyv4c4=;
        b=TwTr7tL+WDZwmHbKemDUyUDIWb4rMpnc4+pKMYXD0kBmNUhOxA2BQCrDumLI49gUkE
         SItrJ7H+S6tadYJjJB0HhN6c7BO4OguGscHfxRnOnavEK6nTgFWY20WxemizPHzBDsI2
         1yCI9pmUvXn41H5HhNmLIDYwGWm9MTTMOmle8NHNJPE4m8M5FVeh+h6wy63h82g4pFTk
         hE3JYSyUOy9LMoGkudQ1dytir8o/fvxTRHzJiNkUB/ooMJ++fajbjI9Dr+fmwzwgGA5S
         wGwcFo0FefarJ73kGoG9DNY1hiOjL/AOcI4Uq85wiJdwSXfWF6UnNs/dw8tust6D57Iy
         ml8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705516332; x=1706121132;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dowglsIPVbYVAFa4rVjn+rlDsEzlw1XXMllVZiyv4c4=;
        b=ZiFbBeS2LnSmgMyQraU1sznMd4tzoGV1W142IjVHvKrKcIdv36Edi3SRcjHV3T1qzO
         IHT5KkhjarpqGT/yZulw3ABgWJ1Cgjm/oU0Z5THIjMpTr5LT0xggd4Xc/QePz0UJ9abc
         W9lJwxsiq8XVx5rJd4RFKM9zF+1iChBpj+jEDYiN8AdNIioiP8iw8tkaFBfXoAZ8y7Q5
         3cqdgBaHNJpDHxzITTkvtjLx1wMnl0YeaPbDuYiOTqXgMFD7IwJGqBcdMOJdn1ms/5xz
         2q2vJdMrNJg/RMUAYjeG531fFlspJUXvjLHaN3l833fGsGfyiaFbQZhQnrg3KPKtK8LQ
         M3+Q==
X-Gm-Message-State: AOJu0YwABtG2lrCiV7eric39UQc8V/18EKybLO2x7vM5IF7EfCo7rYG3
	LcIEYBM4vr1njj227ihrvGOfCqHuFsESVg==
X-Google-Smtp-Source: AGHT+IEerS4tRmti12dAHzaJBQqQIekd1m4weeIk92C/xIkzUsjHTdaIpdo1h9j8pRaeTCy5m+p8lA==
X-Received: by 2002:a05:600c:45ce:b0:40e:6e84:e95f with SMTP id s14-20020a05600c45ce00b0040e6e84e95fmr2723425wmo.252.1705516331931;
        Wed, 17 Jan 2024 10:32:11 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id o8-20020a05600c4fc800b0040e549c77a1sm27223849wmq.32.2024.01.17.10.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 10:32:11 -0800 (PST)
Date: Wed, 17 Jan 2024 21:32:08 +0300
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
Subject: [PATCH] PCI: dwc: Fix a 64bit bug in dw_pcie_ep_raise_msix_irq()
Message-ID: <3f9f779c-a32f-4925-9ff9-a706861d3357@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "msg_addr" variable is u64.  However, the "tbl_offset" is an unsigned
int.  This means that when the code does

	msg_addr &= ~aligned_offset;

it will unintentionally zero out the high 32 bits.  Declare "tbl_offset"
as a u64 to address this bug.

Fixes: 2217fffcd63f ("PCI: dwc: endpoint: Fix dw_pcie_ep_raise_msix_irq() alignment support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis (not tested).

 drivers/pci/controller/dwc/pcie-designware-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 5befed2dc02b..2b6607c23541 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -525,7 +525,7 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	struct dw_pcie_ep_func *ep_func;
 	struct pci_epc *epc = ep->epc;
 	u32 reg, msg_data, vec_ctrl;
-	unsigned int aligned_offset;
+	u64 aligned_offset;
 	u32 tbl_offset;
 	u64 msg_addr;
 	int ret;
-- 
2.43.0

