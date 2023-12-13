Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aXEzd3AK"
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 809DE91
	for <kernel-janitors@vger.kernel.org>; Wed, 13 Dec 2023 01:47:30 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-54cd8f5bb5cso8529390a12.1
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Dec 2023 01:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702460849; x=1703065649; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aSgX3PAlQ/y9PwkGI1/S+nZD/MIWDoeA/FX6JGGY/aY=;
        b=aXEzd3AKoQfo3zLYGJCGtHuvriB0/yjj90mxcTq2CNtvBRvSbUyJtbtjvngT/yM1QH
         5ySKpWLXO1nZjf0Nk6OU8Euoq6ujw2dGTgaBVod0CPy1CuWCjiLgIlp8/gb6RvT4zsIe
         QnflA4C5ChqsSHt7CrtaDmMQDWdyX5kWGOfsfRmyvXhEFrEtla8jPCaS+v9aeW+g6DLp
         hWjPcIwE2bqvTVBQOVMH7Y1JavKk1bpTIKvHeXZN/ey7uq5YrigkYvpEMdDQDGZR+FRl
         UHgTEL28Jsfw8HkAKNU+3f+PfAIgE6IlF4lkNg9qIet17QN8bZ2ZZjYu5UC7Xy/K0bqn
         jttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702460849; x=1703065649;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aSgX3PAlQ/y9PwkGI1/S+nZD/MIWDoeA/FX6JGGY/aY=;
        b=rWHz0cRtwyd4J60FTjRr+5rmcSgKt1FDgGgiL3m7ZA0g57Qos3fCDq628MDnGZtZLk
         gAXlfEqXjcXnxg5fTpBP3thPT4wskuZv+SUNZwMLucYOaK9bUHcoENGl7PvghqpXjU1Q
         NrSlNtWv4fpzj/VKDUbKqSURUUvARojPKeKaUKzswFOMtSL6UWf1TGbKsPWu+0S6UPWb
         N9U0WOVfgVTX3MysBqR7mtCA64GbKLojwtisez9XMtbqivf1E2T72C0XBEqo0q2auICG
         VaGii7aJJrLa1aDM2JQJveYsOBrnlO1HLjQWAbHg3iZ5WRO3DjUgs89/40E2dwqnSUbZ
         ye5w==
X-Gm-Message-State: AOJu0Yz3M2w1JUGgD0k3QvxZnIgZZ8NT92VZLdmLR53T73EOximIiYbS
	xUsCQ5rl8LUshK8YdT539v7GEQ==
X-Google-Smtp-Source: AGHT+IF1a3/GekoPgQ+7ZrhVIzXjagRHGpaEFn7SdjzyCmJ1k1zS4HmcixgzuX3JjFjBkAtOMVKfMg==
X-Received: by 2002:a50:aa8f:0:b0:54c:4837:7587 with SMTP id q15-20020a50aa8f000000b0054c48377587mr4658455edc.51.1702460849026;
        Wed, 13 Dec 2023 01:47:29 -0800 (PST)
Received: from localhost (h1f2c.n1.ips.mtn.co.ug. [41.210.159.44])
        by smtp.gmail.com with ESMTPSA id j17-20020a508a91000000b00552148d00a2sm480954edj.41.2023.12.13.01.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 01:47:28 -0800 (PST)
Date: Wed, 13 Dec 2023 12:47:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Abhijit Gangurde <abhijit.gangurde@amd.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] cdx: Unlock on error path in rescan_store()
Message-ID: <dacdee7d-48f7-44ff-a494-ef7d912338a2@suswa.mountain>
References: <8c79956b-bf8c-4511-97cc-a16833a0630f@moroto.mountain>
 <94c5f197-9459-40fe-9c34-06359779a51a@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94c5f197-9459-40fe-9c34-06359779a51a@wanadoo.fr>

On Tue, Dec 12, 2023 at 06:53:13PM +0100, Christophe JAILLET wrote:
> Le 12/12/2023 à 10:20, Dan Carpenter a écrit :
> > We added locking to this function but these two error paths were
> > accidentally overlooked.
> > 
> > Fixes: f0af81683466 ("cdx: Introduce lock to protect controller ops")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   drivers/cdx/cdx.c | 14 +++++++++-----
> >   1 file changed, 9 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
> > index d84d153078d7..f4f9f0c88c09 100644
> > --- a/drivers/cdx/cdx.c
> > +++ b/drivers/cdx/cdx.c
> > @@ -572,12 +572,16 @@ static ssize_t rescan_store(const struct bus_type *bus,
> >   	/* Rescan all the devices */
> >   	for_each_compatible_node(np, NULL, compat_node_name) {
> > -		if (!np)
> > -			return -EINVAL;
> > +		if (!np) {
> > +			count = -EINVAL;
> > +			goto unlock;
> > +		}
> >   		pd = of_find_device_by_node(np);
> > -		if (!pd)
> > -			return -EINVAL;
> > +		if (!pd) {
> > +			count = -EINVAL;
> > +			goto unlock;
> 
> Unrelated to your patch, but should we have a of_node_put(np); here, on
> early exit?
> 

Let me resend this along with a patch 2/2 which adds the of_node_put().

regards,
dan carpenter

