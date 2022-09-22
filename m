Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA708C6FA82
	for <kernel-janitors@archiver.kernel.org>; Thu, 22 Sep 2022 12:27:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbiIVM1a (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 22 Sep 2022 08:27:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231422AbiIVM13 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Sep 2022 08:27:29 -0400
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A6F4E512A
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Sep 2022 05:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=lPloPoZbJjPIgb5mArkM29FxJyDIFGPUMK34rQ1f3EU=;
  b=Wiipb0ePkikHeaNMl5Xhz7wVgpGvtIqrARmvuBvJ285m/xwal610TPaF
   pKef0atjqRK3WQ7X51CXY5f4ipoR1C98r10xPNL/QgMyJmbXvdAdu77HY
   FYD4DXKDr5GFMBJ/vAKlKtRYlKVtCFRI6YzLUoWXuN2KxkAAWE9J2m2nT
   Y=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.93,335,1654552800"; 
   d="scan'208";a="24408251"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 14:27:25 +0200
Date:   Thu, 22 Sep 2022 14:27:24 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
To:     Yuan Can <yuancan@huawei.com>
cc:     Markus Elfring <Markus.Elfring@web.de>, cocci@inria.fr,
        Nicolas Palix <nicolas.palix@imag.fr>,
        kernel-janitors@vger.kernel.org
Subject: Re: [cocci] [v2 1/2] coccinelle: locks: add missing_mutex_init.cocci
 script
In-Reply-To: <1a6f854f-cf97-3f69-a897-cf92328de986@huawei.com>
Message-ID: <4e1f7b6-5c3f-6973-fdd8-6d294a841d26@inria.fr>
References: <20220920025820.105924-1-yuancan@huawei.com> <0896e030-5060-08e7-d0de-c63d77c9ef27@web.de> <alpine.DEB.2.22.394.2209202211430.2740@hadrien> <92f6a7e6-cfbb-ee05-bbdd-dfa4c9abad4f@web.de> <1a6f854f-cf97-3f69-a897-cf92328de986@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-896390314-1663849644=:3846"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-896390314-1663849644=:3846
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Thu, 22 Sep 2022, Yuan Can wrote:

>
> 在 2022/9/21 4:24, Markus Elfring 写道:
> > > > > +@r3@
> > > > > +identifier s, fld;
> > > > > +position p != {r2.p};
> > > > Why do you think that such a SmPL constraint would be required?
> > > >
> > > >
> > > > > +@@
> > > > > +
> > > > > +struct s {
> > > > > +  ...
> > > > > +  struct mutex fld@p;
> > > > > +  ...
> > > > > +};
> > > > Why would the source code search repetition matter here?
> > > He is searching for a structure that is different from the ones matched
> > > previously.
> > How many mutexes (or spin locks) should be initialised before further data
> > processing can be safely performed with corresponding structures?
>
> In my opinion, every mutexes and spin locks needs to be initialised before
> use.

I think that the concern is that you require that some spinlock is
initialized in the file before you are able to find one that is not.  It
could be good to check this with an artificial test case.

julia
--8323329-896390314-1663849644=:3846--
