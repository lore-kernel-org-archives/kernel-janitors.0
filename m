Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70F0208AD
	for <kernel-janitors@vger.kernel.org>; Sun, 16 Mar 2025 14:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742134862; cv=none; b=YQyKGQ7v+0+l7upjOxOrkQ5i1ekJ5NQXRxqdfH6FwY3JucDNdMdbyioBJ9od9X1IO5S4sQRIWcSF534MN2ze0ZuHegJrKYEDesDNT9m0ZePYDqcQ9D+QUQpGjcjgMkbv9C2NHbN0kiC3cbHBIIOHRPz8oPTkI/K0g1kA78+43Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742134862; c=relaxed/simple;
	bh=aX15elzBfzM4qmYjRk4JQXVRSIns/ntJViqVRDf2BOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIrltCuirCii3CiYLi6Ow1wjPLOw+uoroC96VB9chJ7HI2sPi2IQ62c1vpQa8hogAVcs4Bc8RuaJ8bhshXqsSuXOYn19u30gm8PwSBX9fQ+JwxWB0gDwlgjGvh1omyv1JEIZBZfo1BGFVYPDvUBABgVc2S/ZhooIr7Q4bdVwalo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jmc79cY2; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jmc79cY2"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso12861255e9.0
        for <kernel-janitors@vger.kernel.org>; Sun, 16 Mar 2025 07:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742134858; x=1742739658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JUBU31zWgTKBtgMae2gOeiKWDb462tD5YrmtMJoO2xs=;
        b=Jmc79cY25+MUCYmr7DJU+PXm3rTW/lEYJbnBa1p1u3jamrXUexEr58R30Q4+fMEAE0
         /7muLwVMY8MCttKIA0xTLb6E2Jbn+AdjpjjkCp3mFXixi8EgPVuDS0HBWeh/6eObQ+UK
         hTPeIcNo5jYBsEoPhlkXYykCQ1uI6kzUevsQGpbC86nEHWzhBKzeSez+TIjQ3+GCzrxa
         2qC7yFuzwOLZzujXSHJ9b2Z/w8hG5Yp5OwVI8F1SOTNqXALGWR26TxXwOemQW5s1CLSA
         TK9XimT+w9eEyxOkAc/W7L2TJ3UlAIXgsgzCIzgmOBtKJ+yulZNuRiOkoxupX05vXH8v
         j/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742134858; x=1742739658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUBU31zWgTKBtgMae2gOeiKWDb462tD5YrmtMJoO2xs=;
        b=twTROViFAwUFu6IqorqijJbFDk8yRRQcIo/CPiHrfSGCbJFhENoiIu3dPdQFCUqfh2
         aZMUn4AzgwZzX3/nPw3AN6EwuVRt6aJ6MA33r+jpNc1FjDc/HXtyiyc9FgMyUVvloUTz
         5NnGe7jxAPnniVdJcJFiDxlWNL5g63IF+1+eg3TtjktFjLSHTz/eLeFgY5R5VmJ+S+q+
         xXFPIYdKRBTbogNFBXkraPuSyhDH4fo4u2yFa9tzeCfmgEVSsL8YrqxNmXMUmZNmYAee
         Ir0U8P+THXxG9bU42EzfCNKo0/8cIHjkq5hw+1vLBylYAUT3EQ76h4dsVwCLBnTGNmNU
         L7Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXUPmhZklwBSOS99ZFw/xI9GkglbIVtaky6O8GVG14a82X5zLOad8YiUuUeOPaywhlGb8FSov5Mfj6bR+itCtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvfT2pVzQE1s2dHcTwD2fYDvK45MEgPKqlwyeD0XeilD0rgqxC
	DUy/q+aKPTAJVh1o3Kjosb3Q4KqrsSkkhMu+NDin7oRRdauAWYWI051HYK/WkGA=
X-Gm-Gg: ASbGncuFujkE+/HkD2UYViWjmnPsSYQtguJjRvfh6Kr65ZtKoSbbIu3g6BrgdBIiV3K
	m3HxYmbY4HZNTrbz/6w3Ffvt0wuihL5rLTxY6D7MqN3tCctFgigb7lKqHlwiRSfBakOanim8rJP
	yieB9/wcm2GK29O05B35ah2+ETO4JF46IvCYKq3+ADwc0geieVbknsuGr3ZAB6dLMKUIeiLit1t
	RNjHeI6PXzSAveU82HRuaPkjNO2xhSB2Sho2u2VZ5Ui2SsAK5pmooNzE+PMzlciQ5XfmfEeqWu5
	p3vtuaTO8g9ds2lBx5h5PYmLVs4wydnyaUAM5JHLWiEa1T0N+Xt7a5M4q2Ob
X-Google-Smtp-Source: AGHT+IH96kaFw1QLJUYn/w7ubUS3GRAHrcTkVQ5/aTCb0028F1HTQS+Kq49584fZ58voveSQBvqDqw==
X-Received: by 2002:a05:600c:3399:b0:43d:2230:300f with SMTP id 5b1f17b1804b1-43d2230311bmr87482185e9.0.1742134858143;
        Sun, 16 Mar 2025 07:20:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d1fe659b3sm77842155e9.34.2025.03.16.07.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 07:20:57 -0700 (PDT)
Date: Sun, 16 Mar 2025 17:20:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-riscv@lists.infradead.org, kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Drew Fustini <drew@pdp7.com>,
	Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH next] firmware: thead,th1520-aon: Fix use after free in
 th1520_aon_init()
Message-ID: <80b2d3dd-208e-4e2c-8b17-297be797084c@stanley.mountain>
References: <f19be994-d355-48a6-ab45-d0f7e5955daf@stanley.mountain>
 <d90c0678-d2ed-4e77-901a-fdbab7dfca71@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d90c0678-d2ed-4e77-901a-fdbab7dfca71@web.de>

On Sun, Mar 16, 2025 at 01:05:08PM +0100, Markus Elfring wrote:
> > +++ b/drivers/firmware/thead,th1520-aon.c
> > @@ -203,6 +203,7 @@ struct th1520_aon_chan *th1520_aon_init(struct device *dev)
> >  {
> >  	struct th1520_aon_chan *aon_chan;
> >  	struct mbox_client *cl;
> > +	int ret;
> >
> >  	aon_chan = kzalloc(sizeof(*aon_chan), GFP_KERNEL);
> >  	if (!aon_chan)
> > @@ -217,8 +218,9 @@ struct th1520_aon_chan *th1520_aon_init(struct device *dev)
> >  	aon_chan->ch = mbox_request_channel_byname(cl, "aon");
> >  	if (IS_ERR(aon_chan->ch)) {
> >  		dev_err(dev, "Failed to request aon mbox chan\n");
> > +		ret = PTR_ERR(aon_chan->ch);
> >  		kfree(aon_chan);
> > -		return ERR_CAST(aon_chan->ch);
> > +		return ERR_PTR(ret);
> >  	}
> >
> >  	mutex_init(&aon_chan->transaction_lock);
> 
> May the additional variable (for an information) be defined only for
> the affected if branch?
> Would a smaller scope be more appropriate here?

There are some variables which should always be at function scope and
"int ret" is one of those.

regards,
dan carpenter

