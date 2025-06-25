Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F91C33086
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 18:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750875568; cv=none; b=EAXllW0DFbNtjuqqvr+Vd58Wkpy1cg0b0sbkcbvr7vYKjWyjS/kUFniK7YTilQ7wJewq+ZBkM980AbTpPpWzBlNyFhJUqGJbgV62X4uVTg+AkHZCDq1bJbB2J+zv+9YrehXDmYRvWpX706QL04GrqZP+4zycIeCRB2auXQ0x1l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750875568; c=relaxed/simple;
	bh=Jfj5qnXFugsOMh6HpU5RjfMH6+e8axtkDbqBf4lvN0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXRYucrShUnqcLaw0KouLiSh9DKXHAccI0/DeEezxZPU8nFTy/a7ro0Z56AfJTShncB/ZZ0GweiuOhyxhvOj55MlnMSZqp2jtE2d6CLiahDzNXjiFI63XlESK+sG7II5RCtyA2BJ2E6ehi71nSNwlO7ZlP48JBqhHPCwg87HBi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gIBUPjQ9; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gIBUPjQ9"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-404a5f4cdedso60759b6e.0
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750875565; x=1751480365; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Dm5388ZZrY1U4+efN8p/OTMRUgs76Nb9FuLZ9jSeOs=;
        b=gIBUPjQ96a+Lg9983NJrNYvY2HJ1SedKuihBTsBolYzOwcq2A9pgJ8PNSNt4QEb3YA
         qBXHsJAXFKWdLSaflPUayl9dbT5IIC//HQqS3WLhWgJLPqT1477PSgpMTFpfqUY4SLBd
         wmnHP4cIf6cnftPnhXnVSKZD2vd0y7wwq3iRoQJs6Ctdbhr3bi5EI185KfYupuUMUjBo
         Lo/AeDzdu8WOgxl53zsxSujFt+WomBWmUUR83ZIpvIm0wpfokOvIzNkUab8MFd+RMa0G
         sLmyfIkwsX0eeqsDFIM1JsHLD5ON2Cex/rfttEz88oTRsUbK8qAgmI0Qna+l9N8EQify
         SqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750875565; x=1751480365;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Dm5388ZZrY1U4+efN8p/OTMRUgs76Nb9FuLZ9jSeOs=;
        b=gj6dk/xFlJaz0Apg1hRPr52ll4UK6VnLLZYVe8vRGLd4PRHV3akNgmlik+XX9RbePl
         R9vJie01iGgd+qUXapzfy4KxxxP73MVP3SOmNYh0n6f4d3Esj0ZANtXY/JAQdpAMFeTw
         feTEhqVACc8Iw7BPJ2MD2n9K/NaZ+jVRkRnpUXHHH1aYRDDcTHhWBpOgLTIN4pXCK+mp
         ijNTalCFfIH/TiKG9BKg0VmGbrjH2JeHfSzPdPE3UfB1M0NH7hF/7MFI11fELLmclBj1
         AvNtPngB18msHFc/HH7Q3+v44OYCU6WOKBH5Gsmw5rvRe4rFPR7YLj9pOXky6B5Sc6gK
         80Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWkTNHpYE15wZ89zRQ426wJWzhMJWLi+s8H7rw1YBEl26aRpDVgsed7fzJBqvlO6ExIr46W7neFBo7Y2PpoznM=@vger.kernel.org
X-Gm-Message-State: AOJu0YywLEFDVC6V0Zvy3Al4AB/S/TATmSqme1eb2TNLjTZhfVCnYvnQ
	ozD5bsbXssPg0T607UrTa7P+zfbGsFjbhk2KgCVoBp4SphoRIHdZkKjOU93yOz5AEsc=
