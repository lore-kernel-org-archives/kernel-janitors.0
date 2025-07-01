Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D254C27FB0E
	for <kernel-janitors@vger.kernel.org>; Tue,  1 Jul 2025 19:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751396655; cv=none; b=ke520XFz4SxrsAWOCGMn4Gx0OaVNvhrUxyfoXuN7u+8TbLTUdBETxh89U/PSEbe/J1uW0ACMcmfFpUWEKRoLI/CYuQZax+pgQslH4vKHBQtPJcxaPYpyRw2shhe6R5hZVtTXUzcbjrhdSe5CUqkRRBdW3Y9ouJxAPCn7T/QfUJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751396655; c=relaxed/simple;
	bh=tdMUAe5SXwK2+HqDWwEF+ff83QQq+x5NhkU7fbGpGLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgMEjJoF5rIITsB4Yf4UGsU4WyE7a2V+fxD8JrkCBXuzZSXcDzJpYv8BVXcWjnsO9Nm2wT0neWOdEgkqOSONecr7syE8B7xEF29DDRhrvGhUTXoheR8SkqLxc1vd9Pgxn59J1Q1yAaySTsLFjbwMG4JHO/SdkWHLdKP3kzVDLUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wi4IbO0e; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wi4IbO0e"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2ea58f008e9so3051839fac.0
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Jul 2025 12:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751396653; x=1752001453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KEK3EncUVMtlip1R7eb2kLN0bNbNbxBTXXQymbbA6E8=;
        b=Wi4IbO0eVmzFTdq6qgZqyLfx9Ac4KETYqVo7987Vy11SmbdhcJX675R9C+3to902gm
         cdMJncn1FV1alw8ei9DWLUDlq5mdmThUhgcs7k5ufn24FjYuvjijDsNfw04jHW3/TQ9j
         hTG+McyFBZs5S7EVGhRKR6CrI4Al0xdd+2aENXjnfIsANYF+LaJpJQW4IgG3bGAXDx8c
         smjbOtNj9VfiqyVbXyJyaXq47yamzLMPjyVc9Yh9ZgQKPNTQf52eWjdLssR/BuQ2Wkx4
         dHAKX9HONsow38l0z379caXDINRDfyutp6DxiMNBCMrXKQ56RLvgIs0bysBImNEPNt07
         +VCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751396653; x=1752001453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEK3EncUVMtlip1R7eb2kLN0bNbNbxBTXXQymbbA6E8=;
        b=Idpo11rUqfr5qLTeAhRy04JGkE8GvNQQFfL2qkKfqX9J+A2NlcOwJN55SO4fvc1GH5
         XoDNpJuz4nH0786qX5hQYuIZjygwobLmfgpCNW2Df0/P0GcRpiFwzwVcoXp2lC1k4hpX
         6ekpGPC0yTGtGXIzvUQP2k4jW49vWE9uIRnL2ymCmI2CigsjKpvJl7AOGHFb9CskAZoO
         mpWdRGFUQ8mvZKjJgeHyV8ykQphGtvIbuOtCiojWHPrCL1e5WekLxzjNxiDfs1Yw9f4+
         hFv7VptGhsqLqkhhHi/0/aTn4HM2MM9gm9tQHa7A+ZTWvRW3HlpArvkwDrEHJEHLxVuw
         cdkg==
X-Forwarded-Encrypted: i=1; AJvYcCXoYfDxI8IlwVw7F0C/OMsCsDNUFmVDw8aysTQYl/MF+4ULfelMCv3gFdOAw8jRfKhhSxeIBaYUjflmONNROEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ/hGUznRRz9kZLKdqKOM3sXwa0nUsJLemft8cfu1ih7CAFgXf
	KKmst6gbC6x+kXelpUrAFBqfjnpkT2pwzDhWvjcXfUwT4PGwvc9iNZ/9BQSLPQT8mAwSBsXZqnO
	TWkmW9jY=
X-Gm-Gg: ASbGncvi9KkYSakbHFRG3CPfQ+FLXIzTf1cNwqGcEocKIds3tzskisLxv04IvE4Vbfn
	qrh8ICtNrlbKOX0hjRo8RTQEiEAdCdlNAVT8M1tSlwSPC5P4BrQUtXXLDNdedBnMLqs+ubJ+mTH
	GsN9sfP5ZbkdziRWgn7mjC9pc88YYjsYaFXzSHVIGt/tS4dFJtGHuFqbicOSHcRDLEkqcXIiGvJ
	I1yFMi+deeC6O6o5nObtuUerl+OxA8ol7SliIm+fN+V+7r/t/e1gYZrQa1gXbLiAEuBwhizXXNb
	qifhabr4RUozm3BnHDK1iKueZKsm0TT1GtCvo1AeWkkX4tQqc94mh/yQXU2J3n+ix0iwKA==
X-Google-Smtp-Source: AGHT+IHDxUr1xC3O4B3KUwXveX27ECu3+OaL0Y+zUBHu9uWrNi0sz8Q+GhGn5hs1DTYqhbsigADOQg==
X-Received: by 2002:a05:6870:8614:b0:2e9:e2e6:4a20 with SMTP id 586e51a60fabf-2efed4b8854mr12938843fac.16.1751396652741;
        Tue, 01 Jul 2025 12:04:12 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8ebc:82eb:65f7:565e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4ea5a35sm3456703fac.2.2025.07.01.12.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 12:04:12 -0700 (PDT)
Date: Tue, 1 Jul 2025 22:04:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] pinctrl: rp1: silence uninitialized variable warning
Message-ID: <496f817d-802a-4889-a7dd-155d51895d16@suswa.mountain>
References: <748d256a-dc9d-4f85-aaa4-d480b7c4fd22@sabinyo.mountain>
 <aGOqmd5cvCeBjWMI@apocalypse>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGOqmd5cvCeBjWMI@apocalypse>

On Tue, Jul 01, 2025 at 11:30:01AM +0200, Andrea della Porta wrote:
> We really can't get rid of that warning by replacing ENOTSUPP with
> EOPNOTSUPP because the core pinctrl code still rely on the 'wrong'
> define

Ah good.  Thanks for the explanation.  I'm glad I didn't try "fix" it
then.  :)

> like this excerpt from drivers/pinctrl/pinconf-generic.c:
> 
> ...
> 	if (gname)
> 		ret = pin_config_group_get(dev_name(pctldev->dev),
> 					   gname, &config);
> 	else
> 		ret = pin_config_get_for_pin(pctldev, pin, &config);
> 	/* These are legal errors */
> 	if (ret == -EINVAL || ret == -ENOTSUPP)
> 		continue;
> ...
> 
> Also, many drivers still rely on ENOTSUPP. Maybe a patch that will
> fix all of them at once (drivers and core code) is in order, I have
> it in my todo list, indeed.
> Besides that,
> 
> Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

Thanks!

regards,
dan carpenter

