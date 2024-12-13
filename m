Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5761E1E4928
	for <kernel-janitors@vger.kernel.org>; Fri, 13 Dec 2024 14:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734101470; cv=none; b=r+hI3qnUndFfnkZ37T4I6z3JvphSPZ5uKWPRakVJXdd/OUR8mbI2FLR1u7yHW/wb4hlcOguR7ZEqI7Skn0NAVfwlZbnjqVEEOfjJqeumgHxBFuU31q4effP4gte+7cYMy4+vW7C8riiKAOknTUJdHvbkZjuhxW0H0TExoPhmK2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734101470; c=relaxed/simple;
	bh=+PWrgyUqVhZ7V0cKCjdPuTyqC/Tg19Q+zKVwQeTvk08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sX0IqbCJapNYK74hBoOd8HOrsOJNfSJJNXd5/i3+IXXgvbm+xeOuWdqD4GAz+EC8UVp+CXwkC87TJJttnTkpdIZRwqUfxsUjdmldXJRicXm2FamEluOsMGLcWY8Oyszl4zpqBtGlelrJfC4HpmysDiMBK6Iqbb4bA1/ibkne+lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cQxPJl4S; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cQxPJl4S"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa6a92f863cso363860466b.1
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Dec 2024 06:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734101467; x=1734706267; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RTsIlIv9lJiwHsS898heGQfU2pNtvxuUdUV0LwVg4wg=;
        b=cQxPJl4SdNigSqs1LoI6NAZGyAyJcXtlVaVPommqlpOp2/NVU+wn+Gp/MZWtvtbSgp
         5j8w7B9dEQEfxWNS0EBVimjlJ/ihU72fCyjDa/QMQ7VJ3Fy5IPtQKLrV4MbhmHE/fEH9
         n9QfskWxPx1g3otr3m4tBtn4M65G3UEZNePB1mNGHNBErHlyJjhXmG7rZHhXZWQex1s8
         Mzp9qHzyhEUozti/Msb5CucGlBH3vniQYEhnBuyXTjjIM9voljscUsS38ULcgS1uAVxw
         huf4tbAI0i7sQkOEgAhF9N1+41U2F3M6gDNX9npQRNusqVKT4Hb5yevmF7w1ebXNW8dl
         MCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734101467; x=1734706267;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RTsIlIv9lJiwHsS898heGQfU2pNtvxuUdUV0LwVg4wg=;
        b=jqFaLB7EJh/6vDxuMALJQee32DjX9LojhPVEGYcYCVHYAsx1PPt8UvR1XlBmrUNE9O
         GLBBvqxSIfJJeryd+B26JclbyIy9yfyaFtQt5UIJ0rorX49+8kP4mkOxlssefhbAchm/
         hl9OupXEfrPCI4uZ1Q2iScM10NATJkY0mzZi/654UnRDBjpvZVT0x8yEcSSWr7bfbc2U
         l3JZ3OScDd47Q8/cnvuakFayXLBNQjf9pOe39t42kB6SjSr7ejffEQ1tX90oUTsoJFJi
         prr4GJ2JxuDSmhWvJIs2l7qxh85D6CHpzge7mqZPtPSFMZoSS7MqdLWFr2q4q2+fhS5J
         Sypg==
X-Forwarded-Encrypted: i=1; AJvYcCUUTF2ZOy4OF58sX9OiL48tvoKycfuNYlxMAgbn+YMeW3LKodDVFDHMGU1rC8LzwBQxEMrbouG1X3tQxBA/1PU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Fx9Y4oqNO9nyNbVRveUpiuTXaotwwSDv98ppLgfX0rJkl75j
	zWgJSQ6W1LlPS1t6/ythJYOHVxXsj6FUVUz2xCSHFCIDBpzVartFOkIJ6WnVCic=
X-Gm-Gg: ASbGncvGai/JMuewzB8Y6LYCuQ6o8ylOJs321ZHGvcoenUr6Z5akkSlb9N1i2Z/XzGw
	q2yghJgHO2uY4XxBmoyrNS2t0nzq9iUhiLJ2nF7sxC0V3+q4x72Lh1V1p70RL5ZLoru4kWpR+du
	ZmyB4QFyra7mRI8HvB5uMJbROmA2zVIm8tZP3THJq+WWVjD4eVJvZLZJ8TIkzER4waf5vohKnMy
	RVfda+qImzcb/2lTwYKN5WpSP5rEHGLaKb4Ru/O78K2WBFoZek5HE2zXkBTJg==
X-Google-Smtp-Source: AGHT+IHam3kvQR0KKK8cm4xRP5ic/rpiM5+cPOSriCMQTUL017DYrxeEP/LlAWJlAjP6PlmQ/rV+vw==
X-Received: by 2002:a17:906:2dd6:b0:aab:9263:e775 with SMTP id a640c23a62f3a-aab9263e7f4mr15689966b.32.1734101466647;
        Fri, 13 Dec 2024 06:51:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6b9a94c32sm309650066b.55.2024.12.13.06.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:51:06 -0800 (PST)
Date: Fri, 13 Dec 2024 17:51:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, Chen Yu <yu.c.chen@intel.com>,
	Yafang Shao <laoar.shao@gmail.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] kthread: Fix a NULL vs IS_ERR() bug
Message-ID: <b05f0157-4229-4b4b-ac96-62c9703f145b@stanley.mountain>
References: <64c234af-5141-4062-9170-2122c3edf088@stanley.mountain>
 <Z1xIAezMPKXAj9MC@localhost.localdomain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1xIAezMPKXAj9MC@localhost.localdomain>

On Fri, Dec 13, 2024 at 03:43:13PM +0100, Frederic Weisbecker wrote:
> Le Fri, Dec 13, 2024 at 05:25:02PM +0300, Dan Carpenter a écrit :
> > The kthread_create_worker_on_node() function returns error pointers,
> > never NULL.  Fix the check to match.
> > 
> > Fixes: e9853c812f86 ("treewide: Introduce kthread_run_worker[_on_cpu]()")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  kernel/kthread.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/kernel/kthread.c b/kernel/kthread.c
> > index 83bf73d2355c..922f15762ec3 100644
> > --- a/kernel/kthread.c
> > +++ b/kernel/kthread.c
> > @@ -1124,7 +1124,7 @@ kthread_create_worker_on_cpu(int cpu, unsigned int flags,
> >  	struct kthread_worker *worker;
> >  
> >  	worker = kthread_create_worker_on_node(flags, cpu_to_node(cpu), namefmt, cpu);
> > -	if (worker)
> > +	if (!IS_ERR(worker))
> >  		kthread_bind(worker->task, cpu);
> 
> Whoops!
> 
> Can I fold this to the offending patch? I can add your
> Co-developed-by: / Signed-off-by: ?

Sure.  Just add my Signed-off-by probably.  Co-developed-by seems too
much.

regards,
dan carpenter

