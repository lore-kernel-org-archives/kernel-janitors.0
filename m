Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8986C433E2
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 Mar 2021 16:57:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B49C661A1E
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 Mar 2021 16:57:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhCYQ5G (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 Mar 2021 12:57:06 -0400
Received: from lan.nucleusys.com ([92.247.61.126]:34580 "EHLO
        mail.nucleusys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhCYQ5E (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 Mar 2021 12:57:04 -0400
X-Greylist: delayed 2647 seconds by postgrey-1.27 at vger.kernel.org; Thu, 25 Mar 2021 12:57:03 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=nucleusys.com; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=9+BEITjcOB4Up5oAxEJfwAcVar0gxPpkiEJ8nLYig+I=; b=ieNXDU27KppfuW3RtKoBNCYKVC
        LR9/fGV4FP9oyvzSatYPjlPGlSUzEBge5avHw+Rk/GwNEZkNNCotCIy85XtZQa4iOj6Rae0h0fYh2
        GD/H4SIRJM2/dPOgibRkskhAvF8EJrcELdcbVv3r/g2/q2ghxXKP9BRpgm4eXb6JzRAs=;
Received: from [151.251.251.23] (helo=carbon)
        by mail.nucleusys.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <petkan@nucleusys.com>)
        id 1lPSbG-0008Dw-5U; Thu, 25 Mar 2021 18:12:47 +0200
Date:   Thu, 25 Mar 2021 18:12:46 +0200
From:   Petko Manolov <petkan@nucleusys.com>
To:     'Qiheng Lin <linqiheng@huawei.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH net-next] net: usb: pegasus: Remove duplicated include
 from pegasus.c
Message-ID: <YFy2fnV7GQLOKkRy@carbon>
Mail-Followup-To: 'Qiheng Lin <linqiheng@huawei.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
References: <20210325145652.13469-1-linqiheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325145652.13469-1-linqiheng@huawei.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 21-03-25 22:56:52, 'Qiheng Lin wrote:
> From: Qiheng Lin <linqiheng@huawei.com>
> 
> Remove duplicated include.

It is not duplicated so do not remove it.  Go ahead and look carefully at the
code, please.


		Petko


> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
> ---
>  drivers/net/usb/pegasus.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
> index 9a907182569c..e0ee5c096396 100644
> --- a/drivers/net/usb/pegasus.c
> +++ b/drivers/net/usb/pegasus.c
> @@ -65,7 +65,6 @@ static struct usb_eth_dev usb_dev_id[] = {
>  	{.name = pn, .vendor = vid, .device = pid, .private = flags},
>  #define PEGASUS_DEV_CLASS(pn, vid, pid, dclass, flags) \
>  	PEGASUS_DEV(pn, vid, pid, flags)
> -#include "pegasus.h"
>  #undef	PEGASUS_DEV
>  #undef	PEGASUS_DEV_CLASS
>  	{NULL, 0, 0, 0},
> @@ -84,7 +83,6 @@ static struct usb_device_id pegasus_ids[] = {
>  #define PEGASUS_DEV_CLASS(pn, vid, pid, dclass, flags) \
>  	{.match_flags = (USB_DEVICE_ID_MATCH_DEVICE | USB_DEVICE_ID_MATCH_DEV_CLASS), \
>  	.idVendor = vid, .idProduct = pid, .bDeviceClass = dclass},
> -#include "pegasus.h"
>  #undef	PEGASUS_DEV
>  #undef	PEGASUS_DEV_CLASS
>  	{},
> 
> 
