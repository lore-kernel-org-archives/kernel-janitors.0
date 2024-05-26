Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FC117C7B
	for <kernel-janitors@vger.kernel.org>; Sun, 26 May 2024 16:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716742163; cv=none; b=ts+CtQI5OYw4EL/9tX98Zzi5TdZqcanFRjACnWAqVOoL5LqE5GlH4sbwP4brFOMKSNgWo0f8K8k13EleqI6il6xT/L05fmEQBoutpshs2ZXOLZvn/ELNznWgKjCkkEgZtx5NbpGvqCNsDnMx7nlnpziOVvpQqIWiNZWRs831JM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716742163; c=relaxed/simple;
	bh=ZWX9f3fa8b4qbUFvVN/Q4FeMPt7gbijVsNkWMGYGtZc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PVAFjConc5p/F0kPbmJR+Ao9nGKlHQvnrTAYq6EDgG0rps0AIGEJWccHqfBEthh0xeNbunIXfWn4sU18Z1i8ASJqiexX/tw0HksgFP5+0XBo7LXzFOEW78qS9fNfiF8tCg2q7L3OUKLX9vfYHaLyd46YDHHPaZy7Q2qT79tuoUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=W5nPrcmp; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="W5nPrcmp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=yk3zLaVoiPiKlmCSMJAuhRXdlYTUENxf5o5X4y0H/Es=;
  b=W5nPrcmpWYy5tEI8SEovvLhQQX3fwxHzaDGKQ8qHzTXA7IMh3pMq2R/J
   6bkIVZP0aNZr8T65gQ5LArv2d8aPnWqNbU4lDOICT0YK4UAcxQ+FybFwS
   7whwiOjDn3+jvORVUBxe0+XHkwoDS0iklzntpY84S90k6AmuUPqRFEaqy
   Q=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.08,190,1712613600"; 
   d="scan'208";a="87994904"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 18:49:12 +0200
Date: Sun, 26 May 2024 18:49:11 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
cc: cocci@inria.fr, kernel-janitors@vger.kernel.org
Subject: Re: [cocci] Increasing usage of mutex guards (with SmPL)?
In-Reply-To: <7eb9626c-da7b-414d-bf50-da1eed27be31@web.de>
Message-ID: <alpine.DEB.2.22.394.2405261847380.16852@hadrien>
References: <7eb9626c-da7b-414d-bf50-da1eed27be31@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-459381294-1716742152=:16852"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-459381294-1716742152=:16852
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sun, 26 May 2024, Markus Elfring wrote:

> Hello,
>
> I constructed another small script variant for the semantic patch language.
>
>
> @replacement disable decl_init@
> expression action, e, value;
> expression list el;
> identifier rc;
> @@
> -int rc;
>  ... when != rc = value
>      when any
> -mutex_lock
> +guard(mutex)
>            (&e);
> -rc = action(el);
> -mutex_unlock(&e);
>  return
> -       rc
> +       action(el)
>  ;
>
>
> I tried this SmPL script example out on source code from the software
> “Linux next-20240523”.
> 425 source files were found where some function implementations could be adjusted
> also according to the application of mutual exclusion.
>
>
> Will it become helpful to offer further SmPL script variants which can be used
> together with the tool “coccicheck”?

I'm not the one to decide whether we should use cleanup for mutex locks.
Intuitively, my opinion would be that we should not.  Something that can
have so much impact on the execution of the system should be visible. But
that's just my opinion.

julia
--8323329-459381294-1716742152=:16852--
