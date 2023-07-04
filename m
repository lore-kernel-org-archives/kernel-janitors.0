Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F934EB64DC
	for <kernel-janitors@archiver.kernel.org>; Tue,  4 Jul 2023 01:51:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbjGDBu7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 3 Jul 2023 21:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbjGDBu4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 Jul 2023 21:50:56 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 350E0E4E
        for <kernel-janitors@vger.kernel.org>; Mon,  3 Jul 2023 18:50:55 -0700 (PDT)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B2CDD3F850
        for <kernel-janitors@vger.kernel.org>; Tue,  4 Jul 2023 01:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1688435453;
        bh=xRjzAE0n5uIgT1izeqo8Qt3qb3EDeNKGoRxIM7nbkoA=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=Oe2WdZGUqr/nME0jy0M8S/y8JKtCBbQZ5uicp53Utf/iTUo0iZDzQP55QeAsqSYex
         z3ZDga1tAwvSoh0IkNbev5yE2VRoqyg6EM9FePkBXjbkCPZB0fyMIgiR4wAGXIsFat
         0JD3hAkRX4l8czCpbX8DZoklzxxsJAqSKgeHy6IZLk4q9aPSNEgYAd37Cd8zhKuNBx
         qPZO7gfjkO7j6Hmvm7rZz5MeJUrvywrQPv6sylmul4LR/6HrwRvvoyki3hXMdQR5GS
         8qfuyXbpFEpcGvRo3jlSJI/s2h8ZAR0s+OlhV2ufxT52BNQip673U1bgqec7xseLQa
         cu9jQidgfR/7g==
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-67c2f6fb908so5142252b3a.0
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Jul 2023 18:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688435446; x=1691027446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRjzAE0n5uIgT1izeqo8Qt3qb3EDeNKGoRxIM7nbkoA=;
        b=KfDsAvKaEpsM0oudg5ajLDUrjkRn03klpWD52D+iRGrbC+XBC2VyOSd6aGTtRtKPJl
         rGEQGm1P3AFUhuSN74kfW3cJe69pIykZ7qqvrTGNeajNiDiDhDs/evI1CBocPptoiyos
         4GgSCWwfGdiwOlICDpbkjMGy1ZWTN3Ugslo0rZsqsJYeBvCL+ozjSwrOlBHLX5sjspJ+
         fgUJPsJKK/1w8BbqeM9ST/j+zH/AzSgvABG1W4k4Ry+VhXq1PpMFNOA0/IvGOp/oEzyo
         KIBU9L9bONTBi4cP7KhlVIJniUkx3bwvQIPavxi6QgYIQ3L2Z8T8tUD2auYzNS0NXvuX
         Q5eA==
X-Gm-Message-State: ABy/qLaqnqFX6lqVzekdoedTPpfig/5jn2v4I4/80j3rwKI7NKOuFG2f
        UFgPgQ+CCo28z3+uuxK6COyp7oEvRhtgxpoZ+6cib2QktbaxcKH1KFLkabjZmXln0QPUX0N+Lcc
        hLcSuTTHjiXYJnck1Rb9lojzK/t5sgXrAu5AQFL5vObD+4HdIpjI79WUEjAVuiQ==
X-Received: by 2002:a05:6a00:c91:b0:657:f26e:b01a with SMTP id a17-20020a056a000c9100b00657f26eb01amr12396885pfv.26.1688435446043;
        Mon, 03 Jul 2023 18:50:46 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHX437TWfJBK7YTXwsR6fw6ywkRfC1jA00N3tmzfj+k09vE6RLFcxGk2IJ0KTcV5UzDvOiDWYCDWDyp3EUiYP8=
X-Received: by 2002:a05:6a00:c91:b0:657:f26e:b01a with SMTP id
 a17-20020a056a000c9100b00657f26eb01amr12396872pfv.26.1688435445547; Mon, 03
 Jul 2023 18:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230703162509.77828-1-koba.ko@canonical.com> <4ec2b7d2-11a5-6ab6-087a-175ed31faca4@web.de>
 <SJ1PR11MB60839A0FC6B5E79E3E5A7997FC29A@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB60839A0FC6B5E79E3E5A7997FC29A@SJ1PR11MB6083.namprd11.prod.outlook.com>
From:   Koba Ko <koba.ko@canonical.com>
Date:   Tue, 4 Jul 2023 09:50:33 +0800
Message-ID: <CAJB-X+UB+eYoYOOVH2bqnnVEJcLrxaj5A7-zyfgBM7hOf4y8zw@mail.gmail.com>
Subject: Re: [PATCH v2] EDAC/i10nm: shift exponent is negative
To:     "Luck, Tony" <tony.luck@intel.com>
Cc:     Markus Elfring <Markus.Elfring@web.de>,
        "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        James Morse <james.morse@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Richter <rric@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 4, 2023 at 5:51=E2=80=AFAM Luck, Tony <tony.luck@intel.com> wro=
