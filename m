Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="woQXbLiY"
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 980BA111
	for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 05:46:18 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3316d3d11e1so2384585f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 05:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701092777; x=1701697577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YundCbgOqgxog8krRgkHDMLd3spWK5TLMe9KGeiCx18=;
        b=woQXbLiYHFtdrljCFAFUnWZXAYojcNIYGD8GOkeqJaRniKgMT5TZPQM33mtE9vznTt
         i0ybW8lbtZKlIg5+6YoTqAD1K9mpBFKDyO740fbbvs8cl7X45oDOS7yTd6rQ5cZQALD5
         KZN/orQQS08ZU0hmWkUvmAyKSWPVDBbhQNs5XzZHTfgoAKqUbMFIQn+NJxuVMskbS9JS
         7vy+YVf8OUKvLMzaf2ym1M7yW3k2hPshgnJlROBQqWRclh6VMTYAlm/npuNwEpxjxWLy
         F90IhX+U8URawQOn7oA8i2yGotttwr+5Fld1BYyrIS316IvdEJEtX+yumNEXJ083PPBr
         b4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701092777; x=1701697577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YundCbgOqgxog8krRgkHDMLd3spWK5TLMe9KGeiCx18=;
        b=qXT/qcFcJqJkqv8jQrEj4kmHVz3AJ7HSZtzzuI4ewktrvMTQYbBcCyGVLvaHUpo5Mr
         QVar0wSqzKfsquF76ZUE3/OG25rll0q0h+TGsoGvaz78w0/z5ovd5bL/jQYwYDefnaW2
         o1jlWvQjmarcj7CbufOlXPcgLFEvIP7+yj7VoMihi/XYFtKObOS4zn3iw2wKfL+3Z0Pb
         lKeQW2YbNZkxbBxjshisjFWM7IflM4Msi2rErfM/vvRKHgUBkG/6kpKyCUUKa6U50atW
         xyGYdmfQ+H8OnCrLFOJsQF7njBynl1JI8JC57Bn9vJsWVjx9MmpXpH29skCwH29IaDpD
         Wtng==
X-Gm-Message-State: AOJu0YyOSuZY2nXZ0cv2VYE4SHV6vJxEHiweU7ANKiHhk4hHcTDhoXhb
	w5nf/Iu1kqB0yZ+3w8ykgwxRPQ==
X-Google-Smtp-Source: AGHT+IHvZXohMRpWp9ljekBnVunFfdsN+Aw6FeyybD7055qlsh79kgqr97OPSx0yef3zaO71BUfszw==
X-Received: by 2002:a5d:64e3:0:b0:333:47e:4cf4 with SMTP id g3-20020a5d64e3000000b00333047e4cf4mr1874886wri.15.1701092776947;
        Mon, 27 Nov 2023 05:46:16 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v5-20020a5d6105000000b0032f7fab0712sm12018505wrt.52.2023.11.27.05.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 05:46:16 -0800 (PST)
Date: Mon, 27 Nov 2023 16:46:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Julien Grall <jgrall@amazon.com>, Rahul Singh <rahul.singh@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	David Vrabel <david.vrabel@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] xen/events: fix error codes in xen_bind_pirq_msi_to_irq()
Message-ID: <4e85c67c-7e3a-47e1-a493-4906cd79306b@suswa.mountain>
References: <60028de8-a137-423d-91d8-00b2942bd73d@moroto.mountain>
 <6f9c8b08-3865-479f-8f32-686f778203f6@suse.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f9c8b08-3865-479f-8f32-686f778203f6@suse.com>

On Mon, Nov 27, 2023 at 02:17:05PM +0100, Juergen Gross wrote:
> On 27.11.23 13:57, Dan Carpenter wrote:
> > The error code needs to be set on these error paths.
> > 
> > Fixes: 5dd9ad32d775 ("xen/events: drop xen_allocate_irqs_dynamic()")
> > Fixes: d2ba3166f23b ("xen/events: move drivers/xen/events.c into drivers/xen/events/")
> 
> Please drop the last Fixes: tag. Said patch didn't introduce any new problem.

Yup.

> 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > Are we going to backport these to stable?  Should I split this into two
> > patches?
> > 
> >   drivers/xen/events/events_base.c | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
> > index f5edb9e27e3c..aae62603b461 100644
> > --- a/drivers/xen/events/events_base.c
> > +++ b/drivers/xen/events/events_base.c
> > @@ -1105,13 +1105,17 @@ int xen_bind_pirq_msi_to_irq(struct pci_dev *dev, struct msi_desc *msidesc,
> >   	mutex_lock(&irq_mapping_update_lock);
> >   	irq = irq_alloc_descs(-1, 0, nvec, -1);
> > -	if (irq < 0)
> > +	if (irq < 0) {
> > +		ret = irq;
> >   		goto out;
> > +	}
> 
> Why? The return value for the out: label is in irq.
> 

This patch is full of embarrassment.  I misread this code.  I thought
the out label was in the error handling block.

> >   	for (i = 0; i < nvec; i++) {
> >   		info = xen_irq_init(irq + i);
> > -		if (!info)
> > +		if (!info) {
> > +			ret = -ENOMEM;
> >   			goto error_irq;
> > +		}
> 
> It would be easier to just preset ret with -ENOMEM when defining it.
> 

That only works if it fails on the first iteration.

I'll fix this up and resend.

regards,
dan carpenter





