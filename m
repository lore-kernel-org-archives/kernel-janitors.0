Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38E313D638
	for <kernel-janitors@vger.kernel.org>; Fri,  9 Aug 2024 17:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723226019; cv=none; b=bFGNAU8ya0hsuFPPq2xkMFeAEg2WimPbTVb4W3PHoX0ikLN8l1DaKuXYUFAxJxl6zOJoxJBaltRYOBeBdEd4oaPnWSdwc0TFUml0mN5eC2km4hTGvp5AjV6knrq2GpmAn3M1aydOnPrbNGEQQwOHlnPamnZSyoHcEk4UhguEg3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723226019; c=relaxed/simple;
	bh=7Sn5zTLeILz79ErK8b/F1DbmZgWmp91sN0qPXv3ZHh4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=d8tVoVi2yZLOd5Lc9R3h0+jrR8gavFD6JBTbRHDCunSP6h1idQnIe0bRchz7LbyCnN16IG4Y+3hp83ngzAU+NCBgnClzoVQualJdC8lB+xfMeedXdvJHqUpl7Mv+j4d3nlE/NY3rz7zAbyu6w1/cnWUpSQXHDqKLJWMJgTZQf4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gHWoZlmY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gHWoZlmY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723226016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=noMRONJmEnphGIGG6XXEoyySIPmdg6oUrywJynfzqkw=;
	b=gHWoZlmYa+luZEichI1vyMDIvBNMsHjXr2bCbvrRj4g9dao+nCkKiWSKMqkYHR5an0Q5HS
	IsfH6Xa2ZJwFQzm1/8R27xl+RnfKNvA1Tm4sBm51+IcBGIF90eUYCO4URdaHsJXBA/ufp/
	8ETBKOEXrJyPmV7IbIlwl6/niVV5Zi8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-ZZ8xBWLdN6qYWQuJyxV5ug-1; Fri, 09 Aug 2024 13:53:35 -0400
X-MC-Unique: ZZ8xBWLdN6qYWQuJyxV5ug-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6b7a6d56e53so41025696d6.1
        for <kernel-janitors@vger.kernel.org>; Fri, 09 Aug 2024 10:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723226015; x=1723830815;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=noMRONJmEnphGIGG6XXEoyySIPmdg6oUrywJynfzqkw=;
        b=V2r1f3hT4NzgyuN0FVlQvX3c8sz5/Hw3XH4K3Np7FUSU49Oquj12LGX7ThBGAskGfk
         5lt7aPmNljwqljb/jBagW3YTs6vVhM6wUtfPvfKVy+jhPVxMaTW3q+HQ8Q2Vzp2zms1e
         /MuQr+bjJRWmvhIlsRdo4PFxjoKv0PxccNncUEAJro9Gnn1IKJueEZgMszMfrnFUU6Qk
         +97lGaWpboT9NKb9n8yFndmJrf5N613nNiwRumSr7PgdstppybcIwKMA+gMOVIlSJqY1
         x3+P42xSB/Qmc7XJVrscHFW4dzcAKcrV5IYkA0a5kgRLGOr6ZMjFIo0krpBLYNOtydId
         sERw==
X-Forwarded-Encrypted: i=1; AJvYcCXxElbv9hel3tkv6p0odBHpktJiWeuCnVXxEwN4L+DTIVDs/IdaLzaKElnMvuaiPQcFT3REEuY6cJObltKu+IkGEHbJMRtrNIB6KWxNeG3M
X-Gm-Message-State: AOJu0Yw3yQOSEEH9MgkzsIODWXs7rYkrWBAtIQGPrxcWHQotvijxtIVy
	oWkj4oxx/mw+IoC73UzianJIz8p8AcXxn1swYyIBLaygb7QAuadZLlB3Ik+pTG7erZEgHtAlofz
	72MMVRIewydrnuiVe4KDQtBTecHw4gOL5V1sFVc48m2R1ZKgq7Gabz7xNrcaBNyUFLQ==
