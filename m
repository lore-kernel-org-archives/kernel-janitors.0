Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CFFCDB465
	for <kernel-janitors@archiver.kernel.org>; Sun, 15 Oct 2023 02:30:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233390AbjJOCaD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 14 Oct 2023 22:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbjJOCaB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 14 Oct 2023 22:30:01 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D1AFCC
        for <kernel-janitors@vger.kernel.org>; Sat, 14 Oct 2023 19:29:59 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6bd73395bceso168488b3a.0
        for <kernel-janitors@vger.kernel.org>; Sat, 14 Oct 2023 19:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697336998; x=1697941798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dhN/OgC882rYGvnQvvtSIJopNEt0MUImMTuzjqZB2Xk=;
        b=Odi8MenDvKuf/AZcwNneuZFISXmSP4H8U2QnTOs9+tLcXMyrQNLcEq5oM1t0ELa5XI
         DPAWGPpjkHyon7/JTTZAgPY/HteOJpRDWphxmeF4BOphMAHqnt7RZBDW6IVJZGIoGDLr
         NPKv1l4UeDBU8qczVFi6AZfXG/jzFv++t1ilc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697336998; x=1697941798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhN/OgC882rYGvnQvvtSIJopNEt0MUImMTuzjqZB2Xk=;
        b=AF0K7pkIYeSsvsQVXJzxg0hK6w2xRbVCSA54bUw+TUstj8wV1+vdsypJUrfZSsr59g
         KyiEP149rTMQOmbMh5i81V8VjApvmciN80G/MRRxjhH/RfQrqZ35hCFUvNm126OAhxJg
         Ba6f0BQ8oyxuSjCiczrmfqDn9KYZM/rYopEbaDd/SIgLG0DjIE417xw+kexpv1m2QTrG
         0/wfdYzO9sXKA2uoCUVH+yhlF5BQyuF0lXi5ld67FxXWovTypysy4qRylmkA1O5qnJ+A
         RpLuqp0rkDejJxeNRQfgxgt+6v40MV0SIfkY6argbFTuXt0fozt2tqejm6HKrlQtecfX
         wkRg==
X-Gm-Message-State: AOJu0YzItNDDRtYsoffmFJ4yXnCo+ENA7Iju7rA0SOwgmNOo7RjhlSZG
        ptJjOQQbrcqK/bHzcrrRdU7O/2gwE11Qwr3i51c=
X-Google-Smtp-Source: AGHT+IHFveeRvUhPLEvQmB6YP6tVaXJOJXks9U+vR3El7JIrG5IcRyQop3DrOWjlCqDIVoZMvrQUcA==
X-Received: by 2002:a05:6a00:318c:b0:68f:cdb8:ae33 with SMTP id bj12-20020a056a00318c00b0068fcdb8ae33mr5233919pfb.10.1697336998549;
        Sat, 14 Oct 2023 19:29:58 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t1-20020a63b701000000b005776446f7cbsm4589302pgf.66.2023.10.14.19.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 19:29:57 -0700 (PDT)
Date:   Sat, 14 Oct 2023 19:29:57 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Pravin B Shelar <pshelar@ovn.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, netdev@vger.kernel.org,
        dev@openvswitch.org, linux-hardening@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH v2 2/2] net: openvswitch: Annotate struct mask_array with
 __counted_by
Message-ID: <202310141928.23985F1CA@keescook>
References: <e5122b4ff878cbf3ed72653a395ad5c4da04dc1e.1697264974.git.christophe.jaillet@wanadoo.fr>
 <ca5c8049f58bb933f231afd0816e30a5aaa0eddd.1697264974.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca5c8049f58bb933f231afd0816e30a5aaa0eddd.1697264974.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Oct 14, 2023 at 08:34:53AM +0200, Christophe JAILLET wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> v2: Fix the subject  [Ilya Maximets]
>     fix the field name used with __counted_by  [Ilya Maximets]
> 
> v1: https://lore.kernel.org/all/f66ddcf1ef9328f10292ea75a17b584359b6cde3.1696156198.git.christophe.jaillet@wanadoo.fr/
> 
> 
> This patch is part of a work done in parallel of what is currently worked
> on by Kees Cook.
> 
> My patches are only related to corner cases that do NOT match the
> semantic of his Coccinelle script[1].
> 
> In this case, in tbl_mask_array_alloc(), several things are allocated with
> a single allocation. Then, some pointer arithmetic computes the address of
> the memory after the flex-array.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> ---
>  net/openvswitch/flow_table.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/openvswitch/flow_table.h b/net/openvswitch/flow_table.h
> index 9e659db78c05..f524dc3e4862 100644
> --- a/net/openvswitch/flow_table.h
> +++ b/net/openvswitch/flow_table.h
> @@ -48,7 +48,7 @@ struct mask_array {
>  	int count, max;
>  	struct mask_array_stats __percpu *masks_usage_stats;
>  	u64 *masks_usage_zero_cntr;
> -	struct sw_flow_mask __rcu *masks[];
> +	struct sw_flow_mask __rcu *masks[] __counted_by(max);
>  };

Yup, this looks correct to me. Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
