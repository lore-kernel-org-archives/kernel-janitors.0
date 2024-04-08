Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99BA4D110
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Apr 2024 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712570283; cv=none; b=VvOS/aDWy1fcqa9ue1xtEOG7tzdfdk67VbU4Q68xQ2tg+JP50S/mt0pEbR/K2QOjdiALo3HV3/VloOp0hYvlrArVuwVwx5DwUUF/dEKRF4/gXisX/UyBvV0sr60fj48aAbJMRJAiMTcgGvsAw3jubcpIgHjU66rYjY/Vw75yYqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712570283; c=relaxed/simple;
	bh=62xI9BC0E/Xk0AwhbbhN6+RNRrPnUXP1hM+tL/u1m5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGLW8/yuVN3QwR5mU4CYf58+35R5CoMQuCjO4lFDg7NQpHsRaOJfDhEKXPuePNBos0K0zEN7oLtv72n3Ze+hGcXu/DzvNgij5ZB9OMvrb1xHBNysaqcs5uvbRF2L6+x4QHPsTFbbNYxPeFoVlXClXHbxe4q//C8mXC2M1vtAwIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sxgDY4U8; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sxgDY4U8"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a51d83fafa8so76222666b.0
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Apr 2024 02:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712570280; x=1713175080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv7s+807WBCiP6+884Fp+Z2/jKppTCCB8106gsyIN9Q=;
        b=sxgDY4U8Oyp2toO1Z8gCuSWDWF0KU+zQoy1bktUaxNsj2knvVGHOEaLOVcdQ4mCk9y
         38dFFAZ/6af9syy9AM0qtse1g3K8b+n/GG+djnFQxeSP8ggW+rlPvDHKwVSWOQsJSRSQ
         JQOKKR5ITcMQa4QVW/9f/tVAWjh2Wq7J1pcHSx/l59eBEuYdL24Ap/uLhjlR5oEuhyht
         KziHK0nVj3wWCBwiqlFAtSX4+/6D20bWYxdw1aGgLzS2H3h9laar/KP0Xz+wiKr413K8
         nLzHDG81JEcqBc6slw1Q+uu3x+V8WCFp8BW7wfo0EzQcOjaaf2yehFXsMPFzxWoZIPs7
         UItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712570280; x=1713175080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fv7s+807WBCiP6+884Fp+Z2/jKppTCCB8106gsyIN9Q=;
        b=ZMI157PMYtMxG4YGvXHGhZwMfk4r7f7qiyPhruP3YOvW5LXnBOf7BTMwjHdVOx83FS
         nuyAf6xf5jEsfrfZm8RQUcDNFhCjqw6dnrpjckTPgZ/VajvkF+Kzji0FIAVEwcSlHyqu
         hNP3RkJlYz5IsFwJA185v3jWLdNHrtJt47CfWwQZdCxVFimoQMAnpSuP0A8W/raUrLym
         kE/1RWCJmHxFG7LEURiB6VVDTQ1NJIkUiaPIfnChC121LWI7dD1cQlw+T8s0nZRXstkP
         RI4B+yB68twkc2ovR+BeRK59xkLR8GK7h8dGw1AythtSDQHyc1GQvbv41/Ziqs6SBPsH
         FRXg==
X-Forwarded-Encrypted: i=1; AJvYcCW09Xzqi/bIVDGwjIfTTNaffhjstKoXvD5M1jFEN7SlNalM3L1EwvgccXievZ7NQZOtdH6dGrYIN+FEmIRnCBNdYynMmbjkeVBu+e72BO3b
X-Gm-Message-State: AOJu0Yy+XYSHHYu4R7ncE7n5AcQGpznARRN2oOCzqb4sbrq+D7Gj/b9f
	VgE5Xa2Dj0rBN85kuM4ShZp+79T6Be24J+jvSTTF7RtfaiN7owS5/keiZ6a1Rj0=
X-Google-Smtp-Source: AGHT+IEhY6lp/9F9/v5i0fRG2NqXdj7s4vv69fFui5HJK9MrVInM4cRflU+KYvPepQn823uaxF2z5w==
X-Received: by 2002:a17:906:565a:b0:a4e:1109:9007 with SMTP id v26-20020a170906565a00b00a4e11099007mr5506039ejr.19.1712570279911;
        Mon, 08 Apr 2024 02:57:59 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id g1-20020a1709067c4100b00a519e8c27d2sm4219658ejp.208.2024.04.08.02.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 02:57:59 -0700 (PDT)
Date: Mon, 8 Apr 2024 12:57:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Eddie James <eajames@linux.ibm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>,
	Alistar Popple <alistair@popple.id.au>, linux-fsi@lists.ozlabs.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] fsi: i2cr-scom: Fix error code in read/write
Message-ID: <a4926166-bfed-4696-bd3e-5b8e29c8b176@moroto.mountain>
References: <ee554aa1-0257-4662-8da5-1ea6be2740e9@moroto.mountain>
 <4666c1f5-06e3-2b03-993c-5d53637856a2@linux.ibm.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4666c1f5-06e3-2b03-993c-5d53637856a2@linux.ibm.com>

On Mon, Oct 02, 2023 at 09:57:22AM -0500, Eddie James wrote:
> 
> On 9/7/23 04:55, Dan Carpenter wrote:
> > The copy_to/from_user() functions return the number of bytes that they
> > were not able to copy but we want to return negative -EFAULT to the
> > user.
> 
> 
> Thanks.
> 
> Reviewed-by: Eddie James <eajames@linux.ibm.com>
> 

This was never merged.

regards,
dan carpenter


> 
> > 
> > Fixes: c0b34bed0bbf ("fsi: Add I2C Responder SCOM driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   drivers/fsi/i2cr-scom.c | 10 ++++------
> >   1 file changed, 4 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/fsi/i2cr-scom.c b/drivers/fsi/i2cr-scom.c
> > index cb7e02213032..df1e1df40332 100644
> > --- a/drivers/fsi/i2cr-scom.c
> > +++ b/drivers/fsi/i2cr-scom.c
> > @@ -45,9 +45,8 @@ static ssize_t i2cr_scom_read(struct file *filep, char __user *buf, size_t len,
> >   	if (ret)
> >   		return ret;
> > -	ret = copy_to_user(buf, &data, len);
> > -	if (ret)
> > -		return ret;
> > +	if (copy_to_user(buf, &data, len))
> > +		return -EFAULT;
> >   	return len;
> >   }
> > @@ -62,9 +61,8 @@ static ssize_t i2cr_scom_write(struct file *filep, const char __user *buf, size_
> >   	if (len != sizeof(data))
> >   		return -EINVAL;
> > -	ret = copy_from_user(&data, buf, len);
> > -	if (ret)
> > -		return ret;
> > +	if (copy_from_user(&data, buf, len))
> > +		return -EFAULT;
> >   	ret = fsi_master_i2cr_write(scom->i2cr, (u32)*offset, data);
> >   	if (ret)
