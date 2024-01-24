Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710B077654
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Jan 2024 15:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706108511; cv=none; b=LveRzo58xrruY/GwopTc/zj7uYLb3QaZ8kXPlvRhxAsGtamgB8pVOVwzKtqWoGMXrD8U+cwKX/7LClXoW1rWAkhJR59vx9/tGB/u1Ujq43vNlK7CA14DK0S30l9PfoW+UVGeFdYIHteJIOTa9RxgnCnRaoMfK0mMkIa+TAtqZ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706108511; c=relaxed/simple;
	bh=vXo7kwrg/JEtFg5VNFewRcL3UlxCm3whtvjszAzZPYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bUkykXJTwMyCz6cQFX3Pl/gmIDkwWqSNwuOKlb6yQW4ghjE1r+4adNw0NJG7XDNyqOVNqxFVPuUsyeD4QJQ6TV/XUOygpMzwRGK1YX858Enn8RRlXAc1Jgk9GxwUQElVGG/4M1EH1E9eoym2XTA23ylSU+AcD0Ws2JLo6Veg5H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lj9TLzOh; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lj9TLzOh"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-337d99f9cdfso4872218f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Jan 2024 07:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706108508; x=1706713308; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wddH6dLZWFvD4sBtP23ayzipvN9tjMLSLEUIemLS/70=;
        b=Lj9TLzOhWAYLs1TUsku2c+eL+vj9+Gw2anMWW5GaI45u+pOADar/aYwoHE4IGncJKw
         rpauRDLKl+eA1t8OM8ALejDBk7f9GAI9+1c/NfAuY6KvmxZk+8ZBybhXa3+FSHWIXWg2
         SUURTVtT1mzwpWWqY2eJNmqdW6XsmFK2F2GnYN3YRitPJv6r4PJzd99sHezZmjraNRhm
         qR+p93eM0lEnoMGjMhR8149K9JfSNWcHAITZC4sa45G8TFIwIdVzbOcnQZWIbjDlFAkb
         PWtvNAPDc/GmAmW7Z9pKzZcO1GQqi96GjM3Qznzo4VOk4paO8zfpVRSXyVh1A1W0UdGv
         Sb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706108508; x=1706713308;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wddH6dLZWFvD4sBtP23ayzipvN9tjMLSLEUIemLS/70=;
        b=eCPcR7NOXjMU5an5YtPTw+RrZOZMcqf2gDYrzvus/dUzm2epENUt0E8JbKE9qOFnow
         F5O66kAFqnKhZD+nCyPW9un3vViHDWpUvXeUj7Sc3leB8yQEGBZbv5rYRi6OyMEXRCFt
         btvE9/D9SB+fB/lmhROfoVKqUO83/xT7bSqPgSv19F8IuUm5ZpeerUDv0GARaSpwS3b0
         B2aWJYGz4oeOXN84TL6Io9GCqCP1Hd0rOtXN5r0UjA2Wn9beVVN95eQbJv2Bu0mI+AS2
         ZJLqkH8rlOULMax7GyoaIHCjZtFI9u8t1nHhHXotUD/AdDymiALy8S8veI8UZo518m+p
         afDw==
X-Gm-Message-State: AOJu0Yw2sVsLF5SPwtW+TvI96HTK+cB0SZQlgjiWLT+cWB2aefBiQO9J
	zFr6WxKL72Gcbm8+kBZfyysl96m/+pPkHks+mTwIPj5Aed0sf6UBdYRrwylwpS4=
X-Google-Smtp-Source: AGHT+IHXHhrcwAHRLUnkX2s024mT8pEXvkb38AMMNc+9E2uH9gcDtJhJhoQ9GTqAP9FJosVbKHujPg==
X-Received: by 2002:adf:ef12:0:b0:337:bf29:b6ca with SMTP id e18-20020adfef12000000b00337bf29b6camr701919wro.23.1706108507315;
        Wed, 24 Jan 2024 07:01:47 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id o10-20020a5d62ca000000b00337d4ce6ab4sm15999360wrv.20.2024.01.24.07.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 07:01:46 -0800 (PST)
Date: Wed, 24 Jan 2024 18:01:42 +0300
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
Subject: [PATCH v4 1/2] PCI: dwc: Fix a 64bit bug in
 dw_pcie_ep_raise_msix_irq()
Message-ID: <888c23ff-1ee4-4795-8c24-7631c6c37da6@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
---
v4: Add stable and r-b from Niklas
v3: Use ALIGN_DOWN()
v2: fix typo in commit message

 drivers/pci/controller/dwc/pcie-designware-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 5befed2dc02b..51679c6702cf 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -551,7 +551,7 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	}
 
 	aligned_offset = msg_addr & (epc->mem->window.page_size - 1);
-	msg_addr &= ~aligned_offset;
+	msg_addr = ALIGN_DOWN(msg_addr, epc->mem->window.page_size);
 	ret = dw_pcie_ep_map_addr(epc, func_no, 0, ep->msi_mem_phys, msg_addr,
 				  epc->mem->window.page_size);
 	if (ret)
-- 
2.43.0

