Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC9313B2A9
	for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 15:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731596897; cv=none; b=jQkV5O/BzhwFUF92L8E0IOE0jKg0RnB/H+kCAdmeRk/lxqScDTuGGj7oZZZ2sdhKMhuLdGjTPFQfXEygcr2zIvDEL3QAdUgccKvor6pGMgwRtAuAoItj4bC6voreqXMVyttNkAmDa1ePabjCtHAJCnVTXIhlZvT8LQ6tt9FD0hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731596897; c=relaxed/simple;
	bh=/BYQNd++hlfPbuOhq+QHwO6NZMZHHVCL1uTzzD2INQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUy5fxRD3IE29oLaSCj9P5v8m6wIUL6ptbTeXvNjrsCCcMiE50nqZ7QMTrwgsWFpqohSf8Z7lDdyl4ZOziXC6VA/jhJAjHPPCdpgshA6rXdjgsrCY7buJ6Jgu1q0n9o/Al9enMWO7c8ObEAS6oEbhR8l0PNgN/Gt1e/juRHN6DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sY1fuPqZ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sY1fuPqZ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3821df9779eso330712f8f.2
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 07:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731596894; x=1732201694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AgEfLtq8i/M2M75YOJzjdmjGGJwIKwjUcYodGngqvzE=;
        b=sY1fuPqZue0E6O7bT01aq2X5PjRR/YvzITyxTf8csOImt089a3WQirDz/qZgi1RIFr
         DNy7gakNkL9rhjoFnXzHLVmHOHnWpLEraryNB70x5AYQFg7C/Lll+op2wzr0Iw76u+5G
         lzrRxl/eIP1L8IqFqX7ju+lg04411u1bVSRvd3jHT6MYdfrYXo4JPuY8L2ciWQvYSnlH
         DWlx84gCumhHv/peNcDZXV4it8ARmFfBqhs5uTJ8uos1P1qJYSVsreT0hmf5nnjeqjBt
         xcqilkJ8POSkn3SbxuLXXX89DV+BUE/QjDqAAXJZykx65b7gCG+KvSolnCgNJqd+r5oG
         xIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731596894; x=1732201694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgEfLtq8i/M2M75YOJzjdmjGGJwIKwjUcYodGngqvzE=;
        b=aHppbh2dizdf4ovYJHwCui7b3pfpxDGX5+xV2c7PZUtNWlqIrU+7BolI3lJTQ0uFin
         Vb8gKJy7QnHPXmlQxSXpxPUOK/fkNjpuYnr5U7ZPf8PjTa+YK57fcHFPojNbBdV/+2w9
         +LULtBtdPjgMO9ikVK39e8IC45ncKIjpaiSj0v++VSf4/sqNbsRwRmjEh9ytGy7KXI8E
         sUP/cfuxWLNXpQ6oaxdX9nptI+MY6WaNu96FvXRLseqokSgClMIUozLGWZbjSeO7fTeT
         2AaLLidI3HDveDXDUgzuJu3gsdFHh98U01gnUF97/5c+PSFO+Nk9VgEEBsPJndjkhEBW
         fq3A==
X-Forwarded-Encrypted: i=1; AJvYcCUDkZrOuXhL8y2vtE9Wl6AvNqHLOAg77nUUzQ49ep6G9WYlMOv2iIDRlj/salrN7x0VrAWw+BkHuryER6w0nZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOY7KRyanhT7TmhiOL5fHl+c39R2a+5mcnX9WEwmoOk8z0THkQ
	Yvje8AODjXUl6I6FjNSvh0bdTYsTqHNp6x4gOUsW//LVzWN4FbviQirqsDolMfbkhbqXdM3bObO
	R
X-Google-Smtp-Source: AGHT+IFplMK03X58NbalioWaxnFldro9DAQmBOQt4nnGHdoMh9Yy1lXTcO15M41+5hv7LNH/if3ZJg==
X-Received: by 2002:a5d:64ce:0:b0:381:f5c2:97c9 with SMTP id ffacd0b85a97d-3821851c110mr1743132f8f.25.1731596894541;
        Thu, 14 Nov 2024 07:08:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821adada8esm1703155f8f.36.2024.11.14.07.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 07:08:13 -0800 (PST)
Date: Thu, 14 Nov 2024 18:08:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Max Staudt <max@enpas.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] can: can327: fix snprintf() limit in
 can327_handle_prompt()
Message-ID: <0c4ebaf0-a6c5-4852-939b-e7ac135f6f32@stanley.mountain>
References: <c896ba5d-7147-4978-9e25-86cfd88ff9dc@stanley.mountain>
 <6db4d783-6db2-4b86-887c-3c95d6763774@wanadoo.fr>
 <4ff913b9-93b3-4636-b0f6-6e874f813d2f@stanley.mountain>
 <9d6837c1-6fd1-4cc6-8315-c1ede8f20add@wanadoo.fr>
 <20241114-olive-petrel-of-culture-5ae519-mkl@pengutronix.de>
 <7841268c-c8dc-4db9-b2dd-c2c5fc366022@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7841268c-c8dc-4db9-b2dd-c2c5fc366022@wanadoo.fr>

I'm happy to re-write the commit message.  Changing snprintf to sprintf() makes
me so much less happy...

regards,
dan carpenter

