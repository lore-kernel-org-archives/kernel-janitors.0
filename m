Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E930C433B4
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Apr 2021 06:23:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42E926113E
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Apr 2021 06:23:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhDHGX5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Apr 2021 02:23:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:36438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229512AbhDHGX4 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Apr 2021 02:23:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F7D660FF0;
        Thu,  8 Apr 2021 06:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617863025;
        bh=AmnGcTw72tSsUyDZ1tgA+L5JFtgYU38Who6M38eRL/U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=z4XmOgYPSCItFke6p5SjqRs4HqZ+HtCyFk3PM5x+JK7yH1u/9/95xQwu2mWMw2sVB
         IerecaJIsWOjwVAMd/OqpRSo0rJilpkzxvXIzFNpMTGpJx83F49J+zIzMgbZ2KTV5O
         eir9Kut9X0TKeHFH9wDW45nKgzapfPHjRoFnrrlc=
Date:   Thu, 8 Apr 2021 08:23:43 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sergei Krainov <sergei.krainov.lkd@gmail.com>
Cc:     Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: remove unused variable from
 rtl871x_mlme.c
Message-ID: <YG6hb9YoPyrtEQdc@kroah.com>
References: <20210407193214.GA284402@test-VirtualBox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407193214.GA284402@test-VirtualBox>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Apr 07, 2021 at 09:32:14PM +0200, Sergei Krainov wrote:
> Remove unused variable from rtl871x_mlme.c
> 
> Signed-off-by: Sergei Krainov <sergei.krainov.lkd@gmail.com>
> ---
>  drivers/staging/rtl8712/rtl871x_mlme.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_mlme.c b/drivers/staging/rtl8712/rtl871x_mlme.c
> index 8a97307fbbd6..4f41e321ea63 100644
> --- a/drivers/staging/rtl8712/rtl871x_mlme.c
> +++ b/drivers/staging/rtl8712/rtl871x_mlme.c
> @@ -656,7 +656,7 @@ void r8712_joinbss_event_callback(struct _adapter *adapter, u8 *pbuf)
>  	struct sta_priv	*pstapriv = &adapter->stapriv;
>  	struct mlme_priv	*pmlmepriv = &adapter->mlmepriv;
>  	struct wlan_network	*cur_network = &pmlmepriv->cur_network;
> -	struct wlan_network	*pcur_wlan = NULL, *ptarget_wlan = NULL;
> +	struct wlan_network	*ptarget_wlan = NULL;
>  	unsigned int		the_same_macaddr = false;
>  	struct wlan_network *pnetwork;
>  
> @@ -721,13 +721,6 @@ void r8712_joinbss_event_callback(struct _adapter *adapter, u8 *pbuf)
>  					    scanned_queue,
>  					    cur_network->network.MacAddress);
>  				} else {
> -					pcur_wlan =
> -					     r8712_find_network(&pmlmepriv->
> -					     scanned_queue,
> -					     cur_network->network.MacAddress);
> -					if (pcur_wlan)
> -						pcur_wlan->fixed = false;
> -

Are you sure that r8712_find_network() does not have some other
side-affect here?  Please doucment that in the changelog text.

thanks,

greg k-h
