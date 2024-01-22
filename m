Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F71A405D6
	for <kernel-janitors@vger.kernel.org>; Mon, 22 Jan 2024 15:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705936876; cv=none; b=CP8jEpPScc2uHCYUVDludp4Y89kIqtMWOYb9JzLByjHYKx3UaUvBQ+hgP0fed0CDVog4rQyMzRRwAdLhEZF8ymXQf5pd1GPpgjjxpg7PVGdoVBefWtWasrlpWzqfw1Q9qraoIgTM2SaavkryiASpngHnZhAYogSKTNrOF7DOCRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705936876; c=relaxed/simple;
	bh=fUfuTS1ONtt1Sc+QMJaOn6OAPkhCtiu6J0M8A7SoJa8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Mo5wUsmz9dPEvk9uqOy3lwTxP5NYNA7ElDN4WzOYflbSgqwmuoVgh4gvjXVTkUYT8X4ej9U93oYAreninYiyH1LmxSYi0G5HNlbNrQ04Ot8ZDhjti/sVbD28dSUoIpv7W2Hf9A4bQaOps5+ud4kUONxGb49SyrxSJDx4djYVGYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D/yBbLD2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D/yBbLD2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40e76109cdeso37794715e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 22 Jan 2024 07:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705936873; x=1706541673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3NSmP683nHsYZ+QYwFDjWG0Am9VIQRDzOaWrn4+k4gg=;
        b=D/yBbLD2Z9NmmMarOc0g3Zy4wqpJ7mmfYz+3x6zxlNkNMqU4w/Qf3lfBsQh0cbDSpD
         jFCtpNcZFf4yke329Grdm36+MJ9R7xTJ54V8fjPInO4xmgCln5+DRvyw2h/SnpqGOl1H
         PH5HeLlB5Ofl/8dTQSgbzIbko5kiF0B/Pd1m7tN+PMX2U9eVLrsbB+6dvZ6yqQZWxuCu
         MF+QTu/jcKUojmGVsCTMh2vBRwQQexgg8obr8Ys4kni+ggRa1dG4/CzAaMewQf/DME29
         6+zodjrYx5izdXrGgwbA66xkStFN3cmzisE/dSCcu/QPflXYaC57PH7Xx7L/c6UoEJm4
         B5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705936873; x=1706541673;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NSmP683nHsYZ+QYwFDjWG0Am9VIQRDzOaWrn4+k4gg=;
        b=ARYRQfE84DUK8Xldj6oZhZlApGqhWDq3xVfzqlJUOAqXgKlbV+qbF4bP0pwp0c8c1y
         caJJg3npwyTaVsfJ1xg4qaAWCTvF+DHwiN5alXR1qJuNR3+KRck7SEmzfrdTI1UOvq9t
         ue+aMX6t3CPtYUtZuiBNfn0KsuawGRt/RUIG5LXDrOkcp/vjFtpBRo2MXafwjN8DWyRF
         HHWAERhPYCafI3vadKf+KAEpvljNYy5xeheTjEW0aGmH0BQDHWc4Sg6RIxmxiaCoGlah
         /xZh911So3zyc/SlIvcsYa0xDgsgmIjfQHhImVjxWbfTguytFRhfKauuraluMCX/BCIn
         6+Jw==
X-Gm-Message-State: AOJu0YwQoMewqP/PbnMT0MbVrffbQ2LWJBpLUCPtjAUzbm/iMkMo63/D
	Up2ugAyiCWhu0Byxdoky9sLDwriEBR6MXIQ6mrKj+wgC1fm9ClCxfQ7ltP1AdbE=
X-Google-Smtp-Source: AGHT+IEW7U1TIKg1LwteChy4/AJ3H9LLFV7lw3z54lPa8/SxA8IUIP/Cz3kDcBRnGzAbhGpHLENTEQ==
X-Received: by 2002:a05:600c:3847:b0:40e:553c:dace with SMTP id s7-20020a05600c384700b0040e553cdacemr2272796wmr.92.1705936873221;
        Mon, 22 Jan 2024 07:21:13 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id jb13-20020a05600c54ed00b0040e418494absm38542327wmb.46.2024.01.22.07.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 07:21:13 -0800 (PST)
Date: Mon, 22 Jan 2024 18:21:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v3 2/2] PCI: dwc: Cleanup in dw_pcie_ep_raise_msi_irq()
Message-ID: <c5499db2-2c25-4765-b9e0-1fa26da1cc45@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0d5b689-9437-43cd-8c1f-daa72aeafb2e@moroto.mountain>
X-Mailer: git-send-email haha only kidding

I recently changed the code in dw_pcie_ep_raise_msix_irq() to use
ALIGN_DOWN(). The code in dw_pcie_ep_raise_msi_irq() is similar so
update it to match as well.  (No effect on runtime, just a cleanup).

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Add this patch
v3: Use ALIGN_DOWN() as a style improvement

 drivers/pci/controller/dwc/pcie-designware-ep.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 51679c6702cf..1c8d2e938851 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -483,8 +483,8 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 		msg_data = dw_pcie_ep_readw_dbi(ep, func_no, reg);
 	}
 	aligned_offset = msg_addr_lower & (epc->mem->window.page_size - 1);
-	msg_addr = ((u64)msg_addr_upper) << 32 |
-			(msg_addr_lower & ~aligned_offset);
+	msg_addr = ((u64)msg_addr_upper) << 32 | msg_addr_lower;
+	msg_addr = ALIGN_DOWN(msg_addr, epc->mem->window.page_size);
 	ret = dw_pcie_ep_map_addr(epc, func_no, 0, ep->msi_mem_phys, msg_addr,
 				  epc->mem->window.page_size);
 	if (ret)
-- 
2.43.0

