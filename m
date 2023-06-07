Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679FCC7EE23
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Jun 2023 15:25:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241423AbjFGPZq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Jun 2023 11:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241660AbjFGPZS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Jun 2023 11:25:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9A02702
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Jun 2023 08:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686151376;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+21+UJe7FXTwrAHp4Kil2Yb3E5Xx9Nc7BO+F/S0Qdi8=;
        b=eyRvlO5ncYEs92M8KTYxkn6PvQghun3ZqrhVCKviWfNEy5qBdwdCXZHwXZHNPuO8uE3L2Q
        tBRlfocRe9SghuplZk0/bHgySZn+TsTNX6XFL39ijQH64d5Vyb/31w52W/fPTI4ZjL6pRr
        S+8KDR5OncE0XrrbkFcFYfqx4qX6mnI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-TRymp993O82hxvOr_g-06g-1; Wed, 07 Jun 2023 09:47:45 -0400
X-MC-Unique: TRymp993O82hxvOr_g-06g-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6260d4a9802so79463996d6.1
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Jun 2023 06:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686145665; x=1688737665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+21+UJe7FXTwrAHp4Kil2Yb3E5Xx9Nc7BO+F/S0Qdi8=;
        b=WKUMCT5A8vX/OkZj1iYSAg8AI69fTIQf+RcTXPjX5vqX0PAafECE0Mk2m+5ONQs0tw
         RszwnNgCu5g6Ok3h7GbVasdSG+wqOQAE+llKzHPwHBodaiME0l5Z+Ts7lmpVZe5bX1vJ
         cyZ5XfXLIwA1JEgpxCG6VGxf6VmxB3JebAfWiAIMhdXxB+ibF+Myw6bsI9M7Sde6c6Qy
         MshSPZL0LHiQCJCZK0i0T6kxpLjzI6Sv6c4+wLcuNBxaz68Rr58Szy5TexKcayrSiTow
         48lvsbhZAw5A7cuDxyIazswD/SmmihC8VAipKuXeaxGw9kYUmQqv4aeRoV3QE/6xgphU
         Vx6w==
X-Gm-Message-State: AC+VfDzcPOdBXllTNBV5QVWYNz5drYwFqnCxVHTNHbnyC3GiIKaAyIAg
        ogdcFn18iAnFntAe5kdmbQFHXdjf/adYi2hEAq6kRixRr6zlljtKWBF7ek96zDn8B3abLszcTJT
        W003Af1EWkt1CAk8eFPM2+dg5kMMs8JEFSEi45HSqPWb6
X-Received: by 2002:a05:6214:2a4c:b0:625:aa48:e628 with SMTP id jf12-20020a0562142a4c00b00625aa48e628mr3798654qvb.56.1686145665035;
        Wed, 07 Jun 2023 06:47:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5LqxdVGt9gx33r5P7dquZMC9hoYE8QxbVMlD5LrvGUwG/TxPa0OKI696JmPUonIqCwR3J+uW/uXUU6LYLmhZE=
X-Received: by 2002:a05:6214:2a4c:b0:625:aa48:e628 with SMTP id
 jf12-20020a0562142a4c00b00625aa48e628mr3798623qvb.56.1686145664752; Wed, 07
 Jun 2023 06:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230607053940.39078-10-bagasdotme@gmail.com> <20230607053940.39078-18-bagasdotme@gmail.com>
In-Reply-To: <20230607053940.39078-18-bagasdotme@gmail.com>
From:   Richard Fontana <rfontana@redhat.com>
Date:   Wed, 7 Jun 2023 09:47:33 -0400
Message-ID: <CAC1cPGx-mD0DAEanCFtoxoGRyHkcu-GTTNX=ePzjhb8XM+73mg@mail.gmail.com>
Subject: Re: [PATCH 8/8] crypto: cts: Convert MIT boilerplate to corresponding
 SPDX license identifier
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
        Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jun 7, 2023 at 1:41=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com>=
 wrote:
>
> License boilerplate in CTS mode implementation (crypto/cts.c) looks like
> MIT license with advertising clause. Replace it with correspondig
> SPDX tag.
>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  crypto/cts.c | 24 +-----------------------
>  1 file changed, 1 insertion(+), 23 deletions(-)
>
> diff --git a/crypto/cts.c b/crypto/cts.c
> index 8f604f6554b1c3..9ec7e9787c0f6a 100644
> --- a/crypto/cts.c
> +++ b/crypto/cts.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: MIT
>  /*
>   * CTS: Cipher Text Stealing mode
>   *
> @@ -5,29 +6,6 @@
>   * The Regents of the University of Michigan
>   * ALL RIGHTS RESERVED
>   *
> - * Permission is granted to use, copy, create derivative works
> - * and redistribute this software and such derivative works
> - * for any purpose, so long as the name of The University of
> - * Michigan is not used in any advertising or publicity
> - * pertaining to the use of distribution of this software
> - * without specific, written prior authorization.  If the
> - * above copyright notice or any other identification of the
> - * University of Michigan is included in any copy of any
> - * portion of this software, then the disclaimer below must
> - * also be included.
> - *
> - * THIS SOFTWARE IS PROVIDED AS IS, WITHOUT REPRESENTATION
> - * FROM THE UNIVERSITY OF MICHIGAN AS TO ITS FITNESS FOR ANY
> - * PURPOSE, AND WITHOUT WARRANTY BY THE UNIVERSITY OF
> - * MICHIGAN OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
> - * WITHOUT LIMITATION THE IMPLIED WARRANTIES OF
> - * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
> - * REGENTS OF THE UNIVERSITY OF MICHIGAN SHALL NOT BE LIABLE
> - * FOR ANY DAMAGES, INCLUDING SPECIAL, INDIRECT, INCIDENTAL, OR
> - * CONSEQUENTIAL DAMAGES, WITH RESPECT TO ANY CLAIM ARISING
> - * OUT OF OR IN CONNECTION WITH THE USE OF THE SOFTWARE, EVEN
> - * IF IT HAS BEEN OR IS HEREAFTER ADVISED OF THE POSSIBILITY OF
> - * SUCH DAMAGES.
>   */

This is not the MIT license (as defined by SPDX) - there may not be an
SPDX identifier covering this license text.

This is at least the second time in your recent patches where you have
assumed that a non-GPL license corresponds to a particular SPDX
identifier without (apparently) checking.

Richard

