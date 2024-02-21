Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0881039FED
	for <kernel-janitors@vger.kernel.org>; Wed, 21 Feb 2024 06:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708496914; cv=none; b=Xe7/fNRPdN08JK/S9sPwdtXn++daSg2n4NN2d5UpH+/UclT4gK9Rb7SE2/QUH+M6s12s+5TmkUw4bqoU+AU+B4zdmrXSBDbNLhMbegLPCFz/8tHcXoY26DCxh8R6K+Lh6nWB/tPUYEd6GBfX7o7+6sF5q5a8iGddqE78JIb84cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708496914; c=relaxed/simple;
	bh=NvpND8bHneGl1as7liJpg3nMdmeA4xUwGesva2xlrDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjFMGQhXAAdDix4gEAJh1/xaUk8PVuvZTp/NXV+b/UUPMyF4EWL1x3dxU6mijC6wzYEx2SXj5OK2CAVhKLEGzoHFOHU/WVw7DZzVtfoiTPAideBo227dGyJzqoPZKmas9iEBJR8sYOmiHZm/nBguWOAY7/Vs5lCDzddKokhcD0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pPzdOwWq; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pPzdOwWq"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3d5e77cfbeso1087174966b.0
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Feb 2024 22:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708496911; x=1709101711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CcPstB2bYO4HD/z5bA6bWdOkdEkTV183NUIU2ddVXl8=;
        b=pPzdOwWq51+iTIZaoTuCTrArkigKlw6Z3KWf0hcXrfjjjx2s7VLQxEDixgsWwgavIi
         A8QKmSXPGe3sn14Erb8miPzOTYVEQZdGUhSGCXtUjpOhshbc4f8uX2677DUWY79MYvEO
         /Yh4p2HtTSVP4ujTBcxkCviCmX7J14BYlDiK8DU13MvYgGfIrEKxgf1JU3IjdJ9/rxbZ
         bLtV1zjGETa9b0qMgO2UkeqsDsZyx8zoOSz8IBXXO0tFJu9vfYXoVT7kWBT0kcGVV/SD
         RZvTiDVBvEYCzo7erREX7r5i5xEWb0Mqw8Z5MQ/aURC/54NLv9PlDGES4w4fk4rZl6Rl
         0YqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708496911; x=1709101711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcPstB2bYO4HD/z5bA6bWdOkdEkTV183NUIU2ddVXl8=;
        b=QIch8iJV0/uAi5xp1dLvQRt8xck6IpVbBBFHsSbMI+BFSwlq3uRqhK3HMIFL/vmFp7
         dgEB8yE5AdDF139DAER1dR7pPQQpq8Wz7VqeVs24CRs46RlSOXNvb5Clkze8hhRlM6vp
         0VDBxRY+x2VcqKljq0DrHJDl9QljnLPFVsCcXwcFwxXWGV6D8GZKjdzNPgwLdqDzCMFa
         2qj1fNSy8wVUSRbOAFdDoGJApfdrhVe1aBPMY7uOn6YjcrguebeYhAobiZqdodaCr/Gu
         UPTWqLopbTFKzMbP8/5sNMQdJIFRna7yBHiXOcIdPYlrAVZVbIjwztZ+En0mnR6dg7sT
         xxkA==
X-Forwarded-Encrypted: i=1; AJvYcCWvFoQ4KTkwwx1cgwyslzj6ICNg6gRns+pixIqhEzK0lvH83Z82nwTMxYpJp0a9usg5G+x5WfAQ0KOxMBbs8ipLSWCRC4teenIGS6nQhrAJ
X-Gm-Message-State: AOJu0YwDdtlVlfSF79N1LBjfFwnXERHlgxSnmup5PqsN7MvZAoKbeJVr
	T/3UoTfzegEm4E7ho+NWXiHQi11rzMfvN/jTU1XY/TfoftGHNZHpnHQjfR4vWD4=
X-Google-Smtp-Source: AGHT+IHpriMxroIGBhzF108/XlOwjGc2BsiHpH3gAeVQM0JFaftGLnX8WFuMK3Yp3VE7RBr+jZd/6Q==
X-Received: by 2002:a17:906:4558:b0:a3f:c32:7b0c with SMTP id s24-20020a170906455800b00a3f0c327b0cmr3887561ejq.22.1708496911341;
        Tue, 20 Feb 2024 22:28:31 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id tj9-20020a170907c24900b00a3ca56e9bcfsm4652264ejc.187.2024.02.20.22.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 22:28:31 -0800 (PST)
Date: Wed, 21 Feb 2024 09:28:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm: use ERR_CAST() as a cleanup
Message-ID: <09aadb26-88cf-4f3e-bebb-dcbc1fdadeeb@moroto.mountain>
References: <5a64b69a-40a6-4add-b758-ec3a9d93eb11@moroto.mountain>
 <ZdWWyvoCyI4kp4hm@casper.infradead.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZdWWyvoCyI4kp4hm@casper.infradead.org>

On Wed, Feb 21, 2024 at 06:23:06AM +0000, Matthew Wilcox wrote:
> On Wed, Feb 21, 2024 at 09:22:13AM +0300, Dan Carpenter wrote:
> > The ->page is the first and only member of the folio struct so this code
> > works fine.  However, if we use ERR_CAST() then it's clearer that
> > this is an error pointer.
> 
> NAK.  &folio->page is an indicator that this code is in need of cleanup.
> I use it in my scripts.

Ah.  Fair enough.

regards,
dan carpenter
