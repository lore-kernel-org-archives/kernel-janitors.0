Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2C41373
	for <kernel-janitors@vger.kernel.org>; Thu, 28 Aug 2025 09:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756372379; cv=none; b=Tf1TOnPjQmMSnAhPIwSOUOfy+IAQz/x9oQhMm9CNSIGLDMNY6IM9DoxH0s5EmajLR0EpE4mtfy0S3tji0MkxoqfNkQ+JP33wU3Ia31Man39w7uVfhh7/Ujy2f8Q6kMFw8XY/1F/RYGK/EvedUCOX2UXzBH7h6Ax7oMrjbcplUMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756372379; c=relaxed/simple;
	bh=fnqeH2S/ZooAjeV/GAmQPx2ZLjQQGkor23D7VbntDU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ew2J03YP331GrTbHHAoGbv8JuLBnVS5CtDdVypdRDrCejJa5ldIEBSZAQpvzxr2HfNTcXNZr9s7nlqZFFcm5NFf8IOPYOpLh2QnsBz9uZVw5tnNramuo4hGn8wTAJbRUoNsOIW/sD2R3h0wBK7S0pECxkPIh6cRsG1dqvF7uL5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NYswhJap; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NYswhJap"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b00f23eso4204145e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Aug 2025 02:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756372375; x=1756977175; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wyW2xbXiIG+NwpcX2N9e9mL2ILieuiGVvkRTNRcJIEw=;
        b=NYswhJapU6BYexU23s3DSk+g7Q/UmEMTqOihP30VhugeUeAISCXyXJmM4BCS464qtt
         5r/YPL5fjWEQaV1gQAg2mR+gHslxRdytL2Wcx/jDq8QfAb5jN5PhPjTOsQtYfoMcUGi0
         5Y1Kr4aRc6WYwO5cnfeYA/03MM+Zr5s3zTF/DxPDyOpX50SZ7Skr/jRW5AOcD2VRfZ5L
         xnWL3lqq/QWa7ioJ1AUmLs98L+5r12CYVn2PHORXXCg540q1Px790sxlWxKcv6XyIk01
         k+GT8RC8YknfYjo00UYOhfbgCGnnGOfNr4tO8NfouzfPOwWUs5dfKGfqgna6hPJ0p26F
         xSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756372375; x=1756977175;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wyW2xbXiIG+NwpcX2N9e9mL2ILieuiGVvkRTNRcJIEw=;
        b=VE8405CzpAcsn0F78ig8sHz+W8ZdW8Uv0COoMpvQkwSU+jG6QJSEfLvAoH2HDhiLNd
         UDwrbMKp1TQQ4/FG9mn9zMTiQYIuGur/YwunSbt0pFPPeO5oDQocQtZUzkxexKIENP3v
         QUpkHIJtlgoY4aWU6MytEbxKwGaBw5id+6E3RW5uUXlFCXXc3D2hgp0ArkDG7w2VfuTv
         DOOkKb8fN7YkkYOtpPAB7DPOM8ry+noSftbogoZO6MmjI443CGjpmoIJCMtgMihCuYUt
         /icoKcb0EKE8K0eAmhef8H/yslNkHQvLE+xX3vDpKJDQgtcNNDC8TjrriFrHObmoEc5T
         0wzA==
X-Gm-Message-State: AOJu0YxI0KtZxiqWrfSfOG6o8mMXlWKpRl0ANydMOaBa8yWXf++EaBc3
	IAflS2dTCnReDNF2vC6mWDjXClmLZ81Lx1NCx5J2+/RgkLrid4w51m/4rI6qIIIirWOGmjUSKiX
	eVyuj
X-Gm-Gg: ASbGncvathQWYwhYOTtmM0zLCkjNyeub/dMFXg+aoD0/ugnCrH4q0ZKJuQf6r4Yn3aa
	MS8HbI4Ba6moFY9Pu3M84pXMwm+txFfPjBTtiv+++SXxiK2EZBDNWP11ua3iYdTVPJDzDdG3Gtt
	R3C15OripKT3O0sCGsc4HP9GrfNF7E7Nq9ZJg1aNtdy1Dk1HMxrxof6iDrSr1S3kgOldSK6yBdB
	mlQrdUELPz4yz/N1zwUHU0PaUf6/Lnwq2bqgC+hZWvpXD9w27HH2RaSMWerF2tETppCqcXGneaz
	i+6D0QNAy4xwzsgX7B7aURdmsjifHUcnHDWQ07jAEDWpM4xLhAMEIaAlZpUcET7+PjKrWgszEb7
	K0LabH3MIL/XSTljLOB9wHh9pAE9/ofArepi9B+1rTp+VVzFr
X-Google-Smtp-Source: AGHT+IE1N/GU9CWiFeuSlCA7lYQQE9corIW9G+VvXPDgedIFEeLnjeiHjx5/c6jF5seS8M1zwGBEFA==
X-Received: by 2002:a05:600c:1e85:b0:456:1560:7c5f with SMTP id 5b1f17b1804b1-45b5179d004mr169053305e9.14.1756372375588;
        Thu, 28 Aug 2025 02:12:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b797d1a67sm26010355e9.15.2025.08.28.02.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 02:12:55 -0700 (PDT)
