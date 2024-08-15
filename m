Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F41210198
	for <kernel-janitors@vger.kernel.org>; Thu, 15 Aug 2024 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723713913; cv=none; b=jy7EIbneRgKJgnaSGNJPwkBNMkV2CK1F5kvO059lySBNsT0WXgQMxde34uQhxsDK7I5fSlKElBWrkQVMueE35c2FLn7NnvmK69ZlPQMiTTA3ez/5vLs74B9gAdxvlNlZy1voxcXIvflI6kRsH43oO6RwcDntjOkr9qLEsgbKQGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723713913; c=relaxed/simple;
	bh=g/lyUWU8eCPaBAfe7GWY+aklIjDnUSlq0pYrPSLfBH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IugUUCP8z4nUCXm4Av8y8YW0w2GfVbpxPKf4zHt2kYXkUOg4cjiMrOrwll8CYjg7awZMyb6cOI5h8cjdnivJbMMFZT3ITpPPdgpggG3jZUVUhjb6m44RqQUvBBD0LJtrQl+vHSEKXCNkJ70p7lihvY9nrfYpUATvr4ix2tLpzSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W03e3rnW; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W03e3rnW"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4280b3a7efaso4309295e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Aug 2024 02:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723713909; x=1724318709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GIRH8ZYT8hEH2GbZtKPw+s8BGj/6k9t0nmVaDj+JHRA=;
        b=W03e3rnW/HgTS1NY2F1u5dD8MRAA1C+JCTjFBJDdicpnyXxw5Md/4ncMhOc5oOxCCj
         6PfdlTaJjDi1SdSx2BgFz5ByhBLEdF+YvdT+kft4hdy/RkvF9l+9wYO+kH+DMjnnnvb5
         YOkQ3Ov1562yS5mhVLPBNRS+qd8wXlcKuPILA6Agf3wbIXBDdxMbgaJWG8pEd++ysE+y
         6aAC2zN5iNt0vEUg0jpPGQX4mAPhaatge3JL5lheDaG5X9w4Yef5lVhZJlim/C0jt90w
         sTHpbKgU7kDx4MOl9jzZgTRK18ufg2P0we9HRiai3kvoYsY5gFZBePJyGEHMfVvS5p84
         pDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723713909; x=1724318709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIRH8ZYT8hEH2GbZtKPw+s8BGj/6k9t0nmVaDj+JHRA=;
        b=MH02P7rloUz7jYqULso0IhXr0poZLxwbxWbATMqzUfdmfD6XLMUQf/YlucUyyhvIr9
         C+kYAnt/qiJl7RodcKHfKSqNhkvsVZI+O8Z5TWit8THAsSIBmIkCcv31rM2BNENpFsjN
         lnuFhh9woOOtbm31pfEw+FZwL7Yq4CKYIV9rYxtV9Z/KBqXfW0z0wo4TCJoWKB5Iq8Ee
         1sOgEfatMg76iBYUMdHZ8IDvWWWbOOmdjV0aozCo3HebuNgPl09IAB+EqJOm6jBHvCrD
         vJCNwgcFPNvwh5ef8CVQFnlJJcz3wWFEHhHoI1Z+FAhrbZP32eQZ1HI0ntJ4cl1jvF0Z
         Zf0g==
X-Forwarded-Encrypted: i=1; AJvYcCWHciNVbTvH3ardlGU60ZrR6wup1usuDGCsmCad1vD8YOIQo+U0naya97P0voMjnrLxwPw8xAxBHwFa+IUSrdhsic+wFXJH4F6vaMbLiM/c
X-Gm-Message-State: AOJu0YwIIkK3NoLiGDwRA2r21hwvMgUO1mDiLducNax3eI+HZ6/IwJwD
	Lv5aEncbkFfXj6lenrU8xPmZwiLEFw72sODsuS4KKGuMajmSf5+IPfpSNfwlzAk=
X-Google-Smtp-Source: AGHT+IE+tPJUHOuuXvabrngdhrbZZWdr80Ttb/0EIb25+QGq4bWEGFirvdOTImNxC7SQrW407I5RNg==
X-Received: by 2002:a05:600c:4f45:b0:426:5b29:b5c8 with SMTP id 5b1f17b1804b1-429dd25f6camr34903405e9.28.1723713909406;
        Thu, 15 Aug 2024 02:25:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded71ef0sm42739315e9.36.2024.08.15.02.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 02:25:08 -0700 (PDT)
Date: Thu, 15 Aug 2024 12:25:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Amol Maheshwari <amahesh@qti.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Sukrut Bellary <sukrut.bellary@linux.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2] misc: fastrpc: Fix double free of 'buf' in error path
Message-ID: <a301b77e-b833-482e-afa1-5306bd8fc8e7@stanley.mountain>
References: <20230602113602.1271695-1-sukrut.bellary@linux.com>
 <168656748193.162074.17313550564907901438.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168656748193.162074.17313550564907901438.b4-ty@linaro.org>

On Mon, Jun 12, 2023 at 11:58:01AM +0100, Srinivas Kandagatla wrote:
> 
> On Fri, 02 Jun 2023 04:36:02 -0700, Sukrut Bellary wrote:
> > smatch warning:
> > drivers/misc/fastrpc.c:1926 fastrpc_req_mmap() error: double free of 'buf'
> > 
> > In fastrpc_req_mmap() error path, the fastrpc buffer is freed in
> > fastrpc_req_munmap_impl() if unmap is successful.
> > 
> > But in the end, there is an unconditional call to fastrpc_buf_free().
> > So the above case triggers the double free of fastrpc buf.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] misc: fastrpc: Fix double free of 'buf' in error path
>       commit: 5b3006fffce89706a12741d7f657869ca2be1640
> 

This patch wasn't actually applied.  I'm not sure what went wrong.

regards,
dan carpenter

