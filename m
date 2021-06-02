Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23839C4708F
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Jun 2021 15:57:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DD8C614A5
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Jun 2021 15:57:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbhFBP67 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 2 Jun 2021 11:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232101AbhFBP66 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Jun 2021 11:58:58 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A78C061574
        for <kernel-janitors@vger.kernel.org>; Wed,  2 Jun 2021 08:57:15 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id m13-20020a17090b068db02901656cc93a75so3704015pjz.3
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Jun 2021 08:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KkGJZaXZXDSCrQrG/Y77bUEuCudfeK6vGe5MZWCEVic=;
        b=oQwyu9JXVyx+T9XBxWUAOMb5pDcGHbb3+w58MWKh4gSEYKfZhLOWPF3dC/obTam9tD
         mEwTcP8zobu2fbOcLxNzhVsLZBibsA67pFlyHvMpLpSMi7RjwrOcIub5r4Qqp3hVr7Sx
         hRIvnviDfMVdnqHpwm53umdicBzqautWgt7iAZIYSwilh0E1OxuQE5baulvjO2MzovBI
         H6UeFCVJaGUhRPYFVMNXg5o9GW9d2ODmRScd8eG+WahJ8aYFN1d5SzJZZBxCTufol5nn
         6sSbQgTFYPSbcnIxoTetjSa3mC9MqU8fhpRYYcVBwT3MbUEAa1dNYVbl6nlaQIKNLgAt
         7TlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KkGJZaXZXDSCrQrG/Y77bUEuCudfeK6vGe5MZWCEVic=;
        b=qg+xeSkLQLvbHI1HQLJXiU8YUoYIuQWeEiJbfqoM+bnbBRHriE7vz8NPKywdfbcSOI
         uaAbVrOJvYMi0olfk/mnGmraES0nY+sfVKa2vYXWGLW48NtZAts22pfigMgv48gGW0cf
         A24iSULIZreEPpB7/RXHlI9+10KCPI9qAjMp2YrrohL8e0rVWajCiY+ePkKN23Y42fyL
         6LJz1z816Wt75ie79rPPTJwWPUK7WHTdp2f1HrSN4u1Y21bymNb252p+T5sS1L/9yA02
         /Jd+g4etsEClMTMums3GIcBCxtwkVv+/ugmyL+noCjPSEqdy1ZYiG/9Vp2XkGBc+DYtA
         4Hcw==
X-Gm-Message-State: AOAM533VtzpyYCvlFMEJO19MFek+M3SJQDbCJsrehUubuZnZ76hNUhTf
        /SvMkhNFU/jtPZJTgqGxGE9yPmj+l1LTXl/vwug=
X-Google-Smtp-Source: ABdhPJwqUIW73E+jbrNSJUKxnaAVhwsbvPSPHVt2JgSAeXYawEJnQf/FHf1C9IYyekxHjLXhZfBW3g==
X-Received: by 2002:a17:902:8484:b029:101:7016:fb7b with SMTP id c4-20020a1709028484b02901017016fb7bmr24621844plo.23.1622649435268;
        Wed, 02 Jun 2021 08:57:15 -0700 (PDT)
Received: from fedora ([2604:2000:efc0:108:b082:f3a8:abff:a570])
        by smtp.gmail.com with ESMTPSA id t14sm203662pgk.21.2021.06.02.08.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 08:57:14 -0700 (PDT)
Date:   Wed, 2 Jun 2021 11:57:08 -0400
From:   Nigel Christian <nigel.l.christian@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm: hugetlb: checking for IS_ERR() instead of NULL
Message-ID: <YLeqVPJnBfXN23Zo@fedora>
References: <YLX9FCOU0Il8Ejoy@mwanda>
 <YLZ0Q6S2A9kxXk6c@fedora>
 <20210601190040.GG24442@kadam>
 <20210601193419.GH24442@kadam>
 <20210602142224.GH1955@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602142224.GH1955@kadam>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jun 02, 2021 at 05:22:24PM +0300, Dan Carpenter wrote:
