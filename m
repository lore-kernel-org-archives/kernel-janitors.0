Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8E0EB64DD
	for <kernel-janitors@archiver.kernel.org>; Tue,  4 Jul 2023 14:07:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbjGDOHj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 4 Jul 2023 10:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbjGDOH1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 4 Jul 2023 10:07:27 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384E7E7E
        for <kernel-janitors@vger.kernel.org>; Tue,  4 Jul 2023 07:07:25 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbc244d384so54811655e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Jul 2023 07:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688479643; x=1691071643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bfa1/VBRiNKgEl3qdEAtKMNGvx01sB2q9WDNlFHKK1c=;
        b=z6pMi7YbOvNgeA/MwIw5jnbFTmwFIWpWEUtMAnW3hhn5RC9cAEVI8tFZvBthd3jBqH
         KpYVP414qrfxgVNG39QP2t/6ek5mgjpBTzalv5mtetoMSBFBKHJ17K+uHzNizK7Sx/O9
         MlvjnwesNjVdPsoyhlLKSGq4xPbXKZWu/9Mt2wdxERA5Vs6sL+nWZ1l+B/+AeIoF5+qG
         uHGQCtCiiwiN7K3i8sfM37HS1py/bOp1J0ilUjDz9lEbJaBF+lmeG3nc2nph4x8AqG8h
         ovH//OmEO6BKvjHsDk+3RloazUV89m0xKwMQbOBXsN17Yix6dZA6TmV0xDi+wlfCtv6U
         Fj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688479643; x=1691071643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bfa1/VBRiNKgEl3qdEAtKMNGvx01sB2q9WDNlFHKK1c=;
        b=DKJp/ZSlMhSAw9+YmGdCxmXsr6rMsFQqNjouiPC+TW7IcshFqEeKymGlson8Gee+y7
         s/vJZRkWO4dlHTMWWYDYZkwPM7ZP32cvudSoeaF0VcBBgqM/B1vaAv4Qc38vIzIEZPuZ
         /tOVndnBILyYpZzkMrMHUDlQytnNknr5yXCMLTzxcoZXohbpPXkh+YFsV4cIaqGbE6NW
         LvNFh86JKQaVzlFxKW29wwY05XQtNqIfENdEUVrEWKZ+IjBe+tPXnTLH4ynqad9D9W34
         0YuWEOpHS0wM8Q0t4Fu7hLf3His/foUJgXsgfXaGeenPwLIvHTnzGYxOmgZpCVP5nqDa
         H8MQ==
X-Gm-Message-State: ABy/qLYiLhwRBTEgM4NbPjBccMM3QnRiwAzg3ykhy4UY0qYMB5PfE/OW
        ZkjFXQgFNd2flWvB24ln6b9MjQ==
X-Google-Smtp-Source: APBJJlGireM4qFr+8mexUwYlWxsi1ThA6EdbPSWsPwCGvU5BGxn1v/W0kKfqBUxCNr6faMKKSUqI2A==
X-Received: by 2002:a5d:4444:0:b0:314:2d89:70f1 with SMTP id x4-20020a5d4444000000b003142d8970f1mr7274880wrr.16.1688479643649;
        Tue, 04 Jul 2023 07:07:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j4-20020adfea44000000b0030fa3567541sm28597400wrn.48.2023.07.04.07.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 07:07:21 -0700 (PDT)
Date:   Tue, 4 Jul 2023 17:07:17 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Leon Romanovsky <leon@kernel.org>
Cc:     Guy Levi <guyle@mellanox.com>, Yishai Hadas <yishaih@nvidia.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] RDMA/mlx4: Make check for invalid flags stricter
Message-ID: <359dc6de-2b08-4baa-99cc-d5e5f6e6ce43@kadam.mountain>
References: <233ed975-982d-422a-b498-410f71d8a101@moroto.mountain>
 <20230704133841.GD6455@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704133841.GD6455@unreal>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 04, 2023 at 04:38:41PM +0300, Leon Romanovsky wrote:
> On Thu, Jun 29, 2023 at 09:07:37AM +0300, Dan Carpenter wrote:
> > This code is trying to ensure that only the flags specified in the list
> > are allowed.  The problem is that ucmd->rx_hash_fields_mask is a u64 and
> > the flags are an enum which is treated as a u32 in this context.  That
> > means the test doesn't check whether the highest 32 bits are zero.
> > 
> > Fixes: 4d02ebd9bbbd ("IB/mlx4: Fix RSS hash fields restrictions")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > The MLX4_IB_RX_HASH_INNER value is declared as
> > "MLX4_IB_RX_HASH_INNER           = 1ULL << 31," which suggests that it
> > should be type ULL but that doesn't work.  It will still be basically a
> > u32.  (Enum types are weird).
> 
> Can you please elaborate more why enum left to be int? It is surprise to me.

Enum types are not defined very strictly in C so it's up to the
compiler.

Clang, GCC and Sparse implement them in the same way.  They default
to u32 unless the values can't fit, then they become whatever type fits.
So if you have a negative, it becomes an int or a big value changes the
type to unsigned long.

Since 1ULL < 31 fits in u32 the type is just u32.

regards,
dan carpenter

#include <stdio.h>

enum example_one {
	VAL = 1ULL << 31,
};

enum example_two {
	NEGATIVE = -2,
};

enum example_three {
	BIG = 1ULL << 32,
};

int main(void)
{
	enum example_one one = -1;
	enum example_two two = -1;
	enum example_three three = -1;

	printf("%lu\n", sizeof(enum example_one));

	if (one > 0)
		printf("one unsigned\n");
	if (two < 0)
		printf("two signed\n");

	printf("%lu\n", sizeof(enum example_three));
	if (three > 0)
		printf("three unsigned\n");

	return 0;
}


