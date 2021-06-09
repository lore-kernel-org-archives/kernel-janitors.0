Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFAEC48BCF
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 10:37:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 918DA608FE
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 10:37:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236784AbhFIKjG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 9 Jun 2021 06:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236283AbhFIKjG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Jun 2021 06:39:06 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3708FC061574
        for <kernel-janitors@vger.kernel.org>; Wed,  9 Jun 2021 03:36:57 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id 66-20020a9d02c80000b02903615edf7c1aso23402056otl.13
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Jun 2021 03:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q0LzDFWusGn2R+WKTdGM7AA0eLLeUcP6lahdwNjj8L0=;
        b=kl1Cfm7JlpFzYKtvdvmkIwXngslTORK1ARnLDAtk3sfEpBLjMU0koQTZmK7lB7/W3M
         I66bNb23I5WraSE58VkCKdft1/E7pyliYEsZ100wjSsjHKu5jG4GrDsXr7Rn9biRfY8g
         kqYRxoxGsSzeMppmUVOXGXPPS3sHaPrioSsZV53PD6T6wsSxxa6/G5sVrK/+aXyz+D99
         ng3Ce7p2n/j1416VJmMuUMKJ34+GtvKMvXc4Dp/HQXrMO6IQ4U14zdYZX5jsWW8zc8ul
         HAiHXaz9PdsDf0RMp0mh2ZUU7H1HkRtW0Vrk2Fnr2OhIhO7mN89YiRD8YF/QwTRcSM15
         4sTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Q0LzDFWusGn2R+WKTdGM7AA0eLLeUcP6lahdwNjj8L0=;
        b=Aq8o2anh+a2DaLqW8n2/YKgjrT+cH66ltdHq7qKhAIgTiEnFzsWspELkz52JOxQ4Qy
         ld0YfZyesFxZIZ92pw4B+cbeZhDW1unbjXu8X6Y/3Qkeka/oSevkc0jfu/DBIaJ+7xKP
         9KOVwWeRYSkbNzCluGV4LFRBiWK/NugAto+gQUuRqBPuUE1Q6lX/mtWrwIWQKLn8yYZ0
         0V2GOWF/bXzwLvt01D3QaayvQN0IMyT37Rdg2AridMEkD1i4AOq3mhp46knb6qpe4aDW
         0WC+IjneTlohcOyIFovxwtlr1yAPlyMAu37rG91ZaP60cImtNRnMAzb8pjWFLvUSC9Mm
         dM1w==
X-Gm-Message-State: AOAM533EeMknNAnbFYVlAXktHyBqo9Na++C13H0XRFXG7f4Rnixq3iR1
        9T7J+03RZ675awa/eE21AsY=
X-Google-Smtp-Source: ABdhPJx9hs5ga5vKeura8iSBMko7PkiLl1Rf92EQxXeSeYxSVrtJbkeG8MmRutPM72OQDHVfBHyWdQ==
X-Received: by 2002:a9d:5c16:: with SMTP id o22mr22598512otk.319.1623235016659;
        Wed, 09 Jun 2021 03:36:56 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y7sm3368635oix.36.2021.06.09.03.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 03:36:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 9 Jun 2021 03:36:55 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ivan Safonov <insafonov@gmail.com>,
        Martin Kaiser <martin@kaiser.cx>,
        Michael Straube <straube.linux@gmail.com>,
        Simon Fong <simon.fodin@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 4/7] staging: rtl8188eu: use safe iterator in
 wakeup_sta_to_xmit()
Message-ID: <20210609103655.GD3727184@roeck-us.net>
References: <YL5iX3Exc0HVYrsi@mwanda>
 <YL5i1ZAAAB4vSWef@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL5i1ZAAAB4vSWef@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jun 07, 2021 at 09:17:57PM +0300, Dan Carpenter wrote:
> These two loops call list_del_init() on the list iterator so they need to
> use the _safe() iterator to prevent a forever loop.
> 
> Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/staging/rtl8188eu/core/rtw_xmit.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_xmit.c b/drivers/staging/rtl8188eu/core/rtw_xmit.c
> index f57e41f817ca..d5489811c5bc 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_xmit.c
> @@ -1796,17 +1796,14 @@ void wakeup_sta_to_xmit(struct adapter *padapter, struct sta_info *psta)
>  {
>  	u8 update_mask = 0, wmmps_ac = 0;
>  	struct sta_info *psta_bmc;
> -	struct list_head *xmitframe_plist, *xmitframe_phead;
> -	struct xmit_frame *pxmitframe = NULL;
> +	struct list_head *xmitframe_phead;
> +	struct xmit_frame *pxmitframe, *n;
>  	struct sta_priv *pstapriv = &padapter->stapriv;
>  
>  	spin_lock_bh(&psta->sleep_q.lock);
>  
>  	xmitframe_phead = get_list_head(&psta->sleep_q);
> -	list_for_each(xmitframe_plist, xmitframe_phead) {
> -		pxmitframe = list_entry(xmitframe_plist, struct xmit_frame,
> -					list);
> -
> +	list_for_each_entry_safe(pxmitframe, n, xmitframe_phead, list) {
>  		list_del_init(&pxmitframe->list);
>  
>  		switch (pxmitframe->attrib.priority) {
> @@ -1881,10 +1878,7 @@ void wakeup_sta_to_xmit(struct adapter *padapter, struct sta_info *psta)
>  		spin_lock_bh(&psta_bmc->sleep_q.lock);
>  
>  		xmitframe_phead = get_list_head(&psta_bmc->sleep_q);
> -		list_for_each(xmitframe_plist, xmitframe_phead) {
> -			pxmitframe = list_entry(xmitframe_plist,
> -						struct xmit_frame, list);
> -
> +		list_for_each_entry_safe(pxmitframe, n, xmitframe_phead, list) {
>  			list_del_init(&pxmitframe->list);
>  
>  			psta_bmc->sleepq_len--;
> -- 
> 2.30.2
> 
