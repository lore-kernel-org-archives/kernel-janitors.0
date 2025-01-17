Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2983E1F560E
	for <kernel-janitors@vger.kernel.org>; Fri, 17 Jan 2025 05:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737091559; cv=none; b=gCZTRTFBdFPftoY36eiVVvkQolRrLAI/V6pEaIUVXfEYkMMU2fRFADJG75K4G4AU08bxsx+j5IYnSFGK0hokqC1Ld5Q3MVLIl0QS51YtlXiT0KJZp1qH8vZfN3/vPPe7nXtGvnm23bk994+PJKonEgZnq1cGlSyOdkJRn+x0JWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737091559; c=relaxed/simple;
	bh=DGgHReRoxV/+DmamGVoxWAyOfGnMynXqub0Abuj3F4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4v/BncUfUZEHZ9FukKgkKU80+yqtHF+udc50gPGfOS5StOQyBxVLvLreap2cViyTtnZzdfaSp7hZ23BTMHnzyO9+62nH2AKgVT+O4lJFua+DNVboBJ10a+HeQMjkfbzuF7aeCw4/2PinmLGp3amoB5MEnmCgXm/I/feo87f4H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PSsaLtcp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PSsaLtcp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso10453005e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Jan 2025 21:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737091555; x=1737696355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pgp2+IMXxJqntfEcanaBoZCtUVslmuF+HfybjYKMqH8=;
        b=PSsaLtcp9/7l1mCRevhmjLIT9wr1OZLjIRDhZ6mW91Q6pws+vA+aVMbeWETapsxuqt
         dBP9jVmHIiTfuBV57jkzeuFMPscfvWot5BqCfcNhxE9t8M6ppJAIaVIJtjzS0sEt5UDF
         HFe6Ib1xs9C/MxLibePOh47f3Uu6v6sKjxX/M2v9KK1LLv85qO5ZU4DQ/gVaJjMjEQ9G
         ddeZYgX3VZnX56GPgJUlB56QaTx/LAVthGxDBlsU2AoIIuBHphTryxzPVS9ey7N4R2HE
         1eiOaNXqovDZ2aMPAWFSRcEzQCZaNkkzOoEfPDhxQc5NC0hx88wLMapP+RNJDkh8/+XZ
         AT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737091555; x=1737696355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pgp2+IMXxJqntfEcanaBoZCtUVslmuF+HfybjYKMqH8=;
        b=jjTYPJzXSwsPsTfoDGeQAzU+AD+v7AEokU7iFIi6Q2GlvyTaQpu/kvxQ8pEOP98O6F
         no/BwK9aarkmRykUk7Vf8PS1ITvsalFBeazYEcNsMsr5o4V4uEXzHoPiNNT/7njE53dz
         Gz1fMyhyzUNQSdIjNivXooaj8+sOTKjeHhgsexeee1+qSbwJDIgtmrMPb/vhZxAOMEK9
         XAavqOlnKqVjpOo4v+KPB2oXiyg485Df/p/4xD/5dyzN6PcDmqmwW8JEpjycNTtCRd51
         e022rOrFDb0ydh6mv5JGBS+5UU2zHGlSPAZA+azSvmD/H5S8wLjRI2q3wbxKAhnDsbNO
         euXw==
X-Forwarded-Encrypted: i=1; AJvYcCXaC23kPaMpQ81tTydXi+bJxEsCs1jiaebGfqvMojwKEeciKo7Z52CtS5QGsPjsAazdvvoAnhhvfPMV/or9Ng0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT1iQGoSMWpFdZo7RaPeUwpWSBgNciI8o1dXO99Hzh5859PE10
	ZQUApPN4kR6Vb+yegqMz69Pv7ni0wLP7AH28XQQSKlFPBBmxtjHFK+EDnV8h3Fc=
X-Gm-Gg: ASbGnctsHrRvvCpPl6+tSxv2FZtQgRFfLdnYMkXi3fnK1w69ZOxEbisx9ldmyyUxSG8
	HquL6VfNR9M6UwrFu1Q/v046MWb8jFYA4b6ufvwrc21R5gPv2qIGZrzEk90MAaq6GBd+Z7wtsZF
	wGPaKmEcmT8+eBqji4lRmuhxTWIln5D13EJY/5RuoxazhO7mSZkGHcNWVq77JWVwAdFCfWXHqTZ
	EyOQz1DTG6/sj1Ip9QnmeigWj7mJ//kR8hnf+61w4FnOewoEvHDNzaMZM6ZPg==
X-Google-Smtp-Source: AGHT+IHv7DJAAYThC9GNwDlLUZxVW1EfKgbU1RsWLT2vIWkxB/JLRBW88SN+q/9DKAm8e5HkbQzR7g==
X-Received: by 2002:a05:600c:3b29:b0:434:fe4b:be18 with SMTP id 5b1f17b1804b1-438913ef951mr9742005e9.18.1737091555500;
        Thu, 16 Jan 2025 21:25:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322a838sm1501717f8f.48.2025.01.16.21.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 21:25:54 -0800 (PST)
Date: Fri, 17 Jan 2025 08:25:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Colin Ian King <colin.i.king@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] PCI: Fix ternary operator that never returns 0
Message-ID: <b0d6ea82-c979-447a-9e63-0dbdbf23d411@stanley.mountain>
References: <20250116172019.88116-1-colin.i.king@gmail.com>
 <20250116224944.283e14fb@pumpkin>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116224944.283e14fb@pumpkin>

On Thu, Jan 16, 2025 at 10:49:44PM +0000, David Laight wrote:
> On Thu, 16 Jan 2025 17:20:19 +0000
> Colin Ian King <colin.i.king@gmail.com> wrote:
> 
> > The left hand size of the ? operator is always true because of the addition
> > of PCIE_STD_NUM_TLP_HEADERLOG and so dev->eetlp_prefix_max is always being
> > returned and the 0 is never returned (dead code). Fix this by adding the
> > required parentheses around the ternary operator.
> > 
> > Fixes: 00048c2d5f11 ("PCI: Add TLP Prefix reading to pcie_read_tlp_log()")
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > ---
> >  drivers/pci/pcie/tlp.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
> > index 9b9e348fb1a0..0860b5da837f 100644
> > --- a/drivers/pci/pcie/tlp.c
> > +++ b/drivers/pci/pcie/tlp.c
> > @@ -22,8 +22,8 @@
> >  unsigned int aer_tlp_log_len(struct pci_dev *dev, u32 aercc)
> >  {
> >  	return PCIE_STD_NUM_TLP_HEADERLOG +
> > -	       (aercc & PCI_ERR_CAP_PREFIX_LOG_PRESENT) ?
> > -	       dev->eetlp_prefix_max : 0;
> > +	       ((aercc & PCI_ERR_CAP_PREFIX_LOG_PRESENT) ?
> 
> You can remove the extra set around the condition itself as well.
> They are a good hint the writer doesn't know their operator
> precedences :-)

Please leave them as-is...  I obsolutely do not remember the operator
precedences between & and ? and I have to look it up every time I see
it.

regards,
dan carpenter

