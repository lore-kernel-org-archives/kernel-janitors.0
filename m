Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347A6C49EA2
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Jun 2021 03:32:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DAEF6128B
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Jun 2021 03:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232238AbhFRDem (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 17 Jun 2021 23:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbhFRDel (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 17 Jun 2021 23:34:41 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA0E3C06175F
        for <kernel-janitors@vger.kernel.org>; Thu, 17 Jun 2021 20:32:31 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id w31so6653030pga.6
        for <kernel-janitors@vger.kernel.org>; Thu, 17 Jun 2021 20:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1IR2Jtwu8aWSfR50DxaFiQcomIN7MP6Klsy7f1btCzI=;
        b=TtMv60lza7lNizDysWmmBY57vOoGikPqFdk0B+a5JlDmUhvJPek2Y+q9Omq+R3+B2w
         ytlzcFCqwdBfo8K8WT4sR399ZKqYlmspHEk3mXH7Ne69p66UX+1Qr0GrnZkPb66BN/Lv
         9t6SOXBbI15cJrifYX03qatIhO7ieAAPs6mD+Gv1nanvG5OmS0+xzBkOgNvoREYNYxEZ
         LIP8yp6/O/8ULcITglX0svfJzbg0wcST6jc6nLLWuemQbjazFo2TPy2vsAnU+i8vvVZ6
         Mgmv3uFgwrhVlHcZpFoluSG0vF8ip10pkMuLm3IcM9u3aPRveQTiw1l8tYK2AEg7MSb2
         Lx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1IR2Jtwu8aWSfR50DxaFiQcomIN7MP6Klsy7f1btCzI=;
        b=pZ7puypEvlAKka/kh0NfX9kS8SwMrNz6ITevaw3H3BuKlDa3RFZDe3dmRqVH8ibMoL
         5vxSQYwBI2yUdNtJVeDZK3Em7hWt2GHYRjb8RFfE/Fxf/oQ7LsL4qeTxpGwAjktwLkfo
         /kBaMzj+VgL7noKZk8T3OuaWMT6FzmKGhZprfE0whpADjGPAO4x2C1ppAUEC+IcUZs3t
         l9l1mpbkm7N6b2HSHlaMGgQw3X4ONqVsQ0EKA8Eq6Kj5/yxqtn1Y+2RbmX0ypIQ4O+/D
         aTVtq4Sl/dXP26srvrinhhoqq864M/ujq54PVzEEF6L4UOQ33RtZ18jMN+eCswfo44II
         h/EA==
X-Gm-Message-State: AOAM533vgm+LP2sK5w+GpiEopRsAFOuSFKFmWRsc3TiYzJyPrP+r0jW/
        xTj01F8byCaqUDOxCLxC8g2+YQ==
X-Google-Smtp-Source: ABdhPJyZujAfTBJoBP8IoVxzcmnKXOahTuBWcxxJtVS8tTuDE26rzuzY5dgIrUd7sosptn/B+2loYg==
X-Received: by 2002:a63:1011:: with SMTP id f17mr8066798pgl.274.1623987151163;
        Thu, 17 Jun 2021 20:32:31 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id r14sm6072661pgm.28.2021.06.17.20.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 20:32:30 -0700 (PDT)
Date:   Fri, 18 Jun 2021 09:02:28 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] opp: remove redundant continue statement
Message-ID: <20210618033228.mork47zl3xydwb34@vireshk-i7>
References: <20210617135020.16415-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617135020.16415-1-colin.king@canonical.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 17-06-21, 14:50, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The continue statement at the end of a for-loop has no effect,
> remove it.
> 
> Addresses-Coverity: ("Continue has no effect")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/opp/of.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> index 9573facce53a..d298e38aaf7e 100644
> --- a/drivers/opp/of.c
> +++ b/drivers/opp/of.c
> @@ -197,10 +197,8 @@ static void _opp_table_alloc_required_tables(struct opp_table *opp_table,
>  		required_opp_tables[i] = _find_table_of_opp_np(required_np);
>  		of_node_put(required_np);
>  
> -		if (IS_ERR(required_opp_tables[i])) {
> +		if (IS_ERR(required_opp_tables[i]))
>  			lazy = true;
> -			continue;
> -		}
>  	}

I had to merge this with:

"opp: Allow required-opps to be used for non genpd use cases"

Thanks for the report anyway :)

-- 
viresh
