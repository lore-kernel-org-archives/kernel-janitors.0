Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD75C07E9D
	for <kernel-janitors@archiver.kernel.org>; Fri, 23 Sep 2022 17:08:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbiIWRIx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 23 Sep 2022 13:08:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbiIWRIt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Sep 2022 13:08:49 -0400
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33B414DACE
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Sep 2022 10:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Gw11JBUdH21sSz2T27TsNO2xBRUcUC48YdF+GCrrulg=;
  b=K32RGrEP2l++vR+o9aCVAdCDKWnpzHgPZIUKUeGxZF4gBNFygz6qJzQp
   Sw1mOgduwh/WtwtwY/um/bLxkIkHqMEU9uMQQreGszA6rYwkufJ5oGTh9
   wiGvf3s2ZQDVR0A8qtqqlUnp3pFCGDS9KTf/Badz2GdQ1R6ltCIWkdWPL
   M=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.93,339,1654552800"; 
   d="scan'208";a="24549723"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 19:08:44 +0200
Date:   Fri, 23 Sep 2022 19:08:43 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
To:     Markus Elfring <Markus.Elfring@web.de>
cc:     Yuan Can <yuancan@huawei.com>, cocci@inria.fr,
        Nicolas Palix <nicolas.palix@imag.fr>,
        kernel-janitors@vger.kernel.org
Subject: Re: [cocci] [v3 1/2] coccinelle: locks: add missing_mutex_init.cocci
 script
In-Reply-To: <6a0600c7-dcdd-f37d-9a6d-cc734cf88dd1@web.de>
Message-ID: <54938aa-3629-2bc2-edc-cc1b3246866@inria.fr>
References: <20220922115535.44132-1-yuancan@huawei.com> <20220922115535.44132-2-yuancan@huawei.com> <3351dd3d-f55a-10b0-6b35-d5206570e687@web.de> <2274a1a9-4b13-7677-9cf7-55ea960d8be@inria.fr> <6a0600c7-dcdd-f37d-9a6d-cc734cf88dd1@web.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-444471677-1663952923=:3931"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-444471677-1663952923=:3931
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Fri, 23 Sep 2022, Markus Elfring wrote:

> >>> +@r3@
> >>> +identifier s, fld;
> >>> +position p != {r2.p};
> >>> +@@
> >>> +
> >>> +struct s {
> >>> +  ...
> >>> +  struct mutex fld@p;
> >>> +  ...
> >>> +};
> >>
> >> How many mutexes (or spin locks) should be initialised before further data
> >> processing can be safely performed with corresponding structures?
> > I tried the semantic patch on this file:
> >
> > struct s {
> >   struct mutex fld;
> > };
> >
> > int main () {
> >   struct s *mm;
> >   mm = kmalloc();
> >   mutex_lock(&mm->fld);
> > }
> >
> > and it reported the expected error message.
>
>
> This test result might be nice.
>
>
> > So what exactly is the concern, Markus?
>
>
> I just suggest to check once more if it would be really required to determine
> the position for a data structure member twice (as proposed by the SmPL rules
> “r2” and “r3”).
>
> Would you like to compare the data processing for a SmPL code variant
> like the following?
>
> @find_member@
> identifier s1, s2, f;
> position p;
> @@
>  struct s1
>  {
>  ...
>  struct s2 f@p;
>  ...
>  };
>
> @show_member@
> identifier s1, s2, f;
> position p != find_member.p;
> @@
>  struct s1
>  {
>  ...
> *struct s2 f@p;
>  ...
>  };
>
>
> # How do you think about the handling of multiple members within data structures?

There should be no problem with this.

> # How much does it matter here that curly brackets are used for a proposed SmPL constraint?

I have no idea what "How much does it matter" mean.  {} are used because
that's how struct types are declared.

>
>
> I got another development concern for the presented algorithm.
> Why is a data initialisation function call searched in the first SmPL rule at all?

Because he wants to find the fields for which mutex_init is already called
and to not report messages for them.  That is the whole point of the
semantic patch.

julia

>
> I imagine that potentially missing function calls can be determined also
> by other approaches.
>
> Regards,
> Markus
>
>
--8323329-444471677-1663952923=:3931--
