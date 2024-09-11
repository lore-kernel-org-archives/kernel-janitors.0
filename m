Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8161537C9
	for <kernel-janitors@vger.kernel.org>; Wed, 11 Sep 2024 11:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055551; cv=none; b=VeATwPwBC2+RMyhJj8GW/DVgSjibMrSPU+dZES9TzMErtuI/3HBg5vcpCpsUSgJpsGMDzN2t2v+NBEN3u0GPi+3iqd++KJoqwA2A9xS3F2hsL8Ua9P67OTnIj2xO/p+0v8TWfbAQV4EbiTVt6tDnJjawZS+/arNphUU7YoV4Bks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055551; c=relaxed/simple;
	bh=Q78DboQBzEUAhInyKRbusVheissmcYF52CN3UtKGQmc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H2Ov2SQxJ88pu/0H5bfwI2dIfwxGDI0Rx/q8k2nQus/vLPD230S6WLguB8fQ2PaukNClQ8ZxpjYXFFYC6z8BjLZ7lzQ7uqArOMwaJHqwqqNPTPUDgJyiDYTL1dAdW1NYSVMknrHbWywK9TN377qzB2I7O2xRRJHn7qc3oUBtVeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=MfFc1DXa; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="MfFc1DXa"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 48BBqMXf93688845, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1726055543; bh=Q78DboQBzEUAhInyKRbusVheissmcYF52CN3UtKGQmc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=MfFc1DXa6ok0oqd51odTWDPdmta1loqQ0WCKKKEKquTS9RwuF2MhNMqOj1sr9tanO
	 I92el2OKnftw3a3cdQMwiq9fwbCZfhwSdKc0oLMSjYrPoRsbJAT1JmBt3pQT1bOmrs
	 4KzONACUu7qKYMttJSHD6tdZYCGUruaUCbH7Q8YLlkZguzrLUpS9M1C8KsWl58SsRN
	 g0BWRRxU0YL1hhnDGH012QpfDTqaWqxaJGBuYaifIorGtogwFEnEwVs+BeToWC3tho
	 YoPmomO9MR8PIEQ9p2XzONKA62xSlFKwaOSsBHPNs4ZSZYRiu72BrHRW0G8WxnHjrm
	 Tt/6UdfSCc87w==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 48BBqMXf93688845
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 19:52:22 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.95) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 19:52:23 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 11 Sep 2024 19:52:22 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f]) by
 RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f%11]) with mapi id
 15.01.2507.035; Wed, 11 Sep 2024 19:52:22 +0800
From: Justin Lai <justinlai0215@realtek.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [bug report] rtase: Add support for a pci table in this module
Thread-Topic: [bug report] rtase: Add support for a pci table in this module
Thread-Index: AQHbBB0o9wt4eDZvokm/jT2wCPqzNrJSdyOg
Date: Wed, 11 Sep 2024 11:52:22 +0000
Message-ID: <2817f1c2fc91441a9e64d7fbf16fb1b2@realtek.com>
References: <7df38a5a-761c-409c-90bf-5ac264ed5a1a@stanley.mountain>
In-Reply-To: <7df38a5a-761c-409c-90bf-5ac264ed5a1a@stanley.mountain>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-kse-serverinfo: RTEXMBS02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback

