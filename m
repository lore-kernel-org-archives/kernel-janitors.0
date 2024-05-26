Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF18E573
	for <kernel-janitors@vger.kernel.org>; Sun, 26 May 2024 18:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716748688; cv=none; b=ViBDJ0AUEFG4d6HNz/2s/Fe57dsEkCXtNC7rcoEvd0LfWVLayERPlZMcDkgSZaX0CG2qqCPgO3F/6qnW2SSirJT6RGa4IQ7O/U0aLIUc+JGMcEZOaUQKOwZWUo0sBtyy0FZYB8n7uFMYw/ox1sHGcLSQ2xAXfubDSL3js3YKugY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716748688; c=relaxed/simple;
	bh=A26HxvqL/PvTrUiD8ZRt9ZzPYxFSJfjjhgbVS5BtcJg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EGA3vi9kOMVSxCrEW1hrkUuH//PmZUUax0xVFSKFUgqHnBfoTWaqDKrr3sLxxz0BRJZ5C6jw5o5qQM7OhY+oI/8mKNd1s3ER8cwOHOGNOuDjOcXtIeJPCVsAhpHPtKzCfhGEqJldZD0nBwOMKZKoz44w7Sz8r64+1c/BFogJzCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=AP62MMrx; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="AP62MMrx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pGZ9O40A/d7wa13bUJI/ocizf1Fw4tixoeXn9+NCuHg=;
  b=AP62MMrxHJb+UNAS6Vwt1rkXysPTrj7tzkJVHM76wiaXxhyd+idnTanf
   AsV+h6RIaR2/cuSLzERqXLIhtCHSPck/vHxkAlIo/MDsxaTortXptxG75
   LBYjrzLPlcLjAWBAxLI/bYCvyyohg6Uq6jLxbBzLdifKpywtZOgVmEYf6
   U=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.08,190,1712613600"; 
   d="scan'208";a="167479061"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 20:36:55 +0200
Date: Sun, 26 May 2024 20:36:54 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
cc: cocci@inria.fr, kernel-janitors@vger.kernel.org
Subject: Re: [cocci] Increasing usage of mutex guards (with SmPL)?
In-Reply-To: <702c16f2-33ae-4493-8062-24b14b7fb0be@web.de>
Message-ID: <alpine.DEB.2.22.394.2405262036190.16852@hadrien>
References: <7eb9626c-da7b-414d-bf50-da1eed27be31@web.de> <alpine.DEB.2.22.394.2405261847380.16852@hadrien> <702c16f2-33ae-4493-8062-24b14b7fb0be@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-710957120-1716748615=:16852"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-710957120-1716748615=:16852
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sun, 26 May 2024, Markus Elfring wrote:

> >> Will it become helpful to offer further SmPL script variants which can be used
> >> together with the tool “coccicheck”?
> >
> > I'm not the one to decide whether we should use cleanup for mutex locks.
> > Intuitively, my opinion would be that we should not.  Something that can
> > have so much impact on the execution of the system should be visible.
>
> You are trying to influence software evolution also according to
> scope-based resource management for a while, don't you?
> https://elixir.bootlin.com/linux/v6.9.2/source/include/linux/cleanup.h#L124

I have only helped to automate what others have already shown interest in.

julia
--8323329-710957120-1716748615=:16852--
