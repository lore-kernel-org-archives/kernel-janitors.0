Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759C9D51E
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Jul 2024 14:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721829736; cv=none; b=mJGaJ04b6MfCgwaCAxgfoFd/cPSlyUgINj6ECWHP5ej5mhx1uDaCCEWhOS7puLRsQxfpu27L500kGI1jzgIXhXSl48P7ZGh59jZKfnwoEx5SoWyEMBD1nHayiW+kokOnZqIItI2hW/sKx+YQoova831uWIyc6rezqOaJhGz+9qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721829736; c=relaxed/simple;
	bh=wGbOuea6NOYUqz/tr1aRIds7z8JFvKE6US9qQL9rVoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxqtB+KRurhikAzWyqbIpvtN773mjCVaRA1r9PNqA44mVdMvf8GKA0xKn+Oei3fakn2AL4cypDztumgsT6qGsBXWPAlDuSWd5nzrpywDK7n9pd37BY9HQNcWta3DrVC8hU2Zy+Q3X5PBj2ifubHpGIwTbqtExo/kgD54MWoVZgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=d63Z0DAr; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="d63Z0DAr"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f04b3cb33so6780079e87.0
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Jul 2024 07:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721829733; x=1722434533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=03Mi73DYQ+AbiAWB0TbqqqyX+xcerskNuxokfmAHRtQ=;
        b=d63Z0DArKU74wS8jSf34IueN/9U0bgR3lx6Na0FSyOu/l+xFX+75At+BQpTXdDvpky
         7EXLhd74rBDz4rdb+FQwHvZPNv+YhbDdQVhMQ4m9rRxhmiryqBnR0GeKQqSrLp1QcINc
         oKD6bajV2fUBhV/6M18dffaMbOgzkrYjQtEHwy6gMzAHHh3r1iAswS+74YcpDWjU6mQe
         XBofmBfg97eTlvGaDVjJ7GnZJjS9pWMhavqkUF+E6Z4PjCYMkPMCqneZsmjMmgBpYFOh
         1b+FCv9sqxJ5lG+H7A8MxWYWaXMjETeDHiYOlJsova5prxKCFzk876IhiGIcjofVJ0Rv
         MTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721829733; x=1722434533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03Mi73DYQ+AbiAWB0TbqqqyX+xcerskNuxokfmAHRtQ=;
        b=ZcCIRc+2WThggDjmgWngDZslE2gOuddmHiv4ClCB4NYet+2n9rz+CtXY4rellaxgf9
         DJtPQ8JBegqX/SR/2PnwlraIExUbOQ1kY7azIWSP5bN2s9MRIZgMKpMwxNtgAPAqH1xv
         k6gJs4/xAFZbDoTXzR/kx6nQ3OZBi1pptKBYe10hF1efn3oG5cnw7E2fZf/WBPCC2evZ
         L6oL2sbglqXHECcBJ0pSJ6pvjihdyPsQvRU6LYGDoDjrOrdBS+dpjQ0hJAISedXUQVQ0
         dH2SJhPdvZ9FmC14OyoM2ZXN0Xc8sh5XqfC3oL7UEKjlA2Tsa5hsq/OGoQwKTx4mkOhu
         +/wg==
X-Forwarded-Encrypted: i=1; AJvYcCUhbpq6N+8URQ9Na6fO3lqG31tx/Apb44Q7UFp5t+fl6yBsJQHKNTysZKDjF6qQQtrYsfOywWthHMnqAqBiicMZMfa0bnuFWRKOJmjWqUCL
X-Gm-Message-State: AOJu0Yy0ZW3aGUv8eZBLgtgwsSKY9rcxu0wSs+29lRJwVOuaDP8+E3ey
	NTMyfAZi0DBdd5f73EvVUaq5BUx2yB9HCJvcaGcDhw13+hfFGhnVwHg1T5EO8WM=
X-Google-Smtp-Source: AGHT+IEut+zftTEoUgoGJWMwhaJAFLWg/pjaiJRLKgG/u9m02dE6H+2MerckWbRJ73b6hEaScPDGEQ==
X-Received: by 2002:a05:6512:4011:b0:52c:9877:71b7 with SMTP id 2adb3069b0e04-52fcdaa8ea8mr2910247e87.59.1721829730773;
        Wed, 24 Jul 2024 07:02:10 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c8c0218sm646875566b.128.2024.07.24.07.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 07:02:10 -0700 (PDT)
Date: Wed, 24 Jul 2024 16:02:08 +0200
From: Petr Mladek <pmladek@suse.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] vsprintf: add missing MODULE_DESCRIPTION() macro
Message-ID: <ZqEJYJScuEJpo778@pathway.suse.cz>
References: <20240531-md-vsprintf-v1-1-d8bc7e21539a@quicinc.com>
 <ZmmG_dQaTpq4TkGE@pathway.suse.cz>
 <9614c130-d90a-4023-87fd-0b3b12516021@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9614c130-d90a-4023-87fd-0b3b12516021@quicinc.com>

On Tue 2024-07-23 11:53:34, Jeff Johnson wrote:
> On 6/12/2024 4:31 AM, Petr Mladek wrote:
> > On Fri 2024-05-31 19:42:25, Jeff Johnson wrote:
> >> make allmodconfig && make W=1 C=1 reports:
> >> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_printf.o
> >> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_scanf.o
> >>
> >> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> >>
> >> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> > 
> > JFYI, the patch has been comitted into printk/linux.git,
> > branch for-6.11.
> > 
> > Best Regards,
> > Petr
> 
> Hi Petr,
> I see this landed in linux-next, but is not currently in Linus' tree for 6.11.
> Will you be able to have this pulled during the merge window?
> I'm trying to eradicate all of these warnings before 6.11 rc-final.

The pull request is still being discussed, see
https://lore.kernel.org/r/CAHk-=whU_woFnFN-3Jv2hNCmwLg_fkrT42AWwxm-=Ha5BmNX4w@mail.gmail.com

If the printk rework part is not acceptable then I'll send these
trivial changes separately.

Best Regards,
Petr

PS: I have sent the pull request late because I have had vacation
    previous two weeks.
