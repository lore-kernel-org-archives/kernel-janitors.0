Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40A71581F3
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2024 18:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718303696; cv=none; b=SAisbXcj3RsDjb/RmISS+zZeUomvQHa42uJ/ClLFJyZ8wVPzrc//x2ek2bMJtj3BkeZZAYRjhXvHawO6DIz3tlzyekbNAa5sU/Ccsuk/QOHhUmzuV3+Q0XK6nmhsAl5ZAnhRZpuGEgKviWNVv+mBls3Kr9ExiupfZZOWuXpr1tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718303696; c=relaxed/simple;
	bh=HzYejYuOAn5iwkrueS+PiiRJuMEgvDnHU5MUoSEiTXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVQbCCDJyHUIroAF2UT7AaA7ZETDFGZjB8PyzyyEweHQCChM4zVzrbSWwj5ZFqbBvTxN/3VbCZEX7K21YRevUzJ3Kgh2d+YfFnNVmhdjN5Rvcua/GBIECiDo+C34NzR3W4EBmGMt0y68Ng7JMIZbFhNTlUABEiWUWcu4ZG58oDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nueE7lgG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nueE7lgG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-421f4d1c057so11804045e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2024 11:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718303689; x=1718908489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+98BqI659caT5fQyMNy5nW5CXfFil4jPP9JHzeqpioA=;
        b=nueE7lgG/naHoaPFwMMQmTbMK+2/EAH6ktB36ICcvkmhc2yVGAyH3y5E53CJgTwyF6
         dn+lrqcmtsufzy16Ul/EwLmaqTxX+YzxHyvixZKk+6lgapD+eQvNFHe01rNlivdLf/sj
         cLDPP7G51iuCnM0XpakbceOu8xN9cVJ5WsuEtC4qXMbYqPoTlYieZMHzREpEUBN952pA
         nOFdKlU0CGmofu2PHDd5cWmv9WplcAdVkyk5tOjH8cZuKXXwG0fiKDhmi+XPhhLBkCGh
         6Tx8M0dRq7rIzDrUkn3m+s6+1EPR+A4n0UqVjkPioFqnHJQ0Hc7ZDN5G7mq/y0IQAd+h
         +Tmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718303689; x=1718908489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+98BqI659caT5fQyMNy5nW5CXfFil4jPP9JHzeqpioA=;
        b=dh4ee/DWEYvx+S4qviep63AAR/+r4a1WrVhlHy3QV+WoQBkuHiLhQn4+G2GexiDa9E
         Dv92jvR/5XclbKCv78USvXQb45ix7NU+14fCRXVOdLI/y5QBk00zeTPZEQ3oU1Mcthmt
         /4YCvCVRWb0u1B/LNKDeHStlBMFcqE0dsYQ/OA/0Mjr9U6YE8AtHiIm6p5XoSvUQeujD
         ebmRFSrsYTqLyG9hjnjKMd5HTsYMpjXdImvZUw9k6KyC5Le07m+5Kn2jRR/ajuXEFd33
         CKMwExjrQ+SJQYDDaC3oiJYHT3Dt1vs+Lo7f84nPigIeC88cKQSSY6i1DwwZPT9JZS+q
         ck8A==
X-Forwarded-Encrypted: i=1; AJvYcCWQxkGFnVCJLv0oHZxlP/Da4RUllpuJxNZYyvswzZ17Tvc79KYen8YBR1swBVi2Due07sqxvManBrsMaQRzVesBRTuorhc9v3WP6YnhREjK
X-Gm-Message-State: AOJu0YyKuxQiIEzQ+bYckgI4sQWwiVYS2pXJKhUs/gim3MhzVFaqNZi9
	8atDR4/B4eoDICkcPvum0nmg7TZdkzQJiN+SL39WCDjUj6WBj+sB9lWRSxg+2ME=
X-Google-Smtp-Source: AGHT+IH+s7hcDwfwjXdg6cobQ343oD9A/3tP8Z+Ip47trN4be35NWLP4NUKC3Qmn1FTyx++7yP9BQg==
X-Received: by 2002:a05:600c:4c9a:b0:421:7ac9:460c with SMTP id 5b1f17b1804b1-4230484cfc5mr4462905e9.39.1718303688813;
        Thu, 13 Jun 2024 11:34:48 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f6320b11sm33706145e9.29.2024.06.13.11.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 11:34:48 -0700 (PDT)
Date: Thu, 13 Jun 2024 21:34:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ben Walsh <ben@jubnut.com>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Fix error code in
 cros_ec_lpc_mec_read_bytes()
Message-ID: <68f1d8df-69d2-4246-8c64-4c7cc975feb1@moroto.mountain>
References: <e0b43fb5-ecc8-4fb4-9b76-c06dea8cc4c4@moroto.mountain>
 <87sexgrdk4.fsf@jubnut.com>
 <3226cba0-82c5-47a3-89da-01ffa935a9dc@moroto.mountain>
 <87sexgaemn.fsf@jubnut.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sexgaemn.fsf@jubnut.com>

On Thu, Jun 13, 2024 at 07:20:32PM +0100, Ben Walsh wrote:
> 
> Dan Carpenter <dan.carpenter@linaro.org> writes:
> 
> > On Thu, Jun 13, 2024 at 05:51:39PM +0100, Ben Walsh wrote:
> >> 
> >> Thanks for fixing this! Unfortunately `in_range` returns -EINVAL if
> >> length == 0 (see the definition of `fwk_ec_lpc_mec_in_range`). I'm sure
> >> this broke something in my testing, but I can't find what it was now.
> >
> > I don't think fwk_ec_lpc_mec_in_range() is upstream.  This email is the
> > only reference I can find to it on the internet.
> 
> Sorry, I mean cros_ec_lpc_mec_in_range().
> 
> >  int cros_ec_lpc_mec_in_range(unsigned int offset, unsigned int length)
> >  {
> >  	if (length == 0)
> > -		return -EINVAL;
> > +		return 0;
> >  
> >  	if (WARN_ON(mec_emi_base == 0 || mec_emi_end == 0))
> >  		return -EINVAL;
> >
> > But I don't like how subtle that is.  Probably adding a check for
> > for if (length == 0) to the  to cros_ec_lpc_mec_read_bytes() seems
> > like the best option.  I guess option 2 is the best option.
> 
> Thanks. I'll check out Tzung-Bi's suggestions as well before we decide.

Writing length 0 bytes to cros_ec_lpc_io_bytes_mec() changes the
function to basically this:

	cros_ec_lpc_mec_lock();
	/* Initialize I/O at desired address */
	cros_ec_lpc_mec_emi_write_address(offset, access);
	cros_ec_lpc_mec_unlock();

	return 0;

I was a little concerned about the cros_ec_lpc_mec_emi_write_address()
But I don't know this subsystem at all so it might be fine.

Perhaps the cleanest thing is to delete the length == 0 check in
cros_ec_lpc_mec_in_range() and add one to the start of
cros_ec_lpc_io_bytes_mec().

I think that's a good solution.

regards,
dan carpenter

