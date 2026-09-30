Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B584C4F54
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Sep 2026 11:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769449; cv=pass; b=izsULVsBHqe8kPz4xigiBqyEEU1yGuOXmZP8EUA3B0vwtnRjFlGKSavYRq4K00EKgqnc34OZtrAjQMsN/6Sp7Kh2T2umGiHMl+8RzIBcI/YDUqG2Yaqqm0KEAtD78OHtPnJQTFlZi4vuSrGy2P6+dSlvNuEgABnIm0+pajGQ+4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769449; c=relaxed/simple;
	bh=UoFaUknaPGAot9LI650Qdfi+g+WeShPBf70M25SuqEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uxGejWc3CRIfliPArM/L0cWagjSi7yOI342e5dmJmOr2HctkIGg4460zdOLNX17FwxQjfnwRhN9AAZKFnpFZ4wsLZRXZyfB6hNiKLbFoJOC9vngLaVYKOdlK0ZgR3qpZIJ7jwkVe0InzGZgcvvPXMAM3acZZ4mCsDNzUQpFkheo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQAr9S1U; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQAr9S1U"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-6729ca45e37so5465765d50.2
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Sep 2026 04:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790769446; cv=none;
        d=google.com; s=arc-20260327;
        b=bGzvFbnsPCBvILc6hdqVFCEJ4/c0zXGVsJ+DN6p3bOzmrO/PHnQ56X6RF9YsKl2orw
         RKE/NG7+lm/ZKx6v7+GbG7DDc5qvP0fdEPq+NjBbBiQ7o6antabMWEnXqm338408lVi3
         Rvpw8OQuIeDAZS4baMttT6/jeYnVkIkQ2vi7LWe26dXQHXIO7g/2m33yGyWaylXGrs0O
         JzI5O9fAL0T4EXD5cga2xxhKueu4FDMmcxzqJ6q9XnN5AaVDaXiep6gyxIsnuNG/91Pn
         K7WzfAIy6oNYSjP1QX/lRqvumOHFb9Vsp6Hi1L/xhHYft7lzvl/KprbyufWjoHj7iKm4
         yzJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ba7AhExhkiMVWJNfe1v9ZUOyiNk92H/JjgkQAe6kipg=;
        fh=af/S++EyuIEincxv8S7411ABXjJieITYPKAm2gFepGo=;
        b=jkslkt8/fz/VfZIZ7gHKbpf6NfRnHjqbDUqFO17IOnEykVJqCL1SRdcILD9xCe07NH
         /+dA0uMJCkJKWHMjirE9FH5wLNFVF9DN6q2FR3ed23d8/riENbEOp0oWvm/r4sNzyHux
         xwGv440uZtLFG6Pxqns+R6NM+NajOKBE1EgC1RSqCw1IJMKYJuWzQZCTRpOejh2eO1hn
         MsPx5bAqsI/WjdbHroBEQAU9jqzCp64VZOtu+yZUpCV4rOoSZCk5b48Mb/SSgZ8VYtK9
         2ZmX1Lyw8+DFiHH4I0zgCZ2EdGI/uxQfa4J3/d6SkQwrou49OdAJ1435F9f4t9bOEt7P
         e6fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790769446; x=1791374246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ba7AhExhkiMVWJNfe1v9ZUOyiNk92H/JjgkQAe6kipg=;
        b=OQAr9S1U79AheepEFc3eW+PvLQCQHbuErQhBRpCurfXkkhNAbkqlLqs5mVgVPTmT31
         JhVvAIxcFlb4AJQNHU+X0rRjpW5dtb6ogahQWFHlWB2tIXUgbQFuzkvg8gueKxhiwP3o
         kFPwBIohlqJ/6ZsPcnwpn9fI4xP5Ek8PaC5pejaC+8UmZ4lhpTdyMRTQB8D55E/cLUWn
         3tASZDXqcmX4Fn6qEaZkD6d/r2rx2O1MMLxo1fg5CYUP3xJcCyMYlXaojpNUtNUtQioX
         xlZ33/cdSd3Lnh4qusFiLd1PyuBdFMfdtDMkVcuUKo7OYKT4vba5c+dCw1nDE+vX3ozq
         ZfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769446; x=1791374246;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ba7AhExhkiMVWJNfe1v9ZUOyiNk92H/JjgkQAe6kipg=;
        b=glp3xoDl/rvLi7w/3935P94LqJ5zhcrZNGd9GWn5PmWsX5C3DSPQSAO4IRchBCNvoN
         G0fMTRkNQmFMH50sUvTzGsm0bY3hF7E2vVwRrq2h1IT2eEMgMZH5Td0aaqxvubSz6PY2
         cUkhtgYesHOnrTiSjQLr29k+hdNtrwq66sRU36gwnw5/tXOz0/aSebBv8ud1x0csw4wP
         c+x1r6AFu8prIR/0MhE3xdiG2nXG/ktVEEYWkaIlBrpyLb9FB1s7odoMREGbZMv+jEdD
         FmAPFEzslRNJjgE1zHsKZtP+jBCUCIw+jQJ/j8LqDXACDzDpz60aJB5M6nRouurJ1Fc/
         TFlw==
