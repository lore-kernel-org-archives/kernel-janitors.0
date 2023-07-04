Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA12EB64DC
	for <kernel-janitors@archiver.kernel.org>; Tue,  4 Jul 2023 02:20:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjGDCUh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 3 Jul 2023 22:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjGDCUh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 Jul 2023 22:20:37 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA427E59
        for <kernel-janitors@vger.kernel.org>; Mon,  3 Jul 2023 19:20:35 -0700 (PDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2A30A3F0F7
        for <kernel-janitors@vger.kernel.org>; Tue,  4 Jul 2023 02:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1688437234;
        bh=gPUh1UKYRUTDUZfqtjt41zw9iPe9y1sFpRCgNtjp5pI=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=Hk8GMq/Gec5cKyswDxPGNjRhqiy6pNzJFdd6Mxs1VK3roAYzE2eLdLI72xoBkmesZ
         0cR4qY9k74Hl0hnunHWCGVqWPWIhCJg15SpPJ/kdFDmdhl3aiBxfQ5AfxUsWTv168/
         tLLCYoDuKJa9MasqKEnyCIHKpnijkIqkLfFJl8KAUXIIExQHe7BCrzwWc3F74y8BJ8
         aNyWTLkigcPMRBl0C+eCQJdr7731mhWkheGaLFErcpU3Es7p4LZsMtoaz2mQu/XLi+
         JWcEhcc7kx9a6jTcEf1kVd9N7uV+vUgHJ6f4kVO1wzjKSM0NFfBE/MCJfd1H9EiyfW
         ecXszi9yXDyrg==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9877da14901so355133666b.1
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Jul 2023 19:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688437234; x=1691029234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gPUh1UKYRUTDUZfqtjt41zw9iPe9y1sFpRCgNtjp5pI=;
        b=b1ti0Q1BKGhfGdxcyHwm8B9ngwYLTdpKxhpHveCozRLf+oMRqQJcxvJhgviaLRawLZ
         vv96qTO6x93qQKCnMpcgfWZeyO8EXosuWgWM2kLQJ3cEmKMcTGAw1sIm0G0I89IvMVrA
         2VBK0tmJ6cnEeFYEJ4NhoBCgkQVsr89wsoS44HalGPSUhcBVqmXAGsPUf8ZTGDPz5Y3g
         QUeNIVsc0A06sPlrnsuQdXI1g9ZGApl0l6yCMvb88mWqUtWTAouJGjBv3YWUT8PvVAUy
         gwOL4KpIIEEWwGqM4N7CjlVPQRpXRVRB83t6RegZedoahpfFIbmYneNLns7jITE59eWA
         jbXA==
X-Gm-Message-State: ABy/qLbN2cb/hFA9z6QmcttlrLjtFMgWVlSqv8mNQu7pZgXI61cFjkTi
        YzhU4HJvPOnSncJsF6fqZn5PY9G4DxbCjXroT+8bzP7FJPjXWZkrVU3WpwqdklXqsfEqFoAL+8V
        j2NjW1idVi9GlTrTDGN7r2yiSWuKyCHmENHHnQCviS0yK/76wNvEduypqxuB1MQ==
X-Received: by 2002:a17:907:9850:b0:993:3556:b7ed with SMTP id jj16-20020a170907985000b009933556b7edmr5359543ejc.6.1688437233881;
        Mon, 03 Jul 2023 19:20:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFfr+4nSObV9okaYd8nc1mjdTLkRmk1774yuvQp5tR7ZGFYw29tiQlOXSBPPnbWZ8jRWJg5yiQCcEgEHmT8oiA=
X-Received: by 2002:a17:907:9850:b0:993:3556:b7ed with SMTP id
 jj16-20020a170907985000b009933556b7edmr5359526ejc.6.1688437233447; Mon, 03
 Jul 2023 19:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230703162509.77828-1-koba.ko@canonical.com> <4ec2b7d2-11a5-6ab6-087a-175ed31faca4@web.de>
 <SJ1PR11MB60839A0FC6B5E79E3E5A7997FC29A@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB60839A0FC6B5E79E3E5A7997FC29A@SJ1PR11MB6083.namprd11.prod.outlook.com>
From:   Koba Ko <koba.ko@canonical.com>
Date:   Tue, 4 Jul 2023 10:20:20 +0800
Message-ID: <CAJB-X+X+09-m57JcZcb-_9dKUG3CtAbLXxGTEg7R0bB8pyJx9Q@mail.gmail.com>
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
There are two parts,
1. @get_dimm_attr, edac_dbg was added since e235dd43d8b0f0
2. get num of ranks, rows and cols, 4ec656bdf43a13

Should I add all of them prefixes with "Fixes"?

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
>
> -Tony