X-Received: by 2002:a05:6214:3987:b0:6b5:81ac:6b84 with SMTP id 6a1803df08f44-6bd79b628ebmr35449226d6.14.1723226015087;
        Fri, 09 Aug 2024 10:53:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9OGtq7qQAsDR9pVVwwXR0QjSLhgmC6ppwwOV1ZYvAe5OWF9se9U79Zo0q8ynY3kCnoAc//Q==
X-Received: by 2002:a05:6214:3987:b0:6b5:81ac:6b84 with SMTP id 6a1803df08f44-6bd79b628ebmr35448836d6.14.1723226014706;
        Fri, 09 Aug 2024 10:53:34 -0700 (PDT)
Received: from fionn ([142.189.102.234])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82c5fa95sm298906d6.6.2024.08.09.10.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 10:53:34 -0700 (PDT)
Date: Fri, 9 Aug 2024 13:53:33 -0400 (EDT)
From: John Kacur <jkacur@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>
cc: Dan Carpenter <dan.carpenter@linaro.org>, 
    Daniel Bristot de Oliveira <bristot@kernel.org>, 
    "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, 
    Clark Williams <williams@redhat.com>, linux-trace-kernel@vger.kernel.org, 
    linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rtla/osnoise: prevent NULL dereference in error
 handling
In-Reply-To: <20240809134133.751723e5@gandalf.local.home>
Message-ID: <7ece353a-36a6-6154-97d9-b255728b9807@redhat.com>
References: <f964ed1f-64d2-4fde-ad3e-708331f8f358@stanley.mountain> <c73c51ae-99da-793a-6dcb-2fbc6871261d@redhat.com> <20240809134133.751723e5@gandalf.local.home>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 9 Aug 2024, Steven Rostedt wrote:

> On Fri, 9 Aug 2024 13:34:28 -0400 (EDT)
> John Kacur <jkacur@redhat.com> wrote:
> 
> > On Fri, 9 Aug 2024, Dan Carpenter wrote:
> > 
> > > If the "tool->data" allocation fails then there is no need to call
> > > osnoise_free_top() and, in fact, doing so will lead to a NULL dereference.
> > > 
> > > Fixes: 1eceb2fc2ca5 ("rtla/osnoise: Add osnoise top mode")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >  tools/tracing/rtla/src/osnoise_top.c | 11 ++++-------
> > >  1 file changed, 4 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/tools/tracing/rtla/src/osnoise_top.c b/tools/tracing/rtla/src/osnoise_top.c
> > > index f594a44df840..2f756628613d 100644
> > > --- a/tools/tracing/rtla/src/osnoise_top.c
> > > +++ b/tools/tracing/rtla/src/osnoise_top.c
> > > @@ -651,8 +651,10 @@ struct osnoise_tool *osnoise_init_top(struct osnoise_top_params *params)
> > >  		return NULL;
> > >  
> > >  	tool->data = osnoise_alloc_top(nr_cpus);
> > > -	if (!tool->data)
> > > -		goto out_err;
> > > +	if (!tool->data) {
> > > +		osnoise_destroy_tool(tool);
> > > +		return NULL;
> > > +	}
> > >  
> > >  	tool->params = params;
> > >  
> > > @@ -660,11 +662,6 @@ struct osnoise_tool *osnoise_init_top(struct osnoise_top_params *params)
> > >  				   osnoise_top_handler, NULL);
> > >  
> > >  	return tool;
> > > -
> > > -out_err:
> > > -	osnoise_free_top(tool->data);
> > > -	osnoise_destroy_tool(tool);
> > > -	return NULL;
> > >  }
> > >  
> > >  static int stop_tracing;
> > > --   
> > 
> > Although your fix appears to be correct, I wonder if it would be better to 
> > create a second error label, such as out_destroy_tool: as described in 
> > section 7 of the coding-style.rst
> > 
> 
> There's no reason for that. It's the only error path. That is, nothing
> would jump to the original out_err:
> 
> And for a single error, an if statement is good enough.
> 
> -- Steve
> 
> 

Ah, right of course.
Okay in that case, Signed-off-by: John Kacur <jkacur@redhat.com>
(applied the patch, built and ran)

