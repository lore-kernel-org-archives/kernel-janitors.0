Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE5831691F
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 09:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761127022; cv=none; b=ECtL8C4geiSxzmVfFJCaw+gl0hTdfuh5MjurIxC4pctZbxK6igUzIhdZDYT2OwqQb/fR6jkMghnK64edkYH35t6qxbOmzx0+0qh2rfxQ2ObxgqavKFvz92Io30xjEgKbE0NNr062dJoJ6Ablx8C1PF/3AvGE6pFrh0EsiaoUn5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761127022; c=relaxed/simple;
	bh=Nd3PmKiLo4YsxhtbPzU82+Lnc9NT+hLHce1Hb98tGKU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D7Se538t9toVcuAj4X/eFlb4xYYxWBO6h3UXTNn9ERWRPK/FmcEzF9pBQtIyHvBgjzkKBKqtOyFvpUoXVS3BRoEXB620JJBijNGzynFfEsJDtKi0R4UsuMOk2kPWFk0l++g+gYllvSpgsp6P3rAwqbTJkvppvDHzMoj0bk06+PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qD9PO6nK; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qD9PO6nK"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B37934E41270;
	Wed, 22 Oct 2025 09:56:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A09B606DC;
	Wed, 22 Oct 2025 09:56:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7905D102F2393;
	Wed, 22 Oct 2025 11:56:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761127017; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+Mtx1L8tYK7+JW04tAce2FfiuUr+6sR6Y/hOzxnnM4o=;
	b=qD9PO6nKPXkIG3JFkpn2ANISk0CRHDMNKe+/OUUs0Yfa07JuzreWnum/bRJhgkfa7zTlJn
	5cEDXcBFXFKboaOhOzCKk77rfRhgz5Kfbdlb+X+o0QhsexkPwwBtLV93m8Gb3ZtE8maCTp
	0NhGLq4Sy5nUFL7HM7G7i+tngma6yx9hnEO8QQq84mJLZnbLbNXb5QJ6HPgXd4ZJ7kUQ02
	sS1oO0PDGrFo0nWPWiAV8vcqferkWkFVPQYaXilvvfrM5rjbes2NmhJZIuPKXwzJzYLUKD
	N6VCumi8BNz8t/sFbCpmIff2QL8X+evXncirp75u5lZpGh5vbF8llH+Ysq8YVw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Markus Stockhausen <markus.stockhausen@gmx.de>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <aN-XoqpP2Jz75pjj@stanley.mountain>
References: <aN-XoqpP2Jz75pjj@stanley.mountain>
Subject: Re: [PATCH next] mtd: nand: realtek-ecc: Fix a IS_ERR() vs NULL
 bug in probe
Message-Id: <176112701142.140484.4160274079611139729.b4-ty@bootlin.com>
Date: Wed, 22 Oct 2025 11:56:51 +0200
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

On Fri, 03 Oct 2025 12:30:10 +0300, Dan Carpenter wrote:
> The dma_alloc_noncoherent() function doesn't return error pointers, it
> returns NULL on error.  Fix the error checking to match.
> 
> 

Applied to mtd/fixes, thanks!

[1/1] mtd: nand: realtek-ecc: Fix a IS_ERR() vs NULL bug in probe
      commit: 9225f02ff201837e1443076f37a3c008140d1835

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

