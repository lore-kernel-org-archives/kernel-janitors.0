Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330B62C0281
	for <kernel-janitors@vger.kernel.org>; Wed,  3 Dec 2025 07:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764746636; cv=none; b=jDq//Q4EO26sURZ2A6j2CojGTBCsnx9akuipUbBQ3aH88PU3r2gYjgw02PCeNjDby4fldzHHwsFrLE8nC37yLlTfwTA+LC2SMZXsZ/3ktm7CpNu7beMOsMioLUJl6Ku1RPbyQvMXs9RSW2qPsC2UrIJvcnVROE43/LFGArfa+ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764746636; c=relaxed/simple;
	bh=o6Qpon3V4UMn07Qp5MniTUR+fmyxFvHFmDotfXb62G4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g1CKzm3/ujboFDiBTotRMQB0+pC28VRtQcbUCaQwfW9BNTYFiD34NC5AoSlV/INdnjUm1wncsKQLcA4WxmLN8TongYsin1gf+AZZ52Hsa8oXXgAv0eh6ealStwJ3eX/bCvc8gw2WM72vm2YZH3ZcFQLJ+syMctHzjeV1TbdbWkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VM5kfhGQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VM5kfhGQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so58621645e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Dec 2025 23:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764746632; x=1765351432; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HwHRPh7aKLuG+n2uURVmrDMdBcfe2jHBYezraS+r+IM=;
        b=VM5kfhGQfd6vNomHoue7b60+ZiaJtaVC5hFGSP5Mka516tIVZZLJazQwHxdm9anG7c
         45bXZ/5kD85jZJs4qt2p5Gaj3tnRZ+2LVIl9RQypRbvdDGfHbsAhtHarVF2GMGnfPjDq
         Wb8nS13I3LKwbhXBJuqUEyvDfPylQqOI8qRFBS7Yf5hpJR/GEksDb+RyLUeiVwEjWMD2
         llUXWAXNRAi++ZleapCbDx//0iQMoG/a0V13lUYXiq5x58ANbWlF5xsqEUseGKLAhHDT
         12tCZMRMREUwxO1zuk6/9qsMPEjvz9s4pp25eEMGp0W29LFmFqZkp1yahopAcaGVZNpg
         VOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764746632; x=1765351432;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwHRPh7aKLuG+n2uURVmrDMdBcfe2jHBYezraS+r+IM=;
        b=ln8045TdR1vVCeaQL+JIZEbMkK1juDFYrUpgWzBrYdXIMyNFlO9uNuh5oBAnQhwwJm
         2pGvjem44c5CNJc9VdSyo5tsN6h2xPJleRmHKfj9uexdaV0fAY394SGOrk58IvfJKXQ2
         AfFxnPLHyFVHLN7ogcL3t1wkGJKUkm8NL6pZzIEsGCkiy2joPn167lqZOlIjeYtZbuAu
         Cke6Oxk5xgDgH4ltLiXwgOPf94kVKq+aa3R/5Gx4xQDdk4Ru1sKV860KXZ7btL1EaEK3
         2jK1a5USfAwJvqNvMB1OjWvr2uAex3+xuuH4wr6C5CxKeMuIOai7jp0fSwx9/FdR02hD
         8bqA==
X-Gm-Message-State: AOJu0YxVHhYSABWgyOlJFLNQYDSzXiebP3JPEUk2tO/jlq3XgOjQx+bF
	qSga6pZ6IYUawOHHvh3FVRrDxUYx2pC1mbFTBhSeE+x9A/Tz6AP8sSdxGXSw0O5CRLI=
X-Gm-Gg: ASbGnctgOP8s+KRu9N8nOQGfjdif7jm6LHk0MbZFhJxtG6o27Yuf0QZA87vrecRvbK/
	2dRvmIlCyGJaWlh7e/FhISk4sMMOQ+XzYSNqFQ+TBpfXEHfaM2MX8cSarQISy68VWjoQsZ+7tof
	ILy7z8a2kOfKvo8TrVWPREV932rB2c84OwdoEZXI1IjkJjw5VU46IoTj7BPmDPXnRUGN+/6OJeM
	r/VkYuvfz7agmrMogJfye2C44ihukpuNajZj0zYbaBMhxuRw65pkjuazwtwyDedB0PH/zYlpyd/
	MADVMFX7W73HFpmXyvP5uK+NHN9rn+wztE5pPI1NFpnT3X+9erp35LbZtEj8LIz1jVLt1o+iozs
	vbHmiWMZtDfR4v9dCacQOAbn5xDwjG6MAudOijGAZmKHq8WOvzkQSPjmgdodhfpjHlWADm5tcJE
	lmM/T44cKIfOo/iLun
X-Google-Smtp-Source: AGHT+IH40LzyNAWc8pgHX2UX70NgRc2Laq7PDtdS0VdC17mCVPF1DvCn6+MqTVNVKoakktLALxO5vA==
X-Received: by 2002:a05:600c:4f89:b0:477:5c45:8100 with SMTP id 5b1f17b1804b1-4792af3dc10mr11227865e9.24.1764746632384;
        Tue, 02 Dec 2025 23:23:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4792a8ccdfbsm31229905e9.14.2025.12.02.23.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 23:23:51 -0800 (PST)
Date: Wed, 3 Dec 2025 10:23:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] net: ethernet: ti: am65-cpsw-nuss: restore vlan
 configuration while down/up
Message-ID: <aS_lhMwppbDHoEcX@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Grygorii Strashko,

Commit 7bcffde02152 ("net: ethernet: ti: am65-cpsw-nuss: restore vlan
configuration while down/up") from Jun 26, 2020 (linux-next), leads
to the following Smatch static checker warning:

	drivers/net/ethernet/ti/am65-cpsw-nuss.c:319 am65_cpsw_nuss_ndo_slave_add_vid()
	warn: duplicate zero check 'vid' (previous on line 311)

drivers/net/ethernet/ti/am65-cpsw-nuss.c
    300 static int am65_cpsw_nuss_ndo_slave_add_vid(struct net_device *ndev,
    301                                             __be16 proto, u16 vid)
    302 {
    303         struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
    304         struct am65_cpsw_port *port = am65_ndev_to_port(ndev);
    305         u32 port_mask, unreg_mcast = 0;
    306         int ret;
    307 
    308         if (!common->is_emac_mode)
    309                 return 0;
    310 
    311         if (!netif_running(ndev) || !vid)
    312                 return 0;

If vid is zero we return here.

    313 
    314         ret = pm_runtime_resume_and_get(common->dev);
    315         if (ret < 0)
    316                 return ret;
    317 
    318         port_mask = BIT(port->port_id) | ALE_PORT_HOST;
--> 319         if (!vid)
    320                 unreg_mcast = port_mask;

Which means that this is dead code.  unreg_mcast is always going to be
zero.

    321         dev_info(common->dev, "Adding vlan %d to vlan filter\n", vid);
    322         ret = cpsw_ale_vlan_add_modify(common->ale, vid, port_mask,
    323                                        unreg_mcast, port_mask, 0);
    324 
    325         pm_runtime_put(common->dev);
    326         return ret;
    327 }

regards,
dan carpenter
