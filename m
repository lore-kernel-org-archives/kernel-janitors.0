Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 521B9C67871
	for <kernel-janitors@archiver.kernel.org>; Mon, 16 Jan 2023 23:20:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235383AbjAPXUd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 16 Jan 2023 18:20:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235492AbjAPXS3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 16 Jan 2023 18:18:29 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDCFF2CC66
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Jan 2023 15:11:56 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id b4so23168822edf.0
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Jan 2023 15:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LdqcEbdvoqedhG7wldPzRaY226yfpzrE3vZ+YgLm0I8=;
        b=hfZ9suj8KeRGa5zBdPeNJPyq3P2HmzKbuPWtnNFZDfR0QldgY2UfgUKLmm5QOdaLCF
         djpKEWsXN4mctSaEszw3W+xmbEg5/LIFB4AcCmRwu7Vm19WjWiIiSaGmeS4AIzzVGJ3d
         zOQDUhZP+UXN6+Usx28khOeURisGz3RkW0QhVI54vAbyaH9X/spS4lz7t71AZtz7ztiZ
         rxnfUa5JoA7x9+ele6hieSe8NaMev0udvbhdl7iin+71i1ZfJiP6wYG89oK+mOankkto
         q4xm2GdYGmsEyX0zQxxQL8uY5iCfUAo6wFlKQVyqjfIemREBahNCzjXqNz2HhginQvjr
         U6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdqcEbdvoqedhG7wldPzRaY226yfpzrE3vZ+YgLm0I8=;
        b=p/ofqzOW+KGTsywmvlIi2usWjlk06TWgQkZO67ynvwLeCY2Zo38Q/0kGoB0H+u//Sk
         BrMSny2ver/cTCQrptCbr/iG1bQ5HYyUJa+ZrYgmT3v+lk7cbw6fyoI6sIvg15uPz6/c
         TyCajKwDBf6FBopjj2Kk/W8QllfM1FpyI3YbzDgEKxP20y1G6weqDszRTq680HAWiXkD
         mzlQXZaoVAvhWAdAEtVSZ8BtUjsmIACo1u1keo+NGfu48GWUZxSTD516QvBe1/pqA9lv
         E8lvlWOdGcMXp7g8tkDK5gkwS6uR3FJTl3Djg/PfzgAfBzvsQqz4RAbxQ1XgS2Wvcpg3
         Zlgg==
X-Gm-Message-State: AFqh2kozSMdI2q0nVWH5HS5fUwemQCXDvF/P6Jq+eIheBo7s6H9ubF/v
        9VJWBa8bP3/uQRtS+qRhm5zEl3XQDNbuFRVA
X-Google-Smtp-Source: AMrXdXtZgpkjgNM2KTZw/9Lv4XRWJB5aQRBahwSMUAxSVK2CZWYZ51g5BLOlc7rROqkiyIBiXNKxfQ==
X-Received: by 2002:a05:6402:5412:b0:49d:f4de:1988 with SMTP id ev18-20020a056402541200b0049df4de1988mr933945edb.42.1673910714969;
        Mon, 16 Jan 2023 15:11:54 -0800 (PST)
Received: from gvm01 (net-5-89-66-224.cust.vodafonedsl.it. [5.89.66.224])
        by smtp.gmail.com with ESMTPSA id u9-20020aa7d889000000b00457b5ba968csm11961607edq.27.2023.01.16.15.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 15:11:54 -0800 (PST)
Date:   Tue, 17 Jan 2023 00:11:56 +0100
From:   Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
To:     Dan Carpenter <error27@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] drivers/net/phy: add helpers to get/set PLCA
 configuration
Message-ID: <Y8XZvO6FC0QKycDE@gvm01>
References: <Y8UiT9AKQIqz1zxr@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8UiT9AKQIqz1zxr@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jan 16, 2023 at 01:09:19PM +0300, Dan Carpenter wrote:
> Hello Piergiorgio Beruto,
> 
> The patch 493323416fed: "drivers/net/phy: add helpers to get/set PLCA
> configuration" from Jan 9, 2023, leads to the following Smatch static
> checker warning:
> 
> 	drivers/net/phy/phy-c45.c:1036 genphy_c45_plca_set_cfg()
> 	error: uninitialized symbol 'val'.
> 
> drivers/net/phy/phy-c45.c
>    999  int genphy_c45_plca_set_cfg(struct phy_device *phydev,
>   1000                              const struct phy_plca_cfg *plca_cfg)
>   1001  {
>   1002          int ret;
>   1003          u16 val;
>   1004  
>   1005          // PLCA IDVER is read-only
>   1006          if (plca_cfg->version >= 0)
>   1007                  return -EINVAL;
>   1008  
>   1009          // first of all, disable PLCA if required
>   1010          if (plca_cfg->enabled == 0) {
>   1011                  ret = phy_clear_bits_mmd(phydev, MDIO_MMD_VEND2,
>   1012                                           MDIO_OATC14_PLCA_CTRL0,
>   1013                                           MDIO_OATC14_PLCA_EN);
>   1014  
>   1015                  if (ret < 0)
>   1016                          return ret;
>   1017          }
>   1018  
>   1019          // check if we need to set the PLCA node count, node ID, or both
>   1020          if (plca_cfg->node_cnt >= 0 || plca_cfg->node_id >= 0) {
> 
> Let's assume both conditions are true
> 
>   1021                  /* if one between node count and node ID is -not- to be
>   1022                   * changed, read the register to later perform merge/purge of
>   1023                   * the configuration as appropriate
>   1024                   */
>   1025                  if (plca_cfg->node_cnt < 0 || plca_cfg->node_id < 0) {
> 
> Then neither condition is true here
> 
>   1026                          ret = phy_read_mmd(phydev, MDIO_MMD_VEND2,
>   1027                                             MDIO_OATC14_PLCA_CTRL1);
>   1028  
>   1029                          if (ret < 0)
>   1030                                  return ret;
>   1031  
>   1032                          val = ret;
>   1033                  }
>   1034  
>   1035                  if (plca_cfg->node_cnt >= 0)
>   1036                          val = (val & ~MDIO_OATC14_PLCA_NCNT) |
>                                        ^^^
> Uninitialized
This is correct, however it is not a real problem. Please, allow me to
explain. If both conditions are true (initially) then both conditions at
lines 1035 and 1039 will be true as well. This means that the content of
'val' is completely overwritten with the content of node_cnt and
node_id. This is because the register is 16 bits and node_cnt/id are 8
bits each. Therefore, regardless of the initial status of 'val', its
content is fully determines after line 1039.

With that said, I have no issues in initializing val to 0 if you think
it's still worth it after my explanation.
> 
>   1037                                (plca_cfg->node_cnt << 8);
>   1038  
>   1039                  if (plca_cfg->node_id >= 0)
>   1040                          val = (val & ~MDIO_OATC14_PLCA_ID) |
>   1041                                (plca_cfg->node_id);
> 
> 
> regards,
> dan carpenter
Thank you very much for reporting this,
Kind Regards,
Piergiorgio

