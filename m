Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A6CC77B6F
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 Apr 2023 08:00:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjDJIA4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 Apr 2023 04:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjDJIAz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Apr 2023 04:00:55 -0400
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49EC840EA
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Apr 2023 01:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=gFgcSaz4xRkKQOLqY6Od4NkwhTmN9bqn9JCesrCIk6E=;
  b=Ch1elqMayh0UdPMMT74V8i9yKEU1mFeSBBZo6jXIyR1AIw/7OJL+oQeL
   brPyoMi9awvdW/8rZW03mgk7uStQwxB5GCIl7mMMJpI7vEEU0OsGGwD0Z
   yq/LtgLyOv4bUABx5vMv7MBP1Owa99DHEteH8UuEzuBx5PcsqORJ0Kubd
   M=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,333,1673910000"; 
   d="scan'208";a="102254639"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 10:00:47 +0200
Date:   Mon, 10 Apr 2023 10:00:48 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Markus Elfring <Markus.Elfring@web.de>
cc:     Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr,
        kernel-janitors@vger.kernel.org
Subject: Re: [cocci] Reconsidering pointer dereferences before null pointer
 checks (with SmPL)
In-Reply-To: <2de88997-0732-d0dd-5178-f9d42b5a3be5@web.de>
Message-ID: <alpine.DEB.2.22.394.2304100959310.3387@hadrien>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de> <1a11455f-ab57-dce0-1677-6beb8492a257@web.de> <alpine.DEB.2.22.394.2304092044020.3028@hadrien> <95caa4c1-2455-2733-ef4b-3ab07783c725@web.de> <alpine.DEB.2.22.394.2304100824510.3387@hadrien>
 <2de88997-0732-d0dd-5178-f9d42b5a3be5@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-557947407-1681113648=:3387"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-557947407-1681113648=:3387
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Mon, 10 Apr 2023, Markus Elfring wrote:

> >>> Setting var to &input->member does not cause any immediate problem.
> >>
> >> Undefined behaviour would be involved if the expression variable “input”
> >> will actually be resolved to a null pointer, wouldn't it?
> >
> > No.  &input->member adds an offset to the address of input.
>
> It seems that we represent different development views according to the question
> “Does taking address of member variable through a null pointer yield undefined behavior?”.
> https://stackoverflow.com/questions/25725286/does-taking-address-of-member-variable-through-a-null-pointer-yield-undefined-be
> https://en.cppreference.com/w/c/language/behavior

The statement:

"... &((*ptr).second) which dereferences an object instance pointer"

is not correct.  &((*ptr).second) does not dereference *ptr any more than
&x deferences x.  The semantics of & doesn't work like that.

julia

>
>
> Regards,
> Markus
>
--8323329-557947407-1681113648=:3387--