Date: Thu, 28 Aug 2025 12:12:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hariprasad Kelam <hkelam@marvell.com>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] Octeontx2-af: Fix NIX X2P calibration failures
Message-ID: <aLAdlCg2_Yv7Y-3h@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Hariprasad Kelam,

Commit d280233fc866 ("Octeontx2-af: Fix NIX X2P calibration
failures") from Aug 22, 2025 (linux-next), leads to the following
Smatch static checker warning:

	drivers/net/ethernet/marvell/octeontx2/af/cgx.c:1985 cgx_probe()
	warn: missing error code 'err'

drivers/net/ethernet/marvell/octeontx2/af/cgx.c
    1933 static int cgx_probe(struct pci_dev *pdev, const struct pci_device_id *id)
    1934 {
    1935         struct device *dev = &pdev->dev;
    1936         struct cgx *cgx;
    1937         int err, nvec;
    1938 
    1939         cgx = devm_kzalloc(dev, sizeof(*cgx), GFP_KERNEL);
    1940         if (!cgx)
    1941                 return -ENOMEM;
    1942         cgx->pdev = pdev;
    1943 
    1944         pci_set_drvdata(pdev, cgx);
    1945 
    1946         /* Use mac_ops to get MAC specific features */
    1947         if (is_dev_rpm(cgx))
    1948                 cgx->mac_ops = rpm_get_mac_ops(cgx);
    1949         else
    1950                 cgx->mac_ops = &cgx_mac_ops;
    1951 
    1952         cgx->mac_ops->rxid_map_offset = cgx_get_rxid_mapoffset(cgx);
    1953 
    1954         err = pci_enable_device(pdev);
    1955         if (err) {
    1956                 dev_err(dev, "Failed to enable PCI device\n");
    1957                 pci_set_drvdata(pdev, NULL);
    1958                 return err;
    1959         }
    1960 
    1961         err = pci_request_regions(pdev, DRV_NAME);
    1962         if (err) {
    1963                 dev_err(dev, "PCI request regions failed 0x%x\n", err);
    1964                 goto err_disable_device;
    1965         }
    1966 
    1967         err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(48));
    1968         if (err) {
    1969                 dev_err(dev, "DMA mask config failed, abort\n");
    1970                 goto err_release_regions;
    1971         }
    1972 
    1973         /* MAP configuration registers */
    1974         cgx->reg_base = pcim_iomap(pdev, PCI_CFG_REG_BAR_NUM, 0);
    1975         if (!cgx->reg_base) {
    1976                 dev_err(dev, "CGX: Cannot map CSR memory space, aborting\n");
    1977                 err = -ENOMEM;
    1978                 goto err_release_regions;
    1979         }
    1980 
    1981         if (!is_cn20k(pdev) &&
    1982             !is_cgx_mapped_to_nix(pdev->subsystem_device, cgx->cgx_id)) {
    1983                 dev_notice(dev, "CGX %d not mapped to NIX, skipping probe\n",
    1984                            cgx->cgx_id);
--> 1985                 goto err_release_regions;

error code?

    1986         }
    1987 
    1988         cgx->lmac_count = cgx->mac_ops->get_nr_lmacs(cgx);
    1989         if (!cgx->lmac_count) {
    1990                 dev_notice(dev, "CGX %d LMAC count is zero, skipping probe\n", cgx->cgx_id);
    1991                 err = -EOPNOTSUPP;
    1992                 goto err_release_regions;
    1993         }
    1994 
    1995         nvec = pci_msix_vec_count(cgx->pdev);
    1996         err = pci_alloc_irq_vectors(pdev, nvec, nvec, PCI_IRQ_MSIX);
    1997         if (err < 0 || err != nvec) {
    1998                 dev_err(dev, "Request for %d msix vectors failed, err %d\n",
    1999                         nvec, err);
    2000                 goto err_release_regions;
    2001         }
    2002 
    2003         cgx->cgx_id = (pci_resource_start(pdev, PCI_CFG_REG_BAR_NUM) >> 24)
    2004                 & CGX_ID_MASK;
    2005 
    2006         /* init wq for processing linkup requests */
    2007         INIT_WORK(&cgx->cgx_cmd_work, cgx_lmac_linkup_work);
    2008         cgx->cgx_cmd_workq = alloc_workqueue("cgx_cmd_workq", 0, 0);
    2009         if (!cgx->cgx_cmd_workq) {
    2010                 dev_err(dev, "alloc workqueue failed for cgx cmd");
    2011                 err = -ENOMEM;
    2012                 goto err_free_irq_vectors;
    2013         }
    2014 
    2015         list_add(&cgx->cgx_list, &cgx_list);
    2016 
    2017 
    2018         cgx_populate_features(cgx);
    2019 
    2020         mutex_init(&cgx->lock);
    2021 
    2022         err = cgx_lmac_init(cgx);
    2023         if (err)
    2024                 goto err_release_lmac;
    2025 
    2026         return 0;
    2027 
    2028 err_release_lmac:
    2029         cgx_lmac_exit(cgx);
    2030         list_del(&cgx->cgx_list);
    2031 err_free_irq_vectors:
    2032         pci_free_irq_vectors(pdev);
    2033 err_release_regions:
    2034         pci_release_regions(pdev);
    2035 err_disable_device:
    2036         pci_disable_device(pdev);
    2037         pci_set_drvdata(pdev, NULL);
    2038         return err;
    2039 }

regards,
dan carpenter
