Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C063EB64DD
	for <kernel-janitors@archiver.kernel.org>; Tue,  4 Jul 2023 04:59:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbjGDE7i (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 4 Jul 2023 00:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbjGDE7h (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 4 Jul 2023 00:59:37 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 153C51AD
        for <kernel-janitors@vger.kernel.org>; Mon,  3 Jul 2023 21:59:35 -0700 (PDT)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8B25C3F851
        for <kernel-janitors@vger.kernel.org>; Tue,  4 Jul 2023 04:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1688446773;
        bh=4oXmtSzlPkbqT3hFau3fNKFgcjtLAPmoKdlRgdjPPm0=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=i/b3zlZNwF5fKHOZ5dInqzcihzhBEWyIzZGjVeZ9N6kSUYtq506k+clvoeRYV8KWG
         aM086yJXctnJauR4pgrdbRzWLqsw3+7NwALBzNmlk7/O/pgXUea1Nee5RZ7ux4OP3p
         waCsU1T75nibCiO8nMODHZbe/LAKQY/CnDDm3HSyRpcgENcuX/4GcUNwDYlDhaB5Vd
         QNpRra7mdR4C3UND0VENHZGic3dLwQKd2v3mskqeNfL2qR0LUEM/Qx+dd+N+Khq1Y+
         mybP0cdu2aUYuyW7rZSxISePYmo1SA+Ma6GQhqbmPBpcAPLuJyWf9p5v9LkUHil0Jf
         NlZ6RE4BNjEMw==
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-635dba99f82so56229976d6.3
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Jul 2023 21:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688446767; x=1691038767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oXmtSzlPkbqT3hFau3fNKFgcjtLAPmoKdlRgdjPPm0=;
        b=l8GcoY9cUNQ05S+nSbzA5RQ8EOwW3GqqmZwKAkqWMVmQzYH17zerd89jZlRKRTkm0Q
         yPi3sja5t2tYzGA4hnB6ERDcETQCDhyfxcv58R3wQiN0HYQixkJK5K3GWEGED6S7URMn
         d17dncirv+NyCLEgvjmh7xln4a8lsKoRBV6G0N4wZXYkIwv8/24gpkIYqJzFsVq6PGYS
         F2QC8UIDewM11zocgRnZdlMU/y2TB/W2l8Q5M5sqDL4ReDBIAMSvGJOVfZEfYKa0kewc
         He1z9D+mb60RfEmHAOA4/L8JNwGilttuaasBdpvYl7sLHV2UvXdKJwjGx0ECU9y4eYQ1
         166A==
X-Gm-Message-State: ABy/qLbStSXjxC27+y0N+OID46VKqlFqRPsg8Qt0CqBeH1EiSBMt4fY0
        2VriPrqK686gYvWdHtxKQzX50OZoK6eMkgXX41DU0WXp8FVE63jilrgOak1JkZzOKWsGekzfoYO
        xQG1Cidc7GyO7HtXtsL7ZDL1gzBc3c3LQHgeF2l/dDM+34ZWfTm5/D9brEeqObQ==
X-Received: by 2002:a05:6214:519b:b0:636:afa1:344f with SMTP id kl27-20020a056214519b00b00636afa1344fmr8702947qvb.47.1688446767684;
        Mon, 03 Jul 2023 21:59:27 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF0NeRcpMsBFd4h4OhOM4RIDKJOeBGhCaLbmgR9HoFkVj7U+6XpiFFaJvllsUpGiieMdfn5RfkHGa96P4XPNuk=
X-Received: by 2002:a05:6214:519b:b0:636:afa1:344f with SMTP id
 kl27-20020a056214519b00b00636afa1344fmr8702934qvb.47.1688446767466; Mon, 03
 Jul 2023 21:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230703162509.77828-1-koba.ko@canonical.com> <4ec2b7d2-11a5-6ab6-087a-175ed31faca4@web.de>
 <SJ1PR11MB60839A0FC6B5E79E3E5A7997FC29A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <CAJB-X+X+09-m57JcZcb-_9dKUG3CtAbLXxGTEg7R0bB8pyJx9Q@mail.gmail.com>
In-Reply-To: <CAJB-X+X+09-m57JcZcb-_9dKUG3CtAbLXxGTEg7R0bB8pyJx9Q@mail.gmail.com>
From:   Koba Ko <koba.ko@canonical.com>
Date:   Tue, 4 Jul 2023 12:59:15 +0800
Message-ID: <CAJB-X+XVO29wVxVezjFrgCyXigqEJxAzb0K0wueXNto5K_x2tA@mail.gmail.com>
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

As per suggestions, i modified V3.
could you please take a look

Subject: [PATCH][V3] EDAC/i10nm: shift exponent is negative

Because failed to read from DIMM, get the negative value for shift
operation.
`EDAC DEBUG: skx_get_dimm_attr: bad ranks =3D 3 (raw=3D0xffffffff)
 EDAC DEBUG: skx_get_dimm_attr: bad rows =3D 7 (raw=3D0xffffffff)
 EDAC DEBUG: skx_get_dimm_attr: bad cols =3D 3 (raw=3D0xffffffff)
 EDAC DEBUG: i10nm_get_dimm_config: dimmmtr 0xffffffff mcddrtcfg
0xffffffff (mc1 ch0 dimm1)`

UBSAN complains this error
`UBSAN: shift-out-of-bounds in drivers/edac/skx_common.c:369:16
 shift exponent -66 is negative`

when get rows, cols and ranks, the returned error value doesn't be
handled.

check the return value is EINVAL, if yes, directly return 0 and
show error message explicitly.

Fixes: 4ec656bdf43a13) EDAC, skx_edac: Add EDAC driver for Skylake
Signed-off-by: Koba Ko <koba.ko@canonical.com>
---
V2 -> V3: simplify the summary and add 'Fixes:'
V1 -> V2: make error-print explicitly

On Tue, Jul 4, 2023 at 10:20=E2=80=AFAM Koba Ko <koba.ko@canonical.com> wro=
te:
>
> On Tue, Jul 4, 2023 at 5:51=E2=80=AFAM Luck, Tony <tony.luck@intel.com> w=
rote:
> >
> > > > UBSAN complains this error
> > > > ~~~
> > > >  UBSAN: shift-out-of-bounds in drivers/edac/skx_common.c:369:16
> > > =E2=80=A6
> > > > ~~~
> > > >
> > > > when get rows, cols and ranks, the returned error value doesn't be
> > > > handled.
> > > >
> > > > check the return value is EINVAL, if yes, directly return 0.
> > > =E2=80=A6
> > >
> > > * Please improve this change description further.
> >
> > To be specific. Initially you reported this because of the UBSAN error
> > report. But, after community discussion you now know that the problem
> > is that one or more of the rows/cols/ranks has a value that the EDAC dr=
iver
> > doesn't expect and probably can handle.
> >
> > So, in V2, the commit message should start with the information these
> > values are out of range and mention this was discovered when UBSAN
> > put out a warning about a negative shift. No need to include the whole
> > of the UBSAN stack trace.
> >
> > Then describe the two fixes that this patch includes. One is to change =
the
> > edac debug message into a console error message to enable further
> > debug of this issue. The other is to skip the unrecognized DIMM.
> >
> > > * How do you think about to add the tag =E2=80=9CFixes=E2=80=9D?
> >
> > This is a good idea.  Use git blame, or dig into the GIT history to
> > find the commit where this code was introduced (hint .. git blame
> > says:
> > 88a242c98740 ("EDAC, skx_common: Separate common code out from skx_edac=
")
> > but that obviously just refactored code, so you should dig back more in=
to
> > the history.
> There are two parts,
> 1. @get_dimm_attr, edac_dbg was added since e235dd43d8b0f0
> 2. get num of ranks, rows and cols, 4ec656bdf43a13
>
> Should I add all of them prefixes with "Fixes"?
>
> >
> > > > V2: make error-print explicitly
> > > > ---
> > >
> > > Would you like to avoid a misplaced marker line here?
> > >
> > > See also:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Documentation/process/submitting-patches.rst?h=3Dv6.4#n686
> >
> > That's an excellent resource.
> >
> > -Tony
