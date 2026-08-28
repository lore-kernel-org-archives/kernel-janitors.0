Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36C53D0908
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Aug 2026 13:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922644; cv=none; b=ogkm/zqfOtmy2tq2zGsUFsrXBcbYZT+OKv/DFq2gGA4Izz6T/LFkfPiwyJR45OYyGgDZc6NbD1fBmNTnZxBRrcAkJcwO9XqE6AJCr+PiXCmaz0yWSDAGabBQd0zS5iXaeWHRAZDKGInJZUdtaI/dvL67k5mSM+pNqBf1WsTM23M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922644; c=relaxed/simple;
	bh=28hEvh/yN6/KDaQpf6vq6HtoXt/HwY9DEkzJBJ2Qcp0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AKEB1pjnslTwuw8ERzOzDpMYnmHeEOzdgjpmqZE6k4DB4YZH8GNwT37H6VPIob1B4mMXfJMNmao5PxYd9ELQtWHUyP5+G4h7kGiEhWoHAbHme+6QkBkH4c/7nnW1m+pPd4ai2BrFC4s0vouUU8rHr9BraH9RhenYCvBehtVvmQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=fhMorF/H; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="fhMorF/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wGdauYYeSoLghg8XFSFnJI/mKMIly+AEeT7tYGOO7OI=;
  b=fhMorF/H+0S2NL9f/xwIR8TP5TiTJFsp3UqUicmg1eKgGKrj0tEHyZtm
   Qe8otZGsTjF5sB+BS/4uz7GNpo6BOLZmTIu9escDRfDDKrMr7tRmTa39+
   qrEpVSDgrZzButsHhL9BU0tLidDYG4HemhbIuPl210Q5fjxxhIFpH004H
   o=;
X-CSE-ConnectionGUID: RsVqu6yaRwiQFQfLhmdhOw==
X-CSE-MsgGUID: DekLxXruS7iuw1puvGCK8A==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,248,1779141600"; 
   d="scan'208";a="292024478"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 15:10:32 +0200
Date: Fri, 28 Aug 2026 15:10:32 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Markus Elfring <Markus.Elfring@web.de>
cc: cocci@inria.fr, kernel-janitors@vger.kernel.org
Subject: Re: Improving support for deleting selected macro calls with SmPL
In-Reply-To: <9e729258-a720-4b8f-b0f0-e84f3a984aef@web.de>
Message-ID: <a0b9259-987b-1c92-2e86-3409ecf87e@inria.fr>
References: <9e729258-a720-4b8f-b0f0-e84f3a984aef@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-753801670-1787922632=:71423"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-753801670-1787922632=:71423
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Fri, 28 Aug 2026, Markus Elfring wrote:

> Hello,
>
> The data processing is still improvable also according to the software
> combination “Coccinelle 1.3.2”.
>
> Another SmPL script example:
> @deletion@
> @@
> -READ_ONCE(dev->mtu)
>
>
> Questionable test result:
> Markus_Elfring@Sonne:…/Projekte/Coccinelle/janitor> spatch --parse-cocci delete_READ_ONCE_for_mtu.cocci
> …
> invalid minus starting on line 3

You can't simply delete an expression.  The resulting code would not be
valid.  For example if the code was 10 + READ_ONCE(x), you would end up
with 10 +, which is not valid C code.

The problemn has nothing to do with READ_ONCE being a macro.  It occurs
for any expression.

julia

>
>
> Would you like to improve any software components accordingly?
> https://gitlab.inria.fr/coccinelle/coccinelle/-/blob/78ac4072c68190fc929f2e3c7534350a5ef6496a/parsing_cocci/context_neg.ml#L1419-1434
>
> Regards,
> Markus
>
>
--8323329-753801670-1787922632=:71423--
