Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CC428467D
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 16:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426036; cv=none; b=Kzxan/sJpRbP5rPpbLrJKCS8eX8lt3YETVHJ2+ygvRl09IY8yxHtqPewpVm3/2432V3rVSUjYD37RNo2hL1/I/ZcUc5OFff+i5yCcyc+HMGyzr+UirBAB6aIEDYr+zjpXP+gHJQeR/Nbez2QbXAp5tF9HEiKKBSAWS2+OSaK6Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426036; c=relaxed/simple;
	bh=gLkrQieopHW+FJ7kdxKuJoCxNzN9q1pf7XZqJP/rXJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dR8LI5um7OMGzZlKqXscRhvZm9Bc5j6G2ZYyEQ7NcZbYGBjskvVVhiLgduVEtq0vm44VywsdTljFmcf0w6VzAuSM9bho9KedxvPTgVKoIL8gVntqrSJFOEnIJjZGyAK0xozVlrdYXGDuHBv3MUJE0ShTHHVG7LkHdyIpOp6qZQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Q8Y4OnPV; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Q8Y4OnPV"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c5f720c717so138292085a.0
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 09:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745426033; x=1746030833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bCNtGsQ5GiTaIBuJArPjLavQ92rjl64A1xom0cF912I=;
        b=Q8Y4OnPVmQzjpEF1Wfu2y72HlfSp8TpnmhHxWrLTRVWpfuUdlcAK0O1vuiZMxrLjkg
         4I/iX/pNpYQuU9Y0UxbEnIT+bDpEOQVvxd3seS7JjKzrsjMbrrhpRam4Wic3wgyUOGik
         mk+T+4OjRoPFUrSeK7xErD8qVuTqZwFRcs13vcRL3J9hU0wbIvUHpGbxJbLcmb1ZY9Ss
         43hG2ssunwGao8LN70up8rRK5KC2FAVPWELeFF1E6rDph9FIzeV+BTOXjNwXl4rLOk6D
         l99Rw6XNT35qVAhaA9JZidbg/uN97nspYhhZExklyDeVoEVoUsRc/kO76TP419adZc5+
         13gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745426033; x=1746030833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCNtGsQ5GiTaIBuJArPjLavQ92rjl64A1xom0cF912I=;
        b=HOwJiho46pCoy53gxXqxV0YmLuGvWeZHg4PtdYyZVm7Md/kobJJ8K+o0F11uZ2GrEA
         T3c2K5sy+uE+CNYbPv/f1MlbhVj2i1uyWSATHgmwdXHtul0u6V75e7qB3qbaF50IUjIp
         eK3pyZlh0Et2S4n9h4ZBZSVxrdc52i52OK/ps3Q+fbrz7QjtKSUTw/unn8WhVqCT6PuY
         M+a+qsmmSkANtw3KluM4z8GkV9QYrI8+dIJSWeVcO7wtZZs7QjMehRhibwWr3gGbSpyP
         BXDd7EEnZad7kcjL0HLBKwiEUALoDd9JljSqWcMJ7ctx8vmaPu09LENP777/rpgViF9a
         OS1w==
X-Forwarded-Encrypted: i=1; AJvYcCVR4cUgbhJfHs9pw0wFPxjK1F5T+ZQ6nV45qRLgej7K/FoRxZDynJ6GSokOKkrIos6D3S2wISlUePzCY/4RTjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyepXJm97+TczpZXHpvBKT/JfHzNQJfQO4FK3h4+7OS0uJZWDxP
	wjJSO9eJraNWKDywAual1+U6/qLecJdCRDNGNULJALkHLjcWpZ6vEt1NeZDHfqE=
X-Gm-Gg: ASbGncvZbHvYaPOr9ZfLrLwrf+os02wTqzknWIFBxy2JfWxgbVgRp+QtOTonsjrgyDf
	i01Uu5fYG73DPTvwpWcXIBIyKlV/CD/Y8j0xSBE1+m/G4/S6YCgkGMOxnAijhOfzZqhtMXIRnWS
	zWD1dNVAQY5dlgq345otLNxRcN3McBJxm198GM/8lhOuQ3AxewOnWb2rT7ybOdGNzfDOus5oe2O
	23jyOwmekFS4Hz53kxRSDZoKKbh9DEVSSsmkJLUZ0ymbuMl4e3QUi9KWF7G+d15kBru7wszAKIB
	dGLhXqYMgSeWFw1uGlb7OVLe/++WR8GtY1MqiA7aCya6/Loy+POx4tj/0/feycG4EPAuZ91TBeI
	po5iiqrV0Zg/+a/dJoAueBq9jl2kHNmIxRw==
X-Google-Smtp-Source: AGHT+IEXXa/SP1vcBYCngnvdcxcDUG3M7rtCWaP8VHBCa5k1RUmFf/E+UnlXZTp1S7EeoNVsSxUnVw==
X-Received: by 2002:a05:620a:d86:b0:7c7:a536:66d1 with SMTP id af79cd13be357-7c94d813726mr525145285a.6.1745426032758;
        Wed, 23 Apr 2025 09:33:52 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b6e10dsm697314785a.108.2025.04.23.09.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 09:33:52 -0700 (PDT)
Date: Wed, 23 Apr 2025 12:33:50 -0400
From: Gregory Price <gourry@gourry.net>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rakie Kim <rakie.kim@sk.com>, Andrew Morton <akpm@linux-foundation.org>,
	Honggyu Kim <honggyu.kim@sk.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mm/mempolicy: Fix error code in sysfs_wi_node_add()
Message-ID: <aAkWbsmFW2dbRwhk@gourry-fedora-PF4VCD3F>
References: <aAij2oUCP1zmcoPv@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAij2oUCP1zmcoPv@stanley.mountain>

On Wed, Apr 23, 2025 at 11:24:58AM +0300, Dan Carpenter wrote:
> Return -EEXIST if the node already exists.  Don't return success.
> 
> Fixes: 1bf270ac1b0a ("mm/mempolicy: support memory hotplug in weighted interleave")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Potentially returning success was intentional?  This is from static
> analysis and I can't be totally sure.

I think this was intentional to allow hotplug callbacks to continue
executing.  I will let the SK folks who wrote the patch confirm/deny.

If it is intentional, then we need to add a comment here to explain.

~Gregory

> 
>  mm/mempolicy.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index f43951668c41..0538a994440a 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -3539,7 +3539,7 @@ static const struct kobj_type wi_ktype = {
>  
>  static int sysfs_wi_node_add(int nid)
>  {
> -	int ret = 0;
> +	int ret;
>  	char *name;
>  	struct iw_node_attr *new_attr;
>  
> @@ -3569,6 +3569,7 @@ static int sysfs_wi_node_add(int nid)
>  	if (wi_group->nattrs[nid]) {
>  		mutex_unlock(&wi_group->kobj_lock);
>  		pr_info("node%d already exists\n", nid);
> +		ret = -EEXIST;
>  		goto out;
>  	}
>  
> -- 
> 2.47.2
> 
