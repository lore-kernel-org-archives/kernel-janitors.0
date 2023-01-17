Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8068C3DA78
	for <kernel-janitors@archiver.kernel.org>; Tue, 17 Jan 2023 03:46:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235375AbjAQDqj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 16 Jan 2023 22:46:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235351AbjAQDqg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 16 Jan 2023 22:46:36 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 859E021A2F
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Jan 2023 19:46:35 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id k16so637088wms.2
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Jan 2023 19:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gJn/O28lbGbzVsDG0WuKpwhuDnPUHnwni95l0uLD3VU=;
        b=VtZSUwhm0ThEtI6ftIGjxK+ID3vujo+HquLBvJA6Rpddtd6lMICmvQpzDQpZbVwkfL
         eXpvFGEz6PSuVfejuj2IbTPm+dvc7iVuyUyGyb6635e5pmCvTVYPR17Kj1PlM/LuTOEz
         gB4s0tcELigTxBamlWZClXFbRZ5ro1KuV3wbt14A3xKoFBnpkGQ02N/GqgSp4fMEdqrz
         42Czd+6/hiqc5oEvhVvRxOZZcpGUbFGrDErOFnCeUsIeJDTHwxg5nVd4fJIzhuG7qyrF
         pWmRuv2sBdeXkwX+l9Aw4BhrX8plUsQ7V5emRSJf24dbwBChrj3yqOajjWvjv4Xh4HZj
         N19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJn/O28lbGbzVsDG0WuKpwhuDnPUHnwni95l0uLD3VU=;
        b=CVeJL70XllHFyVY+xPA6rACnY3InlqRHLEogZg4fuliKDw8iTp3oWpVOmIDZp6XsVl
         jHT8cZsgkCC8NMdKicc/fPLfwMuXT63Zffq20eXx122ncK1EvLFz7qFibDyydFstboci
         Mn0HC2727qT+Oc6l/WUPh1bLF1tPEzP2sqtOCcSd7YdFYsZ0cNVOSaG/kw/L/nM1g8LE
         QpgBuphFx4mZOcn4C8UpTDnp0KbkHxDkCc7was1Hc6Q1XpGS28cBDNo/q0sNhYpU6JiC
         y0jbDXbtqrivZjX5Ls0IDLJICd6o5mcBwxBJfShRoq9lPzPSaP2cq7QqnVPoyE+7IDgx
         kA1w==
X-Gm-Message-State: AFqh2koGyi/aHjROGAEw+T0Gys9gFWDntuY2PaU9EQyD8TfUgGvQD1dA
        7GnkWB42W/Ba4CSZFdv+2ACPXsITQj4=
X-Google-Smtp-Source: AMrXdXsJqbNg/coqFbjJ4fFazF/b6dsFej8tMUoyPWobUihq76p/b5k2BqKP6kWzB3mi5wx1RsuywQ==
X-Received: by 2002:a05:600c:4d81:b0:3d0:6c60:b4d1 with SMTP id v1-20020a05600c4d8100b003d06c60b4d1mr1555499wmp.6.1673927193870;
        Mon, 16 Jan 2023 19:46:33 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p21-20020a7bcc95000000b003c65c9a36dfsm34596980wma.48.2023.01.16.19.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 19:46:33 -0800 (PST)
Date:   Tue, 17 Jan 2023 06:46:29 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] drivers/net/phy: add helpers to get/set PLCA
 configuration
Message-ID: <Y8YaFQdz4yMkuk3k@kadam>
References: <Y8UiT9AKQIqz1zxr@kili>
 <Y8XZvO6FC0QKycDE@gvm01>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8XZvO6FC0QKycDE@gvm01>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jan 17, 2023 at 12:11:56AM +0100, Piergiorgio Beruto wrote:
> On Mon, Jan 16, 2023 at 01:09:19PM +0300, Dan Carpenter wrote:
> > Hello Piergiorgio Beruto,
> > 
> > The patch 493323416fed: "drivers/net/phy: add helpers to get/set PLCA
> > configuration" from Jan 9, 2023, leads to the following Smatch static
> > checker warning:
> > 
> > 	drivers/net/phy/phy-c45.c:1036 genphy_c45_plca_set_cfg()
> > 	error: uninitialized symbol 'val'.
> > 
> > drivers/net/phy/phy-c45.c
> >    999  int genphy_c45_plca_set_cfg(struct phy_device *phydev,
> >   1000                              const struct phy_plca_cfg *plca_cfg)
> >   1001  {
> >   1002          int ret;
> >   1003          u16 val;
> >   1004  
> >   1005          // PLCA IDVER is read-only
> >   1006          if (plca_cfg->version >= 0)
> >   1007                  return -EINVAL;
> >   1008  
> >   1009          // first of all, disable PLCA if required
> >   1010          if (plca_cfg->enabled == 0) {
> >   1011                  ret = phy_clear_bits_mmd(phydev, MDIO_MMD_VEND2,
> >   1012                                           MDIO_OATC14_PLCA_CTRL0,
> >   1013                                           MDIO_OATC14_PLCA_EN);
> >   1014  
> >   1015                  if (ret < 0)
> >   1016                          return ret;
> >   1017          }
> >   1018  
> >   1019          // check if we need to set the PLCA node count, node ID, or both
> >   1020          if (plca_cfg->node_cnt >= 0 || plca_cfg->node_id >= 0) {
> > 
> > Let's assume both conditions are true
> > 
> >   1021                  /* if one between node count and node ID is -not- to be
> >   1022                   * changed, read the register to later perform merge/purge of
> >   1023                   * the configuration as appropriate
> >   1024                   */
> >   1025                  if (plca_cfg->node_cnt < 0 || plca_cfg->node_id < 0) {
> > 
> > Then neither condition is true here
> > 
> >   1026                          ret = phy_read_mmd(phydev, MDIO_MMD_VEND2,
> >   1027                                             MDIO_OATC14_PLCA_CTRL1);
> >   1028  
> >   1029                          if (ret < 0)
> >   1030                                  return ret;
> >   1031  
> >   1032                          val = ret;
> >   1033                  }
> >   1034  
> >   1035                  if (plca_cfg->node_cnt >= 0)
> >   1036                          val = (val & ~MDIO_OATC14_PLCA_NCNT) |
> >                                        ^^^
> > Uninitialized
> This is correct, however it is not a real problem. Please, allow me to
> explain. If both conditions are true (initially) then both conditions at
> lines 1035 and 1039 will be true as well. This means that the content of
> 'val' is completely overwritten with the content of node_cnt and
> node_id. This is because the register is 16 bits and node_cnt/id are 8
> bits each. Therefore, regardless of the initial status of 'val', its
> content is fully determines after line 1039.
> 
> With that said, I have no issues in initializing val to 0 if you think
> it's still worth it after my explanation.

This issue will be detected at runtime using KMsan.  Syzbot will detect
it automatically, complain and involve a lot of developers.

Also there is no downside to initializing to initializing it to zero
because most distros will do this by default now so it likely does not
affect run time.

regards,
dan carpenter

