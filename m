Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CD11B4236
	for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 12:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759236896; cv=none; b=WyoUmjoJ5NgCCSrlXKt0X1T2LxJTts+k8h6RbfSgMbjrlzlmVfrtShhb03TD8L2eBw0monUakwMk0dvX10wMtUyffyKN5Rpt66QBldmA69cGZ5sbEWh/qxcPbr9El20kReimrDoR++P1cyux3b+mbKTcEcjBTOerSlACW/pYYHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759236896; c=relaxed/simple;
	bh=MKBeHyv3NY02Jpy+fPZVna1bcBZA3eyBmrzzBsDs3WI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Evh9uQqkkaFPBdsXhKAJEsuBpCa0jQSjqKZeNrD2fqt1sGAg9H4IflIEUUwTWb+EHPGohETp2Jxr3+fomQHkybYmkH2PJHnkS4KcurYQeDKvF7i7Obi0z9CiObu0jankPVgeu6y2aP/m2DA46iClKKenu0cRdJ6Uvg8iFW9ejYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=NJ8zUw/Y; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="NJ8zUw/Y"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7f04816589bso624752885a.3
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 05:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1759236893; x=1759841693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bn+6mTGWkxBQjLUsqN+kSoojzIgnAUXBIQNu61nSFyA=;
        b=NJ8zUw/YFvPcns2AUEJYyaWVwULIa56MoUXScGr+Sk5YzBTCeSdcb6OxCDmSc9i6Fy
         GudI/jNafm09ikmSneic/LEzQnGVc5flqxTN9E6Z47sFcVkySk1zczMx0OTmYOu9H23j
         boHCfthhnDr2jEvNotN4uB5EOjcR5L7LvwpT9tzB/1gRIIBlkhISuqZvsnNk17dTjlSX
         boiB/NAgX9ROEDZg4O0tpmnxSxSybo86CYzm0SJnMluFJZNitVd5+idt3c7jvt6jS1tF
         xg7/HQeRnLh2dpw3+4ZoYawnAuGJ0zmqwiW9eu3Jhtfdvg3DdcsICDTMnXtVcVAINwd4
         WaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759236893; x=1759841693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bn+6mTGWkxBQjLUsqN+kSoojzIgnAUXBIQNu61nSFyA=;
        b=BjNWpip7qLkdJKGa8rPW8nfdFLB+qaRGLndMvJqEisL+RYE34U9jpa5RuhD50cUTRZ
         gJMW5x7FCIAu6OfuoD3hNwNejfDAcVOQWBdZKzXLnnL8qk1G+q8AE8mhrVXZNQjAn+4b
         W9Z0cqCUVqWe38FVmgYMPmhjm95sZo+GZDMXsRKX/S7bTIIlMXB0tBorgtrExHJMnWNN
         YuzEIkFG5mFW7h5c9Pz4U8c7is/tUfH/Un2NPfhylrzmzNAaz1Sxj304yUWce73IkaOe
         Y1ZwFykdIqUy0nWsMWVKOs2qjw8dFQ15nVIkuJoXWlBZB5cCUjH1k9ls6d/JVjP8MlDx
         8Q4g==
X-Forwarded-Encrypted: i=1; AJvYcCUfElCwsyCz7B/xnxCtnuK2MQVKLLtVTvo8oCcpssuSDFNSLsDC3IOmHNw1IdQH647JAjLRscq+Wlwybk+/Suw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4huITgvPZe+qoXum8EnfN526PG64FyXOs8neTwnSmHXiLN3xN
	u2imAkltJIewmAL5+IF5TpuozjpFnOsufPMxjStxp/zFdQWctyx6qEvzuIpmmPPUZNs=
X-Gm-Gg: ASbGnctRRhppm9cnmDCbzkgrkLU26WQM2Jp+sjLUJkAZwsQq5Y7IRPr46JJgvPP/rl3
	oG2P8ywdZcFCjOJGoa63QE28qbUVqpgudFC9re4+x5G9vFF+jFDovwDrY3HLN1ewoFAjZ3WcPMA
	XOB2mv8BMo3i0ODaqurOvcAMtx69tvYlG+DdNbQe2SlbfO+1BD73xbwbcdRqRwmPIb+Htu/Q5/j
	YXjhjD5mhxjojj0q3mIsd9jD50sLULkF1ky9TctzRhRvJNAazmBI81YmyIj4OhR+MI2hitdaQZp
	JAbZ3pNKd5d/rXmvQlaGAvV6m31JCW8o8Cke4GAM0yCw0nl+uJ0yYfPf+PaAeH8xPd2r8WSqPBs
	eBefx20G7M8j3FhMGevMfDbnvqiQBYHw=
X-Google-Smtp-Source: AGHT+IH8Xq1xzvsa5atQWy4L0N+927va19nw9h/INxGPOCjMGegHFYwwzd+J5W1A0Dfgpb/gIfdZBw==
X-Received: by 2002:a05:620a:6281:b0:842:6a7e:52ed with SMTP id af79cd13be357-85ae7bdfb4dmr1889933485a.45.1759236892962;
        Tue, 30 Sep 2025 05:54:52 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c33b73f99sm1035322385a.63.2025.09.30.05.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:54:52 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1v3ZsZ-0000000CX6a-1f52;
	Tue, 30 Sep 2025 09:54:51 -0300
Date: Tue, 30 Sep 2025 09:54:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Guixin Liu <kanie@linux.alibaba.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] iommufd: Fix error code in
 iommu_device_register_bus()
Message-ID: <20250930125451.GM2695987@ziepe.ca>
References: <aNvMULgt6s7-3ceR@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNvMULgt6s7-3ceR@stanley.mountain>

On Tue, Sep 30, 2025 at 03:25:52PM +0300, Dan Carpenter wrote:
>  	iommu->fwnode = fwnode_create_software_node(NULL, NULL);
>  	if (IS_ERR(iommu->fwnode)) {
>  		bus_unregister_notifier(bus, nb);
> -		return err;
> +		return PTR_ERR(iommu->fwnode);
>  	}

Thanks Dan I fixed the commit

Jason
