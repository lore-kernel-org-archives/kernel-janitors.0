Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4795229405
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Nov 2023 16:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r70gxG5i"
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4CADF4
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Nov 2023 08:23:51 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5441305cbd1so5654875a12.2
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Nov 2023 08:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699287830; x=1699892630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X/OUAVDeDW1FGUoOSfZFrOaeiTbPIasE84BelZaNPzo=;
        b=r70gxG5iOs9DyfAdUhER9MpU4ihEBZfbLhkDMZr/IY55TlbJygZ7mL45ENtvz+1uI9
         yzABnXAxa3oxj4tN2LwhDDCVRdWprfXAuLZ3t8ZTD6XasyPPGoMW5BaL0GTJZ/aqwBAS
         Vplwm4bH5QSrP1cWwBVEVWDX2fbJAJii2Ik3bNdwMvgZQlWHwxXgqYYGky1ZO17Xq+9T
         W9sbShskeSWObqOEqAGZsP7WOR80M1pVE8YbZQBe1s6v9L7TClQKBkc8djdC2f5+43gf
         zg7RvB3S6UemwuZgd3AcMtWu3dnV3XRbya8dTyBsz8fPmWkTe8G/LUbhD1LtUqDuzr/a
         RN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699287830; x=1699892630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/OUAVDeDW1FGUoOSfZFrOaeiTbPIasE84BelZaNPzo=;
        b=keg3Oq7FbfG67kOmfe6IMmcNWHLHWUwAQeBHe+OgfFCDQJZrA8XWQyM1MmqX6ByEdb
         NlGMGnVnR5+5A9LuUf7xQAKd4RiKyjf1PGACAwowMxCyuO6ptebQlPGY8XpeoN56qHdd
         lvYHRId5Db6mcFt9sW3nEbiofMj6PBM9w6m5xmMjx9E/nO//9OHh3OOmpqIIQh+zTvLr
         gWX7X2wH7dbbBfYqF2ggHGTsmMKLOLjswXXDWIUYgKPLI7SOkC2t3olksYjs1H8NnSg/
         AO/O2pOP1ehUR91eo49m68AkT+TNgbU/3Ckm1oxfD9CPocd1vNVD5xcFbyTtZsrST3Cb
         bvAg==
X-Gm-Message-State: AOJu0YxK+yP9U0P7PoEtB3lDjlmDKiCdoPVsURA1OL3RP8sL8/t9j+er
	pIFNg1ujmGpaKtUOVQ+NxjvM5A==
X-Google-Smtp-Source: AGHT+IG/uWw3t03bxC6ITNHK1stt5SDvYXWCBLutQwdEau303Xm9GJiqyFC6IuLXZUC9vBhJ+bwSYg==
X-Received: by 2002:a50:d781:0:b0:543:cc90:cb8b with SMTP id w1-20020a50d781000000b00543cc90cb8bmr10520995edi.2.1699287830185;
        Mon, 06 Nov 2023 08:23:50 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id eo12-20020a056402530c00b00530a9488623sm4463765edb.46.2023.11.06.08.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 08:23:49 -0800 (PST)
Date: Mon, 6 Nov 2023 19:23:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev,
	linux-mm@kvack.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm/damon/sysfs: eliminate potential uninitialized
 variable warning
Message-ID: <18d2f41d-e442-4f73-89f1-50bf20cd85f2@kadam.mountain>
References: <739e6aaf-a634-4e33-98a8-16546379ec9f@moroto.mountain>
 <20231106144137.9772-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106144137.9772-1-sj@kernel.org>

On Mon, Nov 06, 2023 at 06:41:37AM -0800, SeongJae Park wrote:
> Hi Dan,
> 
> On Mon, 6 Nov 2023 17:07:40 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > The "err" variable is not initialized if damon_target_has_pid(ctx) is
> > false and sys_target->regions->nr is zero.
> 
> Thank you for fixing this.  I actually noticed this issue from Coverity Weekly
> Scan of -next tree (CID 1570878), and was about to send very same fix, but you
> were faster :)
> 
> > 
> > Fixes: 0bcd216c4741 ("mm/damon/sysfs: update monitoring target regions for online input commit")
> 
> Cc stable?
> 

The fixes tag is from last week so I assumed it wasn't in stable yet.

Also to be honest, I wasn't totally positive this bug could occur in
real life.

regards,
dan carpenter

