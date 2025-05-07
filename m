Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B88F25A2AD
	for <kernel-janitors@vger.kernel.org>; Wed,  7 May 2025 17:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638452; cv=none; b=gYLA6qhwMc5YoVuL6xhePMX2aXVWKCaSRordVEWvpLPTITzAMb6JatyKqXgTSdagrtNcigQgaGrLJvhTAxCShICoUKHbjVl5xKUpSXEFzeFygr5n8tsDuW4a2nBYAOxaCv+HdKtrCzUzYIt16uDYnzxKcBqvfTIz0ffKNpRJSZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638452; c=relaxed/simple;
	bh=EK2I+PIDSegdPp//dTcXMle/m2bG3MDkkTJ0GRpOWaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFlamg8KG17LoUCH9BM3AEOVVuZt4/yQmvJSwj525mhDu5XI+WFOB8I2BEgvIKb2lxZXcou3W/Dk1+wfjve8mJMyLlew+l0P5tw4f38zwdpL5w6/AhGee+dgkPWH1SJYXFbHNjC+oCprleV94RCXc+NQwGwfIAMTkztjUa34TlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dCN7Koml; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dCN7Koml"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfe574976so921745e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 07 May 2025 10:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746638447; x=1747243247; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZIDIc+98VT1uzADSEdsyAT7FWEyMDLAchzu3TvkXi1A=;
        b=dCN7KomlMk1JGtp7bNKag2Q1HMu+y0S+xgl89Ts5SdoDRZNhhIsG2UikAKzcDaIymj
         5jvMg/fRpn+jelkx6/O+6bdStDOdfu9WXJi/Qm0HOFKyziH39pdOurqRAk1I3dc2VTbL
         VsZ6ckyj/jIduAL3tqBZvilEzrvhDbBB4qpQ09yjpk58YONvXhtwPAqgVCBRFOsnxpX+
         vqakyph3cDOplhr54dzysiICn2SQuBsDhOO7SmSa6l41Uy6I4QjYBy327xvHtp1prU3i
         NVaoAASPyeHVIkL9XsellWgqmzJdzx8rTPHtSMaxbrlnlKViY1469qSvyg4iYQR5RT7z
         J+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746638447; x=1747243247;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIDIc+98VT1uzADSEdsyAT7FWEyMDLAchzu3TvkXi1A=;
        b=g5cuoWoP08qbyAZXlSrYEHR+aWgaWhxh/dUbkBTngfB4kBxI1lpzqOaoOozkTjhqwy
         kxuq8EZp/EZAU8agmvfzDqHvikLJZBvlMCMtRr0wMxE2d0YoInLyLJsLVfaYWi+sa86U
         iXYFgU2G9hdPcU2/BTQz2BtO6RoCOjX0PKmXxSlktgCcikU7au38ivmqUWt+3rVAn8UP
         e+UyPrqPx5yvqerkvfyBV8RMQ9lLnKGU9j28jDGdIQ/1S278CClDAGifSBw1DZVuHirH
         xKkSOG4FpM0KkpyGbB3pkv3xujZJpSNgpbVQ3DEZSYK9xz/HABa5nLcwEiddR9RLe06o
         02Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWlyIMCs83FbqeSjlZUEQPQdRJIx5+XHNNS3TodABNIshW6KgJ8vZ+M1LkkSbS+GuLVcOAFp+8+V2MY+WF/mSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDeXX/U27EQd15JV3mYj+7nKrtNeo/9JUE1ece88FlSVQk+/Ru
	rT0DeXwqWngDhGQbDbDmEQJ2AUu3otQvPHMzQHJ+wdz6pT1PNycBCgFsFgsfyfA=
X-Gm-Gg: ASbGnctxaRzWAKm0Vtfbm04K6lPx0hQ4XUd65VzIm9UjaWci1WONoLF9ddsWeFC5NF/
	ZuF7OY99h1TxdxVfDzzAqcVCKp6U8Fe4bLB3R3mEfdwMmxQriedfF9xIME158mIKuB98UnOMVg6
	/c6TyC5cCYXi7VIBmiwctU6KTW+JYG/wSpooKONYUe2joupCA6PUXUYIHNWE0alxh00tbi43WEI
	EPRiQmXxQ9JKZKQf1M/dVr0MeGnhGloK2qI5PxXDkzELu81xv93vOclQ3YyZJM/BWs0lO+4TZfl
	pXJ6DEgmTCVD0EdRv/BTjUB7EKXSo5Pi2S7qqhFEzRVX2Q==
X-Google-Smtp-Source: AGHT+IEgJ+zhZsE37EffQPRp8AYlsaRDot3L3dV0W/8v18j/U3bL8+1nDlYSIXsP5Wo9mJZnrHE3Fw==
X-Received: by 2002:a05:600c:a413:b0:43d:49eb:963f with SMTP id 5b1f17b1804b1-441d44dd4a6mr34168545e9.24.1746638447619;
        Wed, 07 May 2025 10:20:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd350d96sm7383635e9.18.2025.05.07.10.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 10:20:47 -0700 (PDT)
Date: Wed, 7 May 2025 20:20:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] regulator: tps65219: Fix erorr codes in probe()
Message-ID: <aBuWbImT1jgm2QTt@stanley.mountain>
References: <aBtZHEkgYGK33fWk@stanley.mountain>
 <43f5dfb3-ea3a-4f1d-b3bd-9e62f976b651@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43f5dfb3-ea3a-4f1d-b3bd-9e62f976b651@wanadoo.fr>

On Wed, May 07, 2025 at 07:17:25PM +0200, Christophe JAILLET wrote:
> Le 07/05/2025 à 14:59, Dan Carpenter a écrit :
> > There is a copy and paste error and we accidentally use "PTR_ERR(rdev)"
> > instead of "error".  The "rdev" pointer is valid at this point so the
> > existing code returns a positive value instead of instead of a negative
> > error code.
> > 
> > Fixes: 38c9f98db20a ("regulator: tps65219: Add support for TPS65215 Regulator IRQs")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   drivers/regulator/tps65219-regulator.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Hi,
> 
> > 
> > diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
> > index b16b300d7f45..f5cd8e33e518 100644
> > --- a/drivers/regulator/tps65219-regulator.c
> > +++ b/drivers/regulator/tps65219-regulator.c
> > @@ -454,7 +454,7 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
> >   						  irq_type->irq_name,
> >   						  &irq_data[i]);
> >   		if (error)
> > -			return dev_err_probe(tps->dev, PTR_ERR(rdev),
> > +			return dev_err_probe(tps->dev, error,
> >   					     "Failed to request %s IRQ %d: %d\n",
> >   					     irq_type->irq_name, irq, error);
> 
> and error can also be removed in the message as well, with the corresponding
> %d.
> 

Good point.  Also I spelled "error" wrong in the subject.

regards,
dan carpenter