> On Tue, Jun 01, 2021 at 10:51:23PM +0300, Dan Carpenter wrote:
> > Here is my next attempt at this check.
> > 
> > Back in 2009, I used to write Smatch checks which were too complicated.
> > Ideally, each Smatch check should only print one warning.  The state
> > engine should only have one custom state, and &undefined and &merged.
> > That check I sent violated all those rules.
> > 
> > The other thing which might be interesting is if you pass a NULL
> > to IS_ERR() and then dereference the NULL then print a warning about
> > that.  This has a lot of overlaps with some of my existing checks, but
> > it's still a new idea so it belongs in a separate check.  It's fine and
> > good even if one bug triggers a lot of different warnings.  I'll write
> > that, hang on, brb.
> > 
> > regards,
> > dan carpenter
> > 
> 
> This check worked decently enough.  If you want to fix some of the bugs
> here they are.  I'll look at them in a couple weeks.  I fixed a couple
> of the first ones I looked at (not listed).

Yes, for sure! I'll get started from the top of the list below (^_^)

> 
> drivers/phy/microchip/sparx5_serdes.c:2474 sparx5_serdes_probe() warn: 'iomem' is not an error pointer
> drivers/usb/musb/musb_core.c:2483 musb_init_controller() warn: 'musb->dma_controller' is not an error pointer
> drivers/base/power/domain.c:2566 genpd_dev_pm_detach() warn: 'pd' is not an error pointer
> drivers/base/power/domain.c:2599 genpd_dev_pm_sync() warn: 'pd' is not an error pointer
> drivers/pci/controller/pci-ftpci100.c:496 faraday_pci_probe() warn: 'p->bus_clk' is not an error pointer
> drivers/infiniband/core/cm.c:2348 ib_send_cm_rtu() warn: 'data' is not an error pointer
> drivers/infiniband/core/cm.c:2761 ib_send_cm_drep() warn: 'data' is not an error pointer
> drivers/infiniband/core/cm.c:3092 ib_send_cm_mra() warn: 'data' is not an error pointer
> drivers/bluetooth/btqcomsmd.c:140 btqcomsmd_probe() warn: 'btq->acl_channel' is not an error pointer
> drivers/bluetooth/btqcomsmd.c:145 btqcomsmd_probe() warn: 'btq->cmd_channel' is not an error pointer
> drivers/media/platform/sti/bdisp/bdisp-v4l2.c:1402 bdisp_probe() warn: 'bdisp->clock' is not an error pointer
> drivers/net/ipa/ipa_modem.c:360 ipa_modem_config() warn: 'notifier' is not an error pointer
> drivers/net/wireless/ath/wcn36xx/main.c:1411 wcn36xx_probe() warn: 'wcn->smd_channel' is not an error pointer
> drivers/net/can/spi/hi311x.c:854 hi3110_can_probe() warn: 'clk' is not an error pointer
> drivers/net/can/spi/hi311x.c:941 hi3110_can_probe() warn: 'clk' is not an error pointer
> net/bridge/br_forward.c:223 br_flood() warn: 'prev' is not an error pointer
> net/bridge/br_forward.c:313 br_multicast_flood() warn: 'prev' is not an error pointer
> 
> One thing that I realized is that for functions the return NULL when
> they are configured out like media_device_usb_allocate() is that these
> are always a one liner:

Interesting. 
> 
> struct foo *whatever(void) { return NULL; }
> 
> And they're always in the .h file so we have access to them and can add
> a check for that.
> 
> static bool is_one_liner_function(struct expression *fn)
> {
>         struct symbol *sym;
>         int lines;
> 
>         if (fn->type != EXPR_SYMBOL || !fn->symbol)
>                 return false;
>         sym = get_base_type(fn->symbol);
>         if (!sym)
>                 return false;
>         if (sym->stmt && sym->stmt->type == STMT_COMPOUND)
>                 lines = ptr_list_size((struct ptr_list *)sym->stmt->stmts);
>         else if (sym->inline_stmt && sym->inline_stmt->type == STMT_COMPOUND)
>                 lines = ptr_list_size((struct ptr_list *)sym->inline_stmt->stmts);
>         else
>                 return false;
> 
>         if (lines == 1)
>                 return true;
> 
>         return false;
> }
> 
> regards,
> dan carpenter
