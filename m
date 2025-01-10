Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028851AAA1F
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Jan 2025 11:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736509920; cv=none; b=iyMr1J5JVSG2I6nooTraxyNZJR54qFZq3Q+EGyS62pkutdFXvE5zjGy4QkGc6jjVkv+kIkGOy/NA57oJeGvvM6jqdsAunSyZhUqnmfUgJwt8249zBTvTKpFHeSccxJZE6ZOiWlWFwfF4uJf1WFrod4uDwV8YQxZtpN9K4hXwCx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736509920; c=relaxed/simple;
	bh=YV7GmQKqg7lNtZgyhSg6UFYi73qjEM3setYvQpJ1qVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=di7XmE2uK6MECDKfRBokEgPREHL5rOSNFWiY2HCaqwohWKHzKVxInsg4IqGXMp8Imr4LpqDfT99twN8v/s+/liZYAQfu3vFxgxJHbX5WYek8QzfqSKc9TgJ6cig1AUP4wVHa0eOM1+ZWtzyGbuxu5RuXsLUgEYpzinliwpw5GoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fLILecPY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fLILecPY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso14255845e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Jan 2025 03:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736509916; x=1737114716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5CDjoH/Bj4sC3csaucGOxK7bWFGpVLWDds1mIa0onws=;
        b=fLILecPY9NeA+AS3t5ue8chMv1Ob/pcKEuOzaL+Li3wos9F4qCPZkgmMHmjWhoK8Qd
         p+2ItSSR5D389y9/c3VXtc2WP2WlnwTP4myLUHbXvgK/YnM2qt8u3M+AeS7g+ZConJuQ
         +1vupOA7g/0QvJCiuUOc8nJXyuNrsiUcBHSM6fxlkY3Yjo9cF6rzOxQJTo1NpabEYvc2
         jHUg/gbscT1HVFBhp87fSAcUuEvYsQYoPr4DZwNUOi9MQcGgEuYrDW0GPARHSD5mlyUl
         mcwc8bh4l64q5NtbrrZ4hyqOO1d/WeXXqsy8yylhOnWewB7NBuvMfb1gsmZ7EY9RQAgD
         4ksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736509916; x=1737114716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CDjoH/Bj4sC3csaucGOxK7bWFGpVLWDds1mIa0onws=;
        b=RIt9idOsUosOqOYCZ47n6Uy7EXcAXcPyyTivJaVlTa/GC6HgiNGg7wQtrqiH6HXxGO
         281RmGB/5ucQpFGToVq3PA1/+otAGFP+3IOapRPFggJrpDMRZ+BRdFaAaKG29cePmym+
         aJylwViow2aqRozMJwmIL7OlxjzLqeZllojltXiW99pPKsHWBuEHuD39JpF7kmy2GngA
         DxFb8odi6q1p9xMP+tC+/7UFK9P8qs9T19Bv58hcqEDh8SkdbQ/HUUvcaVlgx1B9a2At
         myAnV5sTCPaMNszlUDoJeGrjO/+5PjSwUgaQKGstW7GBi305UZ6X3mH8Lg9ARhAoUKqw
         Tqig==
X-Forwarded-Encrypted: i=1; AJvYcCU4zLSOdSZVTV/ToG2N2BZHdTn0DkYo/rpjRnPXTgSk+tSvQZV+SJ++V7O4fYABwRe9OMsUPB6vjfNR/I3Apg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDlClpzE7+2tBK+cJ5PjTe/QvtFDtfmu8L3JA3MmfVv8QyquJe
	INv3KfJNHDUGBsz6y5nc6xlEJlvM3AdMqEB7G/3+3aPQWSOEsUVlETisqizrDAs=
X-Gm-Gg: ASbGnctVOsUhZ2dykwIEhMDoDbdxDIQCpwzAyKeNvDHIrVMGiVZpw7hWtOnMpOxw1eg
	CQIAM8DyAz4+8F0gY9P8TzxPhWbm84hcd975ClQFdh5U7r3e3YMmTFdUmXsOGXaSCLTfMMPm2xF
	TkWIih6o05n7dt55udkuP8mDsqzs/eIIUm0bQNz7pqOwJ76rhzv/ASiDmQLfSXp+s/EvwHUX3hR
	UGbIyW9urXmkZHB8NYnlQWybRkgENhoczucdJUTllxUouDLh/fxvmNDoOmDnA==
X-Google-Smtp-Source: AGHT+IHKediC199TcMSxu21acE0CN/02tK8RHMMIB+sspKStxvJN02qDARg/u2Qf3U6RMNr9mfLUwA==
X-Received: by 2002:adf:a44e:0:b0:38a:36a5:ff81 with SMTP id ffacd0b85a97d-38a8730e0admr7718927f8f.40.1736509916395;
        Fri, 10 Jan 2025 03:51:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c990sm4384653f8f.56.2025.01.10.03.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 03:51:55 -0800 (PST)
Date: Fri, 10 Jan 2025 14:51:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nicolas Pitre <npitre@baylibre.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kees Cook <kees@kernel.org>, Eric Biederman <ebiederm@xmission.com>,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] binfmt_flat: Fix integer overflow bug on 32 bit systems
Message-ID: <f946074f-60ed-455f-bcc7-4364f15b9603@stanley.mountain>
References: <5be17f6c-5338-43be-91ef-650153b975cb@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5be17f6c-5338-43be-91ef-650153b975cb@stanley.mountain>

Ping.

regards,
dan carpenter

On Wed, Dec 04, 2024 at 03:07:15PM +0300, Dan Carpenter wrote:
> Most of these sizes and counts are capped at 256MB so the math doesn't
> result in an integer overflow.  The "relocs" count needs to be checked
> as well.  Otherwise on 32bit systems the calculation of "full_data"
> could be wrong.
> 
> 	full_data = data_len + relocs * sizeof(unsigned long);
> 
> Fixes: c995ee28d29d ("binfmt_flat: prevent kernel dammage from corrupted executable headers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  fs/binfmt_flat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
> index 390808ce935d..b5b5ca1a44f7 100644
> --- a/fs/binfmt_flat.c
> +++ b/fs/binfmt_flat.c
> @@ -478,7 +478,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>  	 * 28 bits (256 MB) is way more than reasonable in this case.
>  	 * If some top bits are set we have probable binary corruption.
>  	*/
> -	if ((text_len | data_len | bss_len | stack_len | full_data) >> 28) {
> +	if ((text_len | data_len | bss_len | stack_len | relocs | full_data) >> 28) {
>  		pr_err("bad header\n");
>  		ret = -ENOEXEC;
>  		goto err;
> -- 
> 2.45.2
