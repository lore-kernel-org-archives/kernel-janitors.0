Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24B61DF26E
	for <kernel-janitors@vger.kernel.org>; Tue,  3 Mar 2026 00:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772497551; cv=none; b=eAi+P1aoXoCmmjl9jwW9qvvaYvFXlIZ/f6J7tnoN3Ux1orX6ytsBqHDEmuH99UFurGye9DuZ8J/bxdus2oHsBT/XDuFpaDXBmNN9OW0Dw86Ih5ReuAlisuV/Ol+C3z0wFpxzfZaN8LPc0iQ97Jeau1STlxhMc5t8MJ4wS0c7JyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772497551; c=relaxed/simple;
	bh=nLyM2oPF6xKEujjJE8IIxWN27GqEdQwUax+F8Aq6ZL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8h/36HVcW1JClEHohaBM2UktW3y6MygPE4zzK8Le3fivGrj4EsCGavDcATujBwM91/xfH9y7vtvEgxCC0lGs89w6aZHDA2doaQacttpAgnXu+8Iakm58PVfvLrIw6Yi8/iAXL7v9p2UU45xYY/T+KtPQ1PsWf5jCdhXzcP1VK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=MyikHZyg; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="MyikHZyg"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cbc593a67aso449369285a.2
        for <kernel-janitors@vger.kernel.org>; Mon, 02 Mar 2026 16:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1772497549; x=1773102349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zcILp77o/v0Omh/zmVdW5GGMG8Z/qp3ny5THHviWZmE=;
        b=MyikHZyg9k9knoX9YpHM7EwKxyEaSjuoDlON9/TgWtOgTp3wUpujJgzCF7scy4JeSN
         f7klnlPxDNfA5LgPmsI5XPPAUelg8EON4U3dT9Fa+iuzulNbn4QJi96aSgk7z38pJVCr
         fDaUBRMrSdf9i1DaNJpxHfKiNhQLnYTSaEGcG4IPQD6vweU07bEXZ+uaXYxlQUVLptaq
         QWogxrQ5zGHYY4Bf7eydvqOm/JmBo9lLhTK3clALI/6g5fAmVOgDaIuBe0W8r/g7OPsN
         5acau+w5597jz+C59o3stBDu4oZOGT9HY6na00q1khiO01MwwiTAPkZvJ7nrVE5dKEO+
         34Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772497549; x=1773102349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcILp77o/v0Omh/zmVdW5GGMG8Z/qp3ny5THHviWZmE=;
        b=Z/KhOJ8yVdQRlN+PHQNz/4lFtm+GAPOTD+aqx8GmyyvYWCcPeuZQmihdk3BbgDr24E
         XxPN8eHSyu6/Mi4geqkUbeXsdrNdBP03UwoJgaBJbbdOCFuI9JStPFHKznAm5REw9nmr
         KDAeubngqEtXnSpB1wfVcVO8+tn0fAAoClYMsVBj/2/62GRkGNLPLi2T/jRH0AYjXjpk
         GNZL0lTEd6EOl3+FbRSZMfu5IFon3pQcQpVS8zhZsXTnf+7R+lJ3P+0PvvHDVGnX+Ecb
         hmRYLnc5Y68GIBcG2xc325a0d/Jk4GwQ2Ng0NJTGNTLNJLE2BhxYTvGP22qFEt1pwhj3
         UEsA==
X-Forwarded-Encrypted: i=1; AJvYcCVy5w7a2EcjQCmylYY3oNbin48YceTdcAIFQ+5o7hdvQWqnT1DJ6zPUmu83rmM+riibfKJx+ES6OQEAYEMDwKY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzj5qrw+8iNBNWg1EyoV84Hf+9402K3At8LbU1AAn9FVULmEPW
	4nqnd8848Do4SkkVs0TgOQwKP+x6CDBsOyB78LxScp07QT9yepvN3YarBWNOZZFb2Q0=
X-Gm-Gg: ATEYQzwfexjxPUpVY9bcV8BoZS7/HFOEojvYd6lzqebcbBQl1Z5oJWwo3CA7NWBG26A
	Fi09wVIvTgFu8NVzcjcU2rzGmya5uq7ZgDw5xrdFsuY5TY4UOGaFWGTLq53qtLPTysXQsLvR7HL
	UGx8QoJDuoxw1rtNhcbp9O9bM9skWebicv5M9Y5PuTDMQYYDL0NCYOY/JTXckGdggoallgJcLL3
	/SxPg/FYivvHU86ENRmk6ulP7UeN0OLrpuoEMsskcs3qK5sG7us1pmeYNurKUhvTLA+JkQV4Qa9
	vOBKTW7XST6iCq115S07uThkOh4gmjvwWvxGthMWZ6ievF1UtcvwkSs86oSu+r1WM0FqiT3H5fs
	Rjt91C2nDr44zMZuKDPDyUok+m3l67YTKyyMFM+7/NpGMR8NwVzTxCAoWeDhGOx7BAQ6BxIIyVR
	brTfgqLwM0vjLBJ5TOqaftEbfWSBLEUIjR8XvKVObLkl4Zui6/8WwB4FZKTy8YLHqoRMtD24bdO
	J7dVw5w
X-Received: by 2002:a05:620a:29d3:b0:8cb:5393:20f8 with SMTP id af79cd13be357-8cbc8d70e62mr1797838985a.2.1772497548500;
        Mon, 02 Mar 2026 16:25:48 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899f4fb20a3sm49401646d6.31.2026.03.02.16.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 16:25:47 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vxDa7-000000043J8-1LBo;
	Mon, 02 Mar 2026 20:25:47 -0400
Date: Mon, 2 Mar 2026 20:25:47 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH] iommufd: Constify struct dma_buf_attach_ops
Message-ID: <20260303002547.GB964116@ziepe.ca>
References: <67e9126bbffa1d5c05124773a8dd4a3493be77ac.1772139886.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67e9126bbffa1d5c05124773a8dd4a3493be77ac.1772139886.git.christophe.jaillet@wanadoo.fr>

On Thu, Feb 26, 2026 at 10:05:21PM +0100, Christophe JAILLET wrote:
> 'struct dma_buf_attach_ops' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   81096	  13899	    192	  95187	  173d3	drivers/iommu/iommufd/pages.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   81160	  13835	    192	  95187	  173d3	drivers/iommu/iommufd/pages.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
> ---
>  drivers/iommu/iommufd/pages.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied thanks

Jason
