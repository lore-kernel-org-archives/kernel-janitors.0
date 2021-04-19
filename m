Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5602C433B4
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Apr 2021 06:57:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F4B16101C
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Apr 2021 06:57:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237214AbhDSG5c (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Apr 2021 02:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237349AbhDSG5F (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Apr 2021 02:57:05 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8AD1C06138B
        for <kernel-janitors@vger.kernel.org>; Sun, 18 Apr 2021 23:56:33 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id j12so14268406edy.3
        for <kernel-janitors@vger.kernel.org>; Sun, 18 Apr 2021 23:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fkV+Pi3iCC1dzpT7aGxNdWglsEiPELgqZ4OhcTsaIeI=;
        b=Bad0YWM8Sq2gg5hwhfWo16oWSJEsZzMf/OlxgaxCaSiPCf6TTqCQUxste2ZO3hNzzy
         LBMDmWFsA04A46vkWx6IjRUf4Dt9fW5K/6sbfdzOf5xnMWoUgnj3l2Za5HyIk/7znZmy
         48qshdzeb0hrJyinncQlUve6dM94hTyXG3sDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fkV+Pi3iCC1dzpT7aGxNdWglsEiPELgqZ4OhcTsaIeI=;
        b=cYGqjkILvC9D3sM2ab1yGu/MKq0uqjMTEz92XU63KnmF27cJye86LCEw/cr296p3Yg
         BxqBpZ4WHKgE4B3Xccpb3MaZEIh0W9lyhgSe5icHZvZzK53c9CcPMFeN7wYOWNV/kOwN
         rNcAWB7m/Gi4ENNzjl6yoZR4LylChNtPDdZ0WdfZdmmXEMdLd3vvLHB4wShYNZmohkee
         8vzXPqVki2NL5aSCiAbVCyOwU7BEdfEYQGxLzJ1+N1f4c4IJECATbFMHwzRGc8b5/TQZ
         g19gibIfrNFiHAIP9aVMCVKUk8moAhZqJ0/ZFN47aDpDKSxQyMh36YOvxsCkx/fFZ0nb
         v9qA==
X-Gm-Message-State: AOAM531GtxeZjDgxVUZxKMDE0ltG/XmwaZQjtBJrAHk+qH2tDMSGHogt
        JXe27bsiyhSi+B46dLY7WmW1Oi/41DYQMwru
X-Google-Smtp-Source: ABdhPJzwjt0lczMJnkLhsdYdD9PkLvYNQrJgHMSDrKdJDbnerZ3I/m39nrjrhs+gTK9hjqeHA82n5g==
X-Received: by 2002:aa7:d046:: with SMTP id n6mr23100257edo.357.1618815392235;
        Sun, 18 Apr 2021 23:56:32 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.71.248])
        by smtp.gmail.com with ESMTPSA id c13sm5829017edw.88.2021.04.18.23.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Apr 2021 23:56:31 -0700 (PDT)
Subject: Re: [PATCH 1/2] workqueue: Have 'alloc_workqueue()' like macros
 accept a format specifier
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>, tj@kernel.org,
        jiangshanlai@gmail.com, saeedm@nvidia.com, leon@kernel.org,
        davem@davemloft.net, kuba@kernel.org, bvanassche@acm.org
Cc:     netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <cover.1618780558.git.christophe.jaillet@wanadoo.fr>
 <ae88f6c2c613d17bc1a56692cfa4f960dbc723d2.1618780558.git.christophe.jaillet@wanadoo.fr>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <92fed8ae-d92e-0732-2dfc-8fc726802a62@rasmusvillemoes.dk>
Date:   Mon, 19 Apr 2021 08:56:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <ae88f6c2c613d17bc1a56692cfa4f960dbc723d2.1618780558.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 18/04/2021 23.26, Christophe JAILLET wrote:
> Improve 'create_workqueue', 'create_freezable_workqueue' and
> 'create_singlethread_workqueue' so that they accept a format
> specifier and a variable number of arguments.
> 
> This will put these macros more in line with 'alloc_ordered_workqueue' and
> the underlying 'alloc_workqueue()' function.
> 
> This will also allow further code simplification.
> 
> Suggested-by: Bart Van Assche <bvanassche@acm.org>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  include/linux/workqueue.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
> index d15a7730ee18..145e756ff315 100644
> --- a/include/linux/workqueue.h
> +++ b/include/linux/workqueue.h
> @@ -425,13 +425,13 @@ struct workqueue_struct *alloc_workqueue(const char *fmt,
>  	alloc_workqueue(fmt, WQ_UNBOUND | __WQ_ORDERED |		\
>  			__WQ_ORDERED_EXPLICIT | (flags), 1, ##args)
>  
> -#define create_workqueue(name)						\
> -	alloc_workqueue("%s", __WQ_LEGACY | WQ_MEM_RECLAIM, 1, (name))
> +#define create_workqueue(fmt, args...)					\
> +	alloc_workqueue(fmt, __WQ_LEGACY | WQ_MEM_RECLAIM, 1, ##args)

The changes make sense, but are you sure that no current users of those
macros have some % character in the string they pass? If all users pass
string literals the compiler/0day bot should catch those, but as the
very example you give in 2/2 shows, not everybody passes string literals.

Maybe git grep would quickly tell that there's only 8 callers and they
are all audited quickly or something like that; in that case please
include a note to that effect in the commit log.

Rasmus
