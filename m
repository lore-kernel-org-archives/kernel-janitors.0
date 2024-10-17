Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0C81D63FA
	for <kernel-janitors@vger.kernel.org>; Thu, 17 Oct 2024 08:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729155441; cv=none; b=bx3N/0MQfduj5YxZD887dmbqXR7Oj8FHpPh4XwNOReTLzPeCWNQ/wFkePtgGEg7wE0eY/aEdzFXi1+t/8hFpuFe5pZaY/+yH+roYzVf+k3w5jUCPIagv434Fv53k0nCZM4FzyQRBJCEteoPOwR7zbIPosQ28K7njbORE14ehe+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729155441; c=relaxed/simple;
	bh=iFSLKi+JqbE5QIXS1t+TmqgxzgU2rhTSmgEUGjgHdvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GG7Ds11xaxQgrHiARG1vpX8gEqsUW6VBKiLBThtd9E4U85Rm4MxjrU+EhoBZjhkqIYYWSSuFWSm6VW8X7zN3pxjK2hwwpLXJ1OspZYmwFvg9iggZe9PyObv/LckfSjqYXdGfoIJ8dbmAuM2HwbmBFUikUaavrrXohtJ96YdUWkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CVuJiih0; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CVuJiih0"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c9362c26d8so3091922a12.1
        for <kernel-janitors@vger.kernel.org>; Thu, 17 Oct 2024 01:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729155435; x=1729760235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=71u/2ImVUSG6tRSALKKCPqTPCxFY1jTTM2tTLu1wUA0=;
        b=CVuJiih0AV+QNOg20M84HWc1D6Qg8Qbp6RnfLwcnNyCCnml700FIog2+QQxmVLA9A1
         RQnpEf5aQukcTvuEKCTCBm+pOqDnaLJVnxE3Bsui/OCpBRXW9Hu+caQdbcn3d4K5YNUM
         hUVD58XxbwBt5V2Phkgv5bTX72ADoqe0ZuYogtT/C11dmRcFoiYhJgrAYhglLkd4pDEs
         OO+exGwF19yxR0G7QRKtTCQGGTUVGuHcyuxPX2W3XOHVPpTHLDtfhU7UWAdAy/1EfG1u
         JqZAYlutiouwgOV2Kgyu+ETmFwdPFXfdpDJyDWmIBiFrgTTWPTTudPaYzdyXlIHjsLaN
         4lfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729155435; x=1729760235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71u/2ImVUSG6tRSALKKCPqTPCxFY1jTTM2tTLu1wUA0=;
        b=t7fBBhQwpAenJ4wUjkY6akBiOK1PB7ydr1FaXgrCsCn/nR5AtPXd5P5RVMBs/cndlS
         1umfG0oBT4S4hMTuJ1TtjA19S0CxNSRErXRr4+pcaleomp2Ew2eJeqMvxZZPjTTuvDdU
         IwB36m0VFw2CtWaRk7SxGcz846j1kMVCn1wC1N9pGiFXaJaxm7iruVQCKpppkN5SnFef
         Gt1I2pVgAcfNfO26v91+smhth6TMbd53oN2XZ2dOLN4nFqpLRaq9+/NnYXEuoQTqqE3u
         jiOnK+zDtc+Zd0U5bCyV4/zJzB9nRPCCivo9LoOK+T04efvBJCJYHd72bhujCKgMvn0F
         I/Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVSRzJtdHzG5Az4sZVSRJ7gj/cyh78qX+oILaUCrDAS2qpTUamqkutHS6h1anW2cRSHAYTlRrZW8siSbDH1Wew=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGErnA0gauF6c/kQyE2dr/GKWKpVFgSY5dYvDSzIEImOO6bsdO
	54vFgLM34MP5nJxkjYN7P9dqghwxq3flAdFnXa76L517mjdsi1bCl+vfONc+a7Q=
