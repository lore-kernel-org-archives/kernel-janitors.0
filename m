Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00981DF987
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 05:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745990462; cv=none; b=Q/3SxG269INTsKEjj92fJ4ian/WUsPCEkxgOpH8Vl1/wIxgZBtOUsz3Svl7ELDU0pRLMcsgtAouP0/Lej81zVPNCaS3ElUGdZlCrY95SMJd/Fvn4CKsDHIGbqu7iyaeVibfms6e323W2qaE6sjXV+k+Xop9WYTfjBDwbqbkV+Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745990462; c=relaxed/simple;
	bh=3LBZ8CNZY6y9TZGjfZGOceqANuDT2oBaOWkru0fxFQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YT9pozjQxL0BSUUQANuZvisysUCMm0VZX8P6WQqbcqwyCSiws0iacIO7rRw7B2xLPjb+QwV0/2XddT4xUgEuIAAWsnfsVwvl8T0QbOWKkq5ALek2af+/AJfKarsaTUvhSCAq0HgtvGnHqkHa2JdM3w4UPP2aU5uf3W3iGGA8d9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nZMCQJZ3; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nZMCQJZ3"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39129fc51f8so4557231f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 29 Apr 2025 22:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745990459; x=1746595259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EObNhpS6QTdve6kAkH7lX8BP03yhDQRh6hSnvdBfWqw=;
        b=nZMCQJZ3YHEiKRq9xdUEFaoGqNt69hP3P0w1XYeo9Ti5qpMznMI/wn7CysKlxaKzKs
         juknxhYTukcAvaVnD0w+9ABsnHGoBw0cSeZQPMsa492Y19Oha7aPjjdNQm0uGwbmEopE
         /bWZWAJ/AWVypjcStPK2ScZO+PG5JdoamwlmfTJ2rbLtMkv/3g1iKhoGpao7h1uMvz0N
         bIST50dmml5umjyNLCf+Asec1o4CUYE6usUaqgVEVJT/Kg93FJY2HZMJJ0CVHMlCgckQ
         Y1i9JAxjiaLxc0wkC6JXNw59AdEbXfVOnWl8/OpmWLeE9iqAU+DPHMR79kkCtC+oGYGy
         LrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745990459; x=1746595259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EObNhpS6QTdve6kAkH7lX8BP03yhDQRh6hSnvdBfWqw=;
        b=F2qJsl+MCS5jVRdbuRUh4/P08MAnR3+O+saBJLX6DbyOCMF7/sA4M3Lu3Q1dSppVso
         1MRWCLbvYj0Br4O0SDIcaueFfqQD9PvIq8R2/RtWK2nz2CZJwW2uCSn5Zgpjp2nTvLgr
         qm9Maa9thXO1Iv80HyEq+Z4m5TIvrtWvpamBkwBHQG/TKkkj9D+aBQegDAI74HMzB1Um
         7+CGrJ89GHdRvVEODIM8GCz8Ctl6QNiEz1KektjlQzpE6xrYleNV2qABTnerIhjYYKSm
         yZIzySQQrnzB7/SzizfqqxeJ2y3Jj/cmFSMx3A7HFRos5DlvWhi+RFjdCbh7vf+toifT
         znKg==
X-Forwarded-Encrypted: i=1; AJvYcCUp0HnI6vcwqQHUSeD422z2SYwbvnNFaGvAMVeK32P5xObmxkZwXt64NLoPPRDIWUMPyvLcuFPbTNv9CjvlBug=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrE3gyQFttTTV+NxjLDZUr80tjya2wLDJDNAozt7EgP5k5oPnB
	S9fLMlBsGm+Gd493QdbE2D/AfaHuMyviNtj3UhePasSrBsEHXmP9boxuua+GLh4=
X-Gm-Gg: ASbGncvFQ6cSEihceo2w1MG5USnBOa3CeBPddtak1BCYGP9LroVf19tf4rLKgwmHxED
	s77i2R5EJRY+4J9fj8h3RPQP4Xnwo8jKzZ5EH/PpyaUZ2IuuGEM5Rg73amk+49EAJclLDJiqyc9
	eaDHn2YJgUgAlRpYbMKYZ98cQNPVXxBQwXloptjQmavZvqJ6hcZYjkfTkQSZtZNdrlK8+k970Bx
	0yIBmDHsKtNTxdCvHfyfhZXG972A5wEqVTqdjCbvePL4wiMlAVBJnvh/T01AvIa2mQIeP+6q15l
	ZIbrxK63npX7gAZpPNjuffDYZNxgvsXB/eSvw7CiPr1usL+zhnvhggaz
X-Google-Smtp-Source: AGHT+IG3i/sYdfjxVU/5DJKWsNnGTYm+BVMuqTqLUwyXPnfD53W2Wi3SUbcbcnKkL9uToGoA8/2P6Q==
X-Received: by 2002:a05:6000:2cb:b0:38d:e584:81ea with SMTP id ffacd0b85a97d-3a08f7a04c9mr1444347f8f.45.1745990459186;
        Tue, 29 Apr 2025 22:20:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2bbf29dsm10403475e9.36.2025.04.29.22.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 22:20:58 -0700 (PDT)
Date: Wed, 30 Apr 2025 08:20:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] tpm: remove extraneous space after newline \n
Message-ID: <c4ee8e82-4021-418e-a822-34e56c7322c9@stanley.mountain>
References: <20250429163859.823531-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429163859.823531-1-colin.i.king@gmail.com>

On Tue, Apr 29, 2025 at 05:38:59PM +0100, Colin Ian King wrote:
> There is an extraneous space after a \n in a printk statement.
> Remove it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/char/tpm/eventlog/tpm1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/tpm/eventlog/tpm1.c b/drivers/char/tpm/eventlog/tpm1.c
> index 12ee42a31c71..566f4df58d48 100644
> --- a/drivers/char/tpm/eventlog/tpm1.c
> +++ b/drivers/char/tpm/eventlog/tpm1.c
> @@ -258,7 +258,7 @@ static int tpm1_ascii_bios_measurements_show(struct seq_file *m, void *v)
>  
>  	eventname = kmalloc(MAX_TEXT_EVENT, GFP_KERNEL);
>  	if (!eventname) {
> -		printk(KERN_ERR "%s: ERROR - No Memory for event name\n ",
> +		printk(KERN_ERR "%s: ERROR - No Memory for event name\n",
>  		       __func__);
>  		return -EFAULT;

Let's change this to -ENOMEM as well.

regards,
dan carpenter

