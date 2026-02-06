Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7AE3F0741;
	Fri,  6 Feb 2026 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770387810; cv=none; b=hApXuwirEfDkhRt8P/IDqgVhJVByTpFL2T+QxABZMPqWVLwJKY22314MXaL+PN2Q+KeUkd5RR8hpinXXLtF6NkAe9q74/ZjnZtNWFL7QPRWe4kwqvywG8a7rOtiXGzYC9362fUk5ljQOowl2vAHYK0+783u4SHiRh+44wus7Qsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770387810; c=relaxed/simple;
	bh=7uPDghwTBP/3J4cygpnpL6PU+nXEOoE1QSbXkAhF6No=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZLZVqTginKxFZF1JbmTkDKNi0mxudW2RddCu6lIv8jVE5Un2AiMlX+HFA8V9+XfZjh7kRF2iedZh5Aizrhde3t+GwSG/0KdZnfo7QkeO0kQzu/SaNlmAlJz6a2dbkzO7gjCsPyCLf76OV1wj+YoWH6c8BO1CNHigDvM/CB+PW0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=P3dgunVn; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="P3dgunVn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 145371A2C58;
	Fri,  6 Feb 2026 14:23:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D807160729;
	Fri,  6 Feb 2026 14:23:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D609119D1DE9;
	Fri,  6 Feb 2026 15:23:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770387807; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9jrDE1DTQqQcWQVv/UJz6FvrSFyNgWp1ariYMe2medo=;
	b=P3dgunVntf0AU6iE5wBEXjkSHu7GtBfFrSuBrqGHVcBwfl80Y90ZUVZQSsSpB+8z56haqZ
	0RpbCh0zokGLzqqifhv6J5IbFd+y0GxWAfaq9ST0Cqas2irU9mySKEG4QUIIk0bKnSl2ON
	vlB1lB8E9VriN/xh+1cAdyO4wRTWoMLFzU+DwLlCINeWLLp1CC4C6AvSgcE2f24C1IZ0le
	Ig0K+AlX7B5FBqJvT3PHx0u+4wWWb4RtfMKeC0b1446S2sj2TP/kB1StmOYxn5S+Ia1fXG
	BGlri5plfKZvTwyL9JGoBg6ZAv5gp/UzhhQNlfDjUth8vX+WmaqSTt/03wyMyg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <aYXu7uqMQdZRMmQF@stanley.mountain>
References: <aYXu7uqMQdZRMmQF@stanley.mountain>
Subject: Re: [PATCH next] mtd: spi-nor: hisi-sfc: fix refcounting bug in
 hisi_spi_nor_register_all()
Message-Id: <177038780444.1194483.7825758239559320500.b4-ty@bootlin.com>
Date: Fri, 06 Feb 2026 15:23:24 +0100
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

On Fri, 06 Feb 2026 16:38:54 +0300, Dan Carpenter wrote:
> This was converted to a _scoped() loop but this of_node_put() was
> accidentally left behind which is a double free.
> 
> 

Applied to nand/next, thanks!

[1/1] mtd: spi-nor: hisi-sfc: fix refcounting bug in hisi_spi_nor_register_all()
      commit: 6c7860aa28b81b7e909b8d2072ed76fa22db6eda

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

