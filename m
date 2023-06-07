Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9880BC77B7A
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Jun 2023 14:38:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241114AbjFGOia (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Jun 2023 10:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241110AbjFGOi0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Jun 2023 10:38:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D6581735
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Jun 2023 07:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686148662;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ow0OOCSmuKBnWHD28hFOgV3rmZNu8Nj1owILnvPVmGw=;
        b=Gg+o4Ff7vQZxv9XIIO78juiLeczJRDoMb+5hlTD+p6+VwQV/xvXLVE/19w0u33Tz9pqt0B
        hlsY5mDwbkgqpmSce7sR0E1B07ml9/FtWAm7q/fQMlFZkmIgl9QHsOt2i6JhN6CtfKE9lQ
        rz/Y+YnprjAbKFFEs3laeiY8TYlpar8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-gLqaJQjjO1-ceGEjhnSeHA-1; Wed, 07 Jun 2023 10:10:46 -0400
X-MC-Unique: gLqaJQjjO1-ceGEjhnSeHA-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-3f9b94e7ed9so9555281cf.1
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Jun 2023 07:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686147046; x=1688739046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ow0OOCSmuKBnWHD28hFOgV3rmZNu8Nj1owILnvPVmGw=;
        b=KQnGQK+dvkKGxrF39mQP/f15H8OZ/VJbYHRYTHd/nwsiGuX5QmvdNgVqs6ZcP8XuQv
         VLdvfUdwRAB4U52TLTFV+NygQprpzC3iFLEBMBzNDq0efDgqoiD6QEkwlyIAGQlEsTle
         4zhvw55gLqpkB3ygBYFuharqfqYn4X5aikoDXl0M25yqXqPoHKoMdnJ/BZjGp5VRlGb/
         7XybsQC+Up4bu8oDMWFMniE5/IwSPYE0g723DpoRj5+tpjg697VkvQzsrlDwafO+hgjS
         kL5MTMpOBPFR3ZHazRolXRDcFA7g8du4appx0J0HZV7RcePxcVESKQSeIm+JujEXNL9E
         ozQw==
X-Gm-Message-State: AC+VfDzy3tTYAcasum0iBqXuqFPI/O7LHrqHcrCQ8saIHNeKurkHf+jx
        UMAw05KFqrtA8yoi4U4RZzsWgumiotqPJyVQVW1AtEVmnu+JsZuHG2oKcewbu34YQ+7s3GQPggH
        tzffYXUxPjb4JiJPS10fAvvbRuqozXVuKRbdb12u6VFtA
X-Received: by 2002:ac8:5951:0:b0:3ef:5d8c:20d8 with SMTP id 17-20020ac85951000000b003ef5d8c20d8mr4175375qtz.6.1686147045629;
        Wed, 07 Jun 2023 07:10:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5c9VmPsD06888SrAxT7ZB2dNw1yvccd+FEZBd9FI9C9+C0xX8kOrIwO6A3sOilCG+T4V7/HXM5Del8P9wW8+c=
X-Received: by 2002:ac8:5951:0:b0:3ef:5d8c:20d8 with SMTP id
 17-20020ac85951000000b003ef5d8c20d8mr4175338qtz.6.1686147045262; Wed, 07 Jun
 2023 07:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230607053940.39078-10-bagasdotme@gmail.com> <20230607053940.39078-11-bagasdotme@gmail.com>
In-Reply-To: <20230607053940.39078-11-bagasdotme@gmail.com>
From:   Richard Fontana <rfontana@redhat.com>
Date:   Wed, 7 Jun 2023 10:10:34 -0400
Message-ID: <CAC1cPGxD6xOLksyMHCcreFyEv5Yoo50LY=xM9BmOEP=oECoNww@mail.gmail.com>
Subject: Re: [PATCH 1/8] crypto: Convert dual BSD 3-Clause/GPL 2.0 boilerplate
 to SPDX identifier
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
        Alexander Kjeldaas <astor@fast.no>,
        Herbert Valerio Riedel <hvr@hvrlab.org>,
        Kyle McMartin <kyle@debian.org>,
        "Adam J . Richter" <adam@yggdrasil.com>,
        Dr Brian Gladman <brg@gladman.me.uk>,
        Stephan Mueller <smueller@chronox.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jun 7, 2023 at 1:42=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com>=
 wrote:
>
> Replace license boilerplate for dual BSD-3-Clause/GPL 2.0 (only or
> later) with corresponding SPDX license identifier.

This is at least the fourth or fifth time (I'm losing track) where you
have incorrectly assumed a particular non-GPL license text matches a
particular SPDX identifier without (apparently) checking.

Bagas, I urge that you learn more about the nature of SPDX identifiers
before submitting any further patches at least involving replacement
of non-GPL notices with SPDX identifiers. For this unprecedented
license notice replacement initiative to have any legitimacy it must
attempt to apply SPDX identifiers correctly.

> diff --git a/crypto/aes_generic.c b/crypto/aes_generic.c
> index 666474b81c6aa5..2e042bd306f9c5 100644
> --- a/crypto/aes_generic.c
> +++ b/crypto/aes_generic.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0-or-later
>  /*
>   * Cryptographic API.
>   *
> @@ -11,39 +12,9 @@
>   *  Kyle McMartin <kyle@debian.org>
>   *  Adam J. Richter <adam@yggdrasil.com> (conversion to 2.5 API).
>   *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
>   * ---------------------------------------------------------------------=
------
>   * Copyright (c) 2002, Dr Brian Gladman <brg@gladman.me.uk>, Worcester, =
UK.
>   * All rights reserved.
> - *
> - * LICENSE TERMS
> - *
> - * The free distribution and use of this software in both source and bin=
ary
> - * form is allowed (with or without changes) provided that:
> - *
> - *   1. distributions of this source code include the above copyright
> - *      notice, this list of conditions and the following disclaimer;
> - *
> - *   2. distributions in binary form include the above copyright
> - *      notice, this list of conditions and the following disclaimer
> - *      in the documentation and/or other associated materials;
> - *
> - *   3. the copyright holder's name is not used to endorse products
> - *      built using this software without specific written permission.
> - *
> - * ALTERNATIVELY, provided that this notice is retained in full, this pr=
oduct
> - * may be distributed under the terms of the GNU General Public License =
(GPL),
> - * in which case the provisions of the GPL apply INSTEAD OF those given =
above.
> - *
> - * DISCLAIMER
> - *
> - * This software is provided 'as is' with no explicit or implied warrant=
ies
> - * in respect of its properties, including, but not limited to, correctn=
ess
> - * and/or fitness for purpose.
>   * ---------------------------------------------------------------------=
------

This is not BSD-3-Clause as defined by SPDX. It may be a match to
`Brian-Gladman-3-Clause` but I haven't checked closely.

> diff --git a/crypto/algif_rng.c b/crypto/algif_rng.c
> index 407408c437308f..4d4b9e60f72c19 100644
> --- a/crypto/algif_rng.c
> +++ b/crypto/algif_rng.c
> @@ -1,41 +1,10 @@
> +// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0-only
>  /*
>   * algif_rng: User-space interface for random number generators
>   *
>   * This file provides the user-space API for random number generators.
>   *
>   * Copyright (C) 2014, Stephan Mueller <smueller@chronox.de>
> - *
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
PL2
> - * are required INSTEAD OF the above restrictions.  (This clause is
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
>   */

The BSD portion of this license notice is not a match to BSD-3-Clause
(see my comment on another patch which I think had the same license
text).




>  #include <linux/capability.h>
> diff --git a/crypto/jitterentropy-kcapi.c b/crypto/jitterentropy-kcapi.c
> index 7d1463a1562acb..78230ce74fc840 100644
> --- a/crypto/jitterentropy-kcapi.c
> +++ b/crypto/jitterentropy-kcapi.c
> @@ -1,40 +1,10 @@
> +// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0-only
>  /*
>   * Non-physical true random number generator based on timing jitter --
>   * Linux Kernel Crypto API specific code
>   *
>   * Copyright Stephan Mueller <smueller@chronox.de>, 2015 - 2023
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
PL2 are
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

Also not a match to BSD-3-Clause.


>  #include <crypto/hash.h>
> diff --git a/crypto/jitterentropy.c b/crypto/jitterentropy.c
> index c7d7f2caa7793b..c8437bd20dc903 100644
> --- a/crypto/jitterentropy.c
> +++ b/crypto/jitterentropy.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0-only
>  /*
>   * Non-physical true random number generator based on timing jitter --
>   * Jitter RNG standalone code.
> @@ -9,40 +10,6 @@
>   *
>   * See https://www.chronox.de/jent.html
>   *
> - * License
> - * =3D=3D=3D=3D=3D=3D=3D
> - *
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
PL2 are
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

Also not a match to BSD-3-Clause.


> diff --git a/crypto/keywrap.c b/crypto/keywrap.c
> index 054d9a216fc9f3..8c51235a91a9ae 100644
> --- a/crypto/keywrap.c
> +++ b/crypto/keywrap.c
> @@ -1,39 +1,9 @@
> +// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0-only
>  /*
>   * Key Wrapping: RFC3394 / NIST SP800-38F
>   *
>   * Copyright (C) 2015, Stephan Mueller <smueller@chronox.de>
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
PL2
> - * are required INSTEAD OF the above restrictions.  (This clause is
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

Also not a match to BSD-3-Clause.

Richard

