Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B6C21265E
	for <kernel-janitors@vger.kernel.org>; Tue,  8 Oct 2024 18:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728412099; cv=none; b=k1qOOAPjHucvjQZ/xZG1o9W7Tk9T5olmIfUMJo+K3d8oOlmtJR0HRfEuSQg1udt8EAYFRMzi+FmmL3hWA8WtLZF3STCsaLJFvmLzezRrEm/65e0eVjusjmVhGkhM46T04MMyE/9k5VuUBM6VUXOViZEpEPstE8MSygLxBmRjIF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728412099; c=relaxed/simple;
	bh=KRIMSaQJxsJnrkquxy6hhD3S/qPAyWsH44gpf2J/73g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUY/FqtW5d/BR3rqyMGEovXvSrt9zd+yez31E3n+igzIIFKYT/yeWfRyS125xEy9TO6pGHbPP1n8Aqv37iAMh8jtkJbadJd5n3A+AfYmM6HSBxkDwz6+9L7jOGhix+U28k/uzIkQDapDKGQyxp1FuzWyqCS8YHeaHG1Cw4rJRU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cfWrTHoM; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cfWrTHoM"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d2e81e110so511839f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Oct 2024 11:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728412096; x=1729016896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj4U5NZezle5klngEkutB57b0MoLORIo7RbzeKMhINk=;
        b=cfWrTHoMgyQleQgKBDSITavn2krx/9iImZENtnOLbvISt+U/EcDA5zod9AXfNFGwXL
         Eq66dFMV7VbHNKuSG4an/R8gEN54nBgD2FyPo8QF8puHrwB0xaq5jplhdq+KVZJdth11
         Qz+jX2qC9rtFjoWjAkv/PTa0RXYZaBrd/HyRRGUvYgvCvPZOxygvZ+qOD02db9UExUU0
         qzKyL5VO27u/O/Ge+BrpDSPvXI3OyD9ZfyepS0GeEqcELjU2vAdGpUdx19p2JEXTOupf
         APzI8+CAX1aSIw+ggQG6OVZMBPa7E+UZOvjjP4DM/lac5JGnEkFD3MNE+WROYVwvBleu
         7EDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728412096; x=1729016896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vj4U5NZezle5klngEkutB57b0MoLORIo7RbzeKMhINk=;
        b=G33qOIDFW7oqILw/4BZHR4jhrzCRcUChEncaCdaaai+J2lBq8BNMvH+ihvccrgrGug
         LO9coPuLeSBQVDvYRyIueU0zigH/J6FLlLt9Ntpwbg3akL5VrqtjX4N2knIU8gp/gx5r
         7wYhV9xsmixx8NrVWK/xaFL9xSG1tSsALsXixwpY64lsxcoaxxmi2ibt9bbpiAtZuG2j
         DTUjDwORfLJ6zJJTz4zJk2c2uJzPsyOH/jrI/46gdcQU9o2rLcIwdgWeDzMqWRaJf7Qe
         HQRfZLnit/hSUC4DP1kczKjVKas52DDtggVd22w6PlEv97WKqFGAlLDT6B8LpYagyNbo
         61+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNwEETzZdRQW+ir5XIgC0cWxOs+PtRf8QTAik+VOzABchyoIt2eKxY/49zGEMy41V6zC/icgV9tKJFUWfIkN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRYCbLMoLlBWhcnbUG2h9cSnydFzJrer9MLcScvFx1hr/FVHZQ
	Z7p9T0l7nOWkD38bFyJlA2mtf4oKtyvSDl+W5YBlF6h3zfO/XZMIEAf4EHaLCJE=
X-Google-Smtp-Source: AGHT+IF28xrCjVDMGy24eCmaDxnDHGfA069+feSTET3yVX4pIr2vsTYPGgc9aCT6y84BOEZg8lwf4Q==
X-Received: by 2002:a05:6000:400b:b0:378:89be:1825 with SMTP id ffacd0b85a97d-37d0e8f4bcemr11804315f8f.49.1728412096232;
        Tue, 08 Oct 2024 11:28:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1691b725sm8578482f8f.46.2024.10.08.11.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 11:28:15 -0700 (PDT)
Date: Tue, 8 Oct 2024 21:28:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Colin Ian King <colin.i.king@gmail.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jack Yu <jack.yu@realtek.com>, linux-sound@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ASoC: rt-sdw-common: Fix bit-wise or'ing of values
 into uninitialized variable ret
Message-ID: <84edfcd4-02f3-4cd0-90d8-eb5f3cdabec5@stanley.mountain>
References: <20241008164707.203792-1-colin.i.king@gmail.com>
 <ZwVmCNAVSOgqT6Qd@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwVmCNAVSOgqT6Qd@finisterre.sirena.org.uk>

On Tue, Oct 08, 2024 at 06:04:08PM +0100, Mark Brown wrote:
> On Tue, Oct 08, 2024 at 05:47:07PM +0100, Colin Ian King wrote:
> > There are a handful of bit-wise or'ing of values into the uninitialized
> > variable ret resulting in garbage results. Fix this by ininitializing
> > ret to zero.
> 
> I'm very disappinted in the compiler for not noticing this :(

We disabled GCC's uninitialized variable check years ago before we enabled
-Werror.  Clang does catch this.

  CC      sound/soc/codecs/rt-sdw-common.o
sound/soc/codecs/rt-sdw-common.c:119:3: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                ret |= SND_JACK_BTN_2;
                ^~~
sound/soc/codecs/rt-sdw-common.c:111:9: note: initialize the variable 'ret' to silence this warning
        int ret;
               ^
                = 0

regards,
dan carpenter

