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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC3CC433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 21 Sep 2021 21:40:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 567C661019
	for <kernel-janitors@archiver.kernel.org>; Tue, 21 Sep 2021 21:40:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235499AbhIUVlp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 21 Sep 2021 17:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235571AbhIUVl3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Sep 2021 17:41:29 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC49C061766
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Sep 2021 14:39:59 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id i4so3249752lfv.4
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Sep 2021 14:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/GQ08mCZ9JBRNvUpdTV21Jt1At5dv3ORktXGx4iID3I=;
        b=N0gJMruNuD1kJbokvqcOpwZLU/22Bl91BvdhgutTzqI8DSeLFO60gjP3NvgBX1Jk1J
         Z9EJbZddRRwDjiIOW0scfiSsLK5gJUq9d2v9plGV0xymgYoEDe2l8faKQe5d8TLfRqhe
         PD83Mh8r7y1ZRcPYJ9e/n4opfUU46hbPZsVtGIcd9QMUaWI3ApFKH6WAJgjasF/Qk18t
         Ut/Ft1j/d/3Z/NdZ8eFKITabS0yPkOEtHGXpCMoOeb3XfUPcig95OdsN8oNFzcwW+gmD
         ng0Zhlk7gZV8VKGbn+oW36oZbAH/DItOJ2yo2jyFXo5IKTB0zSklzcaUs7jX/Vhs8eHb
         SBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/GQ08mCZ9JBRNvUpdTV21Jt1At5dv3ORktXGx4iID3I=;
        b=bBdBI70nVGamgb6uKSCCerLzlzHVVPEaWyQMv+iB8wenwoXSJERexw/gW88NM+mzao
         W4TWtAauV0mZYo2/p0lEbYwtYzv+vnbdf7SyOfroBl2OykcrufI2shOVBoD+E9pFuDxA
         hfe4oSt9xtAwv60zaS91SzN7HPnzhR+t8OHMvwiHETIjBu4P71bgjoGn1qbmZsufXs2I
         +hfTOJ4smqUxH1Mm6fjTV9Vakj+mJiLgSuT6DgLVPILeq/GUoUhtXvaJrtbbyAMfAxS/
         HB5cvKMQNiOLJ1YXbnkU4JjwqUppdCV4tO9Vek8WvQLSln0qAnUjpTEsyXaoui0mzdmT
         2uVQ==
X-Gm-Message-State: AOAM532IFMfsrC66Jvl39xToF/5K0k5aZ2jmXktPKAvyki7ej0aMee8C
        8QkLqK/tPFwgY3SnZghXwfQ=
X-Google-Smtp-Source: ABdhPJz3waXH/voz9v0RfeBYPoEPFVNaXKv31j9rViKQj5XCZKbqqesKSppQmnpyFZjzIkbv7JkeCQ==
X-Received: by 2002:a19:f517:: with SMTP id j23mr23795986lfb.371.1632260397403;
        Tue, 21 Sep 2021 14:39:57 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id z16sm13452lji.41.2021.09.21.14.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 14:39:57 -0700 (PDT)
Date:   Wed, 22 Sep 2021 00:39:55 +0300
From:   Kari Argillander <kari.argillander@gmail.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] fs/ntfs3: Remove a useless test in 'indx_find()'
Message-ID: <20210921213955.se7svkfr62xndnlc@kari-VirtualBox>
References: <704648698ab3a8e2de118c1bfcb7cec9d84738d4.1631994909.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <704648698ab3a8e2de118c1bfcb7cec9d84738d4.1631994909.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Sep 18, 2021 at 09:56:19PM +0200, Christophe JAILLET wrote:
> 'fnd' has been dereferenced several time before, so testing it here is
> pointless.
> Moreover, all callers of 'indx_find()' already have some error handling
> code that makes sure that no NULL 'fnd' is passed.
> 
> So, remove the useless test.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Seems correct, thanks.

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>  fs/ntfs3/index.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
> index 4f71a91f07d9..6f81e3a49abf 100644
> --- a/fs/ntfs3/index.c
> +++ b/fs/ntfs3/index.c
> @@ -1072,9 +1072,7 @@ int indx_find(struct ntfs_index *indx, struct ntfs_inode *ni,
>  	if (!e)
>  		return -EINVAL;
>  
> -	if (fnd)
> -		fnd->root_de = e;
> -
> +	fnd->root_de = e;
>  	err = 0;
>  
>  	for (;;) {
> -- 
> 2.30.2
> 
