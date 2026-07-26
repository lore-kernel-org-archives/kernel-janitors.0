Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983AD37A846;
	Sun, 26 Jul 2026 14:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785075254; cv=none; b=balyfbWNQV7XFbJo3gdHnxFG406EVAbjkuxT/xAc0kehrewXoU2obh52vdTIAEMzSUDXa0IxI7z4y1E59p1nbaBvRvvHv8OSc/IbpZWyYU7vmGhi6fhqlUibJjLjy1t0kyrT/Bs0ZyN5HwI76TV7Q5DCo3jU/jZH0VsJPpYqOzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785075254; c=relaxed/simple;
	bh=H2V3GI27DdATt/4U7sfXajino3y3q7luiZrN+wxbgUY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=M/m9OFTCftuMyhybD5+3LH4FK0407dbgaeKiNqQqUZZltgp9iQc1UCr8V8WgKjcT+6Q7CxNnBcJ2iQrjqGRgt7u8zyFGCOgoYpJeo1zpmaTauXNySwu8SYhQhHxbmjAcHPhW/iEqGZQ73Zf+8XaJgCInfhiVUYPg7KT2oxz8vZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=Kq2TcGvX; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="Kq2TcGvX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pyc3KV0c7uGPUeGy6S3ZUZkAIvd9XcbGhm5meX3RCeI=;
  b=Kq2TcGvXIe5qbnJwC2jmTSmPg0H3mUwSQJSIHQ0FNrTkVEFJQeejLiQA
   PB6OaVAGBuqT+abBftwHeUTPPcpZiuyfsPUuABcit/JuKH0Hv8OO2LOm6
   3kqW14m7zOlZDzipJQr9hxt8Gsv4Lco6ajnHF18MifvbFsU02y3sUERzS
   w=;
X-CSE-ConnectionGUID: /xG0f2sLQzePhI5X6mmUBg==
X-CSE-MsgGUID: LTOgu4PjRlCerVEP8pT2SQ==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,186,1779141600"; 
   d="scan'208";a="152972072"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 16:14:08 +0200
Date: Sun, 26 Jul 2026 16:14:07 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Markus Elfring <Markus.Elfring@web.de>
cc: Sang-Heon Jeon <ekffu200098@gmail.com>, cocci@inria.fr, 
    Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, 
    kernel-janitors@vger.kernel.org
Subject: Re: [cocci] [PATCH 1/3] coccinelle: mini_lock: improve performance
 when searching loops
In-Reply-To: <c5a73800-59cd-4870-ae57-11fe832054b9@web.de>
Message-ID: <c720b3c1-ac9a-2bf1-545-2d649b41ac5@inria.fr>
References: <20260725113303.691676-2-ekffu200098@gmail.com> <c5a73800-59cd-4870-ae57-11fe832054b9@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1864106738-1785075247=:181691"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1864106738-1785075247=:181691
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sun, 26 Jul 2026, Markus Elfring wrote:

> …
> > +++ b/scripts/coccinelle/locks/mini_lock.cocci
> > @@ -53,11 +53,31 @@ spin_lock_irq@p1
> >  spin_lock_irqsave@p1
> >  ) (E1@p,...);
> >
> > -@looped@
> > +@err_candidate exists@
> > +expression E1;
> > +position prelocked.p;
> > +position up != prelocked.p1;
> > +position rc;
> …
>
> Can it help a bit to avoid the repetition of the type
> for a few metavariables?
>
> +position prelocked.p, up != prelocked.p1, rc;

It's fine as is.

julia
--8323329-1864106738-1785075247=:181691--
