Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2DB14292
	for <kernel-janitors@vger.kernel.org>; Sat, 16 Mar 2024 09:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710582418; cv=none; b=oHjIBUCAdxQxnJ5zvrLL2B8M7FH/iyCh/gwIJVwQM77qIJzE0TYiJeewg4Gig9wa7XmNFP6rLdnjMgoaPlp0M5MB5gHwkXjcbAqwJHl8SACc6DuSTzVakiwiwgQS1rqY76rdtktc1jMTGUn0fwG5syBMOeng9OUI1cXjmbC6Fro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710582418; c=relaxed/simple;
	bh=DMtx0/3geiYhVdzSo4B/B12kXf6OyeqliMzNBLNMbFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhpeiXlR4irmmQgkiAmpc3YrWUC6LewF1MZtSSYqvKgV0A4ti31GNd5MsydwTCO/il+srKlujUwnzeJ6BkQy1x7uTzRZ8a6uqjri+SGiaIKH6HFlchoeiLwIpJTFvoy0lTYHpVX6nz3aHGgwrFxGXQuEOlRbOVuqomFJYlyPc2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=XO0kuuAW; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="XO0kuuAW"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d475b6609eso36676181fa.2
        for <kernel-janitors@vger.kernel.org>; Sat, 16 Mar 2024 02:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1710582414; x=1711187214; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fUW/FIbXtZhpkOcYQxCVkz21OR+E2wEaVF3lBWv8kQM=;
        b=XO0kuuAWVGXCHp3fBjnEyHI4y5M/FWfeRaQfsebasvPkOSqgc+ysKHwFuqvoLiKNv7
         +vZAGYRFQoxVNccE517ZYtEyNrDOKyo4tfTzr/TT48xXKspdub2fFo2OPrboxx1jpBbs
         xC3KuHO0/5FAmElYt3foCnetcTFgV18IOdMxj93145Jj1Wd48R5YvR03EXWuiMWQL49I
         G56mAKnD6dvHxLw6i5L40G4WYrzwiBtEIxPkX2fRIoOiHhxtBCzfKFKLogqPwIYrNtej
         w4iNIAk57yxvtZGju5y5oEpkK4klCozTuoQkcLo2CowFeAOGC8p8vMbjvdJhKxj50eRa
         /0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710582414; x=1711187214;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fUW/FIbXtZhpkOcYQxCVkz21OR+E2wEaVF3lBWv8kQM=;
        b=ay2scGG+HqxAFI6UY4SUTFjxUxd79zEb/G6JoVwMssXtI7IZTXoWQzJ/VmycUZ6G4i
         11WZD5ze1k8I9GhtAeKabSHMVpaWh9BWGS/31fqi6Agq7hlWPkHlq2yz4CGVna/Yf/qS
         rwAA1ylKh7Qx7nwy7cpjuHaxbEGOe5YH5lDb8YLCzKCPJ/6cZQKnVTg+nta5+cR0N3pW
         LV5eYx64N0ZtOjI3PxO5OLfW5coEX6F6o/Ggg8uLi+79olkgBpPlb2lHQCiLB6BYTx4o
         qoKfATy6KQ6wZ56UrKVQ2Kay1lDOSw5ZD3M4lnhCh+scVfCr/0NSKD47rVn1YZjAVBEL
         a+kw==
X-Forwarded-Encrypted: i=1; AJvYcCU5zUKDOTU2zHoYDQe/xJHBZaguB9XdEzO48D8umFg/TgZBxQ5jnnqflwlMXLraxcR8bmXXdLv3JXZYOFfB5upr3NQo7JBxbB6cXkUVh2zE
X-Gm-Message-State: AOJu0YwXBHEozNFSVwJaEEjd+iRNWCW1mI2moiqyO2MiS4/HudatLFlq
	Ko6XyMHc68evvkf9e9GQnjHMbknICQA2P5cby53jmxitgcLMqJ9D05wUYAyMiDE=
X-Google-Smtp-Source: AGHT+IEDsDdll7w3geO/Tp+xb2ClYrnmkqXOFWJIa3xlfSDYbiyEsikoRMXqjej+3H6Huqwl5UJ7qA==
X-Received: by 2002:a19:ca51:0:b0:513:b061:1815 with SMTP id h17-20020a19ca51000000b00513b0611815mr4296285lfj.18.1710582414145;
        Sat, 16 Mar 2024 02:46:54 -0700 (PDT)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id u19-20020ac25193000000b00513a76b310esm921223lfi.60.2024.03.16.02.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 02:46:53 -0700 (PDT)
Date: Sat, 16 Mar 2024 10:46:52 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Markus Elfring <Markus.Elfring@web.de>,
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: rcar-csi2: Use common error handling code in
 rcsi2_parse_dt()
Message-ID: <20240316094652.GC2092253@ragnatech.se>
References: <8b4203dc-bc0a-4c00-8862-e2d0ed6e346b@web.de>
 <CAMuHMdWwegdks3eEviEsBJE3AvUVKbZqHduYdhuwz=8xTMDs5g@mail.gmail.com>
 <260d82b6-e7fc-40c3-b414-50a883709fd7@moroto.mountain>
 <ZeWnD9YrXLWJYmhT@kekkonen.localdomain>
 <cc121bef-8bca-44e6-81aa-bf8e682bdaf5@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc121bef-8bca-44e6-81aa-bf8e682bdaf5@moroto.mountain>

Hi Dan,

On 2024-03-04 14:16:56 +0300, Dan Carpenter wrote:
> On Mon, Mar 04, 2024 at 10:48:47AM +0000, Sakari Ailus wrote:
> > Hi Dan,
> > 
> > On Fri, Mar 01, 2024 at 04:42:01PM +0300, Dan Carpenter wrote:
> > > Sakari Ailus pointed out in another thread that we could use __free()
> > > instead.  Something like this:
> > > 
> > 
> > Looks good to me.
> 
> Thanks for checking!  I've never used these before.
> 
> > 
> > We could merge this with your SoB (pending Niklas's review). :-) The driver
> > has been since moved under drivers/media/platform/renesas/rcar-vin/ .
> 
> Alright.  I can resend this as a proper patch.

Please do.

I do find the idea of scoped operations and the syntax

    struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;

a bit foreign in a C context. But I think the intention is clear and it 
allows us to avoid having the remember to free the fwnode in error paths 
which is a nice thing.

> 
> regards,
> dan carpenter
> 

-- 
Kind Regards,
Niklas Söderlund