> Hello Justin Lai,
>=20
> Commit a36e9f5cfe9e ("rtase: Add support for a pci table in this
> module") from Sep 4, 2024 (linux-next), leads to the following Smatch
> static checker warning:
>=20
> drivers/net/ethernet/realtek/rtase/rtase_main.c:2185 rtase_init_one()
> warn: inconsistent refcounting 'pdev->enable_cnt.counter':
>   inc on: 2108
>   dec on: 2185
>=20
> drivers/net/ethernet/realtek/rtase/rtase_main.c
>     2081 static int rtase_init_one(struct pci_dev *pdev,
>     2082                           const struct pci_device_id *ent)
>     2083 {
>     2084         struct net_device *dev =3D NULL;
>     2085         struct rtase_int_vector *ivec;
>     2086         void __iomem *ioaddr =3D NULL;
>     2087         struct rtase_private *tp;
>     2088         int ret, i;
>     2089
>     2090         if (!pdev->is_physfn && pdev->is_virtfn) {
>     2091                 dev_err(&pdev->dev,
>     2092                         "This module does not support a
> virtual function.");
>     2093                 return -EINVAL;
>     2094         }
>     2095
>     2096         dev_dbg(&pdev->dev, "Automotive Switch Ethernet driver
> loaded\n");
>     2097
>     2098         ret =3D rtase_init_board(pdev, &dev, &ioaddr);
>     2099         if (ret !=3D 0)
>     2100                 return ret;
>     2101
>     2102         tp =3D netdev_priv(dev);
>     2103         tp->mmio_addr =3D ioaddr;
>     2104         tp->dev =3D dev;
>     2105         tp->pdev =3D pdev;
>     2106
>     2107         /* identify chip attached to board */
>     2108         if (!rtase_check_mac_version_valid(tp))
>     2109                 return dev_err_probe(&pdev->dev, -ENODEV,
>     2110                                      "unknown chip version,
> contact rtase maintainers (see MAINTAINERS file)\n");
>=20
> The static checker wants this error path to do some cleanup.
>=20
>     2111
>     2112         rtase_init_software_variable(pdev, tp);
>     2113         rtase_init_hardware(tp);
>     2114
>     2115         ret =3D rtase_alloc_interrupt(pdev, tp);
>     2116         if (ret < 0) {
>     2117                 dev_err(&pdev->dev, "unable to alloc
> MSIX/MSI\n");
>     2118                 goto err_out_1;
>     2119         }
>     2120
>     2121         rtase_init_netdev_ops(dev);
>     2122
>     2123         dev->pcpu_stat_type =3D NETDEV_PCPU_STAT_TSTATS;
>     2124
>     2125         dev->features |=3D NETIF_F_HW_VLAN_CTAG_TX |
> NETIF_F_HW_VLAN_CTAG_RX |
>     2126                          NETIF_F_IP_CSUM |
> NETIF_F_HIGHDMA |
>     2127                          NETIF_F_RXCSUM | NETIF_F_SG |
>     2128                          NETIF_F_TSO | NETIF_F_IPV6_CSUM
> |
>     2129                          NETIF_F_TSO6;
>     2130
>     2131         dev->hw_features =3D NETIF_F_SG | NETIF_F_IP_CSUM |
>     2132                            NETIF_F_TSO | NETIF_F_RXCSUM
> |
>     2133                            NETIF_F_HW_VLAN_CTAG_TX |
> NETIF_F_HW_VLAN_CTAG_RX |
>     2134                            NETIF_F_RXALL | NETIF_F_RXFCS
> |
>     2135                            NETIF_F_IPV6_CSUM |
> NETIF_F_TSO6;
>     2136
>     2137         dev->vlan_features =3D NETIF_F_SG | NETIF_F_IP_CSUM |
> NETIF_F_TSO |
>     2138                              NETIF_F_HIGHDMA;
>     2139         dev->priv_flags |=3D IFF_LIVE_ADDR_CHANGE;
>     2140         netif_set_tso_max_size(dev, RTASE_LSO_64K);
>     2141         netif_set_tso_max_segs(dev,
> RTASE_NIC_MAX_PHYS_BUF_COUNT_LSO2);
>     2142
>     2143         rtase_get_mac_address(dev);
>     2144
>     2145         tp->tally_vaddr =3D dma_alloc_coherent(&pdev->dev,
>     2146
> sizeof(*tp->tally_vaddr),
>     2147
> &tp->tally_paddr,
>     2148
> GFP_KERNEL);
>     2149         if (!tp->tally_vaddr) {
>     2150                 ret =3D -ENOMEM;
>     2151                 goto err_out;
>     2152         }
>     2153
>     2154         rtase_tally_counter_clear(tp);
>     2155
>     2156         pci_set_drvdata(pdev, dev);
>     2157
>     2158         netif_carrier_off(dev);
>     2159
>     2160         ret =3D register_netdev(dev);
>     2161         if (ret !=3D 0)
>     2162                 goto err_out;
>     2163
>     2164         netdev_dbg(dev, "%pM, IRQ %d\n", dev->dev_addr,
> dev->irq);
>     2165
>     2166         return 0;
>     2167
>     2168 err_out:
>     2169         if (tp->tally_vaddr) {
>     2170                 dma_free_coherent(&pdev->dev,
>     2171                                   sizeof(*tp->tally_vaddr),
>     2172                                   tp->tally_vaddr,
>     2173                                   tp->tally_paddr);
>     2174
>     2175                 tp->tally_vaddr =3D NULL;
>     2176         }
>     2177
>     2178 err_out_1:
>     2179         for (i =3D 0; i < tp->int_nums; i++) {
>     2180                 ivec =3D &tp->int_vector[i];
>     2181                 netif_napi_del(&ivec->napi);
>     2182         }
>     2183
>     2184         rtase_release_board(pdev, dev, ioaddr);
> --> 2185
>     2186         return ret;
>     2187 }
>=20
> regards,
> dan carpenter

Thank you for pointing out this warning. I will look into it and submit
a revised patch to resolve the issue.

Thanks
Justin
