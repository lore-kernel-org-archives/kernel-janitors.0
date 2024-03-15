Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90A11EB5C
	for <kernel-janitors@vger.kernel.org>; Fri, 15 Mar 2024 18:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710528245; cv=none; b=BIEVP1rGrhV/+e0DSgZCm7YDwSEaauvFPCuM21Ibi/nRVX+irSRsu7938Thyber+/KgW1yqz3Uypi/E+MhSxuNN1TqwC4nkBeo7Wrs+M7UB5QiVye23J+ctxAwLl18i21bJsKo2mI+kIVwN8uVC65Xgt1K2yboF7KhRDjLMS/VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710528245; c=relaxed/simple;
	bh=1hIcaEugVHYM9qv9vCZLr+cROMsMJ1VI8gM2ISBNduI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gc6Dqzc/SgdSW33lvVC6kjzUjBAMjJM/1Hyhi521vL4lWXLO1CvNokTKrAnnnV9f1WDMdc7q58U+vhrGSNduxQLzafz+8W5LthTgMEckk+nIbCfla037ew8gvnqj3pEnPe3tK/l/Qwgjzjgu0iuGsiozGnap+IOfgL4BNtvNPq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MwKAaevR; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MwKAaevR"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-513da1c1f26so1456181e87.3
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Mar 2024 11:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710528242; x=1711133042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=unYKsN6XP1tGmxG8mlEYFLlvddoUm5Z9kRt/TflohbA=;
        b=MwKAaevRMzrfYEe3Nz4rdKAEAkimUYY35sWA4sxD8D1D9XFtW/jBsarxXxQ5xjq3vI
         ZY5g9w0b7SbRyNO5ZlpAgu3ChpNyejpAYipLT4oEBr5ZRDhBh2wIh/W/lYTBays+WWOP
         PfQahhy2iALf0RlqrXc3cjuAYbljqYIdm30T21fp5j1G6hRqJMcM12tCAHcuk65Wqxxx
         mdxs+MsYuFCTNeVefwyM2w4UMaThPOicIBZqgIOAsrwQdkqhsVbJ222E+Nmad1FwVgO8
         +ZFD5msGU4fDmHMQrouc0+8HtyoTDBr8Z720/BUQQEB6G/GmQA6/lJZyvHpPacyn6hN1
         OMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710528242; x=1711133042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unYKsN6XP1tGmxG8mlEYFLlvddoUm5Z9kRt/TflohbA=;
        b=rv2Rjimv7AMqCjAnKwHWMjIKwVSo4ZZBHBf3LIYkxYV2JKTZmkbaObdCMBMt7XyWTz
         kaJMtMzwczfjAryJ4y7l0G6VbY5H5oNN66mmM0mlR+0961qhmFkaqPYWaQ0tlr9PCJrA
         X++Msal6WmK7F3yOUFfwT4cca1UTxSLexeyweM4jezAdclqlF26LTUoc9BcrxIYzZz+2
         HzXI7k+2qLokFCA0Q5k6dEpkF3JALXiEAfSpupnTBiO0pJ2R4ECfOMTmxGqSCLqWG+gm
         fpdyADEgBu7B8JENFLbb5Q3imPYvoIcVOkhqiWRkcmvXddszSc4+OBEqKRxoAApSFzn4
         R6NA==
X-Forwarded-Encrypted: i=1; AJvYcCUMLfPJOsi+4jeMOytwk+W+IDpJeUvvVVjC3V+6dpqPUNZOBOvmcUie9O+DgF+4JS4eXLJGQDG7GB3JdjAPvX+pHVc4/ROom42xPVAQbJVw
X-Gm-Message-State: AOJu0YyRuCWCvcO8sG5EZu27V5tWuh6/ZL5kDPsZrrkW72U8WVRc8BRQ
	1yWrNBiRnnB7c2nx9iZiaF1jRihboPd6T278Nec5K36fftW+eP428EYR9MvZvhw=
X-Google-Smtp-Source: AGHT+IGepkNfjDBvL+Ow3oH9rGw1nhLPfmkERiJyEG0SK9efGs8Tt8dyBlC5GPFaxBFpGKlpa7MjuQ==
X-Received: by 2002:a19:4353:0:b0:513:cc91:9ed7 with SMTP id m19-20020a194353000000b00513cc919ed7mr3525941lfj.11.1710528241555;
        Fri, 15 Mar 2024 11:44:01 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id r11-20020a05600c35cb00b00414038162e1sm2016682wmq.23.2024.03.15.11.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 11:44:00 -0700 (PDT)
Date: Fri, 15 Mar 2024 21:43:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: usb-acpi: fix uninitialized variable in
 usb_acpi_get_connect_type()
Message-ID: <eb25d06f-775c-43f9-9e7e-4f859f6cc41c@moroto.mountain>
References: <fdd4f94d-fb8c-44a0-9472-3485a567caca@moroto.mountain>
 <2a3ab595-80b2-fd4a-8748-c823fa5ec098@linux.intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a3ab595-80b2-fd4a-8748-c823fa5ec098@linux.intel.com>

On Fri, Mar 15, 2024 at 05:36:16PM +0200, Mathias Nyman wrote:
> On 15.3.2024 17.21, Dan Carpenter wrote:
> > The "pld" pointer is uninitialized if acpi_get_physical_device_location()
> > fails.  Initialize it to NULL.
> > 
> > Fixes: f3ac348e6e04 ("usb: usb-acpi: Set port connect type of not connectable ports correctly")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> 
> I sent a similar patch a week ago, just before merge window opened.
> looks like it didn't make it.
> 
> https://lore.kernel.org/linux-usb/20240308113425.1144689-1-mathias.nyman@linux.intel.com/

Huh.  That's interesting that this bug was causing issues in real life.
I thought everyone was using the GCC extension to zero stack variables.
I've only been fixing uninitialized variable bugs out of sense of
stubbornness and to boost my patch count.  :P

regards,
dan carpenter

