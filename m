Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540CCC48BCF
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 10:35:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AE3361377
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 10:35:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235462AbhFIKg5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 9 Jun 2021 06:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237853AbhFIKg4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Jun 2021 06:36:56 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25024C0613A3
        for <kernel-janitors@vger.kernel.org>; Wed,  9 Jun 2021 03:34:46 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so9728412otl.0
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Jun 2021 03:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Er0XKxR72Ln8a0KN07yz+LiDy46pDiQd3v/AYBknSqM=;
        b=rTyh7JfrvpMO2zcCs9pyaTv2zUoqmHfmFFYzFxQox+eubNDLTrt2/nSKGm7lLV3TiS
         FzuG3XZaix2P6mR55G9kF5IkXKnjYk/SWp77HatmzwQfkKCVQkiARhTl43UJGcZftS+L
         XJmQZt1zG/g+pR4Vu1r5YKV2To2KVf4H+HQAntj7KhK3uW/a22s8l/z5j4wFpkHU66vO
         1rMEIwQMB2v/JvIuEkd5WYzGDwLVVlEcev4l0DhnDjPFB0FM/SPqSCu8Uy3yjdAOch89
         R0HgJ2+IhsYNNqHp03u6EzNQp6IBu7x9/AsMoexz4P6iYwbLnkiSHliejc2rXz1E7Uwo
         saxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Er0XKxR72Ln8a0KN07yz+LiDy46pDiQd3v/AYBknSqM=;
        b=g8jVGPLhmlns2f2YX+dpc1M6EBYHaVzb5DVNiLVLjQ6YzNCZYmy6SMWiqLvofMZGYw
         Tt9sZXy7kmKCO+xEgSayeD2Tk+TuRiqgcQOqBxGTq7Z/6t+G8QBiBENvNDy5wUO/4ikM
         Oj5LvvhfzAY7VfHDeJvYBDO13/alHhdwrOcZK6wYVCRQjMEsGdXC5GHwZSvN87DS1Vk7
         Yi5bp2KmvcLRrMlMzw1+t6/AqqIZcDq8IQJJ/xwFt6Fw/AIM7FCfR93rtyFsxuj5nzQP
         OlX5IyLwIBHMx/BpUNo7Ovs6C5dK6oIan6dNc8YO1uubzxBox8NfHCox4l2It+tBXaJi
         IoPw==
X-Gm-Message-State: AOAM530bN1ydkTw9Tx9kk4dpSAxCriIZgfG8hH1DUGxIiQftLnJ/srCz
        YWmmAsgsg7yAA+zz7UpQjv4=
X-Google-Smtp-Source: ABdhPJwmJLY5OIZrRzw0m/YRgJGXfzISzlTBoeYYS8fhG0o1RuK3FKfgR1+xL9Kfq4ZelRXxlh1MNQ==
X-Received: by 2002:a9d:1ec8:: with SMTP id n66mr12769518otn.314.1623234885178;
        Wed, 09 Jun 2021 03:34:45 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l10sm1220480otj.17.2021.06.09.03.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 03:34:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 9 Jun 2021 03:34:43 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ivan Safonov <insafonov@gmail.com>,
        Michael Straube <straube.linux@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Peilin Ye <yepeilin.cs@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/7] staging: rtl8188eu: use safe iterator in
 tx_beacon_hdl()
Message-ID: <20210609103443.GB3727184@roeck-us.net>
References: <YL5iX3Exc0HVYrsi@mwanda>
 <YL5iunD5ilf+mKPR@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL5iunD5ilf+mKPR@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jun 07, 2021 at 09:17:30PM +0300, Dan Carpenter wrote:
> This loop calls list_del_init() on the list iterator so it has to use
> the _safe() iterator or it leads to an endless loop.
> 
> Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/staging/rtl8188eu/core/rtw_mlme_ext.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
> index b4d81d3a856c..42cfa1e95e2c 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
> @@ -5378,8 +5378,8 @@ u8 tx_beacon_hdl(struct adapter *padapter, unsigned char *pbuf)
>  #ifdef CONFIG_88EU_AP_MODE
>  	else { /* tx bc/mc frames after update TIM */
>  		struct sta_info *psta_bmc;
> -		struct list_head *xmitframe_plist, *xmitframe_phead;
> -		struct xmit_frame *pxmitframe = NULL;
> +		struct list_head *xmitframe_phead;
> +		struct xmit_frame *pxmitframe, *n;
>  		struct sta_priv *pstapriv = &padapter->stapriv;
>  
>  		/* for BC/MC Frames */
> @@ -5392,11 +5392,8 @@ u8 tx_beacon_hdl(struct adapter *padapter, unsigned char *pbuf)
>  			spin_lock_bh(&psta_bmc->sleep_q.lock);
>  
>  			xmitframe_phead = get_list_head(&psta_bmc->sleep_q);
> -			list_for_each(xmitframe_plist, xmitframe_phead) {
> -				pxmitframe = list_entry(xmitframe_plist,
> -							struct xmit_frame,
> -							list);
> -
> +			list_for_each_entry_safe(pxmitframe, n, xmitframe_phead,
> +						 list) {
>  				list_del_init(&pxmitframe->list);
>  
>  				psta_bmc->sleepq_len--;
> -- 
> 2.30.2
> 