X-Forwarded-Encrypted: i=1; AKwUvByBpHJNYAyb1DLxkSA7teaN+GDl4XAoyrLUo1WMTsu8T/7c5kyk15E0+RpotkLzdKKSrB9fPi5GQyrULJ4yWds=@vger.kernel.org
X-Gm-Message-State: AFuF++lGSWnLJP3+JVGpMwggXD5spE5kV7u5zDKTf3IKV2Q8nGbwjncU
	witEav73bXnALAUN+GlXZyoWkmQ1cOvonwUjSQ0pEeZ9S3hiYSxH6iPoWRH+uN2N6W74MoygtsQ
	z3waA8eEZ5MQfhp6fvCIS2J4bcH49tDA=
X-Gm-Gg: AYBFou1MilYjaazFTck30Pzo+FMbItbVa81zcLuNgGF/dZfDliefooaA4Jl8i24Lww2
	KCZcJ5H97ZSay3LJr7v9VhW+/qHFR88pXWvaZevPP0iCn8JPF3XhrQtEdt9fnUxpoJybL73bzNy
	0Ty5zW0wKvWvwqGhV982nyoCzV7C/9avLNRldjRgEeqO3KqoTGvkRlijA1gAgGK5qaGEkYCB2xY
	RpNMezWdWJwfpUUztT5VHxsi/8AHmqN5IcOKLvDeDpKE7hN/8OiVf+RHnEzrRdTFcGY0sbJuCKt
	UID7YU5ju3TRU8f/Qkef505xIsepGbpVZZEjUkvgaA1g9oWVDAuj19c=
X-Received: by 2002:a05:690e:b87:b0:673:572:449c with SMTP id
 956f58d0204a3-67683494064mr311881d50.97.1790769445863; Wed, 30 Sep 2026
 04:57:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929194434.29937-1-ginger.jzllee@gmail.com>
 <20260930071916.35722-1-ginger.jzllee@gmail.com> <0593ff86-c6ab-4c64-88a3-e500ed335760@web.de>
 <CAGp+u1aTQvE_o=nObMb0LvuwmdFukG9qBeKGDvwcf5-ckG9xyg@mail.gmail.com> <cb64813e-0a11-4c14-9bea-45f8dceff115@web.de>
In-Reply-To: <cb64813e-0a11-4c14-9bea-45f8dceff115@web.de>
From: Ginger <ginger.jzllee@gmail.com>
Date: Wed, 30 Sep 2026 13:57:11 +0200
X-Gm-Features: AclHuK9c85XY0-0FVl9whcFZZRCVWc-3bABsjYrbvCeX-F_yjm-EuhyLPQ-257A
Message-ID: <CAGp+u1Yw24hRsZfnD7sePs4C=xp-VLe1=OitaVRUrvE9tyNiiQ@mail.gmail.com>
Subject: Re: [v3] dmaengine: tegra186-gpc-dma: Read channel state under the lock
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 9:46=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> >> Under which circumstances will additional background information becom=
e available?
> >
> > The static analyzer is a research-based one, built upon the LLVM IR.
> > The analysis is founded
> > on a symbolic model (not an ML model) for concurrency bugs.
>
> Thanks for such a hint.
>
>
> >                                                             And due to
> > the anonymity
> > requirements, I am afraid I cannot reveal further information.
>
> How does this feedback fit to other known guidance?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/researcher-guidelines.rst?h=3Dv7.3-rc5#n5
>

I can update more information about the static analyzer (i.e., it is
experimental and its reported log) in the patch.
I believe this aligns with the known guidance, but I cannot provide
the source code links.

>
> >>> Were any more of your contributions supported by advanced source code=
 analysis tools?
> >
> > If you meant AI tools, then at this stage, no. For this patch, I have
> > used AI tools to help phrase
> > the patch better, but I did not use them for code analysis.
> Will this information trigger further collateral evolution?
>

The collateral evolution will only affect the experimental analyzer.
It does not affect the submitted patch.

Sincerely,
Ginger
