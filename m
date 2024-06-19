Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B9715532E
	for <kernel-janitors@vger.kernel.org>; Wed, 19 Jun 2024 16:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718814889; cv=none; b=bznq/CeKdv2QX5cDwUngB4Os3Ba5hxuBV0CIkKIKmPsfpWB6hsOcutcMIoGZAnRWZGihgWGGgt+1Nylu366leSUn2qBeXAdUVguBXomym1W1CjKM28Ruo16p3527vNVDD7kqoobRVW0axyATmTSMAhlMEM2GeybQIZYYEv3jcfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718814889; c=relaxed/simple;
	bh=vz3OyqF6PjBb+NDoBEl8crxXV6LQcMi1lT8jRt8+XwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbWWib1xZGI0gJoOR7N4M0fGFFE6hHmFEFL2/m1KjNiPbXZ5k1NRn9Sk6K9NCkPuC9EdeISW8d2Awjk5jWYw5d/lr2EPWJpj3oXj0D5pDcxgWIfB334S5KrvI/75CkN89LPuk/bTKKBG/SZZcduEJEdbOApf7pd+HvMx3mzHVlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Vu5/rXaQ; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Vu5/rXaQ"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6f9fbec4fd9so3979046a34.2
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Jun 2024 09:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718814887; x=1719419687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U0Z3MILfX5zi94LfosxPsrOvnWTNdLm10NYSBu4aEWY=;
        b=Vu5/rXaQyfeTAi7/rv4vTsJL0ulf7MwmTz4DtKzBI2EjvsX3fIESxNVgPAP5vjnxFE
         1VYQfu+ZkqJOdSzECsnPut6NFRmnQRJeYeoFYwxSWXbbnLL3ktWuBDSV79KOc72ZLw01
         5m/Axu+DWbMbbTwqpVnbTeu0rl5qR/dgOCPBMAdq7xyVThKcjK/aiX9LRmDYfz8qLQxI
         8ybyoxVaM55rOdzo2jxHUAdg76X1oyq2bup1N0/o/oDPX1sXm2tggXlIrO22TdqG4nIQ
         xOzC0DWDvECjN1dZYhvtWR54CYhQON/BbTR9Am8GRwFkYpHkn0OLWpp0CL+hhGfXxbhM
         0TfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718814887; x=1719419687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0Z3MILfX5zi94LfosxPsrOvnWTNdLm10NYSBu4aEWY=;
        b=MkUOEtYbS/QRgZrodUDZYaxr0qLqL70EjjrqrsM9dUXg1lxwvp+/usx0UylmqldXX2
         h5eIbpcPwptaVAPm2l08hlPpqxSCMAT+jkE+0Y0nw2INknmYopk/rhPghXwqD+q0Wwac
         tZR8ysU8omoML88Gfdh9yqEelSyw4mApNklUn9vcpO3i9fNREwiXPieFtbOi5Lbyot20
         lpGCBKrM9ANk7afUnHkhVbse3m6L9dId1N0+4OPBgGjxACH/xF5M/r9T6peSfZKTZ7k3
         +2F3Y5oZi6Q0VZXDmq9i63dqJEON2a1xLjavwOCyzI7Hmu2xd6vZHzK0YebHHyE7/O8/
         8IeA==
X-Forwarded-Encrypted: i=1; AJvYcCXVzld0QETaFBNGqSbz1kMsGvCj4YGYfOi8tqn2xfg5R7pSS4qzqM1JQd9VlG1y02wd/lFFJYgN3WA/A1jPQZFNzr2LTdig9wGSKydHeNdN
X-Gm-Message-State: AOJu0YzWuvj9OqZOeSB5h70h/HsBtLXQBNqv4qAeXd8b1MK44rRKwmB8
	wOPl6MZlRq26d2JldvHO5Qr+WI/sP/W5IJeiDsSoaeJBA0mjNdNysPuTn521jwU=
X-Google-Smtp-Source: AGHT+IHbLaigtw0mJHzx/yQd28ehpS3L1U7ULHkxwkCKVmyGufSvndmmDVZaVUaeop0hhX6BCYc7SQ==
X-Received: by 2002:a05:6830:1243:b0:6f9:aaab:d34f with SMTP id 46e09a7af769-7007365c28amr2973145a34.6.1718814887452;
        Wed, 19 Jun 2024 09:34:47 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b4f8754a9bsm17821726d6.92.2024.06.19.09.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 09:34:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJyGk-005ArA-0i;
	Wed, 19 Jun 2024 13:34:46 -0300
Date: Wed, 19 Jun 2024 13:34:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: add missing MODULE_DESCRIPTION() macro
Message-ID: <20240619163446.GM791043@ziepe.ca>
References: <20240613-md-arm64-drivers-iommu-arm-arm-smmu-v3-v1-1-0e9f7584a5c8@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613-md-arm64-drivers-iommu-arm-arm-smmu-v3-v1-1-0e9f7584a5c8@quicinc.com>

On Thu, Jun 13, 2024 at 12:44:17PM -0700, Jeff Johnson wrote:
> With ARCH=arm64, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.o

Weird I never saw that..

> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c | 1 +
>  1 file changed, 1 insertion(+)

Fixes: da55da5a42d4 ("iommu/arm-smmu-v3: Make the kunit into a module")
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
