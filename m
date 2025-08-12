Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B083314A60F
	for <kernel-janitors@vger.kernel.org>; Tue, 12 Aug 2025 08:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754986725; cv=none; b=eCvuaiz6LfKtrcsY12GMz2qC2yzHHVDpIXn8ugiLJPylfscBWnKIaAydzZCVAq1Aq0XzCQFkb/kPsr4pYsifnYJMaPC6AzBmrm+Yx12EXDwXbhM9+yzWJU0Xu0FNbpftZaKq9qSvgbtNKsu5d6UTrjLrVTyR7lBKDEzVLVoEYE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754986725; c=relaxed/simple;
	bh=neZ/vqHeDssNB9UqqyaDghlL5EhlgwrWjfSDuIFVMEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ntt2guS8MUIGVuCA6tdlDl9VMnB8gwJovqhDiagqQF8wS64ZESHOPktb5lxPAsJIluX8NuYCUyKCLxaLAtSxsxLXaJj20l8hTZ7dZHWfeVw/9aufsNfsDcIeOFWuOQgijP4ZYLGp0J/IxhujIj9vOzCfKoSZ6WNaVD14i24qqbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=emf3/dML; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="emf3/dML"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-458bf6d69e4so47533695e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Aug 2025 01:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754986722; x=1755591522; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1dFZVTGwXUDluCsSFx8fL6z8SdCWjGvQ8onjZgK6EXY=;
        b=emf3/dMLbZxRXr8RgIcRzhKBH9vAasdLOVEKKirkXLPkm3zAh7AoTVGDKXF6TlkSZg
         o03WDByRTePn1zKWCU71nRXGEmGn299EhluBdbc+3j8pAxVYOoRgZfJYoJ+8WgLTe9l0
         4X3q7efXVJoTXXjpXMhW8zGXGAY94GaLW9tFHepYFApl63E04vTDbU4Q+ePV5qvp11L8
         IT6sV4nlEAl7cca5+txWNHySmu6Eq8SuBIDuRmURKoaajj2Somn/qQyK2ysg65rrAXkJ
         4+PrSnNvQSYyNic8+SIAG6FdlecLuEWB+ubSX05zi+Zxms6raNZrAm9Hjyp9GX9X4rZ1
         7dEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754986722; x=1755591522;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1dFZVTGwXUDluCsSFx8fL6z8SdCWjGvQ8onjZgK6EXY=;
        b=CadZYsECBmS3Kc4kGyhq56rBh2KQ6yLwmQbz0HLXElpSVEIaQnccPV4LEO3piW4ZVd
         uVru4Uz7h5cMhbfOaXQP+6AnLVtNGCR29GPyOmuDPNkLPWuuz9RZAK7I/Xsitcjh2YSD
         khTssVO44CyiN/uT6C70Euwg4b10plP8LK119CIb6uQQ08dUiPmxCW/VmGYMC2LEWqpz
         R7I0+0MPL9M0Lla4u7lfi+qA24Uo+vW2VGbTdHlC1Oc7MBlSrzdgNq1/ZNrjfVVLAv0D
         YuXKffjufPhOQITzID4CLXRPwiBui4TeSaAXX7vRwbnrCL2PqyUJwQQ4CDdhLMyfle2o
         TXjg==
X-Forwarded-Encrypted: i=1; AJvYcCUXJP6P46UK47ivIZnQwc0pihpnql9TtnwzTGCHFQE2aptDWXOQ0PunMz79Dk7gIuRsZPJGZZuzt9HXBEt9C+s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9sor7EPC9ZqGqvXlUUVyMvJQKsnB0rqkdJhGFwT31rInPK+UH
	TiG/iRAu5K3tQr0urLvUM+lgYRNmueWr2Es7Rk+FWmGX8Wlsph67qsUq+PfAmTmPIw7y9bLOF/w
	/WGYA
X-Gm-Gg: ASbGncvbTPiauvP5CuR3hscwIQ7LVoSwvPXwPWWJOsTU3duSxcHtKE3E9amYKHgY1wa
	bIK/dspIqxpY0/jd54aJausLmDfGFD5v/PLslF+UxbhBudr+gCaNsmGg0l0P7+Y1glgtxGGA8bg
	Blcoj/f8xS1H2C8Bil1HTvn7xSc/chKVjG2kTIyBm+W39gvXKk7X26aUzHZGdTPYKsBPwkvNtKw
	ooY7sEZXfncHM84Hmj3cqE8NhrO87A8SyXxisZCkbnjcqamgFwE0wZZFkRIx7A3idh8EpnALaPN
	OfaGAMjlH9cZKTORbKpW3mfQ+mGfdFsDs1Pgc3Gtnn8unesXFxy7XNXkSk9p3c37AmaiApnu4Mx
	WnZjBMe1scGKnoD9G1x7QHVSh9q6F74NuWXIZ6A==
X-Google-Smtp-Source: AGHT+IHN1f3Uj/iD0rR/P0kz0n+e4uJ5LS80ahPGJ2u5rWUrfdqpbvNFxOh7h6qh7RHLWO6E++a52A==
X-Received: by 2002:a05:600c:3b10:b0:458:bf9c:274f with SMTP id 5b1f17b1804b1-459f4facbd3mr123467115e9.29.1754986721942;
        Tue, 12 Aug 2025 01:18:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459e5868fd7sm306386425e9.18.2025.08.12.01.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:18:41 -0700 (PDT)
Date: Tue, 12 Aug 2025 11:18:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Scott Guo <scott_gzh@163.com>
Cc: Markus Elfring <Markus.Elfring@web.de>,
	Scott Guo <scottzhguo@tencent.com>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] squashfs: Avoid mem leak in squashfs_fill_super
Message-ID: <aJr43n1np2nB8bht@stanley.mountain>
References: <20250811061921.3807353-1-scott_gzh@163.com>
 <24759bdb-b427-47a7-b9c3-724a11d0162e@web.de>
 <461ae944-5fb9-4860-81c1-1ac48c3d888f@163.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <461ae944-5fb9-4860-81c1-1ac48c3d888f@163.com>

On Tue, Aug 12, 2025 at 10:11:21AM +0800, Scott Guo wrote:
> > 
> > By the way:
> > I propose to refine the goto chain by using additional labels like “e_inval” and “e_nomem”
> > so that another bit of exception handling code can be shared at the end
> > of this function implementation.
> > https://elixir.bootlin.com/linux/v6.16/source/fs/squashfs/super.c#L434-L466
> Will have a look into that, but maybe fix the current issue first.>

Please, don't introduce more of those e_inval, e_nomem labels.

regards,
dan carpenter
