Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAF230FF31
	for <kernel-janitors@vger.kernel.org>; Mon, 12 Jan 2026 07:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768202691; cv=none; b=eVOpko3iDs21i7JRfhfui7BglxKus0Mj4GpLfRYU7I9nqHcDhj38BEKCYyQc4uLvvKuVilIx46WqfjUPheAqvvcgAGnRzmS3lEYtEVj9Wc3Rm4wZyyXPtF5lvy0cZMCQcm9ttO69scENMeI7Mb/mR5NFK440dOQvZwFOMgmklUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768202691; c=relaxed/simple;
	bh=9tlhCdCYVu5QWaCuM0wOL8zacP0JqJxQvvA1bG9Cc/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iVix7NCUl9srkIvXquSOnnVLBpYbDfdqzYvFewnX2c7Z3dpTg8HgZSLM//DdNWB7WkK1gQcD4KTA4+90i4nNytCdlyKE92oeip3S3SNF+xdoIhAL0KALY559zF1N8e++L4HP8L0Z4dncceOmhE29iZEwcCki6b5HA1oS7wBB+zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OBJZh/uY; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OBJZh/uY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5800AC20863;
	Mon, 12 Jan 2026 07:24:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A669460732;
	Mon, 12 Jan 2026 07:24:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B350103C8A36;
	Mon, 12 Jan 2026 08:24:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768202679; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FY9z1ViXRGL8NRS6aDM6FbnajNH8rfWmspe7HS29IS4=;
	b=OBJZh/uYNC88jYGHKuw3M/YFNh5LmEy0f9zRtphvE8yj8VO4u8A5lC3D8josVVnYSDkjZX
	J6eQsvj4xzkmG9Ow0dLbeok7luL3OyyxHCC0gaQq+Rkx3veoIZqBAHsCdmkCaqYSR0DGNk
	aSwnFW6bb/sU6at321AV/jRy/YgxDKt1HNy/gJrJPCBZCVBGC5LhDVk/s6vcKmMbEOQM+v
	zTBTnur7gbJus6VAQ4eWoCzvxj3GUOxXArw5yBf/h6lLW0L+TWh+LJXi2xp9MWQ1PuljtH
	SVp0/c2q6MYwJGMAE0rhUp/4AKrtF5IixVdi16A+h4ZJVld6QCvecI5bSe3yIQ==
Date: Mon, 12 Jan 2026 08:24:33 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, Pascal
 Huerst <pascal.huerst@gmail.com>, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com
Subject: Re: [PATCH] ASoC: cs4271: Fix resource leak in cs4271_soc_resume()
Message-ID: <20260112082433.26175236@bootlin.com>
In-Reply-To: <20260110195337.2522347-1-harshit.m.mogalapalli@oracle.com>
References: <20260110195337.2522347-1-harshit.m.mogalapalli@oracle.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Harshit,

On Sat, 10 Jan 2026 11:53:36 -0800
Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com> wrote:

> Smatch detects this resource leak:
> 
> sound/soc/codecs/cs4271.c:548 cs4271_soc_resume() warn:
>  'cs4271->clk' from clk_prepare_enable() not released on lines: 540,546.
> 
> Instead of direct returns, unprepare the clock and disable regulators on
> the error paths.
> 
> Fixes: cf6bf51b5325 ("ASoC: cs4271: Add support for the external mclk")
> Fixes: 9a397f473657 ("ASoC: cs4271: add regulator consumer support")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> Only compile tested.
> ---
>  sound/soc/codecs/cs4271.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 

Thanks for the modification.

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
