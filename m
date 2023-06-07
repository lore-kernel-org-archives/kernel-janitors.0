Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85676C7EE25
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Jun 2023 15:39:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241404AbjFGPjW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Jun 2023 11:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235079AbjFGPjS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Jun 2023 11:39:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0532FFC
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Jun 2023 08:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686152311;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zHVq+AaJsRP3MMD5HoVnegJq1rhI+iZeYf1Kj+A0Nvo=;
        b=TssTSqZ+3E/UfDqo0W67A1o/MbwPonadgsI6PrBdmixASQapSKAgmtkPK9tZ/Tzjl0B20c
        hBvVZ8WMBgcNYb4BkLFdZI8es9zkA0kANX7oXmTG88Oq1n0G1aH6atPrGK2WSrph7i/+ZN
        Gxfw9PygbJiFaO3QuUeN9xZS8g8xioo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-nW52ekb8MqWqMC2iDgJZGA-1; Wed, 07 Jun 2023 09:56:14 -0400
X-MC-Unique: nW52ekb8MqWqMC2iDgJZGA-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6261691ef6fso65886326d6.3
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Jun 2023 06:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686146174; x=1688738174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHVq+AaJsRP3MMD5HoVnegJq1rhI+iZeYf1Kj+A0Nvo=;
        b=RPwT4tSEKvV+zAANEvKM+6+iOUt0TtSa0tlkT5VYbKIkJ1ncNi0mz76TiNdLb0VBPT
         uoE9WYnzLclbiH2zR2B2uXcf+RwIFjMLRlIqgt/4p1pdGIaenBW7oi2n4jveYpAMhcRl
         YpYm8eOYchxhb9l+TCHfkHmMUk7v9WRsL4uB/caheIoJ42XQw9Mk6GslcGFyx7EcVKAe
         FVlINttTHEdLTdBLRB4t++KP+5lbHsHtRgb6Sa2kp5+xFThtJ8pmPd2IQLJ5H/f/cv7K
         +fk/NOUDWxV2IhQauB8zTF0VIXn5MZsMyp/VqpHPraxqd8TRJATBCiWmY6CXjLN8brTm
         RYSA==
X-Gm-Message-State: AC+VfDwIqSfG/fjLQdY1DPYz84razJK3t+A+ueU2Q5ZbGXZqIFPIlgc4
        x67l8qnQabSbWWngr2YyWcLIjGY5zxYrXU/JtxFzR535aJ8mDt0M8sc8KK8qBBl6TCmI5tj627A
        P9u3SEuIGks5cvxr3uIDL4/1KZALP0Y61/8pOTvp1u4fm
X-Received: by 2002:a05:6214:d0a:b0:626:17b2:5583 with SMTP id 10-20020a0562140d0a00b0062617b25583mr2995551qvh.0.1686146174410;
        Wed, 07 Jun 2023 06:56:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5HEDyEyI1XjMl1yL6Vf9kP387Y6xhzYFVTHowmTz0vgcWT3RbgWM1B06oyD5ILkdVw/rYU26DuplYERBf00D8=
X-Received: by 2002:a05:6214:d0a:b0:626:17b2:5583 with SMTP id
 10-20020a0562140d0a00b0062617b25583mr2995538qvh.0.1686146174135; Wed, 07 Jun
 2023 06:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230607053940.39078-10-bagasdotme@gmail.com> <20230607053940.39078-13-bagasdotme@gmail.com>
In-Reply-To: <20230607053940.39078-13-bagasdotme@gmail.com>
From:   Richard Fontana <rfontana@redhat.com>
Date:   Wed, 7 Jun 2023 09:56:03 -0400
Message-ID: <CAC1cPGzZGWxS1qdKZkMuHrCenegje-M0QE0tFG5UotHAjN5vmQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] crypto: drbg: Convert dual BSD 3-Clause/GPL-1.0
 license boilerplate to SPDX identifier
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Franziska Naepelt <franziska.naepelt@googlemail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
        Linux Kernel Janitors <kernel-janitors@vger.kernel.org>,
        Linux Crypto <linux-crypto@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Stephan Mueller <smueller@chronox.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jun 7, 2023 at 1:41=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com>=
 wrote:
>
> Replace the boilerplate with corresponding SPDX tag. Since there is no
> explicit GPL version, assume GPL 1.0+.
>
> Cc: Stephan Mueller <smueller@chronox.de>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  crypto/drbg.c | 33 +--------------------------------
>  1 file changed, 1 insertion(+), 32 deletions(-)
>
> diff --git a/crypto/drbg.c b/crypto/drbg.c
> index ff4ebbc68efab1..f797deaf3952ef 100644
> --- a/crypto/drbg.c
> +++ b/crypto/drbg.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: BSD-3-Clause OR GPL-1.0+
>  /*
>   * DRBG: Deterministic Random Bits Generator
>   *       Based on NIST Recommended DRBG from NIST SP800-90A with the fol=
lowing
> @@ -9,38 +10,6 @@
>   *
>   * Copyright Stephan Mueller <smueller@chronox.de>, 2014
>   *
> - * Redistribution and use in source and binary forms, with or without
> - * modification, are permitted provided that the following conditions
> - * are met:
> - * 1. Redistributions of source code must retain the above copyright
> - *    notice, and the entire permission notice in its entirety,
> - *    including the disclaimer of warranties.
> - * 2. Redistributions in binary form must reproduce the above copyright
> - *    notice, this list of conditions and the following disclaimer in th=
e
> - *    documentation and/or other materials provided with the distributio=
n.
> - * 3. The name of the author may not be used to endorse or promote
> - *    products derived from this software without specific prior
> - *    written permission.
> - *
> - * ALTERNATIVELY, this product may be distributed under the terms of
> - * the GNU General Public License, in which case the provisions of the G=
PL are
> - * required INSTEAD OF the above restrictions.  (This clause is
> - * necessary due to a potential bad interaction between the GPL and
> - * the restrictions contained in a BSD-style copyright.)
> - *
> - * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESS OR IMPLIED
> - * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
> - * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, ALL OF
> - * WHICH ARE HEREBY DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE
> - * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> - * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
> - * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
> - * BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> - * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> - * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
> - * USE OF THIS SOFTWARE, EVEN IF NOT ADVISED OF THE POSSIBILITY OF SUCH
> - * DAMAGE.

The non-GPL portion of this notice does not match BSD-3-Clause as
currently defined by SPDX (see:
https://github.com/spdx/license-list-XML/blob/main/src/BSD-3-Clause.xml).
This is at least the third time in your recent patches that you have
assumed that a non-GPL license matches a particular SPDX identifier
without (apparently) checking.

That's assuming it's appropriate to represent this as a dual license
and omit the 'ALTERNATIVELY' parenthetical. I'm not sure how I feel
about that.

Richard

