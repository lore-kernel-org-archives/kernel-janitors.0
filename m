Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B77A14F98
	for <kernel-janitors@vger.kernel.org>; Fri,  9 May 2025 09:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781414; cv=none; b=hlVIvA1/Oeil8nawusaQxSmV/6O8Q8evSqEJlZVZwiya+HebKWCn3Q9XqWbCHwIyI+76XqSAQziOuJaaSxDhAIv+z9e+lHC40P1pOE92EJUOPLvTeNWk48XZjd+LXKQjtUqOaxuLhX5Qk+WF2tU2sp7gd8DoGSQk2eeXsXj9DfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781414; c=relaxed/simple;
	bh=8oIhK3lFmGOczQ4SOBu2anG/u052hy5c/AVfkctdMgs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m+UtzN9BWqgyaUQzaiL3GnJsDcoYlcSJFGSvn/N7yLTJO2AiWGeSD2g8i3vfNd4jxN4VciMDhR4lRcSUTbMRF/coyiMvYIOKMDd7C9GmGxa7sE7MnC1I9UCbH0gyEhzOStTh3pGaXJyM9JWplIxgMId438E/kLVZc+vRZq/6/n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y+W9Fd6r; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y+W9Fd6r"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a0b291093fso1830322f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 09 May 2025 02:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746781410; x=1747386210; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PC4GDng3Xm7KN9iP7gwdOCKQPn3smBo/NOl90uRt2k0=;
        b=Y+W9Fd6r83iPKdN3gaw3nqDduAbDJ7JVoGeqHKl6aDPBMtR9w6Jo8RZUd/HWOEBZ1F
         NjQzo82kQr2CvjiRFb/595fKDr+sxpk/c9eWBnA0CIjM/ZbH8ACrJV2srSvJT6qZVk4/
         OORHQl7jI+YZND0m8wA4p1g97fKp9qqTISd5D741J4LOI7GwUg7pmewvlF640zLLO3j2
         Ny+Eb+WTYl+lOCGToeffwOSivePPoS5I4IKhFku7KvG5nu1/4naafMFi7D7Y/o3ssq/x
         f25R1EFBIH/LW2gkPMgcmjffLTH50FdFqcaiHIcbiFaltPBvPmcejmqVMfOuX1wE4rph
         g4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781410; x=1747386210;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PC4GDng3Xm7KN9iP7gwdOCKQPn3smBo/NOl90uRt2k0=;
        b=L78ulJjOj/w5dWCBSpj10BccjNt3JxF6YJBSwcSA/8m/ahPBnrU1YfUuJzy5+VkD6e
         c7DAu8erCIqlRu7b85GOl7/NnxBMHuIN+jcEupDba+L20l3OA5wetCTIPXlxp2+q0Qhz
         L2p7waVIB90HohowGPBaiBCr27g7ujDf2mAjbfnhuzYvRf/DwS2tBdUdf83v1FwE9ZYN
         CF5a7DO1jNhuZ6AtxpgE7FjZFjztoSgJ1d0rB0VUkKFFLMXRMXMYfWrWWsc78npem8jh
         tyb0dL3RrRKy5H76zFoVRZEqHFO5Q9Dt02BY+ebMrPQCFZTMnTpP8u6XA0z+bNVAvkgw
         aVcA==
X-Gm-Message-State: AOJu0Ywq/0h94oWkQpKHo2/3EGe7Olc0FKtFWcNyoqodDtraQqdgcSth
	X3NxoWzoYyQm/4LoXg+3/igHuxc3dkBt5+QnSKpyBBTNpzmut1UHk8CPGOCCAiU=
X-Gm-Gg: ASbGncvsvNKllbGZYYcoRCcVXQK1q862BCuL7QnEaAEpe8ecP92XsrFq5mVmQhn1uhd
	k4H1p3c4Nkd3hvuYAdxXDCrx667IuCmV6yvjhIu6YuL6RTs3jbz0WnZm3CSFMHm6YMOto/YFQrV
	13LwePU3gnHx4PF625b3vyP+ilHqSu9Zk7UwxxU3N/bPbem0I7mq37CLgmXny22ynHGsKrzNDFx
	HPy1OoNKfCkiJNpfIVg1/2akdsnvP/zTv4GRaxgxncpHLN7CGYEzVPSkIf2lr4IAsqkA3j/+iFO
	eMcMyTDw1Gq7nFJM9EvsDmZ0eXsmWKXyOZPnmHvIxpx2gblpH2F8Pdzl
