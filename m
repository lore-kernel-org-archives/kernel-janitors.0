Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88629ECAAD8
	for <kernel-janitors@archiver.kernel.org>; Fri, 23 Sep 2022 14:21:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232557AbiIWOVy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 23 Sep 2022 10:21:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231903AbiIWOVw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Sep 2022 10:21:52 -0400
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E2213B023
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Sep 2022 07:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wodYgcViYlNEgjnvpJ9FEVllkDja6PndBTGivvzh83U=;
  b=ZJWaTX8FIaZqvknaADtCKqnzHU+oxGlk9I4Sr09hZA/rHb0+/1AnXAqs
   gNtnNyWrCCn12PrvJRplVYKbPSjpvfG1uU3EZZliW0F+6ToHhMHQnzDgu
   ydZM5ykvrVohU2f28g1AzCDV2lKPlt2s30EQlRhkDbc7X6O+XlttHV68h
   A=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.93,339,1654552800"; 
   d="scan'208";a="24536317"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 16:21:49 +0200
Date:   Fri, 23 Sep 2022 16:21:49 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
To:     Markus Elfring <Markus.Elfring@web.de>
cc:     Yuan Can <yuancan@huawei.com>, cocci@inria.fr,
        Nicolas Palix <nicolas.palix@imag.fr>,
        kernel-janitors@vger.kernel.org
Subject: Re: [cocci] [PATCH v3 1/2] coccinelle: locks: add missing_mutex_init.cocci
 script
In-Reply-To: <3351dd3d-f55a-10b0-6b35-d5206570e687@web.de>
Message-ID: <2274a1a9-4b13-7677-9cf7-55ea960d8be@inria.fr>
References: <20220922115535.44132-1-yuancan@huawei.com> <20220922115535.44132-2-yuancan@huawei.com> <3351dd3d-f55a-10b0-6b35-d5206570e687@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> > +@r3@
> > +identifier s, fld;
> > +position p != {r2.p};
> > +@@
> > +
> > +struct s {
> > +  ...
> > +  struct mutex fld@p;
> > +  ...
> > +};
>
>
> How many mutexes (or spin locks) should be initialised before further data
> processing can be safely performed with corresponding structures?

I tried the semantic patch on this file:

struct s {
  struct mutex fld;
};

int main () {
  struct s *mm;
  mm = kmalloc();
  mutex_lock(&mm->fld);
}

and it reported the expected error message.  So what exactly is the
concern, Markus?

julia
