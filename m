Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794287226;
	b=i2TH8aaUDaveeLoGbaGiy1P6lFSzPHa4bZEIpKVpqkD43s22eCsT6kQykJje7pITo9jE
	 M6DdgROoYkwFIG8vcDLzPEYnfCo0vV1NlVVYO3xFcp1E41ypIujnyNq8Z4ltOXHXFCi0z
	 DP9ZifpMH30lTKg2DyqHYVw6+eZrF08Vq1Jz8nJFpxADpzm2KYdPN/QEkzIySiXMiE2o/
	 ZqbAjz3hJ7P+3suNOD3FjS2Cjp0dDF1qF28nbB72Mwzc9XzEZGzHbfRs9NF4rMIy+lk4L
	 4CbTsf48lzIK6iGi7s8eksCATraA43Aem2dIQBtoirgOW9RjRsZUab4bYPaRpK+DmMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794287226;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=2seNUxR80lWFNHMOtGuOcjLvb6hw83oNlRxRNGGUWvE=;
	b=VE8TB55KX4kpk0QOYFWdX98LUYh6oxOLSvSu6dKOvOWXAtC+qYwWHWNsUqSqptWiXaZq
	 moZLh0HCizxeNjqbOiVKeVRilO7gj38ywyde5MLoJPEZtM5yzWEUgJnibbKkqqi3GdbKu
	 LU8dqVq2C4HeCdS+d+ed+bkkptNUUbDW/DIkRfj7eK0L90tr75pEjez1m7wh2cZMcXE4d
	 GdHtzYZIVVq7a13hSl2k4wGK7ar8WnB9KQWQDBv8wJPWzDeFcVmeAKQwThUk+P555QI5I
	 V4ed5NE7z28uVYpUeucKBvsREBR6j5+K6vfXT1YR+dFxbuBSvEG6cizdB4ERCjKf3Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F6A606A331
	for <kernel-janitors@vger.kernel.org>; Tue, 10 Nov 2026 05:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F6A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492690dd5daso1062257f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 09 Nov 2026 21:07:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794287224; x=1794892024;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2seNUxR80lWFNHMOtGuOcjLvb6hw83oNlRxRNGGUWvE=;
        b=UDLoeaz6E7PLOlZKjNRsdLLMi9xocmt4g7YJnyq/LT5tbJ5C0o8GxpkM5J2ddpfH98
         bVjcYYuXBVv2LKPaj5+ARmeXpmEt01N0I+w3Uc9eEdgfbLi7YhdpfAiyVwt4oM6FNxvB
         DzXSDPyyHKV1VOVfHqi2ut5mlqjw3a8YDe8TZtNZ+SWtExlQ6rmNhIrao/i5X1fenHwo
         Wsu8xDz+KE23GglcmJYnESwE2c/6J9hFdyRALw7hro40qk4YnrjaNuHUQ3j2r79tSz7f
         s/ug95IcrR8vmQmauACGz2ucLRHUVyA1tb14SnCKfd4u5eYtLkw6eXSVhndxgTF5bV/X
         4Row==
X-Forwarded-Encrypted: i=1; AL+hErHe0DdL79ALBLktZYjvTRbK82+7CmICf2HfYLZWBK0ACEKGmInG3rNdVc3zIAiFaoqCUbeGreG3NZctWPTNzOY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6euCI6kv1i/BJkk47YukDA6EWKhUGYCQVPpOboUXN994hruEX
	oxZ01odiBQdUZYLfgPErKmbHu1RMf1/HpSMhXAPbwjHO/JgGfoRg9+Ak