X-Gm-Gg: ASbGncsz4+90ZTrqMadTKMO6cRX4vr8AT8enIchogZTY90wmEp8F9MHJsZWCOWtZ1yH
	5CD+KLUcYdEuwRZ1R0cTmtkUTm5S6z8wyB9f9osomoWyTCcrmjXeFbwmaBQD3fZ/4vHnF0Lc9VU
	qK13QjStx111ITucnecY4O55DuUs6nBHMvZm0NYh5SDNgiRng9co7zIHfq19WpBmJcNlSfiDyvk
	c4s1vElfjUDFxED9wpCPMZSpZZ9m7x3v6L03sL2RMat2HcYV81O2JDoPrkzFUTSQb7BxGKkmckU
	3+3xxDBXqk74M0jGpBDAQm0wYqb03xvKkc9rdBTk/aqEOcuzsb+OXfKze9ADnSLRKi0=
X-Google-Smtp-Source: AGHT+IGyEXNA75F1Qnqm4F8gyjHFHlyO/fw4ijh8dQyLEguVkILpGruCyf60HTw4fIUAOctXuX74UQ==
X-Received: by 2002:a05:6808:8204:b0:406:6a21:527f with SMTP id 5614622812f47-40b05c75308mr3205199b6e.35.1750875565621;
        Wed, 25 Jun 2025 11:19:25 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3ee4:904:206f:ad8])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6d22c23sm2280631b6e.42.2025.06.25.11.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:19:25 -0700 (PDT)
Date: Wed, 25 Jun 2025 21:19:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Zaid Alali <zaidal@os.amperecomputing.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>,
	Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	Ira Weiny <ira.weiny@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 next] ACPI: APEI: EINJ: prevent memory corruption in
 error_type_set()
Message-ID: <757b5117-a865-4d31-b566-248048f87b29@suswa.mountain>
References: <c71e7ba6-f127-4f49-acbf-20063dd26553@sabinyo.mountain>
 <ks34mfmv2vhwojpxlzv7tyordcjdo6zclcflplvs2wsl6gkbn5@3v5kguelmita>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ks34mfmv2vhwojpxlzv7tyordcjdo6zclcflplvs2wsl6gkbn5@3v5kguelmita>

On Wed, Jun 25, 2025 at 08:04:14PM +0200, Uwe Kleine-König wrote:
> Hello Dan,
> 
> On Wed, Jun 25, 2025 at 11:34:38AM -0500, Dan Carpenter wrote:
> > The "einj_buf" buffer is 32 chars.  Verify that "count" is not too large
> > for that.  Also leave the last character as a NUL terminator to ensure
> > the string is properly terminated.
> > 
> > Fixes: 0c6176e1e186 ("ACPI: APEI: EINJ: Enable the discovery of EINJv2 capabilities")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > v2: I messed up the sizeof() calculation in the copy_from_user() and I put
> >     the parentheses in the wrong place in v1.
> > 
> >  drivers/acpi/apei/einj-core.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/acpi/apei/einj-core.c b/drivers/acpi/apei/einj-core.c
> > index d6d7e36e3647..2206cbbdccfa 100644
> > --- a/drivers/acpi/apei/einj-core.c
> > +++ b/drivers/acpi/apei/einj-core.c
> > @@ -826,8 +826,11 @@ static ssize_t error_type_set(struct file *file, const char __user *buf,
> >  	int rc;
> >  	u64 val;
> >  
> > +	if (count > sizeof(einj_buf))
> > +		return -EINVAL;
> > +
> >  	memset(einj_buf, 0, sizeof(einj_buf));
> > -	if (copy_from_user(einj_buf, buf, count))
> 
> I would add a comment here to explain the -1. It's in the commit log,
> but that doesn't help a future reader.
> 

Sure.  I can add a comment.

	/* Leave the last character for the NUL terminator */

> > +	if (copy_from_user(einj_buf, buf, min(count, sizeof(einj_buf) - 1)))
> >  		return -EFAULT;
> >  
> >  	if (strncmp(einj_buf, "V2_", 3) == 0) {
> 
> Further down there is:
> 
> 	return count;
> 
> Is that still correct given that you read less now?

Yep.  If we don't return count userspace will try again, right?

regards,
dan carpenter


