Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A79E1FAC42
	for <kernel-janitors@vger.kernel.org>; Thu,  8 May 2025 10:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746700053; cv=none; b=HexmQ3ilIuyE6YxBdC72BRWPTi3fq1Txw1ztIplZRiCbNhdOTZxRpcLwdpjkmuvyoFm6ZW89E9vh8NNnP0Rn1rh1FbnSTISu5cdswkcR8ELyS3Ykg71GHeN3ZRhLYCPSpadcBhaYWTos8HVEmOb7FlFR1uRWQ8Dtt+yr+IW5+2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746700053; c=relaxed/simple;
	bh=Wg1tIXtF7cdE4BVkY3U542fb6E3QI2pSyqedPkcT3kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLFWoi+6cdulR7AQ/E5Y6X/Po6IaXSCJJkNq1vN9+ia3mhFxpksSojPcQvqXj5O+z2mTd7Ikgu+l8Evy7qRD5HFoDCizGTTsCf8ZshvbKkeKV4JwWALSJndA4RZUqV6zyYmmqGC3CdYUmsjt60DlnM6s/dg32DGfHSb/8tP4YGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a+KPeXe/; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a+KPeXe/"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a0b291093fso1180009f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 08 May 2025 03:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746700050; x=1747304850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f3dXWdexBFnCh1V4T6e507rtdfn4YGQDtE6BBRQFdZA=;
        b=a+KPeXe/9DHnfAFy4D/68GYC154UdUqFm46xqzdxZSw1NuAOVYOYqvFyFT2cis9Uo9
         Gk29jFR8JpGHN4JL3WrXrKc7SiHR8RyP6qwn7TEprnt4r9OoKEbVGA5FMf7kolrzNNd8
         zFDC6v4Y6fSoPeOSmT2/T91UlFODPQm+pplA3GAoVRYMm1L9u9GnruP/LxucRcqK+a2Q
         pH4sfmg8IOERLd7ExCpgr4SLXilF8DGrGgt/dLbEnTor6BF983ZPG5NadqExVYcqk3Q9
         8PTpBjC77/lp2X9BE+VuIdmvk6esXs+4vyd6bocPfBapyQwhfHrQBY1tLZ8a0MVABN5V
         TXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746700050; x=1747304850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3dXWdexBFnCh1V4T6e507rtdfn4YGQDtE6BBRQFdZA=;
        b=rqZfjb1pUgfrYvm6TQ/pX6S79vvKmeheaui2tPyQ16JQ1ML7LDKB8hJIBvUYVWQRHi
         7elkL5PozS2rx4ZlPcMZZeJBh3hQbJRHma1fQZyiHEukVDRkhpuaJccApMS5DrWW2X4M
         Ri1uwLdguxSXyQxi2xjHRNKDWJYm+urPN7+a4/mTMgoAPe53yoEV6wRby+WkBFPnX/+R
         TK9LOJcrEXXzvOR6wR/DFxiZn9L9fGdQnW2Wr2cRDS92robOP235NZidSfkJjzffpW7f
         Io2lM//9+wsVZx8imn/78e0V3aO0ExT17147oaI0xMi+/6S77iEpv1ms0GPneqSWdLWJ
         Kcfw==
X-Forwarded-Encrypted: i=1; AJvYcCW4b/eLkyHAHW+kpXfGWFutZdeKP41yyGP6URC1Z5u43YinzW0G4CL2Rds4ctkWTOW1R5Ty2nEh8RWZxSpFjcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzupwWDvqkQtaEx62BiGOT/rZ+aclgM0PLgMY9+J9BM+Z0i5b4L
	B/MgmjgtNK1QAX4JvWySOn6dCGAHjUsejzcMEDpouPnr+qEDkEiKQQEYZhfmsnWl7z7jVy+q3TB
	X
X-Gm-Gg: ASbGncu9fuXoUfIjdbRFpTxtjTtHH7B29AX82o7vkyEuRgg6O31kyB7+3N3TJF4EdGe
	ghRxC5qSLAjS+GH0J8G+lNxp1Eq2YvldkxSyZTS5Bk/TAwk2JPXxwlRyalC1rnbciNf3qreOsM4
	8Hds8aH08Z34XTq/rG4QVT6geaKkDXIL8LnFnoLJWivTRA8AX1GxwW9XOfeSLg/9t5bAAlcpP5D
	XuUA1Bcp9tcDzgwRB4V37v9Zfxb73RpvlMBBEtcXo2G6B8UhcfZCYGjUeGLhKadRhULChHLk1yS
	WJwW1ntWk1jUOAoDHOHbF9wItkj/gz2OsI91Kf6PqeN6Fw==
X-Google-Smtp-Source: AGHT+IGr7hK3xCuRso8I/G034nZ8utNO2zmismBg2hsAW4Uj0bzVouwQ2BDVypLguNpWtEPItYf4BA==
X-Received: by 2002:a05:6000:2ab:b0:38d:ba8e:7327 with SMTP id ffacd0b85a97d-3a0b990e086mr2368417f8f.8.1746700049750;
        Thu, 08 May 2025 03:27:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0b47a8448sm5679359f8f.44.2025.05.08.03.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 03:27:29 -0700 (PDT)
Date: Thu, 8 May 2025 13:27:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: rcar_jpu: remove redundant case statement
 when c is zero
Message-ID: <aByHDZyu0pptFUlK@stanley.mountain>
References: <20250508100835.336240-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508100835.336240-1-colin.i.king@gmail.com>

On Thu, May 08, 2025 at 11:08:35AM +0100, Colin Ian King wrote:
> The case statement where c is zero is redundant because the previous
> while loop will only exit if c is non-zero or non-0xff, so c can
> never be zero by the time the switch statement is reaced. Clean up
> the code by removing it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/media/platform/renesas/rcar_jpu.c | 2 --
>  1 file changed, 2 deletions(-)
> 

   612  
   613          for (;;) {
   614                  int c;
   615  
   616                  /* skip preceding filler bytes */
   617                  do
   618                          c = get_byte(&jpeg_buffer);
   619                  while (c == 0xff || c == 0);

Unrelated to your commit, but get_byte() returns -1 for out of
bounds.  I wish there were a explicit check for that.  We end
up hitting one of the "return 0;" statements depending on if
we've found a JPEG_MARKER_SOI.

regards,
dan carpenter

