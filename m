Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3307F13BEAE
	for <kernel-janitors@vger.kernel.org>; Thu, 25 Jan 2024 17:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706202222; cv=none; b=YSYUQyHB8KlHqkkIirGftamw82COikXeUOrx5bUoq7myk+1DCDIhTFFRdAoEcFbVwZtxUwpFoA0Z7faS0S7G5YQI7HFA09Dezp54NRl1pC+CNWwl7PuOM4sO3TPQSOgQld1n4RNNw/N11kdIlCKhJdOPVTyB63mlZHLYoZUpXWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706202222; c=relaxed/simple;
	bh=EtjuxVfRaMmROi8vU5EKNyZbFHvQzfftjUCQ1eYs2Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIURbge0kMzN8MwmhEUEkwK5dez/ypM4QRt5Z4q9uZevgDLHjbA66+ptf8RRMrmSu8PqODqaC2fOVN1t4QsCcGze+wDM2FQM74SRr2PGtfvC0eKqK7LOlvYLfWFcgPvDUSB0qMOIYMYI/mgRmkhDOH26MHFIfV9xtj5b1K2elbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gxnmfUgS; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gxnmfUgS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-290ec261a61so1238989a91.0
        for <kernel-janitors@vger.kernel.org>; Thu, 25 Jan 2024 09:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706202220; x=1706807020; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c23ZTeIVxs6yEnWydo0j3V6m4oKMAUU00aaWAQnKjog=;
        b=gxnmfUgSAiyPTtVHdomyCyCTp10Zhrx+hUqhaqyi4zmyHpa+rNbSO3yHHqPsVPpNNm
         6iJ4YQnpPLASme479i4S0gI+xXqiY67GMO8JO9FuYkBTCmeTSM58O++OxYbpx+gweRHe
         WgEbfQtxF+M5r2a3d17P+eUeLrKiabZ0JC1mt4Q5fKg73Kml7DywI30NAyIOHn4UvjHr
         6DTilvtTemupZ5BgdMeCe+IpGHfqlbV8LFjISjHDizXsmJPt9Uv0jifz11Nj0+2Y4PyQ
         9umNfDYvtt82KkpjC/K7sEXP6BHu3KLOLJS/ug3bDeKp+vVTMzquUS5xjbWktGozRa0K
         u3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706202220; x=1706807020;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c23ZTeIVxs6yEnWydo0j3V6m4oKMAUU00aaWAQnKjog=;
        b=cYfkmzLMmFjuWCJCJqMjtGhhdZf2eMPR4lREyHwYPNYNLGO/HfvnajIg9oBl4ZWS82
         0hgGjo5FjtbPLa3ViyjnEwVxlRcCGoeAfM9uLUiH5bOPFlbjn0GFxfJIm8Xu+U7LKCK4
         +yAznAODBVoise2dgmNg/8OQn/aIQxE4DfmmO2O3DqpNb6wgQWEJ2O8mOIoD43DsDLDd
         UrrAL2MNE8iVfQ432bcqsO97PB3NfoITZn4qzAeDhLNLaSPah6VBGfyTn286xMJTAVzq
         LuhLxTOb/CQUnIo3xlo36FMqfw9HICQAZBnH9Qhar6MGce+enY8M80xSOSi0wwXx0G+j
         S5JQ==
X-Gm-Message-State: AOJu0Ywr4KmFss86px39ocYZprUyHIKkA/Alr4vehBJY026CH5UXTeY2
	LWJivZDF8hpYTbZpGlx3ImalE/hDAmUUTabQ02IGLUJRF0sWRCzuVfMTBRF/ew==
X-Google-Smtp-Source: AGHT+IFb5JGtW8dJ+mUO3mIA3dSMaKRRrd77+BxY9Bk/slj5Q2gpOozeiZOOGGMJe5dfpWi69/EH9A==
X-Received: by 2002:a17:90a:6fe2:b0:290:2844:50a9 with SMTP id e89-20020a17090a6fe200b00290284450a9mr1107862pjk.26.1706202220345;
        Thu, 25 Jan 2024 09:03:40 -0800 (PST)
Received: from thinkpad ([117.217.187.68])
        by smtp.gmail.com with ESMTPSA id s17-20020aa78d51000000b006ce9c8c4001sm16075282pfe.47.2024.01.25.09.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 09:03:39 -0800 (PST)
Date: Thu, 25 Jan 2024 22:33:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v4 2/2] PCI: dwc: Cleanup in dw_pcie_ep_raise_msi_irq()
Message-ID: <20240125170332.GB6390@thinkpad>
References: <888c23ff-1ee4-4795-8c24-7631c6c37da6@moroto.mountain>
 <64ef42f0-5618-40fd-b715-0d412121045c@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64ef42f0-5618-40fd-b715-0d412121045c@moroto.mountain>

On Wed, Jan 24, 2024 at 06:03:51PM +0300, Dan Carpenter wrote:
> I recently changed the alignment code in dw_pcie_ep_raise_msix_irq().
> The code in dw_pcie_ep_raise_msi_irq() is similar so update it to match
> as well, just for consistency.  (No effect on runtime, just a cleanup).
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> v4: style improvements
> v3: use ALIGN_DOWN()
> v2: new patch
> 
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 51679c6702cf..d2de41f02a77 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -482,9 +482,10 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  		reg = ep_func->msi_cap + PCI_MSI_DATA_32;
>  		msg_data = dw_pcie_ep_readw_dbi(ep, func_no, reg);
>  	}
> -	aligned_offset = msg_addr_lower & (epc->mem->window.page_size - 1);
> -	msg_addr = ((u64)msg_addr_upper) << 32 |
> -			(msg_addr_lower & ~aligned_offset);
> +	msg_addr = ((u64)msg_addr_upper) << 32 | msg_addr_lower;
> +
> +	aligned_offset = msg_addr & (epc->mem->window.page_size - 1);
> +	msg_addr = ALIGN_DOWN(msg_addr, epc->mem->window.page_size);
>  	ret = dw_pcie_ep_map_addr(epc, func_no, 0, ep->msi_mem_phys, msg_addr,
>  				  epc->mem->window.page_size);
>  	if (ret)
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்