X-Google-Smtp-Source: AGHT+IGYYEqktdQg4/62lwG+WcVcV3tKvLYkXGKPRL6l8VihPBEL2cH/36Xj6ngD8Ie71PGXZIKeJQ==
X-Received: by 2002:a17:907:3fa5:b0:a99:fcbe:c96b with SMTP id a640c23a62f3a-a9a4cc3aaacmr224024166b.25.1729155434615;
        Thu, 17 Oct 2024 01:57:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a298173c8sm268786266b.123.2024.10.17.01.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:57:13 -0700 (PDT)
Date: Thu, 17 Oct 2024 11:57:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: John Garry <john.g.garry@oracle.com>
Cc: Colin Ian King <colin.i.king@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] scsi: scsi_debug: remove a redundant assignment to
 variable ret
Message-ID: <a2515a3d-1dbb-48b6-a489-25aba3358068@stanley.mountain>
References: <20241002135043.942327-1-colin.i.king@gmail.com>
 <2be706cc-0944-4413-b1b0-52d34fbdadf8@stanley.mountain>
 <9151ca6d-7153-4a97-aaa2-7277fc5ffa84@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9151ca6d-7153-4a97-aaa2-7277fc5ffa84@oracle.com>

On Wed, Oct 16, 2024 at 08:16:16AM +0100, John Garry wrote:
> On 02/10/2024 16:10, Dan Carpenter wrote:
> > On Wed, Oct 02, 2024 at 02:50:43PM +0100, Colin Ian King wrote:
> > > The variable ret is being assigned a value that is never read, the
> > > following break statement exits the loop where ret is being re-assigned
> > > a new value. Remove the redundant assignment.
> > > 
> > > Signed-off-by: Colin Ian King<colin.i.king@gmail.com>
> > > ---
> > >   drivers/scsi/scsi_debug.c | 4 +---
> > >   1 file changed, 1 insertion(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
> > > index d95f417e24c0..7c60f5acc4a3 100644
> > > --- a/drivers/scsi/scsi_debug.c
> > > +++ b/drivers/scsi/scsi_debug.c
> > > @@ -3686,14 +3686,12 @@ static int do_device_access(struct sdeb_store_info *sip, struct scsi_cmnd *scp,
> > >   		sdeb_data_sector_lock(sip, do_write);
> > >   		ret = sg_copy_buffer(sdb->table.sgl, sdb->table.nents,
> > You would think there would be a:
> > 
> > 	total += ret;
> > 
> > here.
> > 
> > >   		   fsp + (block * sdebug_sector_size),
> > >   		   sdebug_sector_size, sg_skip, do_write);T
> > >   		sdeb_data_sector_unlock(sip, do_write);
> > > -		if (ret != sdebug_sector_size) {
> > > -			ret += (i * sdebug_sector_size);
> > > +		if (ret != sdebug_sector_size)
> > >   			break;
> > > -		}
> > >   		sg_skip += sdebug_sector_size;
> > >   		if (++block >= sdebug_store_sectors)
> > >   			block = 0;
> > >   	}
> > >   	ret = num * sdebug_sector_size;
> >          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > And that this would be a "return total;"
> 
> Right, the function is currently a little messy as there is no variable for
> "total", and we re-assign ret per loop.
> 
> So I think that we can either:
> a. introduce a variable to hold "total"
> b. this change:
> 
> diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
> index af5e3a7f47a9..39218ffc6a31 100644
> --- a/drivers/scsi/scsi_debug.c
> +++ b/drivers/scsi/scsi_debug.c
> @@ -3690,13 +3690,14 @@ static int do_device_access(struct
> sdeb_store_info *sip, struct scsi_cmnd *scp,
>                sdeb_data_sector_unlock(sip, do_write);
>                if (ret != sdebug_sector_size) {
>                        ret += (i * sdebug_sector_size);
> -                       break;
> +                       goto out_unlock;
>                }
>                sg_skip += sdebug_sector_size;
>                if (++block >= sdebug_store_sectors)
>                        block = 0;
>        }
>        ret = num * sdebug_sector_size;
> +out_unlock:
>        sdeb_data_unlock(sip, atomic);
> 
> 
> Maybe a. is better, as b. is maintaining some messiness.
> 

I'm happy with option a.

regards,
dan carpenter

