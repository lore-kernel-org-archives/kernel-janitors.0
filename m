Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993591E514
	for <kernel-janitors@vger.kernel.org>; Mon, 19 Feb 2024 05:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708321563; cv=none; b=SLBmdqlobow2AB1AIHyWHUuJiTDksFP300mmkKTmlSRvOKEfBibMEt5Xq3CocaDJ5Sacn4OnXbP7mYaq3tSsRPvzrZRZURndnOuA3pfLau1e8abr6ELGaQzYkmx7zQ743Wz/779FqJMVfIfdpUCcuv1JDITaL7KIGcLOM+5ja04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708321563; c=relaxed/simple;
	bh=sM7/kYg3akwckvbOmZedl+YI9QqqWV+YsqY4FWr+xe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eIWWiOYGRthwakWa4qSiOMVMT+JzPL1ulkq6Mz+wudSb39dysZ25sUQLHfqPnCBaGDxgbTAXBFInek1OZpoLL0Ahpb5FleVXVeQtekS6L++jHCQnvuq7TTzVcdN8AJEKf/CoTFsbN9YIGJ/JP5wENRqEEPCqOKQpvieHf5av6xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iY/RMKXF; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iY/RMKXF"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-563c2b2bddbso5003880a12.1
        for <kernel-janitors@vger.kernel.org>; Sun, 18 Feb 2024 21:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708321559; x=1708926359; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dWOy7fC8kILp8YGaQUICy/CUH4PzJNJowUSlf/QA3S0=;
        b=iY/RMKXFZ+HjDOT5Ahnoz8vaUbkbe2syaIEVuWlsWSHZ30OnlCkpoZ7p9TmwDT7Vp/
         YHd9Sl4XxnRp5QX0dbvALtupgR3YmUdFAbdXdzUFe0QQXUpZtXt4nnIlCae5loRcTUja
         jcfGNClJEyO+b1GanOBV/B5PFZtDBUoFZ0OxQyumtvAjF+AIe7Sno9MwpK8g0kZPdmNN
         pEAS1lNAUXcESXWIDDHJbDctp3DoydPy3wOjBZeA95SWtIYQQspK4Up0Nob3fNBueO6S
         qNHoLYXahIVC4mBoBu1izcH5e/MaTODnupV0NurjuW8NdCGb1jjigPtEF6OlBr5c7TZs
         nyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708321559; x=1708926359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWOy7fC8kILp8YGaQUICy/CUH4PzJNJowUSlf/QA3S0=;
        b=kVuFCJtA4k//44n426CGEux2ViMdX7cObMv+6a0Z1HtTZd8r51sfrhnz3E5ztvdFE/
         SylV1TtbVY1FtnfICTkbWkoDaZWoAYShbsKXTE9KbkVPwMWuBvmisiOFsZ1nKf99kDOR
         sLVWXVbDMhG0LTdNvrMItvkFnor+n0SfRXKCu6gHsjDN00RVIexfLt6weq1GRVD09Ie6
         wSLux3FgDyXkquPfdHf+DcL9HE4p/DGFxDqdZAqQhnb5VJkEjogYFq1IGxVr2SX25Pox
         fkREPq2ASaT8xNrLODfVbemB+20MrIyBhSf2RfEiGB6nOJwYW0+YdZDqhXQHNbacYYLO
         hIpg==
X-Forwarded-Encrypted: i=1; AJvYcCX3HF86mXVSI0jKNc4/IDq4pbuVwAQRB4EMxaJJMigYWwMuNaVf90/gc4FEgG4k2bfOZeIX+8ALbzJDXIMwZ01Jf5aqNfbxk15PTYwDJTDz
X-Gm-Message-State: AOJu0YxcbCzJEnFaFoTYHFMj8yBPTouE0KMX0Il/9Na0lHVXACjSLhFI
	PZ6AeiEnArSmv4Ou5EN3Oc6R2chJOVigc1hnAYwtonJFWuI5CrxgE1lQK+pICgc=
X-Google-Smtp-Source: AGHT+IG3TNBd53zJ81xbVFVbF0zkMNYMQW5MS6CzLs2WFXOk2QZD2ot6Ugdot8/gGvCSUIevT9/CGA==
X-Received: by 2002:a05:6402:1801:b0:564:7007:e14d with SMTP id g1-20020a056402180100b005647007e14dmr932726edy.41.1708321558829;
        Sun, 18 Feb 2024 21:45:58 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id s1-20020a056402164100b00563f918c76asm2372735edx.52.2024.02.18.21.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 21:45:58 -0800 (PST)
Date: Mon, 19 Feb 2024 08:45:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Cabiddu, Giovanni" <giovanni.cabiddu@intel.com>
Cc: Damian Muszynski <damian.muszynski@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Lucas Segarra Fernandez <lucas.segarra.fernandez@intel.com>,
	Tero Kristo <tero.kristo@linux.intel.com>,
	Markas Rapoportas <markas.rapoportas@intel.com>,
	qat-linux@intel.com, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] crypto: qat - uninitialized variable in
 adf_hb_error_inject_write()
Message-ID: <42ad3d09-649c-4dc1-84e4-7aacd3f97ce0@moroto.mountain>
References: <193d36b0-961a-4b66-b945-37988f157ebe@moroto.mountain>
 <Zc+Z7RBFNLcnzNOL@gcabiddu-mobl.ger.corp.intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zc+Z7RBFNLcnzNOL@gcabiddu-mobl.ger.corp.intel.com>

On Fri, Feb 16, 2024 at 05:22:53PM +0000, Cabiddu, Giovanni wrote:
> > --- a/drivers/crypto/intel/qat/qat_common/adf_heartbeat_dbgfs.c
> > +++ b/drivers/crypto/intel/qat/qat_common/adf_heartbeat_dbgfs.c
> > @@ -160,16 +160,17 @@ static ssize_t adf_hb_error_inject_write(struct file *file,
> >  					 size_t count, loff_t *ppos)
> >  {
> >  	struct adf_accel_dev *accel_dev = file->private_data;
> > -	size_t written_chars;
> >  	char buf[3];
> >  	int ret;
> >  
> >  	/* last byte left as string termination */
> > -	if (count != 2)
> > +	if (*ppos != 0 || count != 2)
> Is this alone not sufficient to fix the problem? Probably I'm missing
> something.
> The function just checks the first character in buf.

I mean, technically, yes.

But leaving the last character uninitialized is ugly...  Using
simple_write_to_buffer() was inappropriate because it's not like this
code supported partial writes.  Better to just fix it all the way so no
one copy and pastes it somewhere else.

> 
> Anyway, looks correct to me.
> Reviewed-by: Giovanni Cabiddu <giovanni.cabiddu@intel.com>

Thanks!

regards,
dan carpenter

