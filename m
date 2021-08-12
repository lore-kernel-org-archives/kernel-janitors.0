Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F59AC4338F
	for <kernel-janitors@archiver.kernel.org>; Thu, 12 Aug 2021 13:32:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3535F61059
	for <kernel-janitors@archiver.kernel.org>; Thu, 12 Aug 2021 13:32:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236717AbhHLNcj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 12 Aug 2021 09:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233260AbhHLNci (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Aug 2021 09:32:38 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF42C061756
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Aug 2021 06:32:13 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id h11so10417615oie.0
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Aug 2021 06:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R9HVDpRhXwfFRF2AntRCJkLCvu7sh5TaAycq7OJv9Kg=;
        b=Zlt8B8nlGRTB+9ShaE4Bxw8SWOxqOIOL0DeVa4yr0t9rctsN0vKsFoeq6aieEZmvR2
         3J1hoeLH9HyF0k/aUxAf9fsth3F7eP7sHDkPYBmIdOu4rE7QudjACkcpWDexsgAqZ1cz
         jimzUhkAZhrL4e2SCr5jbP9Xite6g3mPtyCBBn/VV8TIux3pyqe+aQDaK41dg/RVPkPS
         r/saFJOG8CwTffKUPlw5tPdkxdLOgYCRVHS8DrAukCQ/YrRQ3Y1m/aVXcufPN9K3tdAK
         JtalYHrBw8XN1V0OgnpkvOJgaFKJ592jzoI1oFH6k6ZQR7ruxQbfUBBfBeLLWVGf4dET
         MTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R9HVDpRhXwfFRF2AntRCJkLCvu7sh5TaAycq7OJv9Kg=;
        b=Le0IuATewsoJwpq3w5iQUSCcpgday9YK+qHB3cJxYvECFqkIZOLVdg0cniR0lAWhRw
         RDwTbELFUy69EgMJsMEtIP7hyDtT4Tzif66OyZgVZXDU0XkMhIse+5D0A8671zbDguiw
         EXNc8XXyPihoO9PYN1Z+9nr+IhFMB2HGX2nGaH1G2YjEp6KFz1d4hfLFuDzf6uNRt6k3
         X3wHiUTV72gtygr243BTbhqowFAe4NfKQgSTqtF1g99nwuJMIExeESqC8McItj+PhORd
         L00UZdWLvL/iWW0sTqPRva/h8ibOo8MIfFuOE2LTFVW6uPvwgSDF6ryfhAZOgWHU7Tm9
         XNrw==
X-Gm-Message-State: AOAM532D53xdNZovLSxQVqmWDLyMD4clGray09nZa/tpuZ4yEt8AJSlo
        +gY0Vc1lqhdaAyPtF3619jYIN2W+HF4=
X-Google-Smtp-Source: ABdhPJxfUn+mqYNqION2sR82duuBTqyFkfDRc4yBGJdDaNtoPa8tYkYM+QHcojboLqHavDUOH4pZYQ==
X-Received: by 2002:a05:6808:2116:: with SMTP id r22mr3368516oiw.155.1628775132788;
        Thu, 12 Aug 2021 06:32:12 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id w13sm621171otl.41.2021.08.12.06.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 06:32:12 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH] staging: r8188eu: Fix a couple scheduling in atomic bugs
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Phillip Potter <phil@philpotter.co.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Straube <straube.linux@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
References: <20210812065710.GA31863@kili>
From:   Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <2d74ec95-2611-25ca-c0a8-00092c56ff5d@lwfinger.net>
Date:   Thu, 12 Aug 2021 08:32:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812065710.GA31863@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 8/12/21 1:57 AM, Dan Carpenter wrote:
> These allocations are sometimes done while holding a spin_lock so they
> have to be atomic.  The call tree looks like this:
> 
> -> rtw_set_802_11_connect() <- takes a spin_lock
>     -> rtw_do_join()
>        -> rtw_sitesurvey_cmd()  <-- does a GFP_ATOMIC allocation
>           -> p2p_ps_wk_cmd()
> 
> Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/staging/r8188eu/core/rtw_p2p.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_p2p.c b/drivers/staging/r8188eu/core/rtw_p2p.c
> index b4497444a7af..04480a86902e 100644
> --- a/drivers/staging/r8188eu/core/rtw_p2p.c
> +++ b/drivers/staging/r8188eu/core/rtw_p2p.c
> @@ -1697,13 +1697,13 @@ u8 p2p_ps_wk_cmd(struct adapter *padapter, u8 p2p_ps_state, u8 enqueue)
>   		return res;
>   
>   	if (enqueue) {
> -		ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
> +		ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
>   		if (!ph2c) {
>   			res = _FAIL;
>   			goto exit;
>   		}
>   
> -		pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_KERNEL);
> +		pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_ATOMIC);
>   		if (!pdrvextra_cmd_parm) {
>   			kfree(ph2c);
>   			res = _FAIL;

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry


