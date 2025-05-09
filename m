Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616A629116A
	for <kernel-janitors@vger.kernel.org>; Fri,  9 May 2025 12:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746795255; cv=none; b=l5gzH5UADpkQKacxjZlDagpqkHMCz+Rw7ctESO0nOEKYtHS8vGyeFjC2AAGz3mVldPaLVfxYxcdyB3eKrEtSwlIBEiOdv6PtsGz8G8lI52ATI/o/nAMUztiWbTU7q+2CUnwUm6x2njgWEzWkGKgV3XhAZAPBGO5avOXyavBnU7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746795255; c=relaxed/simple;
	bh=jCvLiKDBVrY7WhfqZ7vj3Wj0AsNRlu7MvCd39Ug/Qfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4nAedfvro2LY40UFSt6dMHbRnfneS9+HWYj5QD0B32khoIKSTfdHAVX5UNJcPx3LhRhQ5QF73k9o3j2zm4eYbR0Iw1InbFYOdi6QSCf7hUXZ6887xhfRgc0Is8/zYXhECoCkh36LQu18qL/fZlDlaEBup3SDcDgpjxnvB5lpEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LZtT6A21; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LZtT6A21"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a1fa0d8884so350527f8f.3
        for <kernel-janitors@vger.kernel.org>; Fri, 09 May 2025 05:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746795251; x=1747400051; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5p9hjrbIFYrH+im9JYFPC1IjA/TkM8LxznrYikn7MA4=;
        b=LZtT6A21VfrSyFgsWL1NEDYyp631DTSzvdiY5y8nEVx9NTCw1uouW6aieKW1vlKV9S
         OgGXoUpHmAZsOX/N3/73ssfg1R+fc9l6m5DzfKyNzD6DN17ZuFby2wYGEcaJjr24mIyO
         wXOUFLqbPmfN6EtM/Sq/ZKU1EdEKYcH17U8qTUCfUs5JzmpqxDNSaJw+wLZ7zP37JguF
         btmLscrxHxBahk5cWChpwwdZ/yWo2Ne46NBZSuAWrZF1eWnjcc1KSPcyE8fof4k4pTjR
         iXAbDakDtB2kMVelABMLIRFc/9Y9aWBlZAIlY5UhVEiZ44Ra2PbNzRhDLJuucr+BN+8F
         fNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746795251; x=1747400051;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5p9hjrbIFYrH+im9JYFPC1IjA/TkM8LxznrYikn7MA4=;
        b=uruQmXYhuGrb9hc7gRobIny1VlakWFkN/AL6+bh57j/k6T8rB1b/M//cYHVwgg9VJI
         MErpaaRG8oJFtIhMk8cfCUx+ky5cWRMa4SMTPPwG0Zp1a/pDKzq4euMDl2RA7vUWQpko
         xFRDOdpQCbxO99B+5yfqsEcKWm1bJ+M3ZcVOHXE+Hi7Iw1AJDQm8Wa9DPWjqcbkoyVIY
         fpiXsMxf76dPed9iFx/VO4+iTRcEyS3FF8jGkC20B+TrEGdXX8XL/FxizF3c+1nEtoPO
         az2rwsCITqIGKQJKLzqhJ3Uq1v7+dmUlBSRZwStdVY6rlxLJupxR/1CTz62zEh+tYF2p
         /4eg==
X-Gm-Message-State: AOJu0Ywyl3CvMjsUUYabpqP5Sxr8g487pIkoxqGlQsMF4OVB6cAJwcle
	KqDcIc/QwVet5VYBhBKmiW1/QDEdELlOu5hQr6q50Hacf7cW58tsyUDk4GFEqPJRlyBWfARgK1/
	1
X-Gm-Gg: ASbGncv+Y0t1thUIA07BJGPvLzyEbdk0XD1fes7X299uUA5DSdo4pOdLUZV0E0O+Fee
	SA062/yCc3TQws8+eiuqHZjxGtvI77pPzd11S352rBNtUKc6dTgqJ+Sfo+AlVmAfvVajhAhvqc/
	RSYdI4FcnZzwL3/LZGQMgW1hpxmI+IxqghQGRf2x9a3b2/TR6gGyJYb8xPAiYQZWVBqM5Ft6c4T
	qnZsvBVYuwLusrRtfV+zvaNY2pwJDivE0iywZoOvmAdFpNlp7IZTGGoCNfasTgwJeszcICcYAn1
	9uUDJmLo8pG6poKY811EUvFY300nvzYvIDZPxq4IcP5m4w==
