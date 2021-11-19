Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8B9C433F5
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Nov 2021 23:16:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235095AbhKSXTX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 19 Nov 2021 18:19:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235003AbhKSXTX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Nov 2021 18:19:23 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7987C06173E
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Nov 2021 15:16:20 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id o17so11020882qtk.1
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Nov 2021 15:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=fbwBJ/7tiZLlAuTyZOPjLj3If2zENx0mjR578iDfOxc=;
        b=1LQa7aZRgvqMkeKew1B2mxBN5z+USyumxJWCWTLNOi1sJQY2TsOJjxcEJd426ke5wj
         eaypq55uSRNBK5tpr9fL6ZtZ4QJiP326mmEITMpqmhSgmE1q20oJtey/YiahYF3Z55MJ
         qEi5Eev3BylFxPt6YqhSWDfAHjox2p9UOISooubR4WdLLu/uSPzaDR50K9oF8D4Ey6kt
         Rki0oJ4v8zjYG2qivZ/cnohgJHyGuE6NUggpvOpfQYR4yvNtXzBM57R6TH3v/fGbMKGl
         dnPZFrmSzmFMevlxGCkNdmQ5Or7zR1Skm954alYGy28UF2+6nxgIuh9bXCtAR/lRMQt+
         c69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=fbwBJ/7tiZLlAuTyZOPjLj3If2zENx0mjR578iDfOxc=;
        b=WGEqDZzEI+NkT8DWoVrEBvmrQGYRCFJRO73cfHncv6IbbpNpFpKHdKyWd5scU0sUki
         HH3sHnJkpaE9qgYunfosyHvHxGmljv7+caFy4rAFmlt+nl8TS+PzedtpaNIJ6cf0EHUM
         qxOq54ckLvhVvsFKiHo4jxBjhMglKoXxOFcwCkPa1C5JFS/CXUgwcyN6JDU8CsUl2/IV
         coOzJHhTGZuiHy/+UohzsaUFnDnw7azdiJ2Dto/xLsGYpcN+QqfryUfbGjL2o1cSATIM
         s7tmrToOYqN/BshqonkSdbdkVCu6we8DbfuQGzSowQq6GomWllpncqXHcKWShSj4iBF9
         2vSw==
X-Gm-Message-State: AOAM533eCKMlnGgXOiAl5KN43dHM2nSQYJAIJE+pBnZSJRE0iDUe1i59
        d1mnofJc0L6dC674ZhhgRW6xEA==
X-Google-Smtp-Source: ABdhPJxhHil83yjfhbXuAPxha0HpNEFVV+oaR1l3ki1U2O/b9xob0LbHwhNjMoyt6mKNRcxfExyA1w==
X-Received: by 2002:a05:622a:391:: with SMTP id j17mr10615333qtx.228.1637363779886;
        Fri, 19 Nov 2021 15:16:19 -0800 (PST)
Received: from xanadu.home (modemcable108.170-21-96.mc.videotron.ca. [96.21.170.108])
        by smtp.gmail.com with ESMTPSA id k85sm538099qke.134.2021.11.19.15.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 15:16:19 -0800 (PST)
Date:   Fri, 19 Nov 2021 18:16:18 -0500 (EST)
From:   Nicolas Pitre <npitre@baylibre.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
cc:     alexandre.belloni@bootlin.com, boris.brezillon@collabora.com,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i3c/master: Fix a potentially infinite loop in
 'hci_dat_v1_get_index()'
In-Reply-To: <0cdf3cb10293ead1acd271fdb8a70369c298c082.1637186628.git.christophe.jaillet@wanadoo.fr>
Message-ID: <6s9184r-99rn-nr27-174s-r2nqn1o294n9@onlyvoer.pbz>
References: <0cdf3cb10293ead1acd271fdb8a70369c298c082.1637186628.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 17 Nov 2021, Christophe JAILLET wrote:

> The code in 'hci_dat_v1_get_index()' really looks like a hand coded version
> of 'for_each_set_bit()', except that a +1 is missing when searching for the
> next set bit.
> 
> This really looks odd and it seems that it will loop until 'dat_w0_read()'
> returns the expected result.
> 
> So use 'for_each_set_bit()' instead. It is less verbose and should be more
> correct.
> 
> Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Nicolas Pitre <npitre@baylibre.com>

> ---
> Speculative fix. Untested.
> ---
>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> index 783e551a2c85..97bb49ff5b53 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> @@ -160,9 +160,7 @@ static int hci_dat_v1_get_index(struct i3c_hci *hci, u8 dev_addr)
>  	unsigned int dat_idx;
>  	u32 dat_w0;
>  
> -	for (dat_idx = find_first_bit(hci->DAT_data, hci->DAT_entries);
> -	     dat_idx < hci->DAT_entries;
> -	     dat_idx = find_next_bit(hci->DAT_data, hci->DAT_entries, dat_idx)) {
> +	for_each_set_bit(dat_idx, hci->DAT_data, hci->DAT_entries) {
>  		dat_w0 = dat_w0_read(dat_idx);
>  		if (FIELD_GET(DAT_0_DYNAMIC_ADDRESS, dat_w0) == dev_addr)
>  			return dat_idx;
> -- 
> 2.30.2
> 
> 
> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
> 
