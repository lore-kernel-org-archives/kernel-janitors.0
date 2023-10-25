Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F83C25B47
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 Oct 2023 12:57:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344271AbjJYM5x (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 Oct 2023 08:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344232AbjJYM5v (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Oct 2023 08:57:51 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66316116
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 05:57:49 -0700 (PDT)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 695F93FD3B
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 12:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1698238666;
        bh=YZ12GF+aERDoIF3r6TEMZGT37W8A+JNypJswAaYxRhM=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=Nq3lJYRjmvlNFzhC88nKA+acZLBDUj9Ov5G9LL4MuBCW+ekeopmaP6jh1I3O7zSi3
         VHcgE4W3aVos+T3jx4sC9AuqdjMKXzFYdSIp7QtXybesE78Tp0Y+I9/UCodeFPk9vy
         bhlFQn1hVxFVdvg+jlfaHTMdnjHRibS57BNgxU/3ADQoqprN+STbnIyn84Fqeue9z4
         wueAES6fHVy8EtziuEz7fG/7tmbevvB9wpoMp9MhLoHG/JlQYoWmizinkzN1jdNFyW
         rMz82xE0dxseXyB0G1AIoOTTCiGq4xJIkoTNpvV6GCnM4v2+Sif16TcizvuwguCX3v
         qRT5RAREbrXog==
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-408508aa81cso39337555e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 05:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698238664; x=1698843464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZ12GF+aERDoIF3r6TEMZGT37W8A+JNypJswAaYxRhM=;
        b=s/XiThfYaiKO/HN8yru4pTjhP4boU0z9TmOZyBBFy5jvZHyelFw8vgQivzN8mwO/OX
         PfPU9kC/+GLkxFJhBirhElTpcyMxv0MJsO2l2cp7WBbD8o4M1RKVzjfi5j7umLoOeoT4
         eRWs8gGI5gFeCz93eKb2tuCsXAgBjmykTyn5uyJGCymG68ZdP6GIA1RcU7xjS7eEWC/A
         4EMDmnbypiM20+t+de8WJVXfMvXj0TNqurv9v0rXBxfT4804RqSCsEBASyha8mY9vy4j
         LyGmF6sgEMQbj1QjBseBZTMz0e+Y5GYZ7bh03LBxXfhsRm0P3gOqIWzWYijQMWB/1Zri
         onBA==
X-Gm-Message-State: AOJu0YyOq9sqy51BRtGjLEzdqR/0+/YSslg3Lhb+m4BmJExrThfzbVRp
        yGxnau3fdCAPoBfNwyI+lyYZ3Wb1g3XKclxzx5LK0oPlLiftJrE1TZUwteUeH3KqgaLfRRUadzF
        60SzMTbFbbeFbrqDeQ/uExDNeOnKuHABqNhilhMgJ+ythTxSuku4SGoJMwqdI+g==
X-Received: by 2002:adf:edc2:0:b0:32d:a57b:8c8d with SMTP id v2-20020adfedc2000000b0032da57b8c8dmr12438004wro.69.1698238664538;
        Wed, 25 Oct 2023 05:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaI9gj2ovxx4sLpIcOCYpedqxIgHFi3Wcs69w/nw0GZB5lBOAnarl0/VEXOqC/394g7rDDa9Lg2WtTwOg2eIM=
X-Received: by 2002:adf:edc2:0:b0:32d:a57b:8c8d with SMTP id
 v2-20020adfedc2000000b0032da57b8c8dmr12437987wro.69.1698238664182; Wed, 25
 Oct 2023 05:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20231025104212.12738-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20231025104212.12738-1-lukas.bulwahn@gmail.com>
From:   Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Date:   Wed, 25 Oct 2023 13:57:08 +0100
Message-ID: <CADWks+ZoLs1FUJx0sSg5FBYK5BtD+Po7bRORVT4uBLM6QJxXJQ@mail.gmail.com>
Subject: Re: [PATCH] docs: module-signing: adjust guide after sha1 and sha224
 support is gone
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Luis Chamberlain <mcgrof@kernel.org>,
        linux-modules@vger.kernel.org, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On Wed, 25 Oct 2023 at 11:42, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 16ab7cb5825f ("crypto: pkcs7 - remove sha1 support") and commit
> fc3225fd6f1e ("module: Do not offer sha224 for built-in module signing")
> removes sha1 and sha224 support for kernel module signing.
>
> Adjust the module-signing admin guide documentation to those changes.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Note I have submitted this change as part of the patch series that
adds SHA-3 over at
https://lore.kernel.org/linux-crypto/20231022182208.188714-1-dimitri.ledkov@canonical.com/T/#m81c32a65341a4de39596b72743ba38d46899016f

But indeed, if that patch series doesn't make it into the cryptodev
tree, then this documentation should go in, and the sha-3 one rebased
/ adjusted.

Sorry for not patching documentation at the same time as the code
changes that made documentation out of date.

Acked-by: Dimitri John ledkov <dimitri.ledkov@canonical.com>

> ---
>  Documentation/admin-guide/module-signing.rst | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/admin-guide/module-signing.rst b/Documentation/admin-guide/module-signing.rst
> index 2898b2703297..e3ea1def4c0c 100644
> --- a/Documentation/admin-guide/module-signing.rst
> +++ b/Documentation/admin-guide/module-signing.rst
> @@ -30,8 +30,8 @@ This facility uses X.509 ITU-T standard certificates to encode the public keys
>  involved.  The signatures are not themselves encoded in any industrial standard
>  type.  The facility currently only supports the RSA public key encryption
>  standard (though it is pluggable and permits others to be used).  The possible
> -hash algorithms that can be used are SHA-1, SHA-224, SHA-256, SHA-384, and
> -SHA-512 (the algorithm is selected by data in the signature).
> +hash algorithms that can be used are SHA-256, SHA-384, and SHA-512 (the
> +algorithm is selected by data in the signature).
>
>
>  ==========================
> @@ -81,8 +81,6 @@ This has a number of options available:
>       sign the modules with:
>
>          =============================== ==========================================
> -       ``CONFIG_MODULE_SIG_SHA1``      :menuselection:`Sign modules with SHA-1`
> -       ``CONFIG_MODULE_SIG_SHA224``    :menuselection:`Sign modules with SHA-224`
>         ``CONFIG_MODULE_SIG_SHA256``    :menuselection:`Sign modules with SHA-256`
>         ``CONFIG_MODULE_SIG_SHA384``    :menuselection:`Sign modules with SHA-384`
>         ``CONFIG_MODULE_SIG_SHA512``    :menuselection:`Sign modules with SHA-512`
> --
> 2.17.1
>


-- 
okurrr,

Dimitri
