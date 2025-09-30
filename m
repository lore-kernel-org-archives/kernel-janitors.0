Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4371B4236
	for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 12:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759237068; cv=none; b=LE0noj2B/76ZLpIP+zTg616iKgnB1dC8vQONQ6zMsC+cHjGjezAY2JBO9CopHs6huqA5g97loSno3fMuvhpK0m96ttraGpGn94TiNV/FMsvKremHc8Z6cHAui84S+bsgssYQI5dkdW9eFgJbyM6L4IT2ro3pctjCmRjqpua0cOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759237068; c=relaxed/simple;
	bh=kWzPIJSCPvZuJ5cTivFa/QO51QpD2ze2aD7rllOzFEA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eKDwOjcmgttiLwks2IfxzOn1Kz97PxoxOsbnkvJ7YytqDOdoAlqxLgOi1MdyVd/c8GK6sdTq8mU1VP0JiIuK6BW9bqusHTcsrTrIUy0KuQnTVKZ8ueiv2pWwkTKkdhm6s0dOJ/+6Ng2Dm6zmzSlueB0bzd3PBZwQDBrmA59e4+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kK0lApBs; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kK0lApBs"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 701CBC02468;
	Tue, 30 Sep 2025 12:57:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 100E1606E4;
	Tue, 30 Sep 2025 12:57:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EABD4102F17DB;
	Tue, 30 Sep 2025 14:57:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759237061; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nVa13gnqEbh0OZfVTb62Mape7gGdjtHA5pEICJOEZkQ=;
	b=kK0lApBsvgRTKrjnu2IL+FRxEyR7mnsh3RP0I7hz5/8rfbhRiS/M1SmGvCx98qkRn50S40
	DUuy6VU71VExjQDcGAojP8+opuH+Ak3vE7hk+5v7Ua5MzDtTQ9Y+P1E82gPRCP2QFiJWiv
	D23lVXQomE6b7XxqCYXDQT1snVJVZ6UpdrOS8YDH0D5kCPM6RMt21PyqGlpbt38Qm78oN2
	vKLpRgvc2AEBNZxk7Y7ls2cI3pLo0ue9PBGwgs1z3xAdPxKvAohA+FyomgAYUoi/YQrrts
	8qK0EOOPxIrYpGj3rjSXo9pFMyKBm4ndIRpT49dhsMT8Bn7Q0rgikBt90Dt3pg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,  Richard
 Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 resend] mtdchar: fix integer overflow in read/write
 ioctls
In-Reply-To: <aNvN4kfJ2ROB353Q@stanley.mountain> (Dan Carpenter's message of
	"Tue, 30 Sep 2025 15:32:34 +0300")
References: <aNvN4kfJ2ROB353Q@stanley.mountain>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 30 Sep 2025 14:57:19 +0200
Message-ID: <87qzvogksw.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Dan,

On 30/09/2025 at 15:32:34 +03, Dan Carpenter <dan.carpenter@linaro.org> wro=
te:

> The "req.start" and "req.len" variables are u64 values that come from the
> user at the start of the function.  We mask away the high 32 bits of
> "req.len" so that's capped at U32_MAX but the "req.start" variable can go
> up to U64_MAX which means that the addition can still integer overflow.
>
> Use check_add_overflow() to fix this bug.
>
> Fixes: 095bb6e44eb1 ("mtdchar: add MEMREAD ioctl")
> Fixes: 6420ac0af95d ("mtdchar: prevent unbounded allocation in MEMWRITE i=
octl")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: fix the tags.
> RESEND: I sent this last year but it wasn't applied.
> https://lore.kernel.org/all/Z1ax3K3-zSJExPNV@stanley.mountain/

I don't know why, perhaps it got filtered as SPAM, I don't know, but I'm
sorry about that.

I've just "closed" next, so I'll queue this in a fixes PR on top of
v5.18-rc1.

Thanks,
Miqu=C3=A8l
