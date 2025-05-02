Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A622045B5
	for <kernel-janitors@vger.kernel.org>; Fri,  2 May 2025 07:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746169842; cv=none; b=lAugtTVpoxwWQSzfArmDJLk8jBH8Y78IdZGSAdSFDBuEbgExQnBdnUt9FBtyQSkuFugv66jCHa1MBrYQV1vnnMi6cJNq/Zjo5tYTuyikDkRKV5a67DRgyI2DIMqefNDrbdAn76shLZDMig1MiDSdKJxuLAse4gd9i9N47NZM4FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746169842; c=relaxed/simple;
	bh=NOKG86xB+yiOqLT5qbBkeKjZjQudUxm/RQ7ECo4ZOts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8pOlQTzi4ztWE97h81d0O5pXA1bf0bJOD5K6H5JhYLtNc0A7MdE21Gi611/Q1TzKuC/sco3uTySxuLUuKiCPvDnR4UOkc4rwgz1ShnRYRqEEtWgqPkI/yk7zoRjWOJR2Q9zIrndl8Qgsnv0PF39k76e7XZuOOVpAlvC7dTWJrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j1CPYNUe; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j1CPYNUe"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfe574976so9652685e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 02 May 2025 00:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746169837; x=1746774637; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U06ss2HdcwirNeiqMijvgDAm/dg/vsq1Q1L1rApoCb0=;
        b=j1CPYNUeaFrevX+Y+5ItBuZOVeknLeLGq4+dJP5cqpfPTlY2Dn+FFqd/fqNhHdyJh3
         nw+0qu4/P9Cp05SgjqSTMoC0QFVgEuaNodVoGZFQtYBeVrbPoZ9DTB/GT6oYzfp0Hp4S
         q3qDqQV6sazxwm+kxTP/rAxaBm+17kpj0Je/tQxKOzKxcIlzAMZWR3wKrODrwcS7lViD
         AjTNMb2r0/zx3wqI10YfEwaFGaTg9wMy7Hrow1LnJXSQA4k5HfI7nJY6Jb0NI6RnRw5i
         RklfuYYIvuKVdtump5NbCJe5ayM+gJ1fbKD4qQwfW9SOLSFHDK/r+S8o+gkBz6rR2B5P
         JZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746169837; x=1746774637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U06ss2HdcwirNeiqMijvgDAm/dg/vsq1Q1L1rApoCb0=;
        b=VQdy39SBdXdpZzEjkCXm4vijb4ndf7RYoUVwAXiP9jqtV6++RZn7rXXdrL+I0JHbFK
         2r0f0ZhjqcFe2rF1qRkVYpqM9E9VVx5f54ujVYqqbv5RsopmcMvqURLPHkDyyEhv450u
         z2Dn88ljY9QqOHggFy1pAjtCqOUc9ekhZqFLavZUJ4nz4gKFYnOZzmLy1/+Pog5U39Fp
         /93vauIcdYCvHnLixyqU4wR8xjAXfkHqX3N45Wb9R98WULB7Mxe6KzNrOd931BcpZOBQ
         eHm121kI3osTDPHHY11uXhMkS3JSHQFRn465mOZNJlBfGJnV/E1F1yDsqax8vnelCnvw
         tfrw==
X-Forwarded-Encrypted: i=1; AJvYcCUs5ThSkq8B9X0FECpfCr+MitIgIq7g/RFmUeeP9Z0k7J0dqP4NAnP19ObHEUStg2dykIccB2Fy+kGrswxILq4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfuVdHYJ1uBLLuUG7TAjqCyiKb/8w997QBdKzABJp2eGNy58RI
	VQrVL9rd7ZbT7itun9wf0qEBQ2GGGjoxBoSBzEsVzKYThINRgiSu2ZTZ+dNVAd0=
