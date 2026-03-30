Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE03389DE8
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Mar 2026 12:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774873550; cv=none; b=k8FavNLDbOhqdT1RezRq7kOPsVfYM/gCjMByS9xoqRbpQR8C/3bMyiCjLOIGbtt+w0jojc6sC0gRgrw93zTTREoWw/h0mTbv0exknkoruvj/wCK8tSbaoZfhO8n1IMDTXHX4FgeDdLoLitjX9164qXPomfNba8W/38BtGZD6eu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774873550; c=relaxed/simple;
	bh=c+boihwyiC6KjXeQ8K6LvMZdGBrVwkLlvthbWafEIqQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYQBnWFStghhPCV/MjppqIC/h0BHoG6O8VBhyvQT6Dtmrx8Rrg1V6dpYeJco+NCP9zbMwgqDbQaFZX+gXfFv/1myC6fqZAL6vzi88pqWAgSL9jLtlE8xHHcz/ZBjCN9ge0sBgwT3cKBSRlMC5su/rTZUjsV08DdoCefhTKED24c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sx0QT9gv; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sx0QT9gv"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so663026f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Mar 2026 05:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774873546; x=1775478346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wgjUVS8P42rBXVVmfEboAzCHxUv2VUPQ7Zy7rlx+RoI=;
        b=sx0QT9gvXN9PjVG3pklHZykJj/7Uy30LfohgzRwb56rBrAMtBR+OySZfsJUO5Y8kvR
         OfIFy1+iGHlfLaeXZF6wm7LCaWeU/83q+tDaqCKcLqLpTjre2Szq0gyoxOexKvRR8HLo
         0h9hHvVZnRLyk6u3+AY8UBdpulZJhGL/L8zG9+k7OQhC86+PDGcRmLLQZe48HCxVqjKp
         Hm3HIw1+Nqx/AhjwPqHxnW3djhgCP7G8GSZ9s3xmBRU6R/fwy2+EYJaH5HBOxMqX9iL7
         7LqDGdEYmWUgk6s8VDIqnEn6qAmjn2sNLcqp0VqL8gH/zoLjUkjpEclpO1aGGyNzMlYo
         ndgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774873546; x=1775478346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wgjUVS8P42rBXVVmfEboAzCHxUv2VUPQ7Zy7rlx+RoI=;
        b=biImZWul7rY0iSurb50JzfVZpp3rADCw3pt3a9D6i+OUrg3p/ibVmSj4PV7DyJZDxY
         OIPphWcZJCdBtYSggmdLW5863arrVpQuMcB87L7hHlpm63BRDxZtzo353raG3gYOhsAN
         AMq3RwJuDXigHJmXG/RqrNK71ZEKt0DTxz25fltZs423OzDfzXWLBQefAO04xCQ35/AT
         SsYcQ1v5fyxQmHPU+VMY8I8Ek4VI3fPeK9IdFYmuSurbkNbhP2AcJ7ex0uLbXEN//waH
         wMpycDXVZkxWP6gmatVyOc9tNki8ooAjCi898GXJmX3KkiOL4bEQYnjnB/EJJ9UANei/
         rGvQ==
X-Gm-Message-State: AOJu0Yw2sU8y34Oss4SPV3dU2dQoskdyq+H1Z9+q8PiSIwTaGINEx0Rq
	Wvn9yfxueh+UvEF+2Muz7zEbedypanLLBYx8PFda0GIf/dDSnOaGuf5qiruJ2g==
X-Gm-Gg: ATEYQzxu6LE63fBWzuOGh/GR6Ycor7sb2XNf40FCr4S3qIDq8AGhR6+A9JFZKjm1pi+
	auxxaK6gTHbv1Ju6vnQwQrvZfTAfnXkLMHdywag5/SJ+ZkqN0yAzDeRxkxAqUtHhkQuJWWdQw6y
	Z5yFM3CfQFnJW+hBCadZFGlzNiPfcG63cK4RYcqDV7ltndmHN4559lTNU76nBY7M3/C1+EyS55r
	fINKEdaE00bbddDH45lljwBAoksZQ9cp0HGh6GVJdi73IGgEI+bVrbREoEDK5RSTX+J/4It/P7o
	W10u9fJYyis9k/X9ir+FcYR/svkRJs8QFw1rQ2mfaqE29zvsXTGFYewHoRGfI8z6a9Q05q+746Z
	C2PjJs3na+zlFn3dCuykBSMl9N8t5RsuPT6wyikMPx/A1TG5VuvQn9cauO4Ot4UUVoWBPOde6i0
	uHG8KLhYzy0BhH2NgZLQ6rVEYe32EUpw==
X-Received: by 2002:a05:6000:310e:b0:43c:f8ce:263 with SMTP id ffacd0b85a97d-43cf8ce09b0mr10005639f8f.9.1774873546206;
        Mon, 30 Mar 2026 05:25:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2487sm19657010f8f.5.2026.03.30.05.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 05:25:45 -0700 (PDT)
Date: Mon, 30 Mar 2026 15:25:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: kernel-janitors@vger.kernel.org
Subject: Re: Status of kernel-janitors?
Message-ID: <acprxrESPr1hnXkr@stanley.mountain>
References: <acpeJQEPtDKQ68uo@mosquito>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acpeJQEPtDKQ68uo@mosquito>

On Mon, Mar 30, 2026 at 02:10:49PM +0200, Linus Probert wrote:
> Hello,
> 
> I've been a long time builder and fiddler of kernel source. Running
> self-compiled kernels and pulling in patches before official release
> etc. Bog standard for most of you I assume.
> 
> I'd love to dedicate some spare to help the project. Like so many
> others.
> 
> The kernel-janoitors "project" does pop up in various resources such as
> kernelnewbies and I think it might have been mentioned in one of the
> Linux Foundations free courses. But links to potential homepages seem to
> be dead and resources are sometimes dated.
> 
> I read somewhere that this has mostly evolved into janitorial work in
> drivers/staging. TODOs were mentioned.
> 
> So the actual question. In my mind janitorial code work is a good place
> to dip ones toes when starting out. Is this the right mailing list to
> ask about such things? Any suggestions to find an area where ones
> assistance would be welcome?
> 

Starting in driver/staging is good advice.

> I'm aware of checkpatch.pl but for many drivers diverging from these
> rules seem intentional and just blindly fixing checkpatch warnings are
> not helpful to the maintainer.

Yeah.  After a while, you're left with only false positives or
we introduced new rules and the old code is sort of grandfathered
and the maintainers wouldn't appreciate an update.

> Open source is a lot of work so the goal would be to be helpful while
> not stealing too much attention from concerned parties.

I tried to introduce the concept of, if you have an idea but don't
have the time to implement it right away, then write KTODO in your
email so people can search for that and get a list of ideas but it
hasn't really caught on.

regards,
dan carpenter
