Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B5B157468
	for <kernel-janitors@vger.kernel.org>; Sat, 14 Sep 2024 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726308337; cv=none; b=uxww9Lp/UTuLiWX+ycUqYKNBZjrSyYFxPR34y8Ir9sVJMxaCmu6+xj+e1rjVTXVjXV2db5DMY9VqcfFwpTrW1zfh7LHHZrVjRnevaJasyNZYp6IyyfqWV6Sl0ycysHLAK/mBnt9pCa/wFpPWgmz7joB1kxSCp7tO6hcNxVntk1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726308337; c=relaxed/simple;
	bh=uyUo2fF7wfyuRfSxg2fJMYfWzcWgmdiUEo5RMmlO/3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcvKyu639paYiPgtxNMTZ3KCR1ldO87qKoUwuvlk4FLvsvTJRqd+hGzBV4HTBQOc4iVtHE3ThLDqi6iBZbczNM2Ou0hMAfufdBETrm2z4WPfWIFP/NEOBfRMokjwcoS7nMv6R1/8UzHRlLJoeWnJDePk0DjyHGm1PlrSemlPVWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QXsLhkbd; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QXsLhkbd"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7a81bd549eso341742266b.3
        for <kernel-janitors@vger.kernel.org>; Sat, 14 Sep 2024 03:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726308333; x=1726913133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VQaP07kUjh9Hh3Vx1aYpBskYDsvr/ETiwaom9aVLxSk=;
        b=QXsLhkbdUv3OzkynxfeZvpleBXmyOxG55sl10ZgoZC6KcgEjo0cXvfKprt5kMCBcVf
         W8yLamK04g+xLBsK0hrhEvGxWRnW0BvRMfp21Xv1kfMYOU7/onrZNl4HKwmN/A9Q0H12
         saa5Ge5TWuMRYChA7wOW32FapGrIy/EOyUEd4G17AGQ7N3UYf2jr0+t5Y5uOttISSD0k
         h4/LDQ+kus4J0/x9bNMIVGWZoy3QsxRtMRYxTa/bcPu5f9CW8oiou14RUDZJccqW5Zcd
         JQ8rxask7Sr+ei7cY9Mt8ZHtJES1WYDrQkVdCyf+2BZblvBHYHJAetDN1fB7I40YRJKy
         P6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726308333; x=1726913133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQaP07kUjh9Hh3Vx1aYpBskYDsvr/ETiwaom9aVLxSk=;
        b=o3aMR0Mcky4aZRvi8gGKKn+jp9sVxrY+3Wn26j7+mV10Yic6VKxMV7Cp10fYB7TmTG
         sCdweEJmTtB3+MZuxQVQd6eq9fXh+PO5F0MBDBKkHCXpIrYeGwkV9fUm0sR74XgdG161
         ueYnIReOIGKOCp3uThanSJXEmdh5CA9ST3W1ePFkSbVl+5jbRWRYHdrbmlSslu2mFeFQ
         hNrPNzeuUeHka0v5/T8Pv2ygA0SNNDucD+BSQrNNvMTiArCo2aMsPrVIDoHOMTHmq5oe
         eT1jxn/5rLR7ITZgHdSjBl1b4hspyPbh6EehCQzRvCL2iiGqXah4oiPjCzYgiqHZKipS
         6JTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgKXFUwJS+e2YLGspg+75M8wCltITnZoBJ2pmND/WLrOdGyX+GlUoL8Msjb2iFjVgrd29lglHZ7qhoh6cnM8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvoPbOSdRRHsgNveZzGeSAEnHN3acOmxRFzBV9xE4XpwtI2UAD
	cPRAiDvZKBimSK2lscrdOp0EBFiJKa2t5VrHaWePvN3y1GTw6OyJrcXTA/WoaRI=
X-Google-Smtp-Source: AGHT+IFUGe/YZnTvrPrKTN9LdMp4s56tVPxGhPOwQHgiH6EffJdxr/Zlk+uPLUhxjZOYMNerF5RjBA==
X-Received: by 2002:a17:906:478a:b0:a8a:8c04:ce9f with SMTP id a640c23a62f3a-a90296eabbemr942716766b.52.1726308333391;
        Sat, 14 Sep 2024 03:05:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a906109676esm61912566b.33.2024.09.14.03.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 03:05:32 -0700 (PDT)
Date: Sat, 14 Sep 2024 13:05:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Simon Horman <horms@kernel.org>
Cc: Su Hui <suhui@nfschina.com>, jmaloy@redhat.com, ying.xue@windriver.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, nathan@kernel.org, ndesaulniers@google.com,
	morbo@google.com, justinstitt@google.com,
	tuong.t.lien@dektech.com.au, netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net: tipc: avoid possible garbage value
Message-ID: <f1279370-a127-4946-8c46-cc89fd2a90a6@stanley.mountain>
References: <20240912110119.2025503-1-suhui@nfschina.com>
 <20240914094244.GG12935@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240914094244.GG12935@kernel.org>

On Sat, Sep 14, 2024 at 10:42:44AM +0100, Simon Horman wrote:
> On Thu, Sep 12, 2024 at 07:01:20PM +0800, Su Hui wrote:
> > Clang static checker (scan-build) warning:
> > net/tipc/bcast.c:305:4:
> > The expression is an uninitialized value. The computed value will also
> > be garbage [core.uninitialized.Assign]
> >   305 |                         (*cong_link_cnt)++;
> >       |                         ^~~~~~~~~~~~~~~~~~
> > 
> > tipc_rcast_xmit() will increase cong_link_cnt's value, but cong_link_cnt
> > is uninitialized. Although it won't really cause a problem, it's better
> > to fix it.
> > 
> > Fixes: dca4a17d24ee ("tipc: fix potential hanging after b/rcast changing")
> > Signed-off-by: Su Hui <suhui@nfschina.com>
> 
> Hi Su Hui,
> 
> This looks like a bug fix. If so it should be targeted at net rather than
> net-next. If not, the Fixes tag should be dropped, and the commit can be
> referenced in the patch description with some other text around:
> 


It's one of those borderline things.  As the commit message says it doesn't
really cause a problem because cong_link_cnt is never used.  I guess if you had
UBSan turned on it would generate a runtime warning.  Still it also doesn't seem
intentional so I would probably count it as a bugfix and target net like you
suggest.

regards,
dan carpenter


