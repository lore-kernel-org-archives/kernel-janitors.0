Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358F51AB537
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Jun 2024 13:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718631389; cv=none; b=bV6SNbUwFVCa9NRJnJoB+u8xzk5pi1rRj4nARhjWm6a4nHYWmhcyJPnr+Xu3IPkOMj0cgNRvcawUjFhncPPa/pOi79x7Euw+qugg3Tvc/qLJ3cUptgreoGUIGy/ilvrxGKqMx4FPZNPbwYmEhfdswyBOek0u/+zTl9CCjch1QOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718631389; c=relaxed/simple;
	bh=fkadhAyonb7RymKr0Hwj9qGiWcoaWFoudlddldfbojY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HhiR/oIfFQf5owtDYySGlvGL4BN+0vp1g3mHIgcVf+GlMv0E6t2XIWXLpMuwB0DLA1yIXTMi3sxJqAbJdqwa7WGu33zVY7lsPJwy4cfyQkQ6qG47P7VxKD8SU3PEHZSiFFkNEPoe2gjGgCVeosJmQ1vHcIn662c3D/X1xaX4yxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=RSuya5hQ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="RSuya5hQ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-36084187525so2001164f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jun 2024 06:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1718631385; x=1719236185; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+FTQb5W5/GJ/Nb4LvauMZmPKUHXtT9dcXAWj/SvSDY=;
        b=RSuya5hQGrSTTwFtuBl6/rYKn0k7rEetc7C6wa05py67lGIzR/fbqmVDhimOcIRaBG
         7RwakKGjGsMaKVOboJFC1+LESpkzRkTnjQwfH378O35qHiWOTFjjAOKkNUFyIFD51xuq
         PvKe5njleoOP0wDETKSDt+r+pkI3CowbJKFegbDGnnyu16ZcPs4UUvMLcdQCj/x3u1S3
         koGIWbpIAQd8CT0x2B7O470E4HLeXjA7XaQ97LZaW7rxx2WIEerzzYf8iSMqFO+c0mkJ
         1wdWiaJTV1Yj/gG26UtsjDtglxY0mWaAw95ta7iRSb5y1xj9/dNB+61jVBGJmhgDlTP5
         0P2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718631385; x=1719236185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+FTQb5W5/GJ/Nb4LvauMZmPKUHXtT9dcXAWj/SvSDY=;
        b=bielO+6MCBITZHwxLtnerG1Ze+aKCctS9me0SM7q8FGYaLNyaqoVLMp3q8QI8iu710
         m+LmPsGqvUR8wTQNmh98W7osYtrIk7rC6eqSId7yffBj3ZPU0PEf5oJQQAV0GrG52R3R
         4+b8/aZNuE9OzSQ7hhQRhx1wWVhBBqr7HyIs65Ximo+1BgDpIwCbVVsa5qcnuuDevZcQ
         SCHCbPXhtfYGa3+tuthBbK2S6aEo5KEon3Uf8Sa+QX/M43UxxLJCs1hWTG7H705uC3eN
         R14yQmoIBjzeMfvkb6NocfpYoViRki4HtVACddr7+Frbot4qGqhd1jYps+U3GEhVAcrE
         Os/A==
X-Forwarded-Encrypted: i=1; AJvYcCWq18cufAUUx2PfrXmlkox6H33iYrJdZ+Q4U9aDGMfbyZkhucrv+4AyFpKF0ciWPfyZgaP881yI1Uj8yBBk2RMVbJn6BP2UjJE2phTFk/Cg
X-Gm-Message-State: AOJu0YzVSIZ1ufAkADz6/Fc6wemGilQXpv9gbiOGGP6OeeJAG0XaVALD
	v9w1zkSegSO4E9VQ4LY+hj6QaGFB6D48N/MMIio5RwJ4kegrJgLjCZCzM0+tADg=
X-Google-Smtp-Source: AGHT+IHgsgd/TPVM+18WkZs2+AeqnSk2SRZRbmmdW0ObBeSJuDLzDBQ2FjqSWprz5A6LjcnamvKJ7w==
X-Received: by 2002:a05:6000:bcc:b0:360:7a01:6afd with SMTP id ffacd0b85a97d-3607a74e760mr6960206f8f.10.1718631385486;
        Mon, 17 Jun 2024 06:36:25 -0700 (PDT)
Received: from localhost ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36074e0e5adsm12011860f8f.0.2024.06.17.06.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:36:25 -0700 (PDT)
Date: Mon, 17 Jun 2024 15:36:20 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Yangbo Lu <yangbo.lu@nxp.com>,
	Richard Cochran <richardcochran@gmail.com>,
	"David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v2 net] ptp: fix integer overflow in max_vclocks_store
Message-ID: <ZnA71MTiaESQTUMp@nanopsycho.orion>
References: <ee8110ed-6619-4bd7-9024-28c1f2ac24f4@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee8110ed-6619-4bd7-9024-28c1f2ac24f4@moroto.mountain>

Mon, Jun 17, 2024 at 11:34:32AM CEST, dan.carpenter@linaro.org wrote:
>On 32bit systems, the "4 * max" multiply can overflow.  Use kcalloc()
>to do the allocation to prevent this.
>
>Fixes: 44c494c8e30e ("ptp: track available ptp vclocks information")
>Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
