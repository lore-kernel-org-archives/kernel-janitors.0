Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275862848B2
	for <kernel-janitors@vger.kernel.org>; Mon,  5 Jan 2026 09:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767606828; cv=none; b=sBa0Ct9r2q20p6qGTjWpFAtxHAYWZ0ZqdBEwHsf94PuHftF7gE1rg0CtOPRH9LsJRKDBauEU8G9Duo/dpnNUsREVPgG/ivy/vQ3qqh3C0AAtT/b5orWLddIPE29zpqORDkjANmQ0TMP1CL0sZRb++H/aiWRHoSrgTC0+knyab7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767606828; c=relaxed/simple;
	bh=JYCjSlwgfps6QXKtpDHggwUF1W61UlyY/X3NFqWnja4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUXy3zpOTMg4ndJRpKMErCN6VzZayuaSq6iu1E3xweQYNMapZ6dViTgRTtxjgPE2rvZZkisnqb4GUBpfqF3yVHx/WshgMMwbHZAwih/y28rmP9IPdgiPSO2zbmdV++tbQt1qi4o0ofRo6S21eqWiFtQmFXMFSMDRRD9Yi4+P1K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dZAcJ0Xi; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dZAcJ0Xi"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so103536515e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 05 Jan 2026 01:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767606824; x=1768211624; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CpKgGSJ+75221h6VW5t4CNe4ZqtY9MVAIQyQca2c7b0=;
        b=dZAcJ0XijEWhAhHRBc+ptrpKijEbUiG8pQuLzZM0bzQI08MtcWbdx2Q9M0yOf+W/8G
         0CnQ0bmCsQc1jUjoelEMvIYUzHFatEgZvhM5HqlYDaWNk6mg+E7k2wlPK0S+TL/SPNVf
         Tj7x/0kUqXbdl6WgO3n1px8Dg9PeJWdXb1f0PyqaF5ROhn1NJeQabB9f/eZnTi15ZHET
         Y4BP4VnEr/9j3jFZUNdnCFeg2mqs3ifRja8pY8ba3IQXlCLYjtW8oQcJflSuJgzmwMCw
         owR9N33hZI4f2FjFIsWtYmbw5nqkTrBq2g9KPsYc7G2KkqF1pka4wsmEhopXc0++eLBW
         T2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767606824; x=1768211624;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CpKgGSJ+75221h6VW5t4CNe4ZqtY9MVAIQyQca2c7b0=;
        b=UUkPF11C4NC3+o6JKyTlRTjpgg9TE9vBGNQd5iI2XHPZgjNzMd9lgZLOO//ccmAt1h
         GS7U4BjRodn+KQmZQQNPw4ntGNFSJHqnWEmCLb9n2jgiMuAnYyARw+FO2s06JNOvU5vr
         oTy+JILkpQFns0OZDuX05VQ2IU6rRaJtted/6Tn8YWEcE8TYfP6LdE/sUjeTawX6a/Yy
         kWAqAszU0vzx2Ue49QOdmmxusdiN3zJwEG81EJaEXe1ywdTtKoujp3fM9OBmilyFs2ef
         vIDCco/mr2l1KcOG1DBle4a4OXokCZr4un8XYT4Z2k1yLFcLRzZxGKTUQMzoNUD3630q
         LvqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/GLNR3V0Qz+/PSDFVKzx5qKMbpzL2KvIpQf87eO71wG7oJ6p/l6wrzi9j14nRBFjUWZz7GiEegqGK6MK/oOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQRoeDCO/n4UtlZlfcv7stOQBpPlydPdpIk6Dod0+5gqoNbq4g
	Fuacvwx+u7P3e0S/7rSkGaKFDXx+Tyaz780sZFfqTuFMJ1F6y8Covh/ju6dKY+qccYwCSi4lXNc
	0zRwg
X-Gm-Gg: AY/fxX6Bc51bg0BELaEtcjLLRNIzXFWi3tXYniVTfJQzZyPOjECaAzbvL3l8Jacrt/S
	MB7v0EECZhmWtlp8GQ4PiJFhjipIBOFYDrlutcn6i6EwCcUjYIHTkHuUbs/6um/9FY2xlZ37Hpr
	wU8tQYphrlOx7eKrAp49rxeeN9HDtrR3L6i0Z32HNL6qKNAh/EQ7AOLxQooJvlBryIBXgDBWBI7
	JPeVISf6qkuAhv4frjTzBlYAUI+jay2Xin+LHXa3IiVV1OFGMZxHIQQA/lIgf0Tjdx6J2GYvNGj
	IpRt53UbgGvuClsCSJMOTyPvv7eoBt33kM+4IJmdw2mS/5GE68/Sq/n9WNm8if8EkEFJDmcOTXN
	66LjoKoS+0GKWvBU1P8635Bg3CdI2rgFi4DgWBo6AfZPMx61iMx6Y+LdeJEjr/oJVdevvBO6iB+
	1X+isHvH5/m/fEb8RU
X-Google-Smtp-Source: AGHT+IHXrwODx43asw4XDeLwpdA69n/5YpE0Rwx18F/hMfT02cBwBEbmvIVlCR9Igb4Sdc+Zx1GaSw==
X-Received: by 2002:a05:600c:3555:b0:47d:649b:5c48 with SMTP id 5b1f17b1804b1-47d649b5d5bmr189572735e9.36.1767606824441;
        Mon, 05 Jan 2026 01:53:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6be5a555sm56806025e9.4.2026.01.05.01.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:53:44 -0800 (PST)
Date: Mon, 5 Jan 2026 12:53:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zilin Guan <zilin@seu.edu.cn>
Cc: markus.elfring@web.de, James.Bottomley@hansenpartnership.com,
	jianhao.xu@seu.edu.cn, justin.tee@broadcom.com,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
	paul.ely@broadcom.com
Subject: Re: [PATCH 1/3] scsi: lpfc: Fix memory leak in
 lpfc_config_port_post()
Message-ID: <aVuKJPNjNyt3_yEV@stanley.mountain>
References: <149a576a-6a21-48c6-b121-b20c6173f7cb@web.de>
 <20251230062008.1021449-1-zilin@seu.edu.cn>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251230062008.1021449-1-zilin@seu.edu.cn>

On Tue, Dec 30, 2025 at 06:20:08AM +0000, Zilin Guan wrote:
> On Mon, Dec 29, 2025 at 10:09:04AM +0100, Markus Elfring wrote:
> > …
> > > Fix this by adding mempool_free() in the error path.
> > 
> > Please avoid duplicate source code here.
> > https://elixir.bootlin.com/linux/v6.19-rc2/source/drivers/scsi/lpfc/lpfc_init.c#L563-L564
> 
> Thanks for pointing this out. I will use a goto label to unify the error 
> handling logic and avoid code duplication in v2.
> 
> > See also:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.19-rc3#n262
> > 
> > Regards,
> > Markus
> 
> Regarding the stable kernel rules, do you consider this bug severe enough 
> to warrant a Cc: stable tag? Since this error path is unlikely to be 
> triggered during normal operation and the leak is small, I didn't think 
> it was critical enough to bother the stable maintainers.

I don't agree with either of Markus's review comments.  People have
asked him to stop reviewing code or at least to stick to pointing out
bugs or complaining about style and grammar issues but he doesn't
listen.

https://lore.kernel.org/all/2025121108-armless-earthling-7a6f@gregkh/

regards,
dan carpenter

