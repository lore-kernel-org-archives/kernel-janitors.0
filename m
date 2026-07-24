Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F89842A160;
	Fri, 24 Jul 2026 11:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893119; cv=none; b=YfCIq+EFeDPosj9b7Cjk3MuZsnt6SC+rFxIv6FMuV7ovjcxX5syYOeZACfX9SywCU4fhZgkpcVcaD+3nbcDumeDbsmSR78Z0BxyFhzW3BJyNOMBkmKpISEAyBMr5MKaYM+nzhOWCg5j58KoXDF+Rw+0V4SqnYkrk0rbKztKvZj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893119; c=relaxed/simple;
	bh=+aH73EJd06MgfzO3AUD8VsaSQHoLHeUe3MoL77VRqKA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WiV6PKag0b/7JMysKgcJDikuYUI1m5kgR2cd8b+3ORFDqDZHoTf3aMMguBphjeR5WnI+HruLP3Ti4mhctKd43sFHWs9GvoZi8PgKBJg2I5g+kqGxvs4Ao6L9gjgtSx78O2eulG953fGsy06Hceh8FN3mm5Fe1qYu3w5sfkGZ2CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=KV3s5Sdy; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="KV3s5Sdy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Rw0wIETRsFh1KY80jRMSxOddXjGx6rijH0hDzdNJijU=;
  b=KV3s5SdyvppBX9TiJQr5Yk8B6DJBmiNgcKrNLmIVDCuISTPHJRd6x51v
   n8pzeqoaLNuRMunRF1EhSRPGOQKx30Ase04OrfsjB1NY46kESrF0p/wk+
   B+6W1P0BZKuCePgO/tJ7byRh1EuPAm9rxJYm84Up1YW3vf+hR0On/EqEJ
   c=;
X-CSE-ConnectionGUID: Qy+w6r+XQbK1ocn3cYRoYA==
X-CSE-MsgGUID: 0OKsW1t3SXmd+jTnHp81dA==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,182,1779141600"; 
   d="scan'208";a="287766068"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 13:38:25 +0200
Date: Fri, 24 Jul 2026 13:38:25 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Markus Elfring <Markus.Elfring@web.de>
cc: Sang-Heon Jeon <ekffu200098@gmail.com>, cocci@inria.fr, 
    Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, 
    kernel-janitors@vger.kernel.org
Subject: Re: [cocci] [PATCH 01/36] coccinelle: misc: add
 cond_return_no_effect.cocci
In-Reply-To: <b0577cf2-d8eb-473f-87af-82ecc653f29c@web.de>
Message-ID: <614a4d1a-7a18-f7d9-7531-64605bc24080@inria.fr>
References: <20260723184538.3888637-2-ekffu200098@gmail.com> <b0577cf2-d8eb-473f-87af-82ecc653f29c@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1116840085-1784893105=:3487"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1116840085-1784893105=:3487
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Fri, 24 Jul 2026, Markus Elfring wrote:

> …
> > +++ b/scripts/coccinelle/misc/cond_return_no_effect.cocci
> > @@ -0,0 +1,121 @@
> …
> > +@depends on patch@
> > +local idexpression ret;
> > +expression E;
> > +binary operator cmp = {<, <=, >, >=, ==, !=};
> > +constant C;
> > +@@
> > +-	ret = E;
> > +-	if (\(ret \| !ret \| ret cmp C\))
> > +-		return ret;
> > +-	return ret;
> > ++	return E;
> > +
> > +@depends on patch@
> > +idexpression ret;
> > +binary operator cmp = {<, <=, >, >=, ==, !=};
> > +constant C;
> > +@@
> > +-	if (\(ret \| !ret \| ret cmp C\))
> > +-		return ret;
> > +	return ret;
> …
>
> How do you think about to combine such transformation rules
> by using an SmPL disjunction?

I see no benefit to doing that.  In particular, the patterns search for
some code in common, but from different places, since one starts with an
assignment and the other starts with an if (that is common to both).

julia
--8323329-1116840085-1784893105=:3487--
