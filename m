Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5F21C2AD
	for <kernel-janitors@vger.kernel.org>; Fri, 26 Jan 2024 08:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706258468; cv=none; b=p5j0SBl3H4VqK+XhHwGnHBAlPBzuQ0BC1acRNrAsEaUPM+VcG2GZfTQn8FAfUIauhwsuEfJJUX/GCl67HghHGnxmsyJoylIANcZJ5y+2lq00QIEPgcfPCrIek+CkkqPcLeJXOy8FDA3oayhZVlDjdfrumZZhBWuXPGs9iUYfars=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706258468; c=relaxed/simple;
	bh=xVnB7uNU2aUwkZfdKtBk3UVgE3IhZNWmluxWDjub8oA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=eA2x4xTQPLUbJW2f0wtVuf9I0b6qp/IvhTE27k00pdsH02zOF6xHvQUFn3uCTeJzGqNga7T3/i8Gh7bX/KCNpVia/1AT1kG9j/RfugUn97haGvbsMsDCt2mSorNYtytZ5tFsZ0Nk9i3OfGb1nIUNEJ5Y7inpfg4G0bj3UOS2LAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CMoWsR0b; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CMoWsR0b"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e9ef9853bso9209185e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Jan 2024 00:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706258465; x=1706863265; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XX7Apx6LKiP4Pc42nzu4TYMSpS+o60Wt9NvNj/zb+0Q=;
        b=CMoWsR0b/WtKBU+Q3agudlT37Ebw+8U2UkdQmnfuyJT/XXNIQ29cH9ClgJ6DjDpuRS
         +4jrONbEy5tdbNw24iFkEUfUXfZvRzVPXdrqHqhflS8+JdR8Ns06UDiUEGOt3ysto3Vx
         j2U+QQ3qyUENudea6ZfhA5dSlyY9d2luQ7T0JUg8LiXf/eZfRqabOkSb9PxsKxpEX8MS
         X4RN1avtTgC8DGGPrKc1RacvWYPIqNO5xK/v3SHXjZraei8T3pt6LfEm+SnIz27ZYm8H
         sxr43J+186yG8yNvYWC/f4E5vwOuZvPX1U3ertsFRDDteK7GWfdmjSUOO+Thssu6J4Bn
         Uzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706258465; x=1706863265;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XX7Apx6LKiP4Pc42nzu4TYMSpS+o60Wt9NvNj/zb+0Q=;
        b=d9ia79f2YfP5UXg7J3K68vxZEeWyv3VQeESzYKMYrfnBDibRAO73GpUOTCOoe908KR
         Shejt/SCqUgt+UIR+PvKZKzZwyEyXunClVcBiJXE1I/XtBZhjongu0sgCIc2UZqugDmG
         0MRc1aXbIhOwPDCfjLZ9eOf8IJcQZyH0LgyzQ32+p054bO5Hwc4dDgh6xs4UMCpn/MUP
         /gzujD3ywwexUBjn8VPvDK8JXso90HA4JPq7qQ9RGnMV5EH1SbiJXvg/T2l3x18SYLCR
         ozopMyor/jeFZ9lj51+qzfrOg8VZg53kNSCiUUpXpElPYLkr9k4Dq6VjGji6NuQDx8lW
         BOuQ==
X-Gm-Message-State: AOJu0YzYjE+duxeBVGIKaAkdwcBQzpn3U+bZpuWHn4eJFKiTlzOqJZWX
	qgNcYpGh7MCF7DiXVGKVDlNSl2nfgNyc4701wEmgDVShUeXBRGlU95qeEzxqze+2V54mG5lmKnJ
	fSBg=
X-Google-Smtp-Source: AGHT+IFEq7uN14GEgOVUGh+XC+r/ZDyY6Ub0iEHePwZ1sqpDBMr1Xyrz7nwONatue8o5Dk2Kx2qp8A==
X-Received: by 2002:a1c:721a:0:b0:40e:a555:803d with SMTP id n26-20020a1c721a000000b0040ea555803dmr303589wmc.74.1706258464813;
        Fri, 26 Jan 2024 00:41:04 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id o7-20020a5d6847000000b00339272c885csm750140wrw.87.2024.01.26.00.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 00:41:04 -0800 (PST)
Date: Fri, 26 Jan 2024 11:41:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v5 2/2] PCI: dwc: Cleanup in dw_pcie_ep_raise_msi_irq()
Message-ID: <184097e0-c728-42c7-9e8a-556bd33fb612@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af59c7ad-ab93-40f7-ad4a-7ac0b14d37f5@moroto.mountain>
X-Mailer: git-send-email haha only kidding

I recently changed the alignment code in dw_pcie_ep_raise_msix_irq().
The code in dw_pcie_ep_raise_msi_irq() is similar so update it to match
as well, just for consistency.  (No effect on runtime, just a cleanup).

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
v5: no change to this one
v4: style improvements
v3: use ALIGN_DOWN()
v2: new patch
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index d6b66597101e..9a437cfce073 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -483,9 +483,10 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 		reg = ep_func->msi_cap + PCI_MSI_DATA_32;
 		msg_data = dw_pcie_ep_readw_dbi(ep, func_no, reg);
 	}
-	aligned_offset = msg_addr_lower & (epc->mem->window.page_size - 1);
-	msg_addr = ((u64)msg_addr_upper) << 32 |
-			(msg_addr_lower & ~aligned_offset);
+	msg_addr = ((u64)msg_addr_upper) << 32 | msg_addr_lower;
+
+	aligned_offset = msg_addr & (epc->mem->window.page_size - 1);
+	msg_addr = ALIGN_DOWN(msg_addr, epc->mem->window.page_size);
 	ret = dw_pcie_ep_map_addr(epc, func_no, 0, ep->msi_mem_phys, msg_addr,
 				  epc->mem->window.page_size);
 	if (ret)
-- 
2.43.0

