Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA1113A3F7
	for <kernel-janitors@vger.kernel.org>; Wed, 11 Sep 2024 07:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726040118; cv=none; b=J9WBKSoEpR7s/cErKMh689Fki5ftstorSACxU8BvqoOUCvXIbDDS65aLVk2E6MWuGPXuKQqQlQ87c91IEFAFp8256a0btmy5sepGlvs4enYeHAuZs6tJN2oQh1GH1XneJsIdU3N1mALCfoA056EcMIcl02HLEqP4p/lNIOtIaAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726040118; c=relaxed/simple;
	bh=nQmq7VkgcVU3sxzdfrwtJZx9fzJEFpAmynfuFhaLMww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ibZph7I5B9WoeAq6eo5acc4u5kmRkQq/EN0TYaJoWhxR3VBWV1S9ZEJQXGOX5vapu5lyaWwPIsikF0w8g3hLwOMyTF8sRwbBF/PqBEJ/hzAzsCkWi4/oovCN9tpC6l/xKQP+5mfSp+dusiHz1cqpb+EHoNpwO7tNKsoKT5uavtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TCUKYpqe; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TCUKYpqe"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so28621595e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Sep 2024 00:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726040115; x=1726644915; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MUTWz8H8Tz2LMT6jhiMgaAcLsjgnM5k3iEXbMv49Vgs=;
        b=TCUKYpqeaOP/gJb1f7fO29MT4iVXiUu+lNt829uOXeNOYKpCZUO/Y5m9tM+BlnDhrs
         EQYFe83v7GUVZh3Sqy3oKoEhwtKTaVqDUf5dxxer5Qh2CicuRls7WnAObwaIaLPIsaCw
         xOUAYiJlB/2k++8yvHFvIiN1100cNKRg0EdC2/Sjfuhk6kbkSoZXt2ENrNmBnwEsBw1y
         dDYXM5dYEUVBOA/jvZOkETTH/+kiEQ8TyTHC+GrrPEM/Cmj2+UROcsO0xAZmOHvbMjin
         may0si1hiwt8z7sh+E9/HU24qM75etJuZ/JGxfgHsphWm3Zp/Rwfg/uDjP6wjZIgCPCf
         oItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726040115; x=1726644915;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUTWz8H8Tz2LMT6jhiMgaAcLsjgnM5k3iEXbMv49Vgs=;
        b=Vs59KrMdHpyuXZsulxveV6g/2gEntoWAfzczR1wJDsv8yTE72jE+MUHhNUa/MwA4sU
         X3NQv2doNcJVQa4f436vRV1DBgw7qSOngA5JdZNkWGDZjHAslyga0uurYti63e4OZte2
         buhE56z/uKon47koE2H3PgIBCrRestjr3XpiYxZ6MTj5+M1+s1s5gA+7PGQOu8iICCPf
         1vBfKPVrKVmclu4Frz4eTFLj8h9hthd0+uE0sEBAqerllQauM382knOvibu++y7AiUCB
         J/0YJ5qMNoWY/rWWia9QeRctOfwOuYNUXLe68KD0NOvZp77G6sOlozqAJBQQT6jnUCa0
         DSpg==
X-Gm-Message-State: AOJu0YwZN06mtxiqbTC17G4/+PeGfBxC/R7y7LgWTJeP0v7RH8yphVhH
	KPGop1UA8zRhuEfX6iTcObxx2THxJ4uigy41fhx0xK8DdmxRKjV3l7xFDeVuia4=
X-Google-Smtp-Source: AGHT+IEXdh3VOQbERbctB/+VRwxHaPy47lwhldsNprQakXUrLbELoU9PyEfR50TxBXILRwnl40y7Ow==
X-Received: by 2002:a05:600c:5114:b0:42c:bb41:a05a with SMTP id 5b1f17b1804b1-42cbb41a16cmr61534835e9.34.1726040114760;
        Wed, 11 Sep 2024 00:35:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956650f2sm10717147f8f.26.2024.09.11.00.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:35:14 -0700 (PDT)
Date: Wed, 11 Sep 2024 10:35:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Justin Lai <justinlai0215@realtek.com>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] rtase: Add support for a pci table in this module
Message-ID: <7df38a5a-761c-409c-90bf-5ac264ed5a1a@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Justin Lai,

