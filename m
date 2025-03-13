Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE35841AAC
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Mar 2025 06:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741845792; cv=none; b=NJKgosm9t5n7ta5ByKFzGAz06S4WdwqCoK1W9ywowTTkQlh5hjEAZpuDrR95j3dx9/vEj/OPKRF1HcooB1GdnqtMqmzE+5rc0V4/hoCcAC0rgqLxEJ0dWbDPp12VG7A1rNnYGTNE1QD2j0dLYt/t9gM0poS3Y9icN/M30bkwO7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741845792; c=relaxed/simple;
	bh=3IHj0fwKLeVDGBEhR8BPbj3M6F9IduKAqL/V0C9213o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aP011SQmFL2snVE/S8hTmEaz7jWpsNkGSSHwenqP402PTk6828qEAQvFvleVB+3u34tCh33S3070muYxAXziaBykxLGEHkIUn9SVUZaSbiakHEn5oTybsTDoFZmUYcVBvLEwBDIDwLY5WHeF1gXi03LQzmz4mgLugchis3vtzhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zplUBdIc; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zplUBdIc"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22359001f1aso13991375ad.3
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Mar 2025 23:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741845790; x=1742450590; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f6MdjnJ3ua2k7HKceKUirt21FtnY4dMiCyblx2R2tuo=;
        b=zplUBdIcrp7/hOs653ldpWZ0xoFlR1vsnxtwjz2h+Ci9p/zwf3/5J2K20czzrE6cTz
         dTO9HluaW/hMJFKnuRg++aptR3zGIB3zAiz8Wg6VOzRM3GA3ogzBozHoPVmfOVuABoOR
         2xjJ1cVihKMgJDT83AoBq2joYl2HGsw6CQo/9iMmFNy7inj2y87VoKkMoFu+g3Iqbktd
         /vPdrqW3P/EAlFyqU3azOhiV+PikG2uciQ6vM3kPFhLG3Th7ohFl3VD1j+j18j0HQuAN
         TPhnq9+uXXSFzQK82qY1ASsQwHGu/ZLLRilNPI/fsBzc9apQCM/xrpxZq5PqEwdTkpQc
         bAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741845790; x=1742450590;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f6MdjnJ3ua2k7HKceKUirt21FtnY4dMiCyblx2R2tuo=;
        b=oyguPGJJbGXjsz9wX5m/+vWHbySOT5wzN8tjurUBaWARUG5wuxwjChwBaCxD/y4Orw
         f5yljnBY2o54q6Uhymkxtp5d+P/xIZn4qfxm64BHqWWSDNfJy/E2gOPilS4m2CuZxOCf
         22Hn9mQQJlcBPsYu0DnMVoB/93hKSn3Xr+75vBt12MxS4DtPG8+JAaweZjGxQs2EyDaa
         gmNPF1rRe2mf9x4AQgY+QRocUGjtp6M4Hhr0q2MWZmATJWzYtKGpIB8M051i5VVD0gHR
         BueEzeALnT3xRsAKlm9EgtsBzasIWVRMwaRCWhdmmHszKi5WH8ls8TjhsAMeSaI3xoqj
         XR/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxT7DGV/dGSGZKXZgqqyukAQjtOXBhVaun0msOB+HwNkwthLhCTmZNlkixVjXdqICdXgEApjX5m0IuJHCyQcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhI0tG6VO/zC+Nklw+6Whpeq3hlV6+pzNv2kppIqDCRXGU8FjB
	GujuORZ4HPbMnb4C28vEPO4f2ChuPrzWbSQ7tGX4n5Zt1G8ONBOrAfalGyuL5Q==
X-Gm-Gg: ASbGncu06+WWZ0mu0ErHWQxpI4TSlIn43Z0pFUzfRnQA7LdbPW5Kx1a45hkgpOUd9ij
	jefRZ0QXieOn9cUfdDgiboAYjz3VMdet9u9geU897+DVHWsRcjmSnDd2qCItXJo4ZH6o0pg6Leu
	ESmUEgQBDlXm5O05CVwm8MAwCcPjQ3Z4ezM3p401v6qqkJXEbsrFNS09bD7YSRScMFlvNfGsJlr
	SXuCB+wFovvtSndO78OPS2TThgogg5Y1Qexgo3lwDGyXt2CMeLIeTnv4Fmja//NP3L57K2fZcKH
	GS7heRhgFu1DBOnu1+Rj8QdA9Ujf8yxNGxY3DcrooCHvBTG4w35lmA==
X-Google-Smtp-Source: AGHT+IFPxLRLvvJqzA698/VJnGHbi0WkE2Kuvvzmsfile6eRsQmYWiTTJ/9mF+iWI4d+NDoThioxKg==
X-Received: by 2002:a17:902:e802:b0:224:584:6f04 with SMTP id d9443c01a7336-2242888ab27mr315006605ad.18.1741845790022;
        Wed, 12 Mar 2025 23:03:10 -0700 (PDT)
Received: from thinkpad ([120.60.60.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c688866asm5616385ad.50.2025.03.12.23.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 23:03:09 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:33:03 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Vidya Sagar <vidyas@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] PCI: dwc: ep: Return -ENOMEM for allocation failures
Message-ID: <20250313060303.66eqdf7ok5xpkokw@thinkpad>
References: <36dcb6fc-f292-4dd5-bd45-a8c6f9dc3df7@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36dcb6fc-f292-4dd5-bd45-a8c6f9dc3df7@stanley.mountain>

On Wed, Mar 05, 2025 at 06:00:07PM +0300, Dan Carpenter wrote:
> If the bitmap allocations fail then dw_pcie_ep_init_registers() currently
> returns success.  Return -ENOMEM instead.
> 
> Fixes: 869bc5253406 ("PCI: dwc: ep: Fix DBI access failure for drivers requiring refclk from host")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 20f2436c7091..1b873d486b2d 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -908,6 +908,7 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
>  	if (ret)
>  		return ret;
>  
> +	ret = -ENOMEM;
>  	if (!ep->ib_window_map) {
>  		ep->ib_window_map = devm_bitmap_zalloc(dev, pci->num_ib_windows,
>  						       GFP_KERNEL);
> -- 
> 2.47.2
> 

-- 
மணிவண்ணன் சதாசிவம்
