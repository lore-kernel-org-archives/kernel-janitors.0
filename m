Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63EBC4332F
	for <kernel-janitors@archiver.kernel.org>; Tue, 21 Sep 2021 21:41:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1B0B61165
	for <kernel-janitors@archiver.kernel.org>; Tue, 21 Sep 2021 21:41:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235640AbhIUVm6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 21 Sep 2021 17:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235603AbhIUVmn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Sep 2021 17:42:43 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D22EC061574
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Sep 2021 14:41:13 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id t10so3101125lfd.8
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Sep 2021 14:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZUtb7BIX5XGWejYsRp211NK6WbRuQYuJ0FbAcrgDYUQ=;
        b=RArBOm+P6N7devHl97Vz76wgY+677t3peLjp1TDhFjw1JMmHA9YdrX1ZoA75rm4eQx
         GhqEKHezdYVD9esq7SFJ+UgSI2RuhK8eJHB/JINnEm0rzCLCbOE2iU5KL8JPWsmoV0SG
         tXP2y4Nu+5g17tRWPL6+q2wgdFzOR3Dh/vGztN+dTx/Wu5smKWYzvum9vY13oZ03AvC4
         OIhg3UP/CkqjmFvWn5+gHx0vkUxAFZEq03hjdyNrydt11i+af/rq8xDdTGn2r7giKF+2
         5kSJOs09m1rpjGL3jIV5j8SExjKj81h+/nKrKGuJMFcxSISfHFV+w+9sxwF7pd43aHEZ
         Mqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZUtb7BIX5XGWejYsRp211NK6WbRuQYuJ0FbAcrgDYUQ=;
        b=dqolyPpH0m+JRF+sl6SNER11gQJswD7axLRcTvRJASWhzMJEfqn2jhhBkE2i3HfQKB
         g9s3aKLDvaS6jx+YazqJdMSpfddZjrCE8mH3fu9BrZ/0Hop3MF1jdadkVyniOSEGTA9x
         VYbG52MOwhSFdM2BboOA/REx5w2SXiNnnwDnx6dw33MgfCuuLoRDYDpy8wiWhQXHcE1w
         eB1jeCip7fXC+XgQeZiJ7up0wWlK0HHRAuzMjzgamfvhkFqn053+ScyJ8ch71tZ9YLMD
         GmmyRRdU4DwsAuYuKZNDhewj6F9yC2Q7n2seludy+vRxBLgpIF0z0QWwsOu1uHBdeHs+
         gbDA==
X-Gm-Message-State: AOAM532CKus91Sn5kcKmik71sWfQsUb3qVuUxkIVzt+1a3cG7POgJtiy
        gfW4CexFMQAmja2AAIffS30zKqR3DkHSpQ==
X-Google-Smtp-Source: ABdhPJx2QPLy5x0ifdZlTK6Xj/oVSyCM0uw46wy/DAsGiXc2WmVFvtFZf2I43C9vlK+Jvz1djDf42Q==
X-Received: by 2002:a05:6512:48f:: with SMTP id v15mr24543665lfq.690.1632260471910;
        Tue, 21 Sep 2021 14:41:11 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id t13sm15303lff.279.2021.09.21.14.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 14:41:11 -0700 (PDT)
Date:   Wed, 22 Sep 2021 00:41:09 +0300
From:   Kari Argillander <kari.argillander@gmail.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] fs/ntfs3: Remove a useless shadowing variable
Message-ID: <20210921214109.i4njjbzuspceoe7w@kari-VirtualBox>
References: <704648698ab3a8e2de118c1bfcb7cec9d84738d4.1631994909.git.christophe.jaillet@wanadoo.fr>
 <6cf8bdec16086835c771d797f83b7c298c3667fc.1631994909.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cf8bdec16086835c771d797f83b7c298c3667fc.1631994909.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Sep 18, 2021 at 09:56:28PM +0200, Christophe JAILLET wrote:
> There is already a 'u8 mask' defined at the top of the function.
> There is no need to define a new one here.
> 
> Remove the useless and shadowing new 'mask' variable.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>  fs/ntfs3/bitfunc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs3/bitfunc.c b/fs/ntfs3/bitfunc.c
> index bf10e2da5c6e..50d838093790 100644
> --- a/fs/ntfs3/bitfunc.c
> +++ b/fs/ntfs3/bitfunc.c
> @@ -119,8 +119,7 @@ bool are_bits_set(const ulong *lmap, size_t bit, size_t nbits)
>  
>  	pos = nbits & 7;
>  	if (pos) {
> -		u8 mask = fill_mask[pos];
> -
> +		mask = fill_mask[pos];
>  		if ((*map & mask) != mask)
>  			return false;
>  	}
> -- 
> 2.30.2
> 
