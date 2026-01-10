Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD4824887E
	for <kernel-janitors@vger.kernel.org>; Sat, 10 Jan 2026 20:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768075952; cv=none; b=bZ+f9Fg4nViwy7WX5Gd0sScG+Gvv3cOHGFpr0GBcvTPwkg40q4eJoLv+i/Y1CtPq8q+FF7cB1ZoMD4EvIUmflpZeg8kFy2t2ET/5sUK3C2Ous24dWPmuhc6zxqXhJy6u1SgnGeD8/GJ24HwTFjUtDPj+gkIMISjGeCGAc91LHuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768075952; c=relaxed/simple;
	bh=gqmDPrBUMH4/Iik7/Uer6th3Sz9nY2P2fa3OEefj3lw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BCWDnbW26eiPXbozVWQwA2eR+l26RJwwtiBCxl+Q7VqVRRNSXF4P+s+H8vRDoKN01wDxVBxvAJYQ4UH3sovCY/2y7voHZb5N6k8ZdRS55aT/AK2uVugzhdCEzvJRvtkNd3UljX7l9BP2AgRdlSi7d1s+9O+LSkhBp5/nvxgEgpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0tycxLm; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0tycxLm"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8018eba13cso859781466b.1
        for <kernel-janitors@vger.kernel.org>; Sat, 10 Jan 2026 12:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768075949; x=1768680749; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gqmDPrBUMH4/Iik7/Uer6th3Sz9nY2P2fa3OEefj3lw=;
        b=X0tycxLmRyDKyXoHkjojbT2v4MzBuslSFxT/ppG9rLB6T+dB2ROAqBvBOXvLtMJDAH
         9lOaoaneTHiiJQGtP7F3cWGBXKBeREw2shKY1Yr5R4HoLUaFCsFtsUFdZL9akvrDIjMN
         X7qbsCMdwIMb4TM/UfGlWB9glOIppSXTLFmOtwyu2VhzCFLE2Z7QYTBgDNWGNtjUSicI
         PlGC5cHxxPT4pXLW6fTLVGp8T9kihWd35gO09nhSkGlJqDxTso1jUKimM05HsVJP5eEz
         hBKHfqNFhSfX8dUd6xA+MHioWHpKfmxnDmDBjFObaRq8cMrzn0mHoobCZ2V9FXWP6yB6
         yYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768075949; x=1768680749;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gqmDPrBUMH4/Iik7/Uer6th3Sz9nY2P2fa3OEefj3lw=;
        b=HG2JrQhGzzoMM3EeS5FIdVm0S8AID3Q17EiieEcRFsApVtDtS/qKqku/MSypMU4uJ4
         HBlYrbhxevlfci1zI6Woyr1LsOT9MfEw7qiuCyqkkgLuqDNuF5p8J+ZCBNUPrq/yeAJo
         8iFzvGEg1VgmaPGWiwTIZmRV3TByvfkYXwBPXnnHcKKsFvtcvIxPsrRuq2mdVCaYsuEc
         pOtA6shIsIJmOruvvinK5HDWNy9+yU5/vSjBaH/baqGr3Ie5jwJLH27JEIwM+r4QX54U
         l/olSTMU0gtd2KIGTcVZZZvBEUubr3nTzxmsFj+jHZzdoWneA3wauGxIb5zQVzMVf2Bk
         BH5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNN5lixT9gItIwwbMkZoU0YMOS8FIoehZVD7O7xBQs1x0xlUwJP1xwgxn7gVM1ufmOfYnWINtsNBbqfSZf2dU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLz7otnpldfjWdRnuvL5TzBKwXU+aREMP6K41HgZBnf+8M+DYE
	QW+3pXW9TRRPW0lxK9SM+SXY72eV6wkjlM0vPOC+ivltboQU3jr6Qozi
X-Gm-Gg: AY/fxX4oBwLJhyItMYk0IvtpC5lx+A7I1/oy1qZTyzxbDz5gHFYH/oUAb95+I62Zutz
	+/l7THjIPXqowsOpBg272gQm8sIo3vlKxwm1NlsiMZWWFEtcju9eiRL5vkf/aJU+Fxeche6PV3n
	Z0OBQGRegjDe2i+qRnbb4aEXwnJYMNF9VMBg8Z+W4g6XyJDY1OTaipAzmgx/aisrIx8ko1vS2ad
	cn73fi/o7tMORofZjvUiiUMb6XQ1LCHkGBPjhMVnPNq3p03kG1PvXFCAD19vXkRDcmKx5X9MJKj
	RzG17pw8kJQkzCyrrbBSDNR/zjtCeZDg5uglo2DOfPOByfcPxa6pQnKDJkRUaawlbZaAsb8GK10
	tAvmBCRHMRW/BhsU8AI834OQMCa8qsi8GUDeAiDR9M1mcH9IEuPl78uvU/ovajqhBbUo+dcW0a9
	t39ssm9KdQwxETAh6qGmmqXs8p0O2b
X-Google-Smtp-Source: AGHT+IEqyXVUoiPOwCm8thcx8YpK6aUWILpHTpo0KAnsDDgdi8HgiHbo0Og3YdF+jqmLDC7wVbzBIg==
X-Received: by 2002:a17:906:d54d:b0:b83:95d7:9d50 with SMTP id a640c23a62f3a-b8445179fc5mr1359399366b.38.1768075948938;
        Sat, 10 Jan 2026 12:12:28 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b84591b6240sm922872866b.10.2026.01.10.12.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 12:12:28 -0800 (PST)
Message-ID: <c4d68a6c862e071d1ecdf3a0d7ba566e8d0e5223.camel@gmail.com>
Subject: Re: [PATCH] ASoC: cs4271: Fix resource leak in cs4271_soc_resume()
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, David Rhodes	
 <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>, Herve
 Codina <herve.codina@bootlin.com>, Pascal Huerst	
 <pascal.huerst@gmail.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org, 
	error27@gmail.com
Date: Sat, 10 Jan 2026 21:12:28 +0100
In-Reply-To: <20260110195337.2522347-1-harshit.m.mogalapalli@oracle.com>
References: <20260110195337.2522347-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thanks for the patch Harshit!

On Sat, 2026-01-10 at 11:53 -0800, Harshit Mogalapalli wrote:
> Smatch detects this resource leak:
>=20
> sound/soc/codecs/cs4271.c:548 cs4271_soc_resume() warn:
> =C2=A0'cs4271->clk' from clk_prepare_enable() not released on lines: 540,=
546.
>=20
> Instead of direct returns, unprepare the clock and disable regulators on
> the error paths.
>=20
> Fixes: cf6bf51b5325 ("ASoC: cs4271: Add support for the external mclk")
> Fixes: 9a397f473657 ("ASoC: cs4271: add regulator consumer support")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> Only compile tested.
> ---
> =C2=A0sound/soc/codecs/cs4271.c | 12 +++++++++---
> =C2=A01 file changed, 9 insertions(+), 3 deletions(-)

--=20
Alexander Sverdlin.
