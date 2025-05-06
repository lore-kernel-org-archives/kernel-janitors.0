Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718B628315E
	for <kernel-janitors@vger.kernel.org>; Tue,  6 May 2025 15:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746545663; cv=none; b=SfSxmoLnA+w4qZhurH8EGz7aiWrtEsmPql4JxgK3niKnq2MMC4gDSA489l+21S3G6Qt4G7R03diYA/Ueqfm1O1OvZkwqJxsts8H15VpPrUjyWf/tthV0pugBh1fQOJPZPrB8zM3M5VFcAs+RKxJl5FpcvonweKj+tdMQRSBll3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746545663; c=relaxed/simple;
	bh=Ov/02G0Dcbs71zqBUcZd01NdKb7GrwiBG53tzfrEiqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlxdwXNqvXWJzejIAb4s665ghYtjzdAbDin6tcy7bYFhJBKmSEn9p6abPeZonEtHeNFNBRh4aUa7133T4Vk0HvlgKk+zxX+HIcQHTc4SbehlHJffHVuvYjUCf0j/N5ib6DwLf+M0Z/RanigfwJsY0HsLUUYpiCkcfPit0IbfIsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=MssmoGww; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="MssmoGww"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c5b8d13f73so708772085a.0
        for <kernel-janitors@vger.kernel.org>; Tue, 06 May 2025 08:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1746545660; x=1747150460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DEL0BdJeiWhFSL0UHqew6wK9zUeiS1/Nj6MKOwcN1sk=;
        b=MssmoGww22+bQo4FlZaOqUJc4tw4ZW8X30NxYC2l6bVuh3uRzorjT3/Zkt+UgcMVDw
         tDoC829GcsLFM4Ql955p1NuJ200Jc0kpku3ZAwHWtH8Bz0RsdNxBeLoHCwT7Mjk4M5IK
         Gj3unkgacoTj/10RrSk/bai/xqbZucxe8jw2WZEowOmPsKum6GVd6tPJbRYp/3cTAaK+
         JO6sEIf61B0xKEoNDV/b7Rt9kRkhE7yun3+klS9tGEkS220C+0d510xSrrBvdsJEaFm8
         uqksaCBz71HN+P45XuK1KNt3/6ua1Ke2F9mLEfG22QuR1rjUpPZPyl8psAns+AIred9P
         iyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746545660; x=1747150460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEL0BdJeiWhFSL0UHqew6wK9zUeiS1/Nj6MKOwcN1sk=;
        b=TqbcBiISDo+KS4/hrZEkkecYUfsXUxYTNXRO2Z6m+LmnXlj7op2CUAp96GfTWhPT/6
         WMgmHhb77crcrUVQbh21YY3YI6VwsJCku+zaOQg8hZNv2gznXrWh5MJRc4ro6dWq5Ukv
         GQ+jVUQfe9Xc98QZu/48vFfaJqfOm4iUYfae81IgeFWQNJg/FGuc4Y9AIJgIZqcguOuk
         bLlpuqLQXRpMhoF2a8sppMnatn+INDdCd5fej+jjR23xVzGFpelAO7p031Kb057GT7oj
         c4JNd7VEJ9IHqFLWnSJYMNRwLf5v5rac4X3m+9V1mkEqBWcxjwzdrfBILHY26lmqaDwt
         3gxA==
X-Forwarded-Encrypted: i=1; AJvYcCXs9v+iepNSaC+73rpyS5siYEp4huQhGcW1pCmrKYluTWp/mYsE4Wp1CEPr2y41tJ/e+X7u1bxfdS4sNwPIUeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfYr6/fa707eATK+3fnVyLXuNJlHCw+hCd8xNkmy2k07QJtkMk
	kANStFbmNEppDe59mErrqpnsWs4d+Mk8+rYa+lXzmGVkP7DEJfX/LoH2IG3Cops=
X-Gm-Gg: ASbGnctda9FAxNuRE5eYOISbdCsrgJo+Oh96OgZ3xKP40L3Mi0kl+aJJX0kXT8WcmG9
	IzjSMXxCKdD/iCc0I/Ekqq2HGxHO4QEc3jaQThnmSx9EN5sPBoNAwraRXnHQpuWO48KStY86TcF
	W3i3rWIX3xrks5wXtG/EQ/sf6+CZbtDJrNzzjzThbcgGW/mw8AInBZQkBI4bDA45FFnisWNiTx1
	pEUzMrK1Nx1hJw6MmqyYsK91WuWzVJHk9BfUUb1YxOqqK6OMgULCZjlw5lizgpSO65joBdCg7sZ
	y+wzaKH55sUz+eQdUe6MWye9tSPI5XDWijLShF7//g6YArWK+XwauC06kbqA0rN2wl8R2ebR0om
	KcyQBk4hVKqFmnGT5AXI=
X-Google-Smtp-Source: AGHT+IGjVla9v9iPysAsiyzPvNdcdtY/Ygl5ECmnMcsCIIpAcHMP5wxwPNZpIf0QEMUcDCXVQaRW9A==
X-Received: by 2002:a05:6214:5086:b0:6e8:9086:261 with SMTP id 6a1803df08f44-6f528c3ac16mr186250976d6.3.1746545660278;
        Tue, 06 May 2025 08:34:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f4515absm71401096d6.79.2025.05.06.08.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:34:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uCKJH-000000008YQ-1aOe;
	Tue, 06 May 2025 12:34:19 -0300
Date: Tue, 6 May 2025 12:34:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] iommu/fsl_pamu: remove trailing space after \n
Message-ID: <20250506153419.GL2260621@ziepe.ca>
References: <20250430151853.923614-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430151853.923614-1-colin.i.king@gmail.com>

On Wed, Apr 30, 2025 at 04:18:53PM +0100, Colin Ian King wrote:
> There is an extraenous space after \n in a pr_debug message. Remove it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/iommu/fsl_pamu_domain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
