Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9688242048
	for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 16:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779725587; cv=none; b=fb1SAHGfGn+voO59WpvjYLU3aN+8qsyWZ2WABVAyeOjtfF7MIxq8XpAEJCsCS6HWfRLXHxP2wnV18Qi+acF/Hhu3sZfLSFx33O5vjNth4odL2XJS54kPqiciRZD2xGLx969Fc4r1wV3TTI+togzBZTUNiUQI05vkTG3hcR1hBoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779725587; c=relaxed/simple;
	bh=s5w53t4HZEfOpMWOAkkPTvlM5cQcOCdRUzSMehtyGEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fg0YZ3UMjGKSyR6HiJpErkcFh5vpfr7cPZfw25JrySOmou9tH7HxsAdaK/MV88N/WyUhefqx9AcLxQPwKoYBOZKhnF5/cfzQ4g2u78wivBdKwV2h5qi4NNJ5t9U4mUl4UxdcicC7N87KJkl1YkeK8FbA0qFoHEeo1RP4IF1pZtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kS1DMu6i; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kS1DMu6i"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-441209fb77eso6015727f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 09:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779725583; x=1780330383; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PrUkFmsyhM+H1pzZoLfPMsL3Oa/eAQefGicPa01J8aw=;
        b=kS1DMu6iT6wKVRxaPin7EgPS7Cw9/Pt3WcjoUuYVh9fpumC5IoI/6d1RkxVJfBuVtS
         VWVIpYdKK5RzWqtObG8JD5M91ESXgm9MROtxzeVHJu4FkMcK/tRAPBJOt++CjlF8bOrJ
         viTwzjeTTdLZ14eluw9HcGFfMkic6lDfqgfzxKVuFzQ+Joa5uDV30/AP6Nr0Hwx/4urj
         k37EdlUQoyANmWVkoQRyMKjYhnppCQZddKZK23UH4Fl61SX7QuBjSQAfOmN+mb7TwtJi
         hwL4PW0fyWVAsCsxD0n9l7gWFKnuFKAn5MLjiZHnFXsbvq65wC/xV2LmM3nAbrJ6LGb9
         CIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779725583; x=1780330383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PrUkFmsyhM+H1pzZoLfPMsL3Oa/eAQefGicPa01J8aw=;
        b=DeRH2Kp3b9Ph/5LfSLm8JPYpNbxLYuuJuweoYXGvHlxGeihZtePxWy6pDuSg1FAuIR
         nSkNJBwLVovMF1vXoz5l+xaHEn3sdxNpYSkBuOqz4sADYaSyvIHCWA0U0oSXp8IXfOlc
         4ntD4aRV91kyeJrHm7gruHHXlX6hUIC+qNDvOs2EADzJvskcUwpiKdSRq22VheelJt1A
         jK9mKQOfiUdxKViLz60N6yoRgy7LcwZR8pNKhvFbjTPMgUEV7gxU//ywXCt+WvtbBpPR
         W/ode3MWd2CBIZpPZhHrw5wHPULI4drEuxtqBYqcsxPK2xQxuRRiC8u4S3mgde/g1cJ5
         RGTg==
X-Forwarded-Encrypted: i=1; AFNElJ8Em9m9h1K9cFsJOaukrzpvluJ/4nIN+dURnHnrGkNmPEYF9DEQrxaq4QfUcW/tjvBqgE5cXNEydMuAFa2c63I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7QB2SQz5Ybb7ENaQzXs23gZGtQmihq6qzr9tbJWe8AXWH2CU2
	nM0b6xij1PYOqyDwB1si0TEBNFabpV7Ka7MYlFUwVzvbbnNjbpfp7U8Y
X-Gm-Gg: Acq92OFvyutnwVWX1Smw7R70wkzj7kYKIBu977087rvqChyh1MGi8w5msXq+Kj1ajRQ
	528O1IVAoXWdA+Ru6XVYpUnmfQwjmgVV8R0I/fLbwBq7cmV2ABovdOHAjCTDo91UV4csCtn2nIK
	XUcZ08bviw/UTJLSMD79ezRAZvTbTFaon8ET+rX4clThpH0Q87aLf+osZ0WhIu/QD3yj0JGFZFV
	cTCwnEPNRt4j1D8CruzE6G1L+OtxzIh4Y508OYY3J+YcPuNOiHhN8f3Obs309aFM/zy2YfCI2eY
	Vt0G4s1rgT7s9AVvBHVd2W4anjEhs4+SzQlR5oH481XB0tz9k709NmCqkBisSfX5M8DfuzS6rgh
	mrptLHZZ85MP1kbH7J9gMS56ZLEDe1RHlsGk1nT4Ooidlh2tYT/a8QIAP/x6sS9hsP1VDvZrlXO
	djmo7G9IoYeRZmJYd81m6x+CHYGaLjYxvxAQ==
X-Received: by 2002:a05:6000:1889:b0:45e:8edc:dacc with SMTP id ffacd0b85a97d-45ea31ce398mr31640895f8f.27.1779725582779;
        Mon, 25 May 2026 09:13:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d47b82sm28136573f8f.19.2026.05.25.09.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 09:13:01 -0700 (PDT)
Date: Mon, 25 May 2026 19:12:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iio: core: fix uninitialized data in debugfs
Message-ID: <ahR1CUxzMkYDwVvO@stanley.mountain>
References: <ahP3S9nOYN3pG-Fp@stanley.mountain>
 <CAKqfh0H0Z0xr4bAjctr9h95QTuEUTF1eCgBsRZVHn_KrkZZX3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKqfh0H0Z0xr4bAjctr9h95QTuEUTF1eCgBsRZVHn_KrkZZX3g@mail.gmail.com>

On Mon, May 25, 2026 at 08:17:28AM -0500, Maxwell Doose wrote:
> Hi Dan,
> 
> On Mon, May 25, 2026 at 2:19 AM Dan Carpenter <error27@gmail.com> wrote:
> >
> > If *ppos is non-zero then simple_write_to_buffer() will not initialize
> > the start of buf[].  Non zero values for *ppos aren't going to work
> > anyway.  Test for them at the start of the function and return -EINVAL.
> >
> > Fixes: 6d5dd486c715 ("iio: core: make use of simple_write_to_buffer()")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> > The original copy_from_user() code was better:
> > https://staticthinking.wordpress.com/2026/05/23/simple_write_to_buffer-is-complicated/
> > ---
> >  drivers/iio/industrialio-core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> 
> Codewise looks good but often times people will prefer
> 
> if (*ppos || count >= sizeof(buf))
> 
> over
> 
> if (*ppos != 0 || count >= sizeof(buf))

In this context, I feel like either is acceptable since zero
represents the number zero.  I have a blog about that which I have
been trying to promote.  #SEO

https://staticthinking.wordpress.com/2024/02/20/when-to-use-0/

> 
> Regardless,
> 
> Reviewed-by: Maxwell Doose <m32285159@gmail.com>
> 

Thanks.  And you're other comments with regards to -EINVAL and
-ENOSPC are obviously correct.

regards,
dan carpenter

