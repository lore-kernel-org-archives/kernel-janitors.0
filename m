Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE13F25776
	for <kernel-janitors@vger.kernel.org>; Mon, 18 Mar 2024 08:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710749153; cv=none; b=MT9qXbP0qSX8cv6o56j1PxLDg5iN9/TQrNIfyrIj/MrnUina3VweXGuYdPu/yxJLLwNWSAWAx0eKWgYftrgi25wS9sYvvwEvDa1BJnNNDgz3xnt5APenohUvX9RsI7in1hAvQS7XbhcDJ6bymVHZQ8wq59TVTsM6Zs0B1AHxwtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710749153; c=relaxed/simple;
	bh=xi5wwcua6lSYpDyXXRxYzCJScSbcdjnZzat3Av4lAFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDGCuXiVh+q8U8ULkvllIBEfUWIUFo3ST211tFoExKxzAjqK4+pALCrRimO6iKoT6nnAb5wPwlh2CxKJgao2G0fwTg1UgJ1tbGcb3rXt9W3bLURg53zNmlEE2y/9shHF4RknUyQAuIWKXdxdLxvBeicHTdvZupc1jcOn4An3V3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lcBOLlQs; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lcBOLlQs"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56b8248e2d8so174612a12.1
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Mar 2024 01:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710749150; x=1711353950; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ItwEhW+Elih6WOdZ654FWHRBfnNI2hxeOn7Y1OcJxDk=;
        b=lcBOLlQsJJHhrlOR8jwNpiV9pjv+mgPTwIkKuLlGvqugNHYh+I2uPNrItMz1CRZyOz
         xfyIRZM3063F+mh6QHX5uwI93yrkrvEroBqtX/w/zTJrhtFszLcZN48lNLujaLy5+/mi
         lfxm2z3DxAT0KH0LX3Rlewr6VNWYr5M7nsEV3RapNwJudHX86F5KZ5HUJmlGwAMWtaDD
         Xx2O8QOuWmIE8IEFWUr+DRWKijuIiFuTNFv+hecLxtQbpe0zwt6vfAEWhQ6ncrGCiPJg
         cg06XHoQctWVUNKbo8LONaZw2njAIDU6/01J5YjwVxGXjXrXLhQ2AMxKwq9JcX8y++5o
         9ihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710749150; x=1711353950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItwEhW+Elih6WOdZ654FWHRBfnNI2hxeOn7Y1OcJxDk=;
        b=XCJOoZgufPfwgyfAsznm67l0eXRbS2TxAojDifsCE5QNL8u2NhXPQz2ZzHvjPI9shi
         Wh+23cfTfzAfWhSFk1agXnVEU4+WFj+n7RcfQpE26t23GRzT3tz+ENDtZsGpcOuj7Ukr
         zcHd+E8iD/fAlbYkVVD8wHdpUpLOvEMkXrcbUw2nJsoyseynOcxJ+3nse/etBN8+mv1+
         jX2sbIIfzknuvY3A3hI4Q9uptmS2jAttc6r8jaIOOBAyLi4moela+ZWUukpTRwxW3y1E
         cFvdoSE6hUlhey+dCvlFBdhmyXUQMAQTyGz2rCou+pHW0jVb+2c2phLkiF6h2Wyq/eyj
         uFjw==
X-Forwarded-Encrypted: i=1; AJvYcCWBouwt0km8w3sGGONVgeafJtbwpDBhpGsg7kOWn75tPB0ZcvlrWNxjrjiEGXBKQSmDUpdYWHbNPivp4Q04C8js12smP5xyvfoHpnHy7gRx
X-Gm-Message-State: AOJu0YzSjLu+tmJw1c4quVPl0o+IGMyWmiu/CGfht2QduM/09tq7VCL3
	khB0z6WPhK9ZaZM/1YbGUe9Wfz7ezgAavWMkaMs7QWKgAXi91LFu4BIi6jnfv+c=
X-Google-Smtp-Source: AGHT+IHKtcrmJOgM+mlLfZ7Vs05DyRjA6NQDYRTKLkIuZFdj2gc0SGhwQECvBIW2kaQ3t2ReK5LFKw==
X-Received: by 2002:a17:906:5fd5:b0:a44:e371:a31b with SMTP id k21-20020a1709065fd500b00a44e371a31bmr6557533ejv.10.1710749149848;
        Mon, 18 Mar 2024 01:05:49 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ht17-20020a170907609100b00a461b1e814asm4517581ejc.130.2024.03.18.01.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 01:05:49 -0700 (PDT)
Date: Mon, 18 Mar 2024 11:05:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH] caif: Use UTILITY_NAME_LENGTH instead of hard-coding 16
Message-ID: <148f58b6-fe56-4fd2-b430-d6aa40037bb5@moroto.mountain>
References: <af10f5a3236d47fd183487c9dcba3b3b3c66b595.1710584144.git.christophe.jaillet@wanadoo.fr>
 <20240318032133.GA1312783@maili.marvell.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318032133.GA1312783@maili.marvell.com>

On Mon, Mar 18, 2024 at 08:51:33AM +0530, Ratheesh Kannoth wrote:
> On 2024-03-16 at 15:46:10, Christophe JAILLET (christophe.jaillet@wanadoo.fr) wrote:
> > UTILITY_NAME_LENGTH is 16. So better use the former when defining the
> > 'utility_name' array. This makes the intent clearer when it is used around
> > line 260.
> >
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >  net/caif/cfctrl.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/net/caif/cfctrl.c b/net/caif/cfctrl.c
> > index 8480684f2762..b6d9462f92b9 100644
> > --- a/net/caif/cfctrl.c
> > +++ b/net/caif/cfctrl.c
> > @@ -206,7 +206,7 @@ int cfctrl_linkup_request(struct cflayer *layer,
> >  	u8 tmp8;
> >  	struct cfctrl_request_info *req;
> >  	int ret;
> > -	char utility_name[16];
> > +	char utility_name[UTILITY_NAME_LENGTH];
> Reverse xmas tree.
> 

It's always hard to know what to do when the original code isn't in the
correct format.  Someone sent a patch last week which fixed a bug and
partially converted a declaration block into reverse Christmas tree...

regards,
dan carpenter

