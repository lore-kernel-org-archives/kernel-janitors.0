Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEFC14B947
	for <kernel-janitors@vger.kernel.org>; Sat, 24 Aug 2024 15:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724512865; cv=none; b=XqrF2pnQFefSzYY/RWjLn503zx1mLBWQUdQ5APelaUQztQ+EEoh9yx+H8eV7P0fktIkwdX8gjAVWliU4DGGvnU+yT+pGenmFsgWYouanRyxtJZDg4ZZRQbJYWKFWTgi8+B1QQm0cir1A96tsuajZwQJnOJGvg8mO8U/vYGNICLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724512865; c=relaxed/simple;
	bh=b0xGI+p9gcd/yQoiWwhTGLwLxo5Oe/8tkN1WCnxaiMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m4vZaYWIqos+SP0BbYcrye4Np9sFfKX5Fpp9gRcc1wZGqmJuKGT2XEYWxhxTn5GxIYT6K77+uxHMV3wALpo+QQhwbAvvIC0rTc/YP6HCQCEqNf/WSTxiTSqaffIaLGFmCU7VqZTbDmZWFL863w35zy7G6idB04Ou3jBaZUN8HQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=azsTXq+P; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="azsTXq+P"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7a3375015f8so194911085a.1
        for <kernel-janitors@vger.kernel.org>; Sat, 24 Aug 2024 08:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1724512862; x=1725117662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iFD/HdZvKaQemZyniW7+rQ360L3m9+rOVbHWSYB5I1E=;
        b=azsTXq+PLKP8FBVIRVpSLj+lydrLv5AEAxkQZjwe1RM6taNspObAcumrmVdQc6EBUF
         B8mMaSEGhzbUJzALVj9PwwK8v7JA3rS/uV1CSAiBXDgLBXgHg2vEZlsZthJ2yrCCJKfG
         0DGuNwARdVapiT+ccG4gCVW21YrbzEocaFNAhHrWte8hMpw3Vvd3p5fGgL3YeMoVgJV2
         NAJWn+TY4gcpjmHKAp+jV/wZQ1dbWGW3PDcyT9kfBxyCioiw0b+L2146OO7YZIytS6uT
         kVZ4oWiJ+pBUSroz8YsYypwokyGP8/LdNxoiEXAdTZASqaDXyVujkpbpGOaTGrIx389l
         dhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724512862; x=1725117662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFD/HdZvKaQemZyniW7+rQ360L3m9+rOVbHWSYB5I1E=;
        b=NYCqcMviRt4J41Vh5b8Mizctl4bQ7aZQRY72Y8FvI5oKFT8EnCs2rrlLCk+dV++4U8
         kQFGfSaz1hX96r/KTZpKVlCfWBUJQeLQUcIhdyaEdrHerDx2PzKJrKa0RF/kZsJkPcBn
         1BC1dW7qULP5sG5Sy1dy6UNALKUHg7yB6jGRW0bKsbnwpNguSiRjIfbMzVV1Qs3CQ1O9
         IjS5BP98gmQVv8JY2EHb4v6XhlspuIx2lz+PhMYMUpAb9Gngxk+H5cGbpT6F70uZkM0g
         zq4Uf+wzoQFgTZxl33ULale2uUjVWplNeFIDv3lEhxlPLrr3W87ORvteAPhnqHj4Hk8p
         a3Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXHEGnF9oDBos7MnS07qAM0veSZIHdUITIp52GmeCRKm+OWSSH1UXuSF/S3oZwwO5KX+5hUC2NzRU93r+0fEbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV2D4F8v+sfm2Tz6fwIXOuPCyj/TGlMroQJ4GD8ndi6fgO2WIw
	lXp2TR3kxiG2M+8NaIbYQDIz/CK4pBeq4XYDrziTsboOqkqK2a4ctu8q1RDuug==
X-Google-Smtp-Source: AGHT+IGdt+kqNYPY4hj9CKwN8EktiVIBKnBk8Jy2GFyma/+wYt1JorA8B82+CvYXNoEH5nk/bOOlAA==
X-Received: by 2002:a05:620a:24d0:b0:79e:ff1a:2359 with SMTP id af79cd13be357-7a6896e3e5amr812084585a.14.1724512861875;
        Sat, 24 Aug 2024 08:21:01 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::546])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a67f3fbdafsm285372585a.119.2024.08.24.08.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 08:21:01 -0700 (PDT)
Date: Sat, 24 Aug 2024 11:20:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Oliver Neukum <oneukum@suse.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-scsi@vger.kernel.org
Subject: Re: [PATCH] usb-storage: Constify struct usb_device_id and
 us_unusual_dev
Message-ID: <59fe0f83-168c-4f23-b2bf-504649f29d75@rowland.harvard.edu>
References: <b1b75a2a64b1f6cfad2a611f71393f281178fd3f.1724507157.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1b75a2a64b1f6cfad2a611f71393f281178fd3f.1724507157.git.christophe.jaillet@wanadoo.fr>

On Sat, Aug 24, 2024 at 03:47:07PM +0200, 'Christophe JAILLET' via USB Mass Storage on Linux wrote:
> 'struct usb_device_id' and 'struct us_unusual_dev' are not modified in
> these drivers.
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security, especially when the structure holds some
> function pointers (which is the case for struct us_unusual_dev).
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   25249	   4261	    896	  30406	   76c6	drivers/usb/storage/alauda.o
>    3969	    672	    360	   5001	   1389	drivers/usb/storage/cypress_atacb.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   25461	   4041	    896	  30398	   76be	drivers/usb/storage/alauda.o
>    4225	    400	    360	   4985	   1379	drivers/usb/storage/cypress_atacb.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only.
> 
> I hope that a single patch for all drivers in drivers/usb/storage/ is fine.
> ---
>  drivers/usb/storage/alauda.c        | 4 ++--
>  drivers/usb/storage/cypress_atacb.c | 4 ++--
>  drivers/usb/storage/datafab.c       | 4 ++--
>  drivers/usb/storage/ene_ub6250.c    | 4 ++--
>  drivers/usb/storage/freecom.c       | 4 ++--
>  drivers/usb/storage/isd200.c        | 4 ++--
>  drivers/usb/storage/jumpshot.c      | 4 ++--
>  drivers/usb/storage/karma.c         | 4 ++--
>  drivers/usb/storage/onetouch.c      | 4 ++--
>  drivers/usb/storage/sddr09.c        | 4 ++--
>  drivers/usb/storage/sddr55.c        | 4 ++--
>  drivers/usb/storage/shuttle_usbat.c | 4 ++--
>  drivers/usb/storage/uas.c           | 2 +-
>  13 files changed, 25 insertions(+), 25 deletions(-)

Acked-by: Alan Stern <stern@rowland.harvard.edu>
