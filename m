Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F2C211A04
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Jan 2025 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524531; cv=none; b=ueOMrM/SuAu7opzE25y0wVw8vo6wyPoY77sg/xRGdWqxAAvVyPHrGvy9denNBfBvSi4AmSc4TSbHIo430/xJiPfUoU6yCwZg0HX1rWTmYltr5nCKZ/+aXhxaiNMOWggQzvNbZZ0bhuamGBUfP4vEfjng4QeAcLCzwTbm3cph0c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524531; c=relaxed/simple;
	bh=PT5KbB8STzieb8SI43c9r4bJRZSyJCdnd4NCbGpXFZI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=l6mE0Wt5/e3gKOnShj9egjj0uJE9iFOG5o1qDtn9R3jBXfyobyVBGUr3aZXm9Z0gtmTjJi4CD7rLnL504YY2qpCdfkNaBBltdU2pCMJ/e4nkUbNuJbcsF6ooijCT5ImEw5LKGcUj1snAKQZzMrAQcHEfPu3O6R41NUJS+GTzvUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=g1aQxVtB; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="g1aQxVtB"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-467a3f1e667so13714031cf.0
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Jan 2025 07:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736524527; x=1737129327; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+4DHniq6Jwfm/qrHjg7vshNTs6ZZXTUjwzCd53ai3s=;
        b=g1aQxVtB9sEhUJIZs/HmU/oTV2vlRxnHfwx8Z9mBDGICh/YnW5Mi443b/X0NO7M1Au
         bzNagGCVSE2LfcL1aq6CHWyM16DibiNB4Ml0MabriqzGVzD2ziRnkk1M10BHWXdVcnT7
         E6xlPqkAskO78ARUUgbhBEukUHJMGFpkhTaXlQrx/9QCze35MwMDAkVyUUjmsx4rnuml
         AIFZFtsIxrr67yTXUX2u10+zuCixlzGHXUnVu5NX1oYoDLqorQ9yoFXajEm1EdO5K5KI
         DMc/DX7cSdJUIZNKhBYduCkSpXJemZmGGgACvObtKX6Yixc3VBD5FBvwTh445LU83fw8
         J8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736524527; x=1737129327;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+4DHniq6Jwfm/qrHjg7vshNTs6ZZXTUjwzCd53ai3s=;
        b=KngsMU+bqEfW/tDhS39zTXhwMOss5vCe+cag4yZotP6jtygUNM6X6m9NTe6ftfCW+c
         MNncRsailry1s17CZK+MnRUmGLmD7BomCUum79y6jErAoERNY7gXkcbvPnbp5HBuyb7D
         JnOJThnD+N/M35U4rprbKLYiP8ZrdUSVSuKQlO1GdaWnJNjuRQDf2zRCeQfTKwDKU4Vq
         WbjbckmVFwsSaHnE1NZKIw3XlOvAynqsecsXEf2WeZ+A/4KM7e8yoN2ZbBN5defSehhL
         nAi4Qbz4PVJ6CSbrwnutp9Z380K9Cl5l3dfuNZ6kuEBpJ37C0Pof50SBCQihYPmP+BO6
         0wMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWorGGuJZWTvefGhgq8r/b+povRWySOPNyHfOcF40F8oDYGTpFLIkreuu3y3nwKUPub3j6anaPV9KSnOnU6uoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXNDgH0yIRUh1hLEoMF205l2QAQzK6DdRix8C8NXYKda92wgto
	+1omSMdmGEUeMIbLjagwtPT3IajlQsh8M85cxkjoVf8fmgcXzoA1RDrvFo9JyfU=
X-Gm-Gg: ASbGncuCRHjsfxP3xO7QwkXkhhC8cVXfEazxcrl/SNXKJkmi0enlL7pspuNP90EaZ+a
	+K5IOOA5C96AQNdvjVaCfccbrMfjOTh94LTLHy0p2CwG1lMAOGPNrBBFYpGRaEH+H39gHSDxN4+
	q4mipbTq85tDvhoNAup4QvsDXEB03ykvrobStUvKOs4Y6rRtPS3pe63yZ7m9tLkSQ+V2kkU2Y1U
	/hahsCMble8Gqu9AZ1zD733FaiNIjbmPGGcaH0VnuRpg1j3/IOSflmqwMADSxgprX9zJRpMU3q9
	nNR2DlTeqpMFNQNRfvE=
X-Google-Smtp-Source: AGHT+IEu9QWoE1yj8ljZXJZo7UtmDZAvNDTGtvJsoZEgk/j6xFlgrRvToReL+/TBCH5oXr0zA/7vWg==
X-Received: by 2002:a05:6214:e6a:b0:6d4:3b7a:313a with SMTP id 6a1803df08f44-6df9b2d36c0mr158944466d6.32.1736524527444;
        Fri, 10 Jan 2025 07:55:27 -0800 (PST)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dfade733e9sm10375056d6.82.2025.01.10.07.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 07:55:26 -0800 (PST)
Date: Fri, 10 Jan 2025 10:55:25 -0500 (EST)
From: Nicolas Pitre <npitre@baylibre.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
cc: Alexander Viro <viro@zeniv.linux.org.uk>, 
    Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
    Kees Cook <kees@kernel.org>, Eric Biederman <ebiederm@xmission.com>, 
    linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] binfmt_flat: Fix integer overflow bug on 32 bit
 systems
In-Reply-To: <f946074f-60ed-455f-bcc7-4364f15b9603@stanley.mountain>
Message-ID: <4252467r-08n8-4oqr-3910-p5n1pq8so9s5@onlyvoer.pbz>
References: <5be17f6c-5338-43be-91ef-650153b975cb@stanley.mountain> <f946074f-60ed-455f-bcc7-4364f15b9603@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 10 Jan 2025, Dan Carpenter wrote:

> Ping.
> 
> regards,
> dan carpenter
> 
> On Wed, Dec 04, 2024 at 03:07:15PM +0300, Dan Carpenter wrote:
> > Most of these sizes and counts are capped at 256MB so the math doesn't
> > result in an integer overflow.  The "relocs" count needs to be checked
> > as well.  Otherwise on 32bit systems the calculation of "full_data"
> > could be wrong.
> > 
> > 	full_data = data_len + relocs * sizeof(unsigned long);
> > 
> > Fixes: c995ee28d29d ("binfmt_flat: prevent kernel dammage from corrupted executable headers")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Acked-by: Nicolas Pitre <npitre@baylibre.com>


> > ---
> >  fs/binfmt_flat.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
> > index 390808ce935d..b5b5ca1a44f7 100644
> > --- a/fs/binfmt_flat.c
> > +++ b/fs/binfmt_flat.c
> > @@ -478,7 +478,7 @@ static int load_flat_file(struct linux_binprm *bprm,
> >  	 * 28 bits (256 MB) is way more than reasonable in this case.
> >  	 * If some top bits are set we have probable binary corruption.
> >  	*/
> > -	if ((text_len | data_len | bss_len | stack_len | full_data) >> 28) {
> > +	if ((text_len | data_len | bss_len | stack_len | relocs | full_data) >> 28) {
> >  		pr_err("bad header\n");
> >  		ret = -ENOEXEC;
> >  		goto err;
> > -- 
> > 2.45.2
> 
