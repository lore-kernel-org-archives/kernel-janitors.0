Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E968EB64DD
	for <kernel-janitors@archiver.kernel.org>; Tue,  4 Jul 2023 08:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbjGDIGL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 4 Jul 2023 04:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231449AbjGDIGF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 4 Jul 2023 04:06:05 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F15D110C6
        for <kernel-janitors@vger.kernel.org>; Tue,  4 Jul 2023 01:05:57 -0700 (PDT)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id ADCE33F731
        for <kernel-janitors@vger.kernel.org>; Tue,  4 Jul 2023 08:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1688457955;
        bh=KyUic+k3lhFGyHcIl3np2CuPrA8HfLweP+3Dqn477ss=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=qMl9rJ7ipSYNpN/EvHyM7dTpTM6gzdIoeb28hm4vdZ5p5wquT45tZGjGkLwDlIgoP
         /Lv9WzXl5OgKfPuSX055ExsVGEkzj+yKiiYuxMXgbxGGb2lGaXZ/4Fxk/jXz0SewgF
         nGv2d1kd585Cp7oSG8j7wENDX4kyreqwe21AEokeVvU8akQ0ZuVh/ZvNknMF3ibSTD
         mx/5lp+geLQfhrwdF8NQ1jJDSIbsE/Uh7nOWWzGLQtDV1V+SUOAf8XROznWQhZpaDG
         4fy+vCk6EtscZx5wI/0yiowImxgplVcr8SnHXGNezMt3QmVR5j7ywTLoyLIw7kYeId
         vQa+aLdiipM2A==
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-66872889417so4896266b3a.1
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Jul 2023 01:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688457953; x=1691049953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyUic+k3lhFGyHcIl3np2CuPrA8HfLweP+3Dqn477ss=;
        b=hFNUMuhsHPpPzhenUUKgfWz7VgIWORauLvY4uuPtLlm7ArI+wV3iOD1FhjIiUBNozY
         G/gWko8XO9GpOiQJZ1z6Ypdu3FZwgqFxbgX3+OkWJGDngK6uLtsimphsMP4t244byl2R
         Y9EndNQalzW50fg8VwNyGQ+Ac0c1TTlSTKuggVkHnb0xg40NHP8KBavRTJOvTh1PQbk0
         5rITl4xE5d6moh7vLoOlHC8ECa3Bh1KX9fCrfb5wMrulnlCTjF6PA2/h0IW+OtvzD+fA
         zRIdD9o472dcXGFtypfPvukOBTC5PbJzH+TKEoTnqmYef7/zxP2F7mVfIk/zWjsqpQFS
         FazQ==
X-Gm-Message-State: ABy/qLZJDSwSa7Cl8kAkW57T8T6dalh/yUzYuC47LMrSodONTys7BI1H
        nbboGpHuQe+ysC6gtCccAyKUM0ajkbjTaOCoPN2objRp4ESzOM9L+/b/FQZWuAB+YGojR8qigaW
        AhTcgEwPXpjLrzdt5175RvxdTjLL8F2KXYq2/Ai8LFJbEUdfp0PwDivaDQzeNxurX2S3z7w==
X-Received: by 2002:a05:6a00:b93:b0:668:711a:7d93 with SMTP id g19-20020a056a000b9300b00668711a7d93mr9939035pfj.19.1688457953208;
        Tue, 04 Jul 2023 01:05:53 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE+DtMALYuvUVAQkIm0rXF85n4mhV6VFoX/V08J0R9uCauuzQTrB6GKCpw4T1vFGkR0Uiv+L/35HYKv+EN6td0=
X-Received: by 2002:a05:6a00:b93:b0:668:711a:7d93 with SMTP id
 g19-20020a056a000b9300b00668711a7d93mr9939021pfj.19.1688457952804; Tue, 04
 Jul 2023 01:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230703162509.77828-1-koba.ko@canonical.com> <4ec2b7d2-11a5-6ab6-087a-175ed31faca4@web.de>
 <SJ1PR11MB60839A0FC6B5E79E3E5A7997FC29A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <CAJB-X+X+09-m57JcZcb-_9dKUG3CtAbLXxGTEg7R0bB8pyJx9Q@mail.gmail.com>
 <CAJB-X+XVO29wVxVezjFrgCyXigqEJxAzb0K0wueXNto5K_x2tA@mail.gmail.com> <9c27530e-21f9-15ce-5116-5af5b0c25f53@web.de>
In-Reply-To: <9c27530e-21f9-15ce-5116-5af5b0c25f53@web.de>
From:   Koba Ko <koba.ko@canonical.com>
Date:   Tue, 4 Jul 2023 16:05:41 +0800
Message-ID: <CAJB-X+Wu-Zd6pCrK54aR9iaeS7PW2VmwB+Y+Qeci7Ut0YcdsRg@mail.gmail.com>
Subject: Re: [PATCH v2] EDAC/i10nm: shift exponent is negative
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        James Morse <james.morse@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Richter <rric@kernel.org>,
        Tony Luck <tony.luck@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 4, 2023 at 3:16=E2=80=AFPM Markus Elfring <Markus.Elfring@web.d=
e> wrote:
>
> > As per suggestions, i modified V3.
> > could you please take a look
> >
> > Subject: [PATCH][V3] EDAC/i10nm: shift exponent is negative
>
> Would you like to put the text =E2=80=9C[PATCH v4] EDAC/i10nm: Fix an ina=
ppropriate shift exponent=E2=80=9D
> into a subsequent patch?

I didn't send V3 so the suggestions could be put in V3.

>
> I would find further wording variants nicer.
>
>
> > Because failed to read from DIMM, get the negative value for shift
> > operation.
>
> A surprising value was determined after a read failure from a DIMM.
>
>
> =E2=80=A6
> > UBSAN complains this error
>
> Software analyses pointed a data processing issue out.
>
>
> > `UBSAN: shift-out-of-bounds in drivers/edac/skx_common.c:369:16
> >  shift exponent -66 is negative`
> >
> > when get rows, cols and ranks, the returned error value doesn't be
> > handled.
>
> A special value combination could not be handled so far.
>
>
> > check the return value is EINVAL, if yes, directly return 0 and
> > show error message explicitly.
>
> Check if an invalid value was detected by a call of the function =E2=80=
=9Cskx_get_dimm_attr=E2=80=9D.
>
> * Print a corresponding error message in this case.
>
> * Return zero then directly from the function =E2=80=9Cskx_get_dimm_info=
=E2=80=9D.
>
>
> =E2=80=A6
> @@ -351,6 +351,8 @@ int skx_get_dimm_info(u32 mtr, u32 mcmtr, u32 amap, s=
truct dimm_info *dimm,
>         ranks =3D numrank(mtr);
>         rows =3D numrow(mtr);
>         cols =3D imc->hbm_mc ? 6 : numcol(mtr);
> +       if (ranks =3D=3D -EINVAL || rows =3D=3D -EINVAL || cols =3D=3D -E=
INVAL)
> +               return 0;
> =E2=80=A6
>
>
> Can it be nicer to perform a check for such an error code directly
> after each variable assignment?
> (May this condition check be split?)
>
>
> > Fixes: 4ec656bdf43a13) EDAC, skx_edac: Add EDAC driver for Skylake
>
> Please properly apply parentheses and double quotes for this tag.
>
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.4#n145
>
>
> > V2 -> V3: simplify the summary and add 'Fixes:'
> > V1 -> V2: make error-print explicitly
>
> How do you think about to use more succinct version identifiers
> for such descriptions?
>
> V4:
> =E2=80=A6
>
> V3:
> =E2=80=A6
>
>
> Regards,
> Markus
