Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E0B1F4710
	for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 09:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731576416; cv=none; b=ufKBSXkpTzKkbabNear3s3Ke8WKLrRLjgq7r1N9ZCmGxIpKxRhI1PYrmru0Rkf8Gsi6XmJU6RpAHu8gZHehq56aMrH5lb2KKG+VTPjc6XgLm0/vfIH5YSZI3Vf6gtr+A7ZDTEV6yVNDkbHpL+SHDgaRnq0WkFZ73RvkLnQKygz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731576416; c=relaxed/simple;
	bh=RVRmyPOQUtCwdEMnZ4ivPRmJ3eueanQ/bXMHHdB/nV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oL0SA54m7SYbIFzUaCdqUYXAlVz202PIl/0d0bzd87mhmYMq7Tbj7Yop2lMLLXiFfD3rThRfVui0/vRFF+hyy70iPSzZL26Pjj1M9lPlWRu+kt2EuUUqdfrZkytqEOH3gvfaYtGM9j/3HWUKZJMAc/JEnctVn8scD5m7udwTo1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lWczNwvo; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lWczNwvo"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-431616c23b5so1956235e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 01:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731576413; x=1732181213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fCTvx8T9mnRQzljaKVspAbsUZKT1CG0NwqFkm9WlBfc=;
        b=lWczNwvo6MLVT03lkA4PgAxkw3wY5rs+dew5fFiVSZmVDlBqbTbnBUqvK80PBGYtqX
         NEQmLbJpgHYBLD40903ZUE/MzhYRU32epC4yEsYb6SrxKGpkO6Bw9jfyTJDtVJVAAORk
         Mj3dBFWtmS47GKcMT8S24iSjcBKur8iS+V+DlzPueKBk69vYsUThAxZK4Z3w/TS679v0
         xDtVmjDWa0sSXo3dzf9dlWCNEENk/jD7C4wXsagyD/i0xWNzyMbJiOo13FopELikz2/S
         atKA0gb3jCqf70MURzdc8mGElhDZCOxyqzFfsMWqNxecpmScy5k21uJlqCJMOd8NTa9s
         O5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731576413; x=1732181213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCTvx8T9mnRQzljaKVspAbsUZKT1CG0NwqFkm9WlBfc=;
        b=jhP45ZAmIIX7WYgf4jV1Kum+ca7svK5I7JA2leLacO9mMjdZ9e3DKdRK0mNw2l2a4e
         S0VOzc3cI8dAZFd0oZdEZo2RTZCvUtnANmUdKrqkjdYCMgYJt0N6Sfnd3hTfPj/KDdrI
         /B+TAWrDt3hjIFIhtoZIKzhW3rcv62VxTmZTDBGDlqwo1G9D+wEWA2YovIG2GPWBbjGG
         Ku6hnZY2e0J/4C5+qbyhe8JvP9JpkO28Q/HDSUhP2JzzIBtWec9mMg1LVMVvsTHI5fyP
         gN+h8J8CvGi703vmTQ3RIg86KhM1J3ZPU/xep8lcS7rqeMmVCOpDShXWgsv2jewp/qJz
         +JMw==
X-Forwarded-Encrypted: i=1; AJvYcCUY6DmBzeR5hgkEnjYn8Uopce1vposbk9Q8xuRp3wLCGzw056XGAepA64uZDHnCevL2vRxBTLk5lK3mmbXr1mM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+L+leg8Q8qzF/pTiNvUa80HnusriHCA/PMym/USfSAXErKjW9
	br+BrDMl4Y3c9bNh/IA58plyvoFaKRALpYJaMzTQJWf5P5WBGzJvFdO2CRUoUQ4=
X-Google-Smtp-Source: AGHT+IGdySIXa9beofzpJLtb1EoXYIYxWpYJO9XaQFrJeQj6+O5OPLwg2HQ84siv6pKXWdYlJ0KRWA==
X-Received: by 2002:a05:600c:1c2a:b0:432:7c30:abf3 with SMTP id 5b1f17b1804b1-432d974a829mr22722795e9.7.1731576413154;
        Thu, 14 Nov 2024 01:26:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab806e1sm13852835e9.20.2024.11.14.01.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 01:26:52 -0800 (PST)
Date: Thu, 14 Nov 2024 12:26:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Max Staudt <max@enpas.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] can: can327: fix snprintf() limit in
 can327_handle_prompt()
Message-ID: <1f9f5994-8143-43a2-9abf-362eec6a70f7@stanley.mountain>
References: <c896ba5d-7147-4978-9e25-86cfd88ff9dc@stanley.mountain>
 <22e388b5-37a1-40a6-bb70-4784e29451ed@enpas.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22e388b5-37a1-40a6-bb70-4784e29451ed@enpas.org>

On Thu, Nov 14, 2024 at 06:19:12PM +0900, Max Staudt wrote:
> Hi Dan,
> 
> On 11/14/24 18:03, Dan Carpenter wrote:
> > This code is printing hex values to the &local_txbuf buffer and it's
> > using the snprintf() function to try prevent buffer overflows.  The
> > problem is that it's not passing the correct limit to the snprintf()
> > function so the limit doesn't do anything.  On each iteration we print
> > two digits so the remaining size should also decrease by two, but
> > instead it passes the sizeof() the entire buffer each time.
> 
> D'oh, silly mistake. Thank you for finding it!
> 
> 
> IMHO the correct fix isn't further counting and checking within the snprintf
> loop. Instead, the buffer is correctly sized for a payload of up to 8 bytes,
> and what we should do is to initially establish that frame->len is indeed no
> larger than 8 bytes. So, something like
> 
> if (frame->len > 8) {
> 	netdev_err(elm->dev, "The CAN stack handed us a frame with len > 8 bytes.
> Dropped packet.\n");
> }
> 
> This check would go into can327_netdev_start_xmit(), and then a comment at
> your current patch's location to remind of this.

So far, so good.  But it sounds like you've already written this patch in your
head.  Can you just send this and give me Reported-by credit?

> Also, snprintf() can be
> simplified to sprintf(), since it is fully predictable in this case.
> 

I don't love transitions from snprintf() to sprintf() but I won't complain.

> 
> It's also possible that the CAN stack already checks frame->len, in which
> case I'd just add comments to can327. I haven't dug into the code now -
> maybe the maintainers know?

No idea.  Can is quite difficult to parse from a static checker point of view
because of how it casts skb->data to a struct validates that everything is
correct and then passes it around as skb->data.  #opaque.  Smatch always treats
skb->data as untrusted, which is mostly a problem on the send path but with can
it's a problem throughout.

> 
> 
> I can whip something up next week.

Excelent, thanks.

regards,
dan carpenter

