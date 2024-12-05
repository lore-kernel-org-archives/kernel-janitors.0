Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A101D90B6;
	Thu,  5 Dec 2024 10:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733395565; cv=none; b=pM6y+N5YPedaiJH5wax6WiM4eitecOU5ZYudAS0PgEvne3ggQzVCXLn7/5DulfKQTK+L8k0zo1B80MIH5QyCxulYhoIH3w8DS9Z4/XVOzUqfLmcOFnp6PQtholgwoFZPcKAxSx5ui1pK81kB6cOTgbFxKxB4LBn30MpRuKWbGh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733395565; c=relaxed/simple;
	bh=43b7I4kQsknjD4ld4O30WPxbQGPMHVX8puNe04UAIWo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=e/9DUygN+W2kzrYkxYJ6XKXTUUs+QGwgVMFxCE7xPCrxooUwbb5qFNEWTcka3klMLwp3tIPPZ58g4jdf4CrrM2ptwaHKI7TwHEgDB4rnJL4y01BG2PGr39yHPTFUgoP8Vcki8Td/eKobrvQPCgxx8n/RQqa8FgEVC0KxMG/nBQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=musTL+Ec; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="musTL+Ec"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2829B1C0003;
	Thu,  5 Dec 2024 10:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733395561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43b7I4kQsknjD4ld4O30WPxbQGPMHVX8puNe04UAIWo=;
	b=musTL+Ec2if8OtaFPKkJH2oemx0s1FPABUayqxGICgAa1n5rj+bxig3+ckUVmlv2aDVyC+
	hlpTM3zNMMAGXkgG3AKCQVTTdowh30zbjW9Gv7M6ndR4b0yq0U2z1sXU0Y2N0esZWZcNxj
	zT7veplfV6PFoeARhM7LBhtQ3sbIjZQj09Xbo2iwEOTjeYllXCQiWyuVn4JMhNHfwL61vW
	R4HxFsm1VYpoy/P9xX9MRbmh8+fBCdXuKD91aqUQ+UyILcCVqYJO99V4MhUjSTMCYAlL4P
	DpOOie8T9g3Bcvq2O2zk2wHsE+FCxmXZS9UvlIHKMONFG8dZdIep3/qFcLcXZw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Joern Engel <joern@lazybastard.org>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  kernel-janitors@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] mtd: phram: only call platform_driver_unregister
 if phram_setup fails
In-Reply-To: <20241030172149.3101873-1-colin.i.king@gmail.com> (Colin Ian
	King's message of "Wed, 30 Oct 2024 17:21:49 +0000")
References: <20241030172149.3101873-1-colin.i.king@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 05 Dec 2024 11:46:00 +0100
Message-ID: <87frn2v253.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi,

On 30/10/2024 at 17:21:49 GMT, Colin Ian King <colin.i.king@gmail.com> wrot=
e:

> The check on ret and call to platform_driver_unregister is only required
> in the code path where MODULE is not defined. Fix this by moving this
> code into the relevant place after the call to phram_setup.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied to mtd/next.

Thanks,
Miqu=C3=A8l
