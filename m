Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC3D1DE3C6
	for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731576550; cv=none; b=V6ZbQOYye239OLwkCtjHnISfWC3GszZfRALz7aS6qeciE5GOzPInOooLOwumLfSLpXEI7mcCBNAn0BVBdIyxi3yX3VwjXm83i9brY2ClKlEBcmmHOtWifWYFqMRsSdXDSp2oHqFAK7fQMBkox/U9MH/QAJOi+etcn0/Xr1cs9R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731576550; c=relaxed/simple;
	bh=SunWVLxZJU191an+c75kTT6SIArlemY5vm2v+U03SGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/taCwQoauQ4vcjlxU/rWHnfQUXlw0MgyWoULndZVzRhJtCSD6FoBDKDfHJEPE49uHvEwYrN2q8jQxUUKjBQ28DbFO5XCTlSSgWGOHMJ/0gfcPJHPGtoOoURNCeywy8G/GyTJGwIx1yEZ96mNiNl0a3kUTys3FsqzBGJs/bVlpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rvmgsPyb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rvmgsPyb"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315eac969aso1922575e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 01:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731576547; x=1732181347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nS1EJqfWpVBxhs4KFRyVItEivrNNryuQ6Ge6sLEQQzg=;
        b=rvmgsPybBABEfCgrfeczr90Z3zLDGWvaDlGrPsDGEZ7cT+yIBwyXSQxjywJZQK467v
         LvPyGCisaSo8U87xyA88aUW5MnXzDo6ChTK9l7tjB2CeB0YH4CLcAgicWWwmaHhB6V3G
         gJsc6uPChCYdtGs1o1eZ1zt+cRblivoqBUWFendyuZd2xMF5g7dFzadY3ZxWeI8kFPT+
         avNei5N4jBFiVisYUlZZESAcKPL7sfqYYItO+O6A3WM68KoO+IgbnXGuRQ4fR3tIb+Mt
         /97rnym+1dDTZ5Y4lqBfan1m3ydiM7YjbUaaMbNPePLsfg4e/LMDDnc0XtjqNGCw0EMa
         7AbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731576547; x=1732181347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nS1EJqfWpVBxhs4KFRyVItEivrNNryuQ6Ge6sLEQQzg=;
        b=AM0LTaAZXNvprz8YVK6PmnpEJnxaco0oEMcTOoEn4PaHJWQW4JrFhhT6n7LpKnPUEM
         +ykAADFhjdiXWvBiVqzhiaW1IRZbKbd19z+bFSIIbWEUPj4fyl1hIu2yUe4PD9ufcSHV
         cDrp0TJZaMvspX7rQ7RdpkbkaCSFgfZe5qPn4TaLyTBRt4HiErhueFQe6GOdKwpc1vnd
         uVa+HQYk5SXJsGoJvBEIDFjtOFpCFy96PyPtHrNY1ZUXnI5K/5q2LR4FHWny1GpKUXzs
         y9Btc2T5fzLLdvK+7oPRZuw5m3ElPzScg6KdaLIOZCfL2oHnh4d0ktbTcYs3ltMExPAH
         bJHA==
X-Forwarded-Encrypted: i=1; AJvYcCU0hsYylHnZLQnhTXjZiB/WvkqiB1ZXL8aQztMMqIMxbipt3MbZsJZK5onFTQ7ZDJ4L3LGoKeafu6bQ6cPw6ac=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV/rj+be5AVnYcr6Wj457CJV+YW0ULBNgMtt39+BdHECB8HuKx
	14wETl4+rS+6tSk9sEZoGaEEyoKsMzmAP4YvjOKmdKZMN2OYq3WbsIAG9wLC0/U=
X-Google-Smtp-Source: AGHT+IHa+GwPw1XMCZ+cH9jSTN1XwUkHTtzXZGQ1rcTxNIzhWEEEwnyYXS3SOYBkd1TsYzhe+styJQ==
X-Received: by 2002:a05:600c:a4c:b0:42c:b991:98bc with SMTP id 5b1f17b1804b1-432d95ad53cmr21357685e9.0.1731576547571;
        Thu, 14 Nov 2024 01:29:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d48a7cf1sm47674685e9.1.2024.11.14.01.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 01:29:07 -0800 (PST)
Date: Thu, 14 Nov 2024 12:29:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Max Staudt <max@enpas.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] can: can327: fix snprintf() limit in
 can327_handle_prompt()
Message-ID: <033f74e6-2706-439a-9c02-158df11a3192@stanley.mountain>
References: <c896ba5d-7147-4978-9e25-86cfd88ff9dc@stanley.mountain>
 <22e388b5-37a1-40a6-bb70-4784e29451ed@enpas.org>
 <1f9f5994-8143-43a2-9abf-362eec6a70f7@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f9f5994-8143-43a2-9abf-362eec6a70f7@stanley.mountain>

To be honest, I was afraid that someone was going to suggest using on of the
helper functions that dumps hex.  (I don't remember then names of them so that's
why I didn't do that).

regards,
dan carpenter

