Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C001C6FD1C
	for <kernel-janitors@archiver.kernel.org>; Tue, 14 Mar 2023 08:18:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbjCNIS2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 14 Mar 2023 04:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbjCNIRw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Mar 2023 04:17:52 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A70DF1F5DF;
        Tue, 14 Mar 2023 01:17:30 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id j11so58533879edq.4;
        Tue, 14 Mar 2023 01:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678781849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFmrgoFX8e2tXRWBLSQLhRldhqfPMiA/z+mX5uDLA5E=;
        b=n6wGLaeHLTOcz5q517JnqrC2Xt7AxmI2nv4QFevlP0RyX8Mp6PDcCBaA0lLJp/itCW
         VBlcS5cZKmJkxd0x+uG7iXdb1IhHh046fxGJ3W60DxFPFLcsTjXh7JCxsMDDpOPqS9Ap
         rRFPZhai3QZ1K0mBjYYtJUswXLAKAUADeeMBlqygnBnNYbLIHvIgsD0WuO+NgIRSeSWx
         xE9rK5cLcOmiXwmRCzIEzsDrwiBIfKOwOzF5AUePYV+3LT2jRVNwhKkQWLPM6PQ0mx7t
         aaCC0IVenXzK6Dh9PEXCeBhMopwQimceFiFC9lB+68IsLyMbg/pBjyGwnSlPaqM2d1rI
         ep0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678781849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFmrgoFX8e2tXRWBLSQLhRldhqfPMiA/z+mX5uDLA5E=;
        b=YAySHchRdXsUc4O5wGVl7EtKIr/bpBm1tTjta6Uq23UTsryCGtwkP6tLVpOqA4GioE
         CdBWIijtdeypInHNbGAjza0cqZxei7EwupyfR9MPma27IbC/74EcbjATaXQOIs1NEa4G
         aJNIy2uH5fI0kVcFrdWpLhtYKRSUXonOKNjn1G7S+Z+wZ/JxnCYTg2kpYn5qwIgfcsGF
         KjjEg5jP/vn1UmzKnYc2h5nVaG8BSy85dcR57/v5qprcXfQPCboggWJccaApKkc9h5s4
         TgiE1Jl0zwA/DQd1pkUAQg26+tda31GOsPivIWfKHy/Bi7sUHQD5TeLRrVgIpuMAqtgp
         9EVw==
X-Gm-Message-State: AO0yUKVx7guvdcLtsGLPn8mwfxXQcH7QHDjBlW63CsVlhk0Jiq8CVtTp
        y9nmwZiluzQ2KDBM9+aDnI823qPLwX20jdveD38=
X-Google-Smtp-Source: AK7set/WsRTaXQDKcuv6Z3Z8FDkurQyyZzTSUvVAfJWb39YBTuibZxwLFDRj0gBxe+eRAtNAc9NQ8F/WFpjjun5zK6s=
X-Received: by 2002:a17:906:4d57:b0:90a:33e4:5a69 with SMTP id
 b23-20020a1709064d5700b0090a33e45a69mr662685ejv.3.1678781849147; Tue, 14 Mar
 2023 01:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAKXUXMwwQuwssyzBrOXHOz__YRpa1Rjgqmwn5rRFjDVLBbabPA@mail.gmail.com>
 <20230314085741.6f968e68@bootlin.com>
In-Reply-To: <20230314085741.6f968e68@bootlin.com>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Tue, 14 Mar 2023 09:17:18 +0100
Message-ID: <CAKXUXMwqobqZJtDXAfymF3iWmzE3EXH1q6VLddVob9q2ygzWyQ@mail.gmail.com>
Subject: Re: Question about the dependency on the config SOC_FSL in CPM_QMC
To:     Herve Codina <herve.codina@bootlin.com>
Cc:     Li Yang <leoyang.li@nxp.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Mark Brown <broonie@kernel.org>,
        Qiang Zhao <qiang.zhao@nxp.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Mar 14, 2023 at 8:57=E2=80=AFAM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> Hi Lukas,
>
> On Tue, 14 Mar 2023 08:21:50 +0100
> Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> > Dear Herve,
> >
> > In your patch below, you added the config CPM_QMC which depends on the
> > non-existing config SOC_FSL:
> >
> > https://lore.kernel.org/r/20230217145645.1768659-7-herve.codina@bootlin=
.com
> >
> > Up to my knowledge, the config SOC_FSL never existed in the mainline
> > tree. Is this dependency really required or can the expression simply
> > be reduced to COMPILE_TEST and we drop the dependency to SOC_FSL?
> >
> > Note: This patch has now shown up in linux-next with commit
> > 3178d58e0b97. Currently, it would not be possible to compile test this
> > driver, as the dependency on SOC_FSL is never met.
> >
> >
> > Best regards,
> >
> > Lukas
>
> My bad :(
>
> The dependency must be FSL_SOC instead of SOC_FSL.

Herve, are you going to send a quick fix to your patch or ask Mark if
your original patch can simply be replaced with a new one with this
change added?

Lukas

> I mean:
> diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
> index f90cfdf0c763..7268c2fbcbc1 100644
> --- a/drivers/soc/fsl/qe/Kconfig
> +++ b/drivers/soc/fsl/qe/Kconfig
> @@ -47,7 +47,7 @@ config CPM_TSA
>  config CPM_QMC
>         tristate "CPM QMC support"
>         depends on OF && HAS_IOMEM
> -       depends on CPM1 || (SOC_FSL && COMPILE_TEST)
> +       depends on CPM1 || (FSL_SOC && COMPILE_TEST)
>         depends on CPM_TSA
>         help
>           Freescale CPM QUICC Multichannel Controller
>
>
>
> --
> Herv=C3=A9 Codina, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
