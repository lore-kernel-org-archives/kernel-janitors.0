Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD69379EF0;
	Tue,  2 Jun 2026 20:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780432598; cv=none; b=Ce5fYDdgVaHJGyHw1+zkinWTyk4xzKYYKgvSy7hAydiEZEG7c25tHOnmU7iuIJIMKq9G+p1GDfYu+lI/bYRqW7wdoPo8gnhIZA7vznTLdLsK5V1XPbPd6mrQZf9j9DhyZAPGd0KrN9zfhmBqyu9YGu4i57ZFsllnCsY2KE4+5dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780432598; c=relaxed/simple;
	bh=dtpktG00PU6UaPXXfICg86MWQbDAfVnwa0v0akUfUWU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=G57AYtLgjYFDG2wJITu3pcdMW7teBVzZmrqrJqtR0FEuCkXlV0ycQepIxSvNRDoxTS1WXj1+6v+vOAZbBPvOQlj4sf3FEY38OTk6XlEiO0utFJn7Bq5rst0Nca5NbCZhmdckW3y87shjhwopQybPXKnpYWcZ0RrM+WoHRm0Ihnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loKi+wwq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loKi+wwq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81DD1F00893;
	Tue,  2 Jun 2026 20:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780432597;
	bh=xjAReXlwt50uzbRM3Cf/ibHPun0CriJpzEHnpmkY5Co=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=loKi+wwqWXbqNUGCXO1UCXbzDb7q15pIHtUaGwBtTh/r/xOtB9KmLK8sKwm0AWHWZ
	 mvstHaRMZ5SWEkyzmOT5yWZ0FCimEt4T1d0D3F7w8ctrNP4Sfmdb1KYd5x0+Do/Qoe
	 CMfALkCijT4hWebkTgFJje3zgP94wjn8ObRsGMc577msrpTA4WibQo/V6YepQkcxoS
	 G5VNP/YdQCUrpIAUECW0HxDIJabE9IoLcf6Ddmn1g25zlQTfNwot9YAcQ/VDEbXbBf
	 1zBB3F1VKxOn0CPrOevZ5qPaIK5WlD8/htJeCwLjGOiHThi+4wd3NXuM+xrw/l32hQ
	 8acDn1Apr0ZNw==
From: Thomas Gleixner <tglx@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v2 0/7] Initial steps to constify irq_chip
In-Reply-To: <cover.1780343698.git.christophe.jaillet@wanadoo.fr>
References: <cover.1780343698.git.christophe.jaillet@wanadoo.fr>
Date: Tue, 02 Jun 2026 22:36:34 +0200
Message-ID: <87v7c07k8d.ffs@fw13>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Christophe!

On Mon, Jun 01 2026 at 22:19, Christophe JAILLET wrote:
> This has been 95% build-tested on x86.
> So it is likely that some corner cases will be spotted by build-bots
> on other architectures.
> Sorry about that, but I don't have enough cycles on my personnal
> machine to cross-build the serie on different architecture.

I've applied it to my devel tree, so the robots can chew on it.

    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/constify

If there is fallout you should get a nice mail from them.

Thanks,

        tglx
