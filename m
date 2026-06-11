Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E08A1A6806
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2026 07:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781162477; cv=none; b=CqYrhCPXGL6lKk0+OIP6QpCDfDhvcsxDkBPSME2sJ+AMKY27Y0NoD9dCH1CE1ei2BNHzMbFadYmwYrO3/M85PES0a63nBVI9h6fyCEIwQLgQB+qJxgxgNv6T4vdHHFNubtwBzuodJZt/7hOKhk0ur9m57YYTwzKYoprSnKCfBhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781162477; c=relaxed/simple;
	bh=vqXBRCfdJypCWOvjzMy3+kaVRxBBLR15tEPZD8ww7IM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WBfd81Z4XcTvsnndZt5tPyTsPfzciPjKY8L6xYlBBFEfgZuAq5d4SfEdg2v3+YCL80fH7B/6CA0PoZbxSx2rhhv4QP6nn+/2UgVQjjkZbILbSYN/xa19ZZiMZgBpabBVIIsM+hYhYInCWQri6/U/w01GHv/1IWNDCqA5JgYdYWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Yg2mNsza; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Yg2mNsza"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 70F09C49F64;
	Thu, 11 Jun 2026 07:21:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 352DE5FF03;
	Thu, 11 Jun 2026 07:21:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A755106B9E31;
	Thu, 11 Jun 2026 09:21:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781162473; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sx2Lw2VBfVAh5bZFaQYxdt+bBNldzZyEUbKgaWFmh4Y=;
	b=Yg2mNszaQYtR6t73fwlwIAi5MN/X/qea8mGzSZoO4CIn0VdD0BYFOKodl828+oQqvfl0Hf
	do4r3S8Sh6nLJZrb27JTuDZdCwezhLk6sX8eJJp0wie/z3EECGj21/8u4KeZwef8SJLARn
	7t1tXi7rh8E0p89sYOOdxgljsgpl5K2OVTh/kXk669bXnuNkJ959qEmvhqKjKjTKX2f3wq
	zE3m947uyTlFDVI/D8tna7jLG0XBtD8zq0cAKFFS2lzBVaRvweX+TUcbvVjrJqXv640Ctn
	8Ny/dq+RQOwh+ZNeV+GiNUP91xqwYLkQGsfuv4BUN1km5GASvs75EvKdvCZz5Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Kees Cook <kees@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
In-Reply-To: <e3b98bb6-62e3-4370-9050-de48250a0398@web.de>
References: <e3b98bb6-62e3-4370-9050-de48250a0398@web.de>
Subject: Re: [PATCH] mtd: cfi: Use common error handling code in two
 functions
Message-Id: <178116247248.423856.8903595196251166869.b4-ty@bootlin.com>
Date: Thu, 11 Jun 2026 09:21:12 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 10 Jun 2026 09:21:46 +0200, Markus Elfring wrote:
> Use additional labels so that a bit of exception handling can be better
> reused at the end of two function implementations.
> 
> This issue was detected by using the Coccinelle software.
> 
> 

Applied to mtd/next, thanks!

[1/1] mtd: cfi: Use common error handling code in two functions
      commit: cf4ff717af69cfe2dff8ddb843dce36205cb3c40

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

