Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FB8C47083
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Jun 2021 14:22:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB1DD61263
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Jun 2021 14:22:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbhFBOYW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 2 Jun 2021 10:24:22 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:25138 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231524AbhFBOYR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Jun 2021 10:24:17 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 152EMX8i001813;
        Wed, 2 Jun 2021 14:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=1rluyX24n4RFzWdVmZmYNnYGUiqyj9GFtB0n0kILsHM=;
 b=xiUGBc6N1WXKwwWeDI2y6ZcG60UkTuZaR0bnSOeCXtagvyxtYj5GdGW3LnyeSQl811w9
 tghmM8nJhNl594bGYrD6bD+ymRYik2hgr6VKHWuH+UI3kGlQnyEFKNl6+z6JqiLgltAd
 jo+54vsGFxo3Jp02RZ/rEW5JRhcMTrshhBTOsjPusPyCNTT8mGW09ZTU9aTgiSds77so
 4b6TZA4y7xuM5+Rk4i527dv7yJjfjkzV2lT75FAoVlBVbwcknn6C6+UZFYDNak5fgClP
 w3954++EEvMWs61ujPwc7+9tWKFVmHn1O8Cj3hgfoYXLDO7uT27If5ABC0o9QQBGOYxO 8w== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 38wr508d4e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Jun 2021 14:22:33 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 152EGW29165653;
        Wed, 2 Jun 2021 14:22:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38ubne1gtv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Jun 2021 14:22:32 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 152EIuDQ168853;
        Wed, 2 Jun 2021 14:22:32 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 38ubne1gth-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Jun 2021 14:22:32 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 152EMVGd024546;
        Wed, 2 Jun 2021 14:22:31 GMT
Received: from kadam (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 02 Jun 2021 14:22:30 +0000
Date:   Wed, 2 Jun 2021 17:22:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Nigel Christian <nigel.l.christian@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm: hugetlb: checking for IS_ERR() instead of NULL
Message-ID: <20210602142224.GH1955@kadam>
References: <YLX9FCOU0Il8Ejoy@mwanda>
 <YLZ0Q6S2A9kxXk6c@fedora>
 <20210601190040.GG24442@kadam>
 <20210601193419.GH24442@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601193419.GH24442@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: q1KW2vRiXbkVCWxlhDsGTohVNvoKHe3M
X-Proofpoint-GUID: q1KW2vRiXbkVCWxlhDsGTohVNvoKHe3M
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 01, 2021 at 10:51:23PM +0300, Dan Carpenter wrote:
> Here is my next attempt at this check.
> 
> Back in 2009, I used to write Smatch checks which were too complicated.
> Ideally, each Smatch check should only print one warning.  The state
> engine should only have one custom state, and &undefined and &merged.
> That check I sent violated all those rules.
> 
> The other thing which might be interesting is if you pass a NULL
> to IS_ERR() and then dereference the NULL then print a warning about
> that.  This has a lot of overlaps with some of my existing checks, but
> it's still a new idea so it belongs in a separate check.  It's fine and
> good even if one bug triggers a lot of different warnings.  I'll write
> that, hang on, brb.
> 
> regards,
> dan carpenter
> 

This check worked decently enough.  If you want to fix some of the bugs
here they are.  I'll look at them in a couple weeks.  I fixed a couple
of the first ones I looked at (not listed).

drivers/phy/microchip/sparx5_serdes.c:2474 sparx5_serdes_probe() warn: 'iomem' is not an error pointer
drivers/usb/musb/musb_core.c:2483 musb_init_controller() warn: 'musb->dma_controller' is not an error pointer
drivers/base/power/domain.c:2566 genpd_dev_pm_detach() warn: 'pd' is not an error pointer
drivers/base/power/domain.c:2599 genpd_dev_pm_sync() warn: 'pd' is not an error pointer
drivers/pci/controller/pci-ftpci100.c:496 faraday_pci_probe() warn: 'p->bus_clk' is not an error pointer
drivers/infiniband/core/cm.c:2348 ib_send_cm_rtu() warn: 'data' is not an error pointer
drivers/infiniband/core/cm.c:2761 ib_send_cm_drep() warn: 'data' is not an error pointer
drivers/infiniband/core/cm.c:3092 ib_send_cm_mra() warn: 'data' is not an error pointer
drivers/bluetooth/btqcomsmd.c:140 btqcomsmd_probe() warn: 'btq->acl_channel' is not an error pointer
drivers/bluetooth/btqcomsmd.c:145 btqcomsmd_probe() warn: 'btq->cmd_channel' is not an error pointer
drivers/media/platform/sti/bdisp/bdisp-v4l2.c:1402 bdisp_probe() warn: 'bdisp->clock' is not an error pointer
drivers/net/ipa/ipa_modem.c:360 ipa_modem_config() warn: 'notifier' is not an error pointer
drivers/net/wireless/ath/wcn36xx/main.c:1411 wcn36xx_probe() warn: 'wcn->smd_channel' is not an error pointer
drivers/net/can/spi/hi311x.c:854 hi3110_can_probe() warn: 'clk' is not an error pointer
drivers/net/can/spi/hi311x.c:941 hi3110_can_probe() warn: 'clk' is not an error pointer
net/bridge/br_forward.c:223 br_flood() warn: 'prev' is not an error pointer
net/bridge/br_forward.c:313 br_multicast_flood() warn: 'prev' is not an error pointer

One thing that I realized is that for functions the return NULL when
they are configured out like media_device_usb_allocate() is that these
are always a one liner:

struct foo *whatever(void) { return NULL; }

And they're always in the .h file so we have access to them and can add
a check for that.

static bool is_one_liner_function(struct expression *fn)
{
        struct symbol *sym;
        int lines;

        if (fn->type != EXPR_SYMBOL || !fn->symbol)
                return false;
        sym = get_base_type(fn->symbol);
        if (!sym)
                return false;
        if (sym->stmt && sym->stmt->type == STMT_COMPOUND)
                lines = ptr_list_size((struct ptr_list *)sym->stmt->stmts);
        else if (sym->inline_stmt && sym->inline_stmt->type == STMT_COMPOUND)
                lines = ptr_list_size((struct ptr_list *)sym->inline_stmt->stmts);
        else
                return false;

        if (lines == 1)
                return true;

        return false;
}

regards,
dan carpenter
