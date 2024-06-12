Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602C9152DF1
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Jun 2024 11:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718191875; cv=none; b=dhw5fJE4rzvVRX60wHz1COqM7EOVpTjSndIP5hnjOrGsaxgo78hQeM6gi4repEjkWMZ1+oT3SRhYhbCxp8PYVbvA6euIb8+QTuKbk4bjGIS/xEU9KwqE9+UsdUycNkkMjj/yPJvavg11yqf5eKDFKdwi3Q6XxQHcW7PSzv6Pa9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718191875; c=relaxed/simple;
	bh=r66wZYLmFvXt0D9cZgBfb9tuRiJPaVJy+mZp2jglOW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQRQAfpwpW5T+H0A5FhSmoVLtbvpAgeXnwsZwqDY1qA9e/cAweOThtLqNZ99nzuRUKsdnNyBMZpkt3wC3+bYCX8VvGF53Ki8srtHjrTG+5+1qLGpBp4W0z6p2thQMej8BT9Id1s+kx0hnWGEX7yGfC6/bNZaMEaYIcWaGaT4KmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eSZilDcj; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eSZilDcj"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57c75464e77so2743973a12.0
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jun 2024 04:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718191872; x=1718796672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ieujl4+mCZfP+jneLi96UmF3H+59EZDsz47WSP3MPbo=;
        b=eSZilDcjy/LMdcHqyV3qNCK1YTh4Z4q8LGz0y/ghYAA5BIm1pBRUHDsrjsr79fFXfD
         LEIHP5Xzi6E5rAYSNpxjz7a0IfkW6EORjQXJNgehaNkaJ1q5v5xTxhL1qo+dx2+CKzzb
         937pzZjUhB/0vDVhHnmrj4Fv2xWGxjsBOHB6IpTiyT1w5D7Ta9EzBVizXVAFuPMFuseg
         4+NzanL9bhxCjxSX9o/A5HDWJtsV/I1VEUyOjZFzl/WzceltIyw31c6iz6lgKlLuOWun
         3uSpsnUf2RpKP40XVJ4eUJAD/fUErwZ/9KSqvJmpxhob3YQxHNRHd2av93Jf+Q3Lu7L2
         tPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718191872; x=1718796672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ieujl4+mCZfP+jneLi96UmF3H+59EZDsz47WSP3MPbo=;
        b=DKSuOAuQwfk6eqdQhGL5RHE7GcQxvCPPzVLEhObjXL7qrvnMnEfEpxsr8/ul6qVQFB
         hcOJJeJykCj1gSfsRZjX4w/hGN38n+fAkAzCCFlUxAvyG/8WlGVr6GRzqHqTVeqUC+A5
         QxR1XNJYtacsLW4fdgEHmgzpUysUJuTC1X+Yaajiu9FwfNEujAGfPrpyV4Ei5erWL6Kb
         UUYtvumd1gmd1cLj2oYnO7qBcwBQ29nmkj1ZMIorZcmygwNR6gFpa6hUdI7zlP/PBmDt
         5ukuGU3134y+vU0RPRBWLtNvGPqzUxb7TZSE+l2nURWzM6Hm7/yE0gl9MyX3QruKdB/b
         wkDw==
X-Forwarded-Encrypted: i=1; AJvYcCWY/k57Opv6bGJA42tAcTssL2iIz8hM2akvFIQu6o/Ut/l4BTC947JjDA+dwmxtSwatd9bNmp54oSJ5gcIxnrQWy+gn5OO0luXAy3mbdA16
X-Gm-Message-State: AOJu0YxYn7uRm1CGrIjqxAdQArvz0Tqm+ozPdzIUIkR0utwMRsRqvbM6
	/iwUyku37HA9o6FspQjhRTV9sA2xBCAXJjNrzunhlT1xJZ6l4+4WMwkBbqQ6LbI=
X-Google-Smtp-Source: AGHT+IFktql5pDJ89QDBzHQTvLdzWqnS/SXVFQhaj2o8PYolFJOl5+tsqLqr0bufmH0YV6RqSy84gw==
X-Received: by 2002:a50:f68b:0:b0:57c:a7dc:b0e4 with SMTP id 4fb4d7f45d1cf-57ca975695dmr1302795a12.3.1718191871664;
        Wed, 12 Jun 2024 04:31:11 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aae229712sm10929059a12.81.2024.06.12.04.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 04:31:11 -0700 (PDT)
Date: Wed, 12 Jun 2024 13:31:09 +0200
From: Petr Mladek <pmladek@suse.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] vsprintf: add missing MODULE_DESCRIPTION() macro
Message-ID: <ZmmG_dQaTpq4TkGE@pathway.suse.cz>
References: <20240531-md-vsprintf-v1-1-d8bc7e21539a@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531-md-vsprintf-v1-1-d8bc7e21539a@quicinc.com>

On Fri 2024-05-31 19:42:25, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_printf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_scanf.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

JFYI, the patch has been comitted into printk/linux.git,
branch for-6.11.

Best Regards,
Petr
