Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F14332EC4
	for <kernel-janitors@vger.kernel.org>; Tue, 25 Nov 2025 18:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764097176; cv=none; b=P0TVPR/go/lvdnh2zcZTWd0QqjEfAW9vWP8SAJGLHRQgAUqLY6EwnsTWC5TOlwtlBcRQBZLD1Ljl2yXNkrC+rNe/2Jc8EQuMpxWNXQm9wu3AcGseMR8fl0XWyO7X6xorn6/8geH/rUlqf/VTBmXNExKygjZZWl7pCzRP8Nvb9oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764097176; c=relaxed/simple;
	bh=yOFucbp8qhMoIw4wLHpUT/X36VLPm5l//pIaGkCFQlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aAj6LrxsjkZYWjp3K/HBhpmQaXIWGg3mp8GXwt+ExfA27hQImuahIweOnWFotqdO6WQdTuqLGevpMYIwiypV6/oXjdR8U63lwmTuGgaC/SoEhGZN//OoC49741LeGsozTYvdQcG6Ltggeveyw8LJJ5KAFcmG3bvmDeIN+iIXnl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fbXAotmH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fbXAotmH"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779d47be12so45379315e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Nov 2025 10:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764097173; x=1764701973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jmBPXp4FX8VWv8A/1xzlTIxHcprYvbnP+acWiPY5y1E=;
        b=fbXAotmHJzXgQSEsgW+pJhTBf0VTk25s9Pbubk/fe2wjlSe0WZ6bN8Sai+3yDW4mtb
         kbRPdtWiwhSrQ3GKQ6OPMTapkKyoNyySoobjZ5HVjFsc8gmdMGe7/l2fzS+7VWwXnKvH
         iFfAz05oe2TqwV/pN42aRk0KrILZtugLiIp/Xw85HDb/9jUQgn0g+2gN2N74VSYW9vw4
         wciQv5i/Zzvz+wyIJ/LypuNzf9mg9Q7sBHmNgk9aqoQBlS2jBQEFM3gaFq0QuWGLKbxE
         jG9+wLXUJpR+c6YpBsSy5tUduoTs2Df5Se6l2rxg0JmYkc96H1BADpNtnmP/L2aeB5bD
         K4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764097173; x=1764701973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmBPXp4FX8VWv8A/1xzlTIxHcprYvbnP+acWiPY5y1E=;
        b=Eg+1lfbxMyS1kdSC0+SJkkcz2YGNfrpdIHH817MkhhehaG8vZKQBgl6WQSOvuQkb+N
         G0XdvMe/z0S0xUJgjms81dQLQ/6alFbmXtG6Et9cCkI3w+cyMhmm+RaSbCvo546mecLT
         C4DJaKADWxBPObQ6sSne38CZycvI2rLfDF4hLW0phPg9L/q9Fy08gLyyeKrQNhQxiuh7
         9TJv6ZfUwfx37Jk/2Gt0dW4p/arsdet9Rol7+wjvWiam1sCFeaIzYFvXIBA8z94vBlIc
         2e3loHp9QW6HQ98UURXiRNnmgMtzSoxhPka/KEcEZhdghVuV5451zAahoth6kKt6A1Rv
         9ejw==
X-Forwarded-Encrypted: i=1; AJvYcCVeIzZF42dToC5fuBXPymEs3XpSM5zEWLP8hcP40sAFAdgNI4gOFYJxEV9DbkMJWb4zeI3oOpwneIAqSl78R50=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJg4LpY1okExyaY6w+ldmZa4PTT0/091b32XKC3akIr1zuq2fC
	vHJp3iaM5yUGKe4Yl+IvKk4qpRTNQu+Jda1w/OZEteWMTtlaMT2e+fys5ZUyPGZlYCc2Us5tqzU
	iIws4
X-Gm-Gg: ASbGncuv3T47DqrmzCIGEZMYaalcJKgAwYvnN/yuIioVrhqA5zoaIcs38R91VNnBL0T
	zszIxJea0a+rc/Lcgg6TvPV+137Pf6W/+SSbMxhire1hPRFMkNMEc3iadixyvBNiT4uC0bdmHNy
	7PNm4wMGFjm0FVTlr9JC/Qd9bY8vJgGjUJMlN3xgAn3bfjyGuVNkc4Ul+Pu1wqD8tNDnjmEfVSi
	/hMYViibEomZaRSfZOsY1FEurjF9SJekT3s5H8Yrc23+zf+BAgwiHUL0F2qTUIJ8lz6YK2FPykD
	fqpmcITqi43Wnp7oNLrhO1SpQI22KrXT2T+Glk8xUDyGmVk9yd1Z+z4M51pu3MsSLVBrUvLbfqc
	5pvdDwlLCWdE1Qp9qjtL7l8AQ4/Wr5xWex9AloTCxiyfFMGg6/SEXTL1zq0vt3ax/EmgujesxsC
	FetRU4IAb1weTgXnMh
X-Google-Smtp-Source: AGHT+IHwbKRr1pvKyNsFNGaFEvgiVnbE4yxn0br2mGaIpqkjm2b1jEyBexkRR5mnkMzoGLfDWc+rGg==
X-Received: by 2002:a05:600c:46cc:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-477c0174856mr167233485e9.7.1764097173292;
        Tue, 25 Nov 2025 10:59:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4790add4b46sm4117085e9.4.2025.11.25.10.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 10:59:32 -0800 (PST)
Date: Tue, 25 Nov 2025 21:59:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ira Weiny <ira.weiny@intel.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] nvdimm: Prevent integer overflow in
 ramdax_get_config_data()
Message-ID: <aSX8kcQT3z-iD94M@stanley.mountain>
References: <aSW0-9cJcTMTynTj@stanley.mountain>
 <6925db85a9343_63977100fd@iweiny-mobl.notmuch>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6925db85a9343_63977100fd@iweiny-mobl.notmuch>

On Tue, Nov 25, 2025 at 10:38:29AM -0600, Ira Weiny wrote:
> Dan Carpenter wrote:
> > The "cmd->in_offset" variable comes from the user via the __nd_ioctl()
> > function.  The problem is that the "cmd->in_offset + cmd->in_length"
> > addition could have an integer wrapping issue if cmd->in_offset is close
> > to UINT_MAX .  The "cmd->in_length" variable has been capped, but the
> > "cmd->in_offset" variable has not.  Both of these variables are type u32.
> 
> Does ramdax_set_config_data() also need this?

Yes.  It does.  These are from Smatch warnings, right.  They take a few
rebuilds for the taint information to propagate from the ioctl to the
ramdax_get_config_data() function.  When I rebuilt it, then it propagates
to both so I would have seen the ramdax_set_config_data() tomorrow.

But they're called from the same function so the taint data should
have propagated to both at the same time...  WTF?  I don't know what
happened.  Anyway, I will fix that and resend.

Thanks for noticing.

>  I'm not quite following where in_length is capped so I'm inclined to
> add size_add in both set and get.

I meant that the  if (struct_size(cmd, in_buf, cmd->in_length) > buf_len)
line checks that cmd->in_length is okay.

regards,
dan carpenter

