Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF1B215F4A
	for <kernel-janitors@vger.kernel.org>; Wed,  6 Aug 2025 14:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754491151; cv=none; b=e56FU6M0w3sLBfLtUYrM155Kw76b/y9WbKmriiSW4NNKJApqe5AiYndSGsHed7X7czHat17e740ElSOIcg8UNbHbKE82Hl5N1VkpoiBP7kVw8MinIEm1rEsDg2FfpXDgUtzYlwVNQzQmGOPOZ4laTS6ZELB4LxMwhBoRB76HvLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754491151; c=relaxed/simple;
	bh=YJ6mdEgeBoXcjvgJA/CR/fmtrg1zaUe1je1DWvu5qcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFfnmjuMoevadi6nyPOdAw3puvzMMBpc0XOODpovOH2lBTqim0KHWURUULsH3vZjLigjStdquc8jbJvb2nooV+e3jNqpkh8WZ9hROWZq44QZpbIHgV32gSHr07V4pOau2ErFFRvsVb1XSpZwRge6ELRjBP2fozcUgNvOpNMUZw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GWVUKym0; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GWVUKym0"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b786421e36so3866185f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 06 Aug 2025 07:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754491148; x=1755095948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t3HkDKyjugPotQJhu78AmOt2Qiqge9F0DpeQ381Qjek=;
        b=GWVUKym0fCODMVtov2Htiy382ptU09zcLmRrnQzQZng39OCVTQad3dv8dta3vohayf
         ch06WjgG+bm88zVBmGc0XuWVH9HU45ht1Gz00tV0XtGcA8YsjnE5rZwrInXI9CLqv/VW
         vx3C9olGUNxjq7Mnyoyv7m+nGalu2hx+0PkLjhB/SVxG7YD7Jb0tv7dDEhak7f+lwsNs
         +ohH+xBal9kRVFOFkt4FYFwKzOy2a4t7RikGnlyUrZ1mTxGvNBY3CNJkPuedQlGA2DE2
         2p0jt2RkHO8N52ey+BUApiuXncZ3jFu4nz3C4HTkIblcSrVUh4BO1c3Yd+5Z20NHfqR8
         0DRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754491148; x=1755095948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3HkDKyjugPotQJhu78AmOt2Qiqge9F0DpeQ381Qjek=;
        b=bdnKRK97RgnNrTjgEZiY+KY6m3eZMyUjIrsHcw9BWc1I4WzECXeOds2kzd/jytM3pV
         Ivpip8J1Au2EBYZC1qJfunOrgdjqxSYE27xZsrvq+ub+xWVr7naEV+2mE1UjI4beAfZj
         x6WmHLPDq2D7UcCcXbcKTDUyeJGPQUi+ZCCR8CI5eGFLZhjYKtj31zmBXivNHyoowMJG
         vJ7CBpQ8xXUfS29jfu+arKKSz2ouFObBFKPsUOxKjnB/DyubzgCfFEk/QsUWHxcZJuPp
         w3APiijZXxUep7/ekRwospocHKGVH7VmCrrx88IoomJvdSdTLnoAd2CbHQWVxZVmsjmn
         pGSA==
X-Forwarded-Encrypted: i=1; AJvYcCUxYvboGtbuEFPBdblXCx0OLVtSIT3qScJnGmUh7tihZMhT2tzsAzL/2q4D5x72RTVxQ9vNOoAB9L3DlCnfCh8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhe5XrT03OGuSnAQUGpF9AAQhhh5DUH5Nskd3pateLh+yM3rYl
	rRpKoTLJDkTaUP5jvUee59fb5En9nIFzEcVZz81ipQTC/h2um/z+DKMZulEtRj+dbtw=
X-Gm-Gg: ASbGnctJVISHTanbF+YRF/B+ukYPPEX84xDgbq4WWg5SW6LRFGpsDE0WUVFOWs8IhN1
	2Z7dcPLGyeBrj2wSas52ngxmqz/nwqIFDvJI7NuHmC9M4i2l8OK0jTMJC8nLf4RkhKjYnPArSCX
	e1O6Dl/iC+hiXfRQ5Sx7yh6MgzEy92hA4gVoGszoV9zJ5l6BrUs8jCXx+oUKVA7A026eb9qk48c
	o4EuDgUFEGXIMYki0AAjoFIMiEUr8pwrqXYjLAHph8jTwNrlnlBmZ/57+O+LKPqJR3D3QUF9u4V
	ETyXXg2RNgbKl16CL+4IC2OxjVxJbxZt/EKdXUrMbCZgPuwaxI+EfMRGEAoqYxaI5Njj1pTIbqP
	7Y5JnqpkR2ZpAravDJS8xt8VBbErC5BDD7tlvVw==
X-Google-Smtp-Source: AGHT+IFXtbxOaD74GotqT9R0CD1sqY91sieSs3SIFRrIbH0jr4lRcbg1q493FHWof4NReZYFSRDp7g==
X-Received: by 2002:a05:6000:24c6:b0:3a4:cfbf:51a0 with SMTP id ffacd0b85a97d-3b8f41bbb72mr2459659f8f.21.1754491147334;
        Wed, 06 Aug 2025 07:39:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e583f9fcsm50543105e9.4.2025.08.06.07.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 07:39:06 -0700 (PDT)
Date: Wed, 6 Aug 2025 17:39:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefan Metzmacher <metze@samba.org>
Cc: Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] smb: client: Fix use after free in send_done()
Message-ID: <a1a0046c-f47f-4e8a-ae3c-85db58a6cb2f@suswa.mountain>
References: <aJNASZzOWtg8aljM@stanley.mountain>
 <ad2e9d94-2d95-4351-b800-627f20672209@samba.org>
 <87646c67-78b8-41c5-9b72-361cb3b733d1@suswa.mountain>
 <e291d925-bfd9-4202-b5d4-de5bf30ab870@samba.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e291d925-bfd9-4202-b5d4-de5bf30ab870@samba.org>

On Wed, Aug 06, 2025 at 04:17:41PM +0200, Stefan Metzmacher wrote:
> > > What was the test that triggered the problem?
> > > Or did you only noticed it by looking at the code?
> > 
> > This was a Smatch static checker warning.  You need to have the cross
> > function DB to detect it.
> 
> Ok, I'll try to integrate it into my build flow...
> 
> Does it replace sparse or does it run in addition?

In addition.  I find the Sparse endianness checks especially useful.

> If it replaces sparse I guess a small script would
> run them both?
> 
> $ cat mychecker.sh:
> #!/bin/bash
> set -e
> sparse $@
> smatch $@
> 
> And maybe all others from
> https://gautammenghani.com/linux,/c/2022/05/19/static-analysis-tools-linux-kernel.html
> 
> How often do I need to run smatch_scripts/build_kernel_data.sh on the whole kernel?

The cross function database is really useful for just information
purposes and looking at how functions are called.  You probably
would need to rebuild it four or five times to get useful
information, unfortunately.  I rebuild my every night on the latest
linux-next.

But for other people, I normally say don't bother with the cross
function DB.  It takes a long time to build and it only slightly
improves the output.

regards,
dan carpenter
