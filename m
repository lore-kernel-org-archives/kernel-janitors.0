Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEB812B79
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 08:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="prEu3q2p"
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7D81BC
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 01:36:02 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1cc316ccc38so17392745ad.1
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 01:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698741361; x=1699346161; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CmRWz5iS/me/RMqdnaDD894cfakp+jsL2NZ95UmiyHg=;
        b=prEu3q2poVTSVjwpaPZo6mX/hhi+J/9eh6896iU+t69PYT7sgiFwRiKMtn/sGQz5Yp
         3A78cOa7ptNqhqjgW8wM/coB35JyveqVCWsLg4ZCZwpfLvQPqpTBE4mqqQj2GELAeEeN
         I17rzqljT2wjoWR6O5EQDtN5a4TleqGr7iBmuEPlUMQd15E08j9KpIVi7Xirk3DsU7x7
         hTqCs/VU/WNvPyEPOFx9WQnS9iV6yTWg1FrcyLprVVLnlw1xX1DmwXSHAzbMne6c3L3h
         OJCnPq5I7ZPnuc2cO3HtMFOXlQn38PgTxnQBUf7AJvwL+O2euasULlD1Q8Ilgp+plwkh
         cRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698741361; x=1699346161;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CmRWz5iS/me/RMqdnaDD894cfakp+jsL2NZ95UmiyHg=;
        b=mkZ/YPvsL80SYIyb9P/cJXqOzEC1WTtCJDOOqXrN1mAV0XbNghQzsmVxi79R2COwLu
         nCYJlipMRCJyEl51qYzTC39W/xYu9xHv1qi83wH8AJl+rcAe/HgnSwHrO8CJH+uFemcS
         TSNsrZD6IwIcUNqWQzUrQMnc/wNvKdrbJCjB9kYFeXzFeu9pFiVmVeJjH+lRzYFp9rX1
         IeVu+SqVbOGLAO4AKMDDr85AXMzdihLwZYxVa7717LLwGgpAPjRMefTkJELOUbcccWIX
         DJvrEd+bFOR9hSLwLASCcJ0eCwC+4qDKu4R0h685FbnNhkc1zwUy3kT5RBy10XiYIpzl
         vLwQ==
X-Gm-Message-State: AOJu0YyO2tr7ChoQXF310JakLxGD49je7SbyZ3A8jdCsjzAzrn0nseUw
	glM/hAdu059qb1vaSmV2Ou2v
X-Google-Smtp-Source: AGHT+IHjmRCODXpSYkvrHsgbscR3NzOeJbWUsnSzsupPb3nySmVdBXTLkyuKisEduQzGXlUKwY73Rg==
X-Received: by 2002:a17:902:d50f:b0:1cc:4e9f:d27 with SMTP id b15-20020a170902d50f00b001cc4e9f0d27mr4647477plg.1.1698741361293;
        Tue, 31 Oct 2023 01:36:01 -0700 (PDT)
Received: from thinkpad ([117.193.215.92])
        by smtp.gmail.com with ESMTPSA id u3-20020a17090282c300b001c74df14e6fsm781176plz.284.2023.10.31.01.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 01:36:00 -0700 (PDT)
Date: Tue, 31 Oct 2023 14:05:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH] PCI: kirin: Fix an error path in kirin_pcie_probe()
Message-ID: <20231031083553.GD11778@thinkpad>
References: <e2b83334ab204ee905fe36ac01cfc297a5a2a7be.1698654061.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2b83334ab204ee905fe36ac01cfc297a5a2a7be.1698654061.git.christophe.jaillet@wanadoo.fr>

On Mon, Oct 30, 2023 at 09:21:16AM +0100, Christophe JAILLET wrote:
> If an error occurs after a successful kirin_pcie_power_on(),
> kirin_pcie_power_off() should be called, as already done in the remove
> function.
> 

PERST# assert (gpio_id_dwc_perst) is missing from kirin_pcie_power_off(). So
first you need to add that in a separate patch and then this patch can come
next.

Also, this driver is using legacy GPIO APIs and needs cleanup too (Kudos if you
are willing to do that).

- Mani

> Fixes: fc5165db245a ("PCI: kirin: Add HiSilicon Kirin SoC PCIe controller driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Not sure of the Fixes tag.
> ---
>  drivers/pci/controller/dwc/pcie-kirin.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
> index 2ee146767971..0b93de9d2d06 100644
> --- a/drivers/pci/controller/dwc/pcie-kirin.c
> +++ b/drivers/pci/controller/dwc/pcie-kirin.c
> @@ -813,7 +813,15 @@ static int kirin_pcie_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	return dw_pcie_host_init(&pci->pp);
> +	ret = dw_pcie_host_init(&pci->pp);
> +	if (ret)
> +		goto err_power_off;
> +
> +	return 0;
> +
> +err_power_off:
> +	kirin_pcie_power_off(kirin_pcie);
> +	return ret;
>  }
>  
>  static struct platform_driver kirin_pcie_driver = {
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