X-Google-Smtp-Source: AGHT+IGN/h3ySaynydD/+H2o+/taaGnWRBx/kBXGgc+T+XaB/tHtMChCtfnOP4rk38pj3rS+z6JsWA==
X-Received: by 2002:a05:6000:1449:b0:3a0:8442:2c48 with SMTP id ffacd0b85a97d-3a1f64a48ecmr2295110f8f.44.1746795251507;
        Fri, 09 May 2025 05:54:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f5a4c5a4sm3127094f8f.81.2025.05.09.05.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 05:54:11 -0700 (PDT)
Date: Fri, 9 May 2025 15:54:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: kernel-janitors@vger.kernel.org
Subject: Re: [bug report] net: usb: lan78xx: refactor PHY init to separate
 detection and MAC configuration
Message-ID: <aB367-jQMalNTDAr@stanley.mountain>
References: <aB3E3qDVOHu6zBI-@stanley.mountain>
 <aB34YNRx4uV9MaBL@pengutronix.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aB34YNRx4uV9MaBL@pengutronix.de>

On Fri, May 09, 2025 at 02:43:12PM +0200, Oleksij Rempel wrote:
> On Fri, May 09, 2025 at 12:03:26PM +0300, Dan Carpenter wrote:
> > Hello Oleksij Rempel,
> > 
> > Commit d39f339d2603 ("net: usb: lan78xx: refactor PHY init to
> > separate detection and MAC configuration") from May 5, 2025
> > (linux-next), leads to the following Smatch static checker warning:
> > 
> > 	drivers/net/usb/lan78xx.c:2842 lan78xx_phy_init()
> > 	warn: missing unwind goto?
> > 
> > drivers/net/usb/lan78xx.c
> >     2805 static int lan78xx_phy_init(struct lan78xx_net *dev)
> >     2806 {
> >     2807         __ETHTOOL_DECLARE_LINK_MODE_MASK(fc) = { 0, };
> >     2808         int ret;
> >     2809         u32 mii_adv;
> >     2810         struct phy_device *phydev;
> >     2811 
> >     2812         phydev = lan78xx_get_phy(dev);
> >     2813         if (IS_ERR(phydev))
> >     2814                 return PTR_ERR(phydev);
> >     2815 
> >     2816         ret = lan78xx_mac_prepare_for_phy(dev);
> >     2817         if (ret < 0)
> >     2818                 goto free_phy;
> >     2819 
> >     2820         /* if phyirq is not set, use polling mode in phylib */
> >     2821         if (dev->domain_data.phyirq > 0)
> >     2822                 phydev->irq = dev->domain_data.phyirq;
> >     2823         else
> >     2824                 phydev->irq = PHY_POLL;
> >     2825         netdev_dbg(dev->net, "phydev->irq = %d\n", phydev->irq);
> >     2826 
> >     2827         /* set to AUTOMDIX */
> >     2828         phydev->mdix = ETH_TP_MDI_AUTO;
> >     2829 
> >     2830         ret = phy_connect_direct(dev->net, phydev,
> >     2831                                  lan78xx_link_status_change,
> >     2832                                  dev->interface);
> >     2833         if (ret) {
> >     2834                 netdev_err(dev->net, "can't attach PHY to %s\n",
> >     2835                            dev->mdiobus->id);
> >     2836                 if (dev->chipid == ID_REV_CHIP_ID_7801_) {
> >     2837                         if (phy_is_pseudo_fixed_link(phydev)) {
> >     2838                                 fixed_phy_unregister(phydev);
> >     2839                                 phy_device_free(phydev);
> >     2840                         }
> >     2841                 }
> > 
> > Why does this error path only cleanup for ID_REV_CHIP_ID_7801_ where the
> > others do it unconditionally?
> 
> This chip-specific condition in the cleanup can be used, but it’s not
> strictly necessary - none of the variants introduce regressions. The
> non-conditional cleanup actually matches the logic already used in
> lan78xx_disconnect(), where phy_is_pseudo_fixed_link() is checked
> unconditionally.
> 
> That said, the purpose of this patch set is to prepare for migration to
> phylink, where pseudo fixed links won’t be used at all. Due to the
> 10-patch limit, I’ve split the changes - the patch that removes pseudo
> fixed-link support entirely will follow.
> 
> Nevertheless, I can send a cleanup patch that unconditionally jumps to
> free_phy on phy_connect_direct() failure for consistency and clarity.
> Should I?

Don't do anything on my account.  These messages are only intended to be
helpful, so ignore them when they're not.  People with questions know to
look it up on lore and they will find this thread.

regards,
dan carpenter
