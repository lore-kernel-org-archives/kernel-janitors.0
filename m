Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202AB1714AB
	for <kernel-janitors@vger.kernel.org>; Thu, 15 Aug 2024 12:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723723609; cv=none; b=uWBkwtscCkDZ+n7Nnb8PqBGnRbjf0x+X60cqkuBbjgqItVwLuYxIoTs8tyif8oN5kL/qLwpmZqWkoP/2qqehDdfZ1Xuw6FdzNSPDvmqVReHDtoobHUX6xklfMjVTZ4ps82a5d3ozFvu7xPHi8Lxl/ltyC4DIf1fClgPmija8NhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723723609; c=relaxed/simple;
	bh=uveJ8w6kuDKNwrmp5pXf26ypCO7yq++W7SiFSpS31B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6vW+uTW7FIQRofa4K+agO2he6XxpdmZ53BHjQt+zjjLcZ8hEnwXy7oFGeqvc96X4RAGxQ3DxBoPWmQxH7OSzwfEj0O6xkE8Xm+tE7NyYaqYCTzpymWAzkkD9U1/cgtdGWD4e48hmGwZEQuMmK2xjtb+FhXodu2RiDemSPPz7MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=I5lx9EhE; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="I5lx9EhE"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6b79c969329so4521736d6.0
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Aug 2024 05:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1723723607; x=1724328407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hr4E58oRSlojKYyvjb6raU+5d7kHhDDWcSg78FeETeg=;
        b=I5lx9EhEPNbehRrEJD+clJOFly8N5nX/FzrUrdSk39j4G7I0S35q05N7eujHogYiKG
         5cECxQpla68sUDIqLNEm9fol+LCyyM6uXKWgB7Jejwczf7k7Q5C4aRBZnrwNHPZWQAks
         u73XmA8pBQzxNY/e+bKLFz3ahbJccgYq2SjkkZ2MmGK4MT/C4EGEwtXO/xnyTE/m32dd
         oB6VEBW+bbaZhznn3wB1GZ5XBFozvWBIW5ENc1HirzyL7SZKFdksRRu20ORWCagLVzSI
         CgwdVIjeSwrgsStHLtrX0l7VbL10DzujxIRONIMF9GFL9wezdaWgkxYqqKJdY1x/B6BD
         1MNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723723607; x=1724328407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hr4E58oRSlojKYyvjb6raU+5d7kHhDDWcSg78FeETeg=;
        b=NkbdqF51v1D99U8vEnvMTDYG1ezCI3P5bJXWafwZi9D7J1RBdihueyKrPNsX/PkOZd
         vodhoU7THI+CPsXPSizGKo/9quZw23jmZKhyiecxJoED8plB+AAdQZ/H8Gga5hL5BtHZ
         VxILU9V3NpuBZWkNdtdhDg+LQheGTHqLwzlkWCYBM/E02Dq3nAa1Q5HtboEAZq5ILupE
         LhGFrshhhmxSw1wR96yhbLgzJnqsq96vuEZbh092n2fpRfWuXIupj3iTg+e8SULJtosa
         OecK7wBhttKqCA1yzsIIHkyk8ZagI4RTbQEhvUoVhcjdOf4Rr/1Fr/86S9eMCOVIP4A8
         WOYw==
X-Forwarded-Encrypted: i=1; AJvYcCW1rZllERHpjmd2FYOZxuJ6wYypdY/MJMrC/hcm0SptHjteAEGa+r2oY602oSXm9Y9ayAEYpjmxr/EIdlKkZZWdOxhrHGcEQll9aPek0XLV
X-Gm-Message-State: AOJu0YxkLaXSIHEQoUKUeUjQrPfQnCOq3HCDOO+B4cClv7WVLe4eiHjd
	73C8Wzy8YV9FjwPZbGd2T42b68HFmCuXV4MvBeKBp0yNMREEpEWGqL/KPbTMtYw=
X-Google-Smtp-Source: AGHT+IEVYQLKcB+BDHqW0CoQRVm2Fen7oEdm+gWp7c62CjP214H/a2sHkXJ4ifu64Ci1C2h8LkxIEA==
X-Received: by 2002:a05:6214:5d8e:b0:6b5:4a2:79a2 with SMTP id 6a1803df08f44-6bf5d1a3018mr50970416d6.28.1723723607021;
        Thu, 15 Aug 2024 05:06:47 -0700 (PDT)
Received: from ziepe.ca ([128.77.69.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef4897sm5777456d6.110.2024.08.15.05.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 05:06:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1seZFd-002m27-9t;
	Thu, 15 Aug 2024 09:06:45 -0300
Date: Thu, 15 Aug 2024 09:06:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Nicolin Chen <nicolinc@nvidia.com>,
	Michael Shavit <mshavit@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Fix a NULL vs IS_ERR() check
Message-ID: <20240815120645.GE3468552@ziepe.ca>
References: <9208cd0d-8105-40df-93e9-bdcdf0d55eec@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9208cd0d-8105-40df-93e9-bdcdf0d55eec@stanley.mountain>

On Thu, Aug 15, 2024 at 02:25:00PM +0300, Dan Carpenter wrote:
> The arm_smmu_domain_alloc() function returns error pointers on error.  It
> doesn't return NULL.  Update the error checking to match.
> 
> Fixes: 52acd7d8a413 ("iommu/arm-smmu-v3: Add support for domain_alloc_user fn")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Yeah, looks like this was missed during a rebase

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