X-Google-Smtp-Source: AGHT+IFyhNE3vu7SzRJOyGboag+h3ZymVjsGvIlXYA/wJB8L6p4nb9WV80NAapnRTMd3gD/LylfjTA==
X-Received: by 2002:a05:6000:144f:b0:39c:30f7:b6ad with SMTP id ffacd0b85a97d-3a1f6c984a1mr2254143f8f.18.1746781410323;
        Fri, 09 May 2025 02:03:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f5a4cc2esm2635114f8f.90.2025.05.09.02.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 02:03:29 -0700 (PDT)
Date: Fri, 9 May 2025 12:03:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] net: usb: lan78xx: refactor PHY init to separate
 detection and MAC configuration
Message-ID: <aB3E3qDVOHu6zBI-@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Oleksij Rempel,

Commit d39f339d2603 ("net: usb: lan78xx: refactor PHY init to
separate detection and MAC configuration") from May 5, 2025
(linux-next), leads to the following Smatch static checker warning:

	drivers/net/usb/lan78xx.c:2842 lan78xx_phy_init()
	warn: missing unwind goto?

drivers/net/usb/lan78xx.c
    2805 static int lan78xx_phy_init(struct lan78xx_net *dev)
    2806 {
    2807         __ETHTOOL_DECLARE_LINK_MODE_MASK(fc) = { 0, };
    2808         int ret;
    2809         u32 mii_adv;
    2810         struct phy_device *phydev;
    2811 
    2812         phydev = lan78xx_get_phy(dev);
    2813         if (IS_ERR(phydev))
    2814                 return PTR_ERR(phydev);
    2815 
    2816         ret = lan78xx_mac_prepare_for_phy(dev);
    2817         if (ret < 0)
    2818                 goto free_phy;
    2819 
    2820         /* if phyirq is not set, use polling mode in phylib */
    2821         if (dev->domain_data.phyirq > 0)
    2822                 phydev->irq = dev->domain_data.phyirq;
    2823         else
    2824                 phydev->irq = PHY_POLL;
    2825         netdev_dbg(dev->net, "phydev->irq = %d\n", phydev->irq);
    2826 
    2827         /* set to AUTOMDIX */
    2828         phydev->mdix = ETH_TP_MDI_AUTO;
    2829 
    2830         ret = phy_connect_direct(dev->net, phydev,
    2831                                  lan78xx_link_status_change,
    2832                                  dev->interface);
    2833         if (ret) {
    2834                 netdev_err(dev->net, "can't attach PHY to %s\n",
    2835                            dev->mdiobus->id);
    2836                 if (dev->chipid == ID_REV_CHIP_ID_7801_) {
    2837                         if (phy_is_pseudo_fixed_link(phydev)) {
    2838                                 fixed_phy_unregister(phydev);
    2839                                 phy_device_free(phydev);
    2840                         }
    2841                 }

Why does this error path only cleanup for ID_REV_CHIP_ID_7801_ where the
others do it unconditionally?

--> 2842                 return -EIO;
    2843         }
    2844 
    2845         /* MAC doesn't support 1000T Half */
    2846         phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_1000baseT_Half_BIT);
    2847 
    2848         /* support both flow controls */
    2849         dev->fc_request_control = (FLOW_CTRL_RX | FLOW_CTRL_TX);
    2850         linkmode_clear_bit(ETHTOOL_LINK_MODE_Pause_BIT,
    2851                            phydev->advertising);
    2852         linkmode_clear_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT,
    2853                            phydev->advertising);
    2854         mii_adv = (u32)mii_advertise_flowctrl(dev->fc_request_control);
    2855         mii_adv_to_linkmode_adv_t(fc, mii_adv);
    2856         linkmode_or(phydev->advertising, fc, phydev->advertising);
    2857 
    2858         phy_support_eee(phydev);
    2859 
    2860         ret = lan78xx_configure_leds_from_dt(dev, phydev);
    2861         if (ret)
    2862                 goto free_phy;
    2863 
    2864         genphy_config_aneg(phydev);
    2865 
    2866         dev->fc_autoneg = phydev->autoneg;
    2867 
    2868         return 0;
    2869 
    2870 free_phy:
    2871         if (phy_is_pseudo_fixed_link(phydev)) {
    2872                 fixed_phy_unregister(phydev);
    2873                 phy_device_free(phydev);
    2874         }
    2875 
    2876         return ret;
    2877 }

regards,
dan carpenter
