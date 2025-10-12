Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3F52750F6
	for <kernel-janitors@vger.kernel.org>; Sun, 12 Oct 2025 17:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760291414; cv=none; b=oFHG2dQybqLKFTU8XWu5o/hGqoiIgF6aui7wGGfktFUtxIqjCi+50S9qz2C8JON6LUZQWoReZ70LpZf70To3xdgANerJ9zS0BljfqlOZMo84OzAn4z/BF2IXg4/Y0KpOF04QHrfLcyp7cPObnghJI1FrnCFYRbTtkEomUchfUBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760291414; c=relaxed/simple;
	bh=0XtKuLa8UiwNtFQOHtGYSF9Ae5RbWbAtQVc8rTPpTUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEaPRSNfHkNHgXaI722edBlS9aS7JKtVaJAZnGSx+YAiuDLdvc0UiGNAze+veBqJxgvnhRRntkY476akSn7xLh/U0TX9zLw8e54p4NPJXGu+sQlNd3X3dfYxr5AHcCLleNuwdEY8EEte6e3M18GymQUCN/d4Wz3w+nivOO0vyRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZfUimi7H; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZfUimi7H"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3324fdfd54cso3807254a91.0
        for <kernel-janitors@vger.kernel.org>; Sun, 12 Oct 2025 10:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760291411; x=1760896211; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KG7cZkr2V/oLoitCh7Ph/07kt3ygxpCQRJaIzYce2jQ=;
        b=ZfUimi7Hpkun05Xe/cPHRo5tfzkZtNzLlFfCUj1gbO6OQRuCrlmqakPJ6ZfEI9aB/X
         E/tDQCRiyYyLgtY6SBDyTjTa9XY0h/jWTbb8NG5v/27gIBXCniKp3zhpPko6Dma+Nfsh
         ts044QQnOEIxhfj865cGBLxnxDmfFYl7GCr73fas6YYhp+7lKzqQVXOjXl5deuhad7kD
         Vw1832uipXDofqs/97kbGLcHvDvNSRHNEXI0MFdoRR0UK6YKyNDpfJ0Epm4+dsWmGZRe
         ypm+u24hapuyY8stJu3+aec50PJOAtY0AvPp5U+olSq4TevAmQWnC60R4dZtcbA1Jfp+
         e13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760291411; x=1760896211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KG7cZkr2V/oLoitCh7Ph/07kt3ygxpCQRJaIzYce2jQ=;
        b=q/4vmzlvBjvpORVDd+lpsY3h9zaR1BJLh53YI7lQS/5sjr+/3tJNHmxygDVPkcTRc7
         p383gp2xwQzlLnKNtVcLQngu+TIsB3jCoiK+oDulTQOPvgYbMWm2ETVKOsa2atwNnQG+
         0BfWimKQJQIylsaK7rADT55oJUI8cbvFMWm2xcWXkzGOllyYQweEBERPzDZ/dJGMyzdx
         LoYHzuwXIQDykkQ+lVvLqChqszQkuTAOov8Sl/Q0IrysCdkwyfQ4OJmAGUWZ4ia1ScbZ
         gEKfbwwv70MSdf/hCkVjzTfWBmol/KTWfYg7oybl+2TEg6jto2/fAS0twMl96ZSCYOZT
         uUhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS39S570Sw34Jbz7Eb7CsC3j7g+yQ+7ap6YqiOMZM/ln5N1HKCekWBZUjRLUuS2nMUzbzPcwtzs2m7P54Qbak=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4OdTmGwng8b8amDQfC2dmnBRpV5/Bb70mvzh8Ukg9yH3HpHE2
	kcH5I6rZME09Ne5ZWy6FfH3rxnfb0JhBV6Uwr4mYmDSFSv5AWRzwwtV3
X-Gm-Gg: ASbGnctDQ7eK/IcwIKtlNyTOFMvZR42JYKKiffSU3xILFehcDs1uafzYbUa1UUA3rq9
	JMbwfwfxno+VZb4hjblg8x4XpZvLQar+NNg2FjZY2eYK8QlFApAFlt+jhopS3wd0QYo//jSwbB4
	1tRBKJwyglJLLX9lVp9GG99Q6FvXskDOkgwJngXtd7EfV0busm0b46ky/zkRNtol61l0uHjKkXq
	PneO2vnS3fMVOK3RgmOZ4nG9kSW9Q9ksWma2PULkY0Iv2Kk0uTCSxC+/DQRGQxdfEUnugeM5BT5
	F35+drV4Ts3AXPYB7XDiU9L4VnvZOyrYJJBtU+2RxekTtvnIMOg4kRycOvOeY7PAwCUYTRxh+74
	X8dPOzN2NIMIUsxPDFbiuBe7fE0oKAf8aqxkBk1dBK77owJTiAepgGIxlSHgirr4C
X-Google-Smtp-Source: AGHT+IFPUnweijrn2pOw98DIoWtnaMWpi9PLMftd6tmmurmdLN2gURd0KnujjCj0/eqqy8Ofu8hbtQ==
X-Received: by 2002:a17:90b:1d89:b0:330:797a:f504 with SMTP id 98e67ed59e1d1-33b5114d664mr25165948a91.3.1760291411356;
        Sun, 12 Oct 2025 10:50:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626d15e2sm9407269a91.21.2025.10.12.10.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 10:50:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Oct 2025 10:50:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Cryolitia PukNgae <cryolitia@uniontech.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH] hwmon: gpd-fan: Fix return value when
 platform_get_resource() fails
Message-ID: <917278e0-cb6b-481b-8d1f-04b693668273@roeck-us.net>
References: <20251010204359.94300-1-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010204359.94300-1-harshit.m.mogalapalli@oracle.com>

On Fri, Oct 10, 2025 at 01:43:59PM -0700, Harshit Mogalapalli wrote:
> When platform_get_resource() fails it returns NULL and not an error
> pointer, accordingly change the error handling.
> 
> Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Applied.

Guenter