X-Gm-Gg: AYBFou2612kq/0WP6M/kgClTXFcjVIQ17DdFbVAJ6iKqi5yBFI4WTkGwJwunioDrYdU
	WU5eY/z9w9vYmIX3jgflw4fpGFnx7TYwG1CtTJqMsYv3nBFNJ2TsYixCtfgCzBt7zXMVRW3VZp/
	8VY4qab7LvboCQeT/iu6BToA1KY7o1ie9ehJi9VwmhXnHrQZJ28kMQAnB5/6z97WLDQGpjoGT07
	RtBzke6kTiKaDI0otZ7JZidrP9WuK7xuRPKlSaR8IBlT25IfAVZj8Snfvt1M5wrKEYq6BfmLcJc
	ilaqsOLEuQHEdQBKE3BBvcY5Jewv5x83DZsUg/tyyIsJKx0vvl7oBjxVaZbCxydbQvRxa86b5Uu
	bqYIyY2Q7X4s4aUWIB3DhhcFdoWdRHGk+FLfA8dqT3bRY+YEztt8PXC/jFX2XvJ5VkC0qrY37zf
	TppvlknK8XI69R5sxKehsqVOAfST+mbS0gC2RstSzDH1xf6dK4yxKeoVPP+hVKOliCQEtEG6SBY
	8p5QwVVNw67oe/twkM22DguGl2QFnxfXEJYQdA2z5pQ6GHAjfZ4xPSyHf3RPf1sL2l/wjextN/j
	cDuQCQ0irXyKXOegJy4LrCpjX0xqVEcbrwzcYlDZ3NBLrjNX1tze+MYMuicM2zXCh3e92+Ece8H
	bYwZOAZWQJp4J0ddXzQYllxK7tMawzfedn8pjdG4uvh45RVCg/xA6/pnM6Fhd/YrWd+dCny0aNt
	lvfRrdhqG0Bg==
X-Received: by 2002:a05:6000:25fb:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-498305da14amr2288609f8f.45.1794287223902;
        Mon, 09 Nov 2026 21:07:03 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm1332172f8f.20.2026.11.09.21.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:07:03 -0800 (PST)
Date: Tue, 10 Nov 2026 08:06:59 +0300
From: Dan Carpenter <dan@cryspen.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Josh Triplett <josh@joshtriplett.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, rcu@vger.kernel.org
Subject: Re: [PATCH] rcuscale: Constify struct rcu_scale_ops
Message-ID: <avKmc-690MOAGJc5@stanley.mountain>
References: <3f546f8e102ef271e7d5ac6d8b6a1f44d0fb20cb.1794085327.git.christophe.jaillet@wanadoo.fr>
 <20261108230623.GA3148953@joelbox>
 <2727df26-9f09-48c9-90b5-2d1416c3b2b1@wanadoo.fr>
 <730e60cb-30fd-43a3-8152-543b4ba5878e@paulmck-laptop>
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <730e60cb-30fd-43a3-8152-543b4ba5878e@paulmck-laptop>

On Mon, Nov 09, 2026 at 10:44:16AM -0800, Paul E. McKenney wrote:
> On Mon, Nov 09, 2026 at 06:32:15PM +0100, Christophe JAILLET wrote:
> > Le 09/11/2026 à 00:06, Joel Fernandes a écrit :
> > > On Sat, Nov 07, 2026 at 10:02:25PM +0100, Christophe JAILLET wrote:
> > > > 'struct rcu_scale_ops' is not modified in this driver.
> > > > 
> > > > Constifying these structures moves some data to a read-only section, so
> > > > increases overall security, especially when the structure holds some
> > > > function pointers.
> > > > 
> > > > On a x86_64, with allmodconfig:
> > > > Before:
> > > > ======
> > > >     text	   data	    bss	    dec	    hex	filename
> > > >    45585	  24946	   2816	  73347	  11e83	kernel/rcu/rcuscale.o
> > > > 
> > > > After:
> > > > =====
> > > >     text	   data	    bss	    dec	    hex	filename
> > > >    46545	  23986	   2816	  73347	  11e83	kernel/rcu/rcuscale.o
> > > > 
> > > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > > ---
> > > > Compile tested only.
> > > 
> > > rcuscale is a test kernel module, is it worth adding boilerplate for
> > > non-production code sighting security reasons?
> > 
> > Oups, now I better understand Bradley Morgan comments.
> > 
> > I didn't notice it was a test module.
> > My patch makes no more sense, as it is not hardening runtime, so feel free
> > to just drop it.
> > 
> > Sorry for the noise and not seeing it by myself.
> 
> Although the header comment does say "Read-Copy Update module-based
> scalability-test facility", maybe there is something that should be
> done to more clearly mark code that is not to be used in production.
> And maybe to inform the LLM review bots of this.
> 
> But this is bigger than just RCU.

Christophe has been constify things for years and years.  There is
an argument to be made that it's just the right thing to do whether
this is test code or not.  Someone might copy and paste it, for
example.

Of course, everyone is overloaded with AI.  I feel like normal cleanup
patches are more likely to get NAKed because everyone is just totally
overwhelmed.

regards,
dan carpenter

