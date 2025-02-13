Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D667C205E06
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Feb 2025 05:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739424376; cv=none; b=Fn+VSaZovkWKKELSI4mEZF5zCMBZkRH/CfWW+MKmiapg6vZnCAd2ESVtYx9eb9xofiwx7zX4NWa/7xxEkmCifEQNbOLV1X9NpSTNAM9R6ZpDTBTTd+Sd8stkvKfes41j+sZc6GFertw3IiWFp10wMmulQ0u7AQFdikTBc/dO+EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739424376; c=relaxed/simple;
	bh=t6YR0npYVjRvyKj0ZE1XLCJjmwLZGXa/7c4my+oO014=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bj36of1/pp+jGw5DYW0mDxdzw5uyLShBtkXsJSJqzLv3L8pB6T776RB3XnkmkD66HoMAd+31tI5tp5HSwigJOH+/sSl1FNupGEfo9vbzrrlO/09oYxTrbXJz81GaaJperaIpJSnSc0lj5/BexxSjT2cOFqUGeYuDpBUIcOARR8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JXV8gn2U; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JXV8gn2U"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5dec817f453so680634a12.2
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 21:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739424373; x=1740029173; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0HAEYUoXN1RzPu9Vc5RFXNu3L5U0k8+uT71SbgN/hXA=;
        b=JXV8gn2UZhGegF7+LPmcwR/bRPnsW9fAJzgvT4gqFCIX04Ux2Oek21eAK5biQR5/4V
         OjJRN2ha+0CUdpOUZZgFlEpnDUrUXwHVvnUgpz5BNYSsKWw5hvoXC0BQ8Kx4ImGBz+dc
         15bK/+8mTYV/0C38jLwQ1p0bgRqluAJ8lzaXfrYV9bsS27a6vcqFrtdWoeP0tmO6JAaB
         PHHszoU6y+dx9bA82OOMBGSPILMrjtqdx2/AseUuZNhfUPfWD3hb1egs6rAnGKoJpEmT
         awDRzlNaxo5o4Y1IeFAunzpAIt6+yolsLIOcU8xfO0DNNTxlTHioETVOtHZvl4fFlQhI
         /Y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739424373; x=1740029173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HAEYUoXN1RzPu9Vc5RFXNu3L5U0k8+uT71SbgN/hXA=;
        b=ROT+Dg9HyfdxOn3ffQuYNpd4wqxFNzm/s7br2zf+OPrbpTOPr643Z5NXylwUiblaD3
         FaSNaKxOx7s+Ztx+n3/YGQXvpdPaoM82yVVEtKGFA5RScu55FszD8XL9wTaUWdz3UNBu
         zdZIWrhk3dvW1AmgbZXHqSZ4S/qtEuAxjE2i07l6jYfF8le/AKIdx1lgmdkkXoOxbF7+
         lgd5VhMqWyBKpul7remqthr37p66pVHfLzreilY+Ns0iXhzFHu76zLnK2Cvi3OD7MgSa
         jPWE/U6jZFX6cN3nlrnY85BjdeX2cBixbulWNkl0tWY7zMykIhsfZPouegWr/SoaZNUp
         0iDw==
X-Forwarded-Encrypted: i=1; AJvYcCXuoOO7au58QnaQM9yWnUK/s1ZTrU8E1w/hhBldhkN3A9EzRir03il3vTEtrqhQ2o8mgxSX0NOmv1Qwss9NMJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmIA5xXYdAxB2CBCS780vN74/LYzumw1fmFgSdurFXPOvFnh0Z
	eDN5EYjA9Jp0nhjHTtWimtaRsz+i6U4DW/DVGph48mjxzjNfsR+rYpBwpa9Vv8I=
X-Gm-Gg: ASbGncu4U7kZbdbDT77xJ6OFlBTSqPkzzK8L+hiTFWuX1it6ZmwZ1oW1yboA8mCIqlv
	P3R10wrU/Pmlnp491CkdpDmXtkUx0aWqLNGl6+BYSPUevYvOmtaX+6Q4WIoqaARRUCK+RJ9uqeJ
	1De+3nCtGzVAYz0BKJ18Z9fOKF8XwIKGVXW0zyEN6Cl1rtJkkP6HghPRIqBrdkij0q6o9zNuZRK
	LGzhK42S2dYChBGWkB4DLzs39v9iFfhXwsUuPQzHGYm0JCkCVp8VUYVcaKRa/CZU6DN/AfdgAWR
	TkDsqVrT0JY/s3rcjNVX
X-Google-Smtp-Source: AGHT+IEzj9Ta5BdBT6AH7PreThdj8+Vp0LN+dbci6CqGFf6XXQjsFFpLhPxNkTgcclST41hSlPWi8A==
X-Received: by 2002:a17:906:7956:b0:ab7:f221:f7b4 with SMTP id a640c23a62f3a-ab7f34738c0mr544342766b.43.1739424373199;
        Wed, 12 Feb 2025 21:26:13 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aba53257618sm55687766b.51.2025.02.12.21.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 21:26:12 -0800 (PST)
Date: Thu, 13 Feb 2025 08:26:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] ice: Fix signedness bug in
 ice_init_interrupt_scheme()
Message-ID: <d6eaa268-e4ef-4d90-bb1e-37a7f546da93@stanley.mountain>
References: <14ebc311-6fd6-4b0b-b314-8347c4efd9fc@stanley.mountain>
 <f66b15a3-1d83-43f9-8af2-071b76b133c0@intel.com>
 <20250212175901.11199ce1@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212175901.11199ce1@kernel.org>

On Wed, Feb 12, 2025 at 05:59:01PM -0800, Jakub Kicinski wrote:
> On Wed, 12 Feb 2025 17:46:54 +0100 Alexander Lobakin wrote:
> > > [PATCH next] ice: Fix signedness bug in ice_init_interrupt_scheme()  
> > 
> > I believe it should be "PATCH net" with
> > 
> > > If pci_alloc_irq_vectors() can't allocate the minimum number of vectors
> > > then it returns -ENOSPC so there is no need to check for that in the
> > > caller.  In fact, because pf->msix.min is an unsigned int, it means that
> > > any negative error codes are type promoted to high positive values and
> > > treated as success.  So here the "return -ENOMEM;" is unreachable code.
> > > Check for negatives instead.
> > > 
> > > Fixes: 79d97b8cf9a8 ("ice: remove splitting MSI-X between features")  
> > 
> > a 'Stable:' tag here.
> 
> Bug only exists in net-next if it comes from commit under Fixes.
> So I think the patch is good as is.

I want to resen this.  My scripts should have put a net-next in the
subject and I think that changing:

-		return -ENOMEM;
+		return vectors;

actually does fall within the scope of the patch so I want to change
that as well.  There is no point in really breaking that into a separate
patch from a practical perspective.

regards,
dan carpenter
