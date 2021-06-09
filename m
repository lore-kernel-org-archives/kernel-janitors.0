Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F356C48BCD
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 10:33:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E066761375
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 10:33:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237046AbhFIKfX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 9 Jun 2021 06:35:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234299AbhFIKfV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Jun 2021 06:35:21 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B86C061574
        for <kernel-janitors@vger.kernel.org>; Wed,  9 Jun 2021 03:33:13 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 66-20020a9d02c80000b02903615edf7c1aso23393169otl.13
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Jun 2021 03:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C6zmZocfV59nTRUR/tuzqZPISvv+0Relgl8iloiv6bQ=;
        b=TJhP3AsfAN5fWM/pybxz1m4QEpj/Hhiaz3m7UGAeUImETHl8elkocpS+Y9h8+GFu8o
         k++7ev++/ua+zwrhKKg/a9Gbq+e+JA4bn/kbDWSuMCc3tbwFNPsF6ZpYacqj9ZSnFJwR
         SMQfWwqXSssrPo8Z22MY2gQiO5Rp/M6VH8B15//i/UHf3rQ8emluQaSmxsjr+739ZM7L
         jFsQL3u4MSDz8apuQ5p05CYmxJsqvy7YwtbIwS1bK+uxdWxEfpsjmA2sR9D44MdUDpRd
         BmfT84IWiLwpZsUAgdivyT9wG9yMuTl0QJanNGOf0HI/+2ROaCFRByRnc5Yq0L/MNrg8
         HwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=C6zmZocfV59nTRUR/tuzqZPISvv+0Relgl8iloiv6bQ=;
        b=puvbzDl15AZjnJUbPaApoE9qYWgGLTN91xOKYDlMiP9LKfL2fOoIbiw4/9kyAn20/Y
         xdIsg4EC7h43PnvUuDIU2lShD/0VccNHvJ/l2qkrgk1oMvZXbDpYnGiU6jedVpOJM2it
         dNhogr2CUrSxPOrQ/4D2eMS03P3qHSyFFAvZCVBdKmcuND7NjuCSy2bF6JsLtrNxDCTg
         t3URN93diD3LhpIlD0dUnW4oEuvd1gv8NBXHGC2Pt8KO0jHI8eZKnSa4vwjcIA7gk7Jf
         dkkSiNv8a09PK6dgmoH2UEyQK/cLdS22FT0lvdgf82UfiWXZdqitCeuPf379PigdN3cw
         H3Tg==
X-Gm-Message-State: AOAM533LvuP9kVbiSWFrzcK9BxY81EV9qYGpG+kOvEoqp1u5wzPMh1EE
        BONMyNwxZTcoaxztEjK4bV4=
X-Google-Smtp-Source: ABdhPJyeXw5X999oqt7C6iMeiIUz0+8cZ+wjvaM2TWs+PQv8nZv/nEeFANue6ztPSOQd5H31GGmeAw==
X-Received: by 2002:a05:6830:1bd8:: with SMTP id v24mr2244034ota.203.1623234793036;
        Wed, 09 Jun 2021 03:33:13 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c13sm2659023otr.23.2021.06.09.03.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 03:33:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 9 Jun 2021 03:33:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Kaiser <martin@kaiser.cx>,
        Ivan Safonov <insafonov@gmail.com>,
        Paul McQuade <paulmcquad@gmail.com>,
        Michael Straube <straube.linux@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/7] staging: rtl8188eu: use safe iterator in
 stop_ap_mode()
Message-ID: <20210609103310.GA3727184@roeck-us.net>
References: <YL5iX3Exc0HVYrsi@mwanda>
 <YL5ip4yz9NEB9RZO@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL5ip4yz9NEB9RZO@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jun 07, 2021 at 09:17:11PM +0300, Dan Carpenter wrote:
> This loop calls list_del_init() on the list iterator so it can result
> in a forever loop.
> 
> Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/staging/rtl8188eu/core/rtw_ap.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_ap.c b/drivers/staging/rtl8188eu/core/rtw_ap.c
> index bbecb07274f6..9399c17bfdbf 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_ap.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_ap.c
> @@ -1688,8 +1688,7 @@ void start_ap_mode(struct adapter *padapter)
>  
>  void stop_ap_mode(struct adapter *padapter)
>  {
> -	struct list_head *phead, *plist;
> -	struct rtw_wlan_acl_node *paclnode;
> +	struct rtw_wlan_acl_node *paclnode, *n;
>  	struct sta_info *psta = NULL;
>  	struct sta_priv *pstapriv = &padapter->stapriv;
>  	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
> @@ -1709,10 +1708,7 @@ void stop_ap_mode(struct adapter *padapter)
>  
>  	/* for ACL */
>  	spin_lock_bh(&pacl_node_q->lock);
> -	phead = get_list_head(pacl_node_q);
> -	list_for_each(plist, phead) {
> -		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
> -
> +	list_for_each_entry_safe(paclnode, n, &pacl_node_q->queue, list) {
>  		if (paclnode->valid) {
>  			paclnode->valid = false;
>  
> -- 
> 2.30.2
> 
