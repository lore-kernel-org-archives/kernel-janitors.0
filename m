Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9202CC04A95
	for <kernel-janitors@archiver.kernel.org>; Fri, 23 Sep 2022 19:28:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232629AbiIWT2n (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 23 Sep 2022 15:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiIWT2m (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Sep 2022 15:28:42 -0400
X-Greylist: delayed 63 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 23 Sep 2022 12:28:40 PDT
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC44012CC89
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Sep 2022 12:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=W924Q08YRfkc/BK7mpoCqLP0ZrNRF4hS2uWrF5dSqQk=;
  b=pLVA8QmRhBYstTudi2Gjouriym6jaStiF67ErE/4Bm4y/zAo02QKA4PV
   maewr/QLcryAROYoehKfXikPbc1Y7qpDXYPFInJ76R5lN/mALOUslBIXF
   HUZ2Gi4iEcNLL6WJff0HqMUEa/7JsTCV7TuZ1AZZ0Ybx6xm9jAGtiBKeK
   8=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.93,340,1654552800"; 
   d="scan'208";a="54293489"
Received: from 51.123.68.85.rev.sfr.net (HELO hadrien) ([85.68.123.51])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 21:27:35 +0200
Date:   Fri, 23 Sep 2022 21:27:34 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Markus Elfring <Markus.Elfring@web.de>
cc:     Yuan Can <yuancan@huawei.com>, cocci@inria.fr,
        Nicolas Palix <nicolas.palix@imag.fr>,
        kernel-janitors@vger.kernel.org
Subject: Re: [cocci] [v3 1/2] coccinelle: locks: add missing_mutex_init.cocci
 script
In-Reply-To: <2a8b2d3c-26cf-3aab-34b3-1ba402740111@web.de>
Message-ID: <alpine.DEB.2.22.394.2209232125480.2720@hadrien>
References: <20220922115535.44132-1-yuancan@huawei.com> <20220922115535.44132-2-yuancan@huawei.com> <3351dd3d-f55a-10b0-6b35-d5206570e687@web.de> <2274a1a9-4b13-7677-9cf7-55ea960d8be@inria.fr> <6a0600c7-dcdd-f37d-9a6d-cc734cf88dd1@web.de>
 <54938aa-3629-2bc2-edc-cc1b3246866@inria.fr> <2a8b2d3c-26cf-3aab-34b3-1ba402740111@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1190244421-1663961255=:2720"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1190244421-1663961255=:2720
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Fri, 23 Sep 2022, Markus Elfring wrote:

> >> # How do you think about the handling of multiple members within data structures?
> > There should be no problem with this.
>
>
> Would it be relevant to use the SmPL construct “<+... … ...+>”?

Not in a structure definition.

>
>
>
> >> # How much does it matter here that curly brackets are used for a proposed SmPL constraint?
> > I have no idea what "How much does it matter" mean.  {} are used because
> > that's how struct types are declared.
>
>
> Please take another look at mentioned implementation details for
> the clarification of such communication difficulties.
>
> A)
> position p != {r2.p};
>
> B)
> position p != find_member.p;

OK, both are fine.  If there are multiple positions that p should be
different from then the {} would be required.

>
>
> >> I got another development concern for the presented algorithm.
> >> Why is a data initialisation function call searched in the first SmPL rule at all?
> > Because he wants to find the fields for which mutex_init is already called
> > and to not report messages for them.  That is the whole point of the
> > semantic patch.
>
>
> How do you think about an opposite source code search order?
>
> Would you like to search for function calls which require initialised
> data structures before any additional source code analysis?

It doesn't make much sense to have a mutex without initializing it.

julia
--8323329-1190244421-1663961255=:2720--