X-Gm-Gg: ASbGncsJQdFRu8tf9KmSa37zCx4pzLy8md1FIGZrne0ki+1BKnKvSp5kvGsoxHJWRk9
	/XIPhLT/MGuPOABQBVmTVsI7Sp1BDDqV0o7KqYhMhl6nBbiFb048MDWtdClcQwpuAcih/gb+JFB
	Okm4wilKrtWxFapvDhYAsA7fQAYeOl2pqkRQ/cDrPWOAeuQgaIC8lEkmkx/NsZ2jBfxrkN7vvKW
	AbU0pZhhvJVsIbV6sQIvJMfbghO57fBVIV8gXZV6ob80FcffwMgCIs8XdAqZ+QgEpQO8xlaOvnj
	YFyTIXksTVrkVlOAF88SU6+gIvDS5zTC+h/3DmVLlKL4yg==
X-Google-Smtp-Source: AGHT+IHtNfp9BE0awULIWqLBT0upZss91Y/YU3Wv6VlCY1VbHPu43hU9YAJA4Xe2Y6q9r/3mhLUIjA==
X-Received: by 2002:a05:600c:4710:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-441bbeda9d2mr12759135e9.17.1746169837547;
        Fri, 02 May 2025 00:10:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae7cc6sm1328988f8f.55.2025.05.02.00.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:10:36 -0700 (PDT)
Date: Fri, 2 May 2025 10:10:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Honggyu Kim <honggyu.kim@sk.com>
Cc: Rakie Kim <rakie.kim@sk.com>, kernel_team@skhynix.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Gregory Price <gourry@gourry.net>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mm/mempolicy: Fix error code in sysfs_wi_node_add()
Message-ID: <aBRv6RmQf7vNZQMJ@stanley.mountain>
References: <aAij2oUCP1zmcoPv@stanley.mountain>
 <9837bbe0-d494-43bb-8e92-8cbf47a32b68@sk.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9837bbe0-d494-43bb-8e92-8cbf47a32b68@sk.com>

On Fri, May 02, 2025 at 03:46:21PM +0900, Honggyu Kim wrote:
> Hi Dan,
> 
> On 4/23/2025 5:24 PM, Dan Carpenter wrote:
> > Return -EEXIST if the node already exists.  Don't return success.
> > 
> > Fixes: 1bf270ac1b0a ("mm/mempolicy: support memory hotplug in weighted interleave")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > Potentially returning success was intentional?  This is from static
> > analysis and I can't be totally sure.
> > 
> >   mm/mempolicy.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> > index f43951668c41..0538a994440a 100644
> > --- a/mm/mempolicy.c
> > +++ b/mm/mempolicy.c
> > @@ -3539,7 +3539,7 @@ static const struct kobj_type wi_ktype = {
> >   static int sysfs_wi_node_add(int nid)
> >   {
> > -	int ret = 0;
> > +	int ret;
> >   	char *name;
> >   	struct iw_node_attr *new_attr;
> > @@ -3569,6 +3569,7 @@ static int sysfs_wi_node_add(int nid)
> >   	if (wi_group->nattrs[nid]) {
> >   		mutex_unlock(&wi_group->kobj_lock);
> >   		pr_info("node%d already exists\n", nid);
> > +		ret = -EEXIST;
> 
> Returning -EEXIST here looks good to me, but could you remove the above pr_info
> as well?  I mean the following change is needed.
> 
> -		pr_info("node%d already exists\n", nid)
> +		ret = -EEXIST;
> 
> We don't need the above pr_info here because we delegate a warning message to
> its caller wi_node_notifier().
> 
> This can close another warning report below.
> https://lore.kernel.org/all/202505020458.yLHRAaW9-lkp@intel.com
> 
> If you apply my suggestion then please add
> 
> 	Reviewed-by: Honggyu Kim <honggyu.kim@sk.com>
> 

Rakie Kim was pretty confident that returning 0 was intentional.  Btw,
Smatch considers it intentional if the "ret = 0;" is within 5
lines of the goto.  Or we could add a comment, which wouldn't silence
the warning but it would help people reading the code.

regards,
dan carpenter