te:
>
> > > UBSAN complains this error
> > > ~~~
> > >  UBSAN: shift-out-of-bounds in drivers/edac/skx_common.c:369:16
> > =E2=80=A6
> > > ~~~
> > >
> > > when get rows, cols and ranks, the returned error value doesn't be
> > > handled.
> > >
> > > check the return value is EINVAL, if yes, directly return 0.
> > =E2=80=A6
> >
> > * Please improve this change description further.
>
> To be specific. Initially you reported this because of the UBSAN error
> report. But, after community discussion you now know that the problem
> is that one or more of the rows/cols/ranks has a value that the EDAC driv=
er
> doesn't expect and probably can handle.
>
> So, in V2, the commit message should start with the information these
> values are out of range and mention this was discovered when UBSAN
> put out a warning about a negative shift. No need to include the whole
> of the UBSAN stack trace.
>
> Then describe the two fixes that this patch includes. One is to change th=
e
> edac debug message into a console error message to enable further
> debug of this issue. The other is to skip the unrecognized DIMM.
>
> > * How do you think about to add the tag =E2=80=9CFixes=E2=80=9D?
>
> This is a good idea.  Use git blame, or dig into the GIT history to
> find the commit where this code was introduced (hint .. git blame
> says:
> 88a242c98740 ("EDAC, skx_common: Separate common code out from skx_edac")
> but that obviously just refactored code, so you should dig back more into
> the history.
>
> > > V2: make error-print explicitly
> > > ---
> >
> > Would you like to avoid a misplaced marker line here?
> >
> > See also:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.4#n686
>
> That's an excellent resource.

Thanks for your advices and I will modify.
here's part of dmesg enabled EDAC_DEBUG
~~~
[    4.032332] EDAC DEBUG: skx_register_mci: MC#1: mci =3D 00000000799db99e
[    4.032334] EDAC DEBUG: i10nm_get_dimm_config: dimmmtr 0xffffffff
mcddrtcfg 0xffffffff (mc1 ch0 dimm0)
[    4.032335] EDAC DEBUG: skx_get_dimm_attr: bad ranks =3D 3 (raw=3D0xffff=
ffff)
[    4.032337] EDAC DEBUG: skx_get_dimm_attr: bad rows =3D 7 (raw=3D0xfffff=
fff)
[    4.032338] EDAC DEBUG: skx_get_dimm_attr: bad cols =3D 3 (raw=3D0xfffff=
fff)
[    4.032339] EDAC DEBUG: i10nm_get_dimm_config: dimmmtr 0xffffffff
mcddrtcfg 0xffffffff (mc1 ch0 dimm1)
[    4.032340] EDAC DEBUG: skx_get_dimm_attr: bad ranks =3D 3 (raw=3D0xffff=
ffff)
[    4.032341] EDAC DEBUG: skx_get_dimm_attr: bad rows =3D 7 (raw=3D0xfffff=
fff)
[    4.032341] EDAC DEBUG: skx_get_dimm_attr: bad cols =3D 3 (raw=3D0xfffff=
fff)
[    4.032343] EDAC DEBUG: i10nm_get_dimm_config: dimmmtr 0xffffffff
mcddrtcfg 0xffffffff (mc1 ch1 dimm0)
[    4.032344] EDAC DEBUG: skx_get_dimm_attr: bad ranks =3D 3 (raw=3D0xffff=
ffff)
[    4.032345] EDAC DEBUG: skx_get_dimm_attr: bad rows =3D 7 (raw=3D0xfffff=
fff)
[    4.032346] EDAC DEBUG: skx_get_dimm_attr: bad cols =3D 3 (raw=3D0xfffff=
fff)
[    4.032347] EDAC DEBUG: i10nm_get_dimm_config: dimmmtr 0xffffffff
mcddrtcfg 0xffffffff (mc1 ch1 dimm1)
[    4.032348] EDAC DEBUG: skx_get_dimm_attr: bad ranks =3D 3 (raw=3D0xffff=
ffff)
[    4.032349] EDAC DEBUG: skx_get_dimm_attr: bad rows =3D 7 (raw=3D0xfffff=
fff)
[    4.032349] EDAC DEBUG: skx_get_dimm_attr: bad cols =3D 3 (raw=3D0xfffff=
fff)
~~~

I shared the whole dmesg through g-drive.
https://drive.google.com/file/d/1epnDZNezGiJsK1eT4UNOi8_igcBSXtiF/view?usp=
=3Dsharing

>
> -Tony
