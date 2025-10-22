Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663AA298CDE
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 09:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761127016; cv=none; b=naWxIjIh5xCpMowykcDBu7BpwgEl6SOjHkmQrgwNiN22ie586vn9XEuDrssMh4yyEyywrlySN0C+WTgEBS1Uq3RpUHqQvNQvySZc10yuFGDI/wPEv3WNFyII3iHMYHDA5ogZ/r3KiS3HTUBgvqaBq0ByBW2i8vuveclechO5Kdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761127016; c=relaxed/simple;
	bh=YlVeq68YvgrRSwKBIIf0HCrGHeLXi8dyIqJ/PjZP9Mg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ncPz/oPeVi9acOg4TLXAYQgPOB6bpWCQFmijWx1u3msYCW//c4gk+CyaKEL5Uf6eeDxuP1W4djJiMn2sP92J/6gtA55TkepKtyf1yK/2kAaqeSIh1dOgo2A8IJm3Yj9ER3TOsI2uZOCk/i/d6pc6vdItYx0TcaLxHKOEjuYe4oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EClQ6rS2; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EClQ6rS2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C8C49C0B8B2;
	Wed, 22 Oct 2025 09:56:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 81543606DC;
	Wed, 22 Oct 2025 09:56:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD497102F242A;
	Wed, 22 Oct 2025 11:56:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761127011; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PtUVlEJ95DFrLMp1kRswERQY+ixJI6wZGrq1K1yw3ck=;
	b=EClQ6rS26/rnP/zhUZKi0h9SDoA5ZzfeiYjG2Umwvn3r2OlW98nK5bomlonaRmsXwAJOEE
	fV8TjWbPOuc2wvZlJjqZ5ZlK7a8Y8LCI+SHCRjB/Tu+6hdPD1ozA2C1t4ZS5U6bb9dQDJF
	6RUG0vSc6rp2JaZQC2pqrXLIjaBG0t9SSDaI89F3YxNZ1DPl0vKmZPGu7jaK+L15O/Epeh
	2FXFzStLOhs43muKwx3rg1u5A2clefITADHkb3XmdFlsaXqn4Puif2LjiXQCobAm8Ey8gE
	dP+LRRR7aBGunuiUKETHmqDvjtwC2Zu71daYnppwJ+vPwTe52p3Cm+o/l9Tzpg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <aNvN4kfJ2ROB353Q@stanley.mountain>
References: <aNvN4kfJ2ROB353Q@stanley.mountain>
Subject: Re: [PATCH v2 resend] mtdchar: fix integer overflow in read/write
 ioctls
Message-Id: <176112699838.140484.7478020068192325576.b4-ty@bootlin.com>
Date: Wed, 22 Oct 2025 11:56:38 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 30 Sep 2025 15:32:34 +0300, Dan Carpenter wrote:
> The "req.start" and "req.len" variables are u64 values that come from the
> user at the start of the function.  We mask away the high 32 bits of
> "req.len" so that's capped at U32_MAX but the "req.start" variable can go
> up to U64_MAX which means that the addition can still integer overflow.
> 
> Use check_add_overflow() to fix this bug.
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtdchar: fix integer overflow in read/write ioctls
      commit: e4185bed738da755b191aa3f2e16e8b48450e1b8

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