Commit a36e9f5cfe9e ("rtase: Add support for a pci table in this
module") from Sep 4, 2024 (linux-next), leads to the following Smatch
static checker warning:

drivers/net/ethernet/realtek/rtase/rtase_main.c:2185 rtase_init_one()
warn: inconsistent refcounting 'pdev->enable_cnt.counter':
  inc on: 2108
  dec on: 2185

drivers/net/ethernet/realtek/rtase/rtase_main.c
    2081 static int rtase_init_one(struct pci_dev *pdev,
    2082                           const struct pci_device_id *ent)
    2083 {
    2084         struct net_device *dev = NULL;
    2085         struct rtase_int_vector *ivec;
    2086         void __iomem *ioaddr = NULL;
    2087         struct rtase_private *tp;
    2088         int ret, i;
    2089 
    2090         if (!pdev->is_physfn && pdev->is_virtfn) {
    2091                 dev_err(&pdev->dev,
    2092                         "This module does not support a virtual function.");
    2093                 return -EINVAL;
    2094         }
    2095 
    2096         dev_dbg(&pdev->dev, "Automotive Switch Ethernet driver loaded\n");
    2097 
    2098         ret = rtase_init_board(pdev, &dev, &ioaddr);
    2099         if (ret != 0)
    2100                 return ret;
    2101 
    2102         tp = netdev_priv(dev);
    2103         tp->mmio_addr = ioaddr;
    2104         tp->dev = dev;
    2105         tp->pdev = pdev;
    2106 
    2107         /* identify chip attached to board */
    2108         if (!rtase_check_mac_version_valid(tp))
    2109                 return dev_err_probe(&pdev->dev, -ENODEV,
    2110                                      "unknown chip version, contact rtase maintainers (see MAINTAINERS file)\n");

The static checker wants this error path to do some cleanup.

    2111 
    2112         rtase_init_software_variable(pdev, tp);
    2113         rtase_init_hardware(tp);
    2114 
    2115         ret = rtase_alloc_interrupt(pdev, tp);
    2116         if (ret < 0) {
    2117                 dev_err(&pdev->dev, "unable to alloc MSIX/MSI\n");
    2118                 goto err_out_1;
    2119         }
    2120 
    2121         rtase_init_netdev_ops(dev);
    2122 
    2123         dev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
    2124 
    2125         dev->features |= NETIF_F_HW_VLAN_CTAG_TX | NETIF_F_HW_VLAN_CTAG_RX |
    2126                          NETIF_F_IP_CSUM | NETIF_F_HIGHDMA |
    2127                          NETIF_F_RXCSUM | NETIF_F_SG |
    2128                          NETIF_F_TSO | NETIF_F_IPV6_CSUM |
    2129                          NETIF_F_TSO6;
    2130 
    2131         dev->hw_features = NETIF_F_SG | NETIF_F_IP_CSUM |
    2132                            NETIF_F_TSO | NETIF_F_RXCSUM |
    2133                            NETIF_F_HW_VLAN_CTAG_TX | NETIF_F_HW_VLAN_CTAG_RX |
    2134                            NETIF_F_RXALL | NETIF_F_RXFCS |
    2135                            NETIF_F_IPV6_CSUM | NETIF_F_TSO6;
    2136 
    2137         dev->vlan_features = NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_TSO |
    2138                              NETIF_F_HIGHDMA;
    2139         dev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
    2140         netif_set_tso_max_size(dev, RTASE_LSO_64K);
    2141         netif_set_tso_max_segs(dev, RTASE_NIC_MAX_PHYS_BUF_COUNT_LSO2);
    2142 
    2143         rtase_get_mac_address(dev);
    2144 
    2145         tp->tally_vaddr = dma_alloc_coherent(&pdev->dev,
    2146                                              sizeof(*tp->tally_vaddr),
    2147                                              &tp->tally_paddr,
    2148                                              GFP_KERNEL);
    2149         if (!tp->tally_vaddr) {
    2150                 ret = -ENOMEM;
    2151                 goto err_out;
    2152         }
    2153 
    2154         rtase_tally_counter_clear(tp);
    2155 
    2156         pci_set_drvdata(pdev, dev);
    2157 
    2158         netif_carrier_off(dev);
    2159 
    2160         ret = register_netdev(dev);
    2161         if (ret != 0)
    2162                 goto err_out;
    2163 
    2164         netdev_dbg(dev, "%pM, IRQ %d\n", dev->dev_addr, dev->irq);
    2165 
    2166         return 0;
    2167 
    2168 err_out:
    2169         if (tp->tally_vaddr) {
    2170                 dma_free_coherent(&pdev->dev,
    2171                                   sizeof(*tp->tally_vaddr),
    2172                                   tp->tally_vaddr,
    2173                                   tp->tally_paddr);
    2174 
    2175                 tp->tally_vaddr = NULL;
    2176         }
    2177 
    2178 err_out_1:
    2179         for (i = 0; i < tp->int_nums; i++) {
    2180                 ivec = &tp->int_vector[i];
    2181                 netif_napi_del(&ivec->napi);
    2182         }
    2183 
    2184         rtase_release_board(pdev, dev, ioaddr);
--> 2185 
    2186         return ret;
    2187 }

regards,
dan carpenter
