Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CDAC77B61
	for <kernel-janitors@archiver.kernel.org>; Sun,  9 Apr 2023 18:45:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjDISpd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 9 Apr 2023 14:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjDISpc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 9 Apr 2023 14:45:32 -0400
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D173581
        for <kernel-janitors@vger.kernel.org>; Sun,  9 Apr 2023 11:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/XxL2YQ7mwgsHIuRErZtpjcuXpumOdbWZSudzFSHabc=;
  b=eIOB1h1Us779OYQPy+T9qjOaam7h0KVwq9znefhJWY9UpHVB7CqMg8pe
   x0lMURKQjs2ajr76jlG5xyK30kBD957WRJhFQLlCdVHxKm5uYtk1pyPao
   8hUceYFup9FCEYep+pvdEo6IEIp5ASTSZjp8/3TQ/pRL8JhQTcqL5/7YB
   M=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,331,1673910000"; 
   d="scan'208";a="102222873"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 20:45:28 +0200
Date:   Sun, 9 Apr 2023 20:45:28 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Markus Elfring <Markus.Elfring@web.de>
cc:     cocci@inria.fr, kernel-janitors@vger.kernel.org
Subject: Re: [cocci] Reconsidering pointer dereferences before null pointer
 checks (with SmPL)
In-Reply-To: <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
Message-ID: <alpine.DEB.2.22.394.2304092044020.3028@hadrien>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de> <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-725807146-1681065928=:3028"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-725807146-1681065928=:3028
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sun, 9 Apr 2023, Markus Elfring wrote:

> Hello,
>
> I tried the following SmPL script out also on the source files from
> the software “Linux next-20230406”.
>
> @display@
> expression action, input, target;
> identifier member, var;
> type t;
> @@
> (
> *t var = \( &input->member \| action(..., &input->member, ...) \);
>  ... when != input
>      when any
> |
> *target = \( &input->member \| action(..., &input->member, ...) \);
>  ... when != input
>      when any
> )
> *if (input == NULL || ...)
>     return ...;
>
>
> 31 source files were found where it was tried to determine the address of
> a data structure member (which includes a pointer dereference)
> before a null pointer check.
> I imagine that such code should be reconsidered once more and improved accordingly.
>
> How do you think about to achieve any adjustments in this design direction?

Setting var to &input->member does not cause any immediate problem.  If
there is a dereference of &input->member that can happen at run time
that would be a problem.

julia
--8323329-725807146-1681065928=:3028--
