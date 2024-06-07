Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0A8132139
	for <kernel-janitors@vger.kernel.org>; Fri,  7 Jun 2024 09:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717752670; cv=none; b=TqNvrrZtFoXbTEmO3zmwy/X2yhyc/XY72FSXxK5lveA8I3hMHPqLxdpKZP8ijz5BqS0Q12y+UT+R6f7H0owxwzhxctABVHcSxZYTtAoyuIj9U2GkkWOHXQJqD4sXiXry3woA/lq0bCj82ded+8QIZ6IuFuAlx/OZ8CWmb5FjCvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717752670; c=relaxed/simple;
	bh=rh6d3hIT/gGHuZqXKZa2cH2yqFBKt04gITtRxetenJ8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hMRzqvq/8v5GRwBa7SW0n9AEaThkrfojloEfvaqtoSB2a8U6M6A7NBcGQYBc5ejgA/7Ep/T7G7N0bKs2IShuV1fnW+S57TjDyCImhnlxglsmj/FEAsnhufCv4qUtcPj67dJjpuDmpevwjAXJb6BCgxoGxiheq1i64yDNz6wKpcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=E2RyW84n; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="E2RyW84n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1XtAVpu9xsa7LVD+ZsUycFjXRJCZQ525/U/2NN6TixM=;
  b=E2RyW84ntlgvB2ZuzUy1zcpnDBuJOv5JpuWdT0JQdFDko4FKjUOLvSIe
   emqz4rCz8VIWinRUd9WVhwIjgTIKJZJSVJRWmiCBYNHkWBjp8eCH2BLnb
   g5vBzssUZPK6Yz946Dw4MoYpYvejVZtJ8gT4l9ycj05CMd73bX96BSnGT
   c=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.08,220,1712613600"; 
   d="scan'208";a="89091338"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 11:31:00 +0200
Date: Fri, 7 Jun 2024 11:30:58 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Markus Elfring <Markus.Elfring@web.de>
cc: cocci@inria.fr, kernel-janitors@vger.kernel.org
Subject: Re: [cocci] Increasing usage of spinlock guards (with SmPL)?
In-Reply-To: <9d79a2de-10fa-479c-b720-1c4a2f51782d@web.de>
Message-ID: <4bad748-afee-713a-a2d7-30b6e5c1cb28@inria.fr>
References: <7eb9626c-da7b-414d-bf50-da1eed27be31@web.de> <alpine.DEB.2.22.394.2405261847380.16852@hadrien> <9d79a2de-10fa-479c-b720-1c4a2f51782d@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1745173528-1717752659=:3380"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1745173528-1717752659=:3380
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Fri, 7 Jun 2024, Markus Elfring wrote:

> > I'm not the one to decide whether we should use cleanup for mutex locks.
>
> Would you become interested to support the conversion of another tiny script
> (like the following) for the semantic patch language into a corresponding
> SmPL script variant which can be used together with the tool “coccicheck”
> any more?
>
> @replacement@
> expression e;
> @@
> -raw_spin_lock
> +guard(raw_spinlock_irq)
>               (&e);
>  ... when != e
>      when any
> -raw_spin_unlock(&e);

What exactly is the problem?  I tried this rule and it worked fine.  There
were a few issues of inconsistent control-flow paths, but it made 325
changes.

julia
--8323329-1745173528-1717752659=:3380--
