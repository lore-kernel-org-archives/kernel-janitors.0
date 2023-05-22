Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387C8C77B75
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 May 2023 10:35:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbjEVKft (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 22 May 2023 06:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbjEVKfs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 May 2023 06:35:48 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06C78DC
        for <kernel-janitors@vger.kernel.org>; Mon, 22 May 2023 03:35:47 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f41dceb9d1so58124235e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 22 May 2023 03:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684751745; x=1687343745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=65v00oth8llyyqlj2COYxgZ3LDV9ng4IjXfVfrT+DXI=;
        b=SwWpEXFk78PIWRx32ndx0QUvSAT3CtEOcSPlQgOLLzsAw+2Lp0pjN8uGsvh4UgxUPT
         mznc47ng/wwvMbyB/go0gU9h1x18e3CP1cPz2CP7Vbmjz5JnO+UdUd1xTzID3KWtjJ+P
         Fxo5pvags9Pt+T6BGWLs+SarBSYSnkxaL3HKWxnJoFLf9kCzr926esXEEnXuJZruBzGS
         AvVf87PBM++3jPhsa3FHRPCCERVRptVL197kp2hOZ83a707P9RtppbSlejwTaRERt2U/
         KdwvHY316asApO92oZNvC8nlQ2VgSOXWtRQUaKoobc3E+po6gnhZ3LDT2wq3HncN+c9O
         aA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684751745; x=1687343745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65v00oth8llyyqlj2COYxgZ3LDV9ng4IjXfVfrT+DXI=;
        b=YRBwsvLc4TxLmKeJd9VY3L6k4fxNGgoDRJ7EkGrvgfOPcRh/G2k1R9jkY1558/bybs
         wKn1L5wNOOn4x1pdT57k0ViUs3JjQml1tkwI8eSO0HHv7Kt08qW0rnHit+Vl1L7NBpCj
         mMJOEOE13ssNy4f7oBeT/G/kWd/QtozkAywGA6DY/6QXcEF9zbzSXnyyFmkmXDEcQAu6
         K/uErsWpekrMoI6Ih1s9+CPEOKtW6f9cV6kdZME4jutgPA1yyANrAeaZiBvYNktMFSzm
         ssDI9lwqDr3xt2AU7vjcSSRCJsa3HT/vIHPjDvU+uUyp6b7Q6/Uz5nBL2+uqWxXttBKn
         OFAA==
X-Gm-Message-State: AC+VfDwXMd/HJgHNuG+ZECZ5F1afzGIBuB80vJPL9gljKbgS5lCNsGZc
        lAOR8lLl5Orm4SZEzq3BJKXBZA==
X-Google-Smtp-Source: ACHHUZ58cQ1Fp60cWARv/F4iudu6wycgwjig++ulhlcmrNm7mtLTOXyXP1IV38WDno3DYTacz/xYbw==
X-Received: by 2002:a05:600c:c6:b0:3f6:692:5607 with SMTP id u6-20020a05600c00c600b003f606925607mr869487wmm.40.1684751745480;
        Mon, 22 May 2023 03:35:45 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c4-20020a7bc004000000b003f42461ac75sm11155349wmb.12.2023.05.22.03.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 03:35:43 -0700 (PDT)
Date:   Mon, 22 May 2023 13:35:38 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Simon Horman <simon.horman@corigine.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Rain River <rain.1986.08.12@gmail.com>,
        Zhu Yanjun <zyjzyj2000@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Ayaz Abdulla <aabdulla@nvidia.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH net] forcedeth: Fix an error handling path in nv_probe()
Message-ID: <f4296d23-83ce-4147-894a-3e5640cdf87c@kili.mountain>
References: <355e9a7d351b32ad897251b6f81b5886fcdc6766.1684571393.git.christophe.jaillet@wanadoo.fr>
 <ZGtAIJZ3QzkBJgHI@corigine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGtAIJZ3QzkBJgHI@corigine.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 22, 2023 at 12:12:48PM +0200, Simon Horman wrote:
> On Sat, May 20, 2023 at 10:30:17AM +0200, Christophe JAILLET wrote:
> > If an error occures after calling nv_mgmt_acquire_sema(), it should be
> > undone with a corresponding nv_mgmt_release_sema() call.
> 
> nit: s/occures/occurs/
> 
> > 
> > Add it in the error handling path of the probe as already done in the
> > remove function.
> 
> I was going to ask what happens if nv_mgmt_acquire_sema() fails.
> Then I realised that it always returns 0.
> 
> Perhaps it would be worth changing it's return type to void at some point.
>

What? No?  It returns true on success and false on failure.

drivers/net/ethernet/nvidia/forcedeth.c
  5377  static int nv_mgmt_acquire_sema(struct net_device *dev)
  5378  {
  5379          struct fe_priv *np = netdev_priv(dev);
  5380          u8 __iomem *base = get_hwbase(dev);
  5381          int i;
  5382          u32 tx_ctrl, mgmt_sema;
  5383  
  5384          for (i = 0; i < 10; i++) {
  5385                  mgmt_sema = readl(base + NvRegTransmitterControl) & NVREG_XMITCTL_MGMT_SEMA_MASK;
  5386                  if (mgmt_sema == NVREG_XMITCTL_MGMT_SEMA_FREE)
  5387                          break;
  5388                  msleep(500);
  5389          }
  5390  
  5391          if (mgmt_sema != NVREG_XMITCTL_MGMT_SEMA_FREE)
  5392                  return 0;
  5393  
  5394          for (i = 0; i < 2; i++) {
  5395                  tx_ctrl = readl(base + NvRegTransmitterControl);
  5396                  tx_ctrl |= NVREG_XMITCTL_HOST_SEMA_ACQ;
  5397                  writel(tx_ctrl, base + NvRegTransmitterControl);
  5398  
  5399                  /* verify that semaphore was acquired */
  5400                  tx_ctrl = readl(base + NvRegTransmitterControl);
  5401                  if (((tx_ctrl & NVREG_XMITCTL_HOST_SEMA_MASK) == NVREG_XMITCTL_HOST_SEMA_ACQ) &&
  5402                      ((tx_ctrl & NVREG_XMITCTL_MGMT_SEMA_MASK) == NVREG_XMITCTL_MGMT_SEMA_FREE)) {
  5403                          np->mgmt_sema = 1;
  5404                          return 1;
                                ^^^^^^^^^
Success path.

  5405                  } else
  5406                          udelay(50);
  5407          }
  5408  
  5409          return 0;
  5410  }

regards,
dan carpenter

