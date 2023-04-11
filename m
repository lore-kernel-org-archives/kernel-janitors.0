Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2D1C77B76
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Apr 2023 07:40:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbjDKHk2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Apr 2023 03:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbjDKHk0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Apr 2023 03:40:26 -0400
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 134A81709
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Apr 2023 00:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OHrTMkf5R4C4XNEzngdXIuZRhn0et7vsN9POMwfmYTs=;
  b=aUC73seVZ3Vmy/RKhU7TRZL68LM5DJxHJTiwDesP1USmUhNxYeCRpWPI
   45yImImXqxSReS5GB0gY7vlQX3p1TFCqaxdTEVQlrliJWL/nuh/1dOalp
   rONm/9jirDtZAoItVcqVvyrWWUbr4L1i7cje/vHuO7XDiK6WgNy+F/zzU
   k=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,336,1673910000"; 
   d="scan'208";a="102355044"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 09:40:23 +0200
Date:   Tue, 11 Apr 2023 09:40:23 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
To:     Markus Elfring <Markus.Elfring@web.de>
cc:     cocci@inria.fr, kernel-janitors@vger.kernel.org
Subject: Re: [cocci] Reconsidering pointer dereferences before null pointer
 checks (with SmPL)
In-Reply-To: <5defca25-d893-f61a-ec24-aa99ba39d8a7@web.de>
Message-ID: <4d2383c7-b923-31a2-2c26-7b34b3b13c7@inria.fr>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de> <1a11455f-ab57-dce0-1677-6beb8492a257@web.de> <alpine.DEB.2.22.394.2304092044020.3028@hadrien> <95caa4c1-2455-2733-ef4b-3ab07783c725@web.de> <alpine.DEB.2.22.394.2304100824510.3387@hadrien>
 <2de88997-0732-d0dd-5178-f9d42b5a3be5@web.de> <alpine.DEB.2.22.394.2304100959310.3387@hadrien> <31b51efc-afbe-ec34-255e-9df60983ec3d@web.de> <alpine.DEB.2.22.394.2304101415040.2875@hadrien> <5defca25-d893-f61a-ec24-aa99ba39d8a7@web.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-262426065-1681198823=:3683"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-262426065-1681198823=:3683
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Tue, 11 Apr 2023, Markus Elfring wrote:

> >>>> https://stackoverflow.com/questions/25725286/does-taking-address-of-member-variable-through-a-null-pointer-yield-undefined-be
> >>>> https://en.cppreference.com/w/c/language/behavior
> >>>
> >>> The statement:
> >>>
> >>> "... &((*ptr).second) which dereferences an object instance pointer"
> >>>
> >>> is not correct.  &((*ptr).second) does not dereference *ptr any more than
> >>> &x deferences x.  The semantics of & doesn't work like that.
> >>
> >> Does the usage of the operator “member access through pointer” (arrow) mean also
> >> a dereference in comparison to the asterisk operator in the C programming language?
> >
> > Not when there is a & in front.  you can just look at the generated
> > assembly code to see that.  The goal of & is to take the address of
> > something, not to evaluate the thing.
>
> Would you like to take another look at recent responses by David Svoboda?
> https://wiki.sei.cmu.edu/confluence/display/c/EXP34-C.+Do+not+dereference+null+pointers?focusedCommentId=405504153#comment-405504153

His previous comment says that the standard doesn't mention &a->b so it is
a problem.  He is surely more of an expert on the C standard than I am.

julia
--8323329-262426065-1681198823=:3683--
