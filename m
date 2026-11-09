Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253745;
	b=MZkvgBNICVI5BU7OjC/XAd5WkeQmNiaiZKkbZb2m7/d7tbN9TkXIIXUZzfoKP1c83+mC
	 4u9kbz4b5+WF+d5g+tB8ct1R+iuK+czhBiAqQwvxihWwdnoJuxdFk5x9N+0vJqQxPmoh9
	 LJShKO/9VlAFYj2i6xsZACObcvbK8dQZkbCxHNgVxK2n8kAy4v2q+3MIsQb3J/0YJCaLm
	 Mno29zctuzbDv5VRTXuMKzu1R6+4OFFHP/map416n0auGdek1QwqYTgcjtpY2Z2pqt3KP
	 pBWbHb3vJoTgwQF0/cNSJ/VtNlPJl5+EY+uFJNhJ2YJEaiUl+M8fE1njYH9CmoWfB3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253745;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ba2Q7AJDVOznKzIVSG4WADmv5TxkLP7hX7pgseAgvN0=;
	b=jmFHrrLzg9tFKIIv/un+BbH5unfwBrjrBsN+mSFeef4GcWPPPjukfQbETED7umIqc4i4
	 ukiHABFdPNv9FnxITBzFy26mqb+RhpPQHJWidFyCOvEm1h8WefH5f4RSf7TIsbbSYdfpm
	 5LQonmi1f8njNpaBcwjeMQFQ45neeI5fjyMs8dWPb0OrPHSt9aKpeWWPRzc1DDxRtHGOw
	 uBfBNsFW40JJLnMNj8Oha8I88+uLBoBCH2PnuTtGb6WljKpHDsvda2dk6X5LX/XSijXuD
	 FnN8jvEUht+bxPjka93lonQI3DZgUsk6FM0/5hdkjDlftqliw2WAuhJpq5+vrSotouA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0AE606A335
	for <kernel-janitors@vger.kernel.org>; Mon,  9 Nov 2026 19:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A0AE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so13513445e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 09 Nov 2026 11:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253743; x=1794858543;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ba2Q7AJDVOznKzIVSG4WADmv5TxkLP7hX7pgseAgvN0=;
        b=vQw9NSOp7wBdwZ6jCnQ542gEaHRammOrnjCAlxUHNBtAMB19gqOAwjdmtzQe18M5q8
         Wj93yEV3at1l0+NvTzKfE0rXmn2kavciiOGAXEuDC03VGOHLZOQNcUDjBrWcWaX7C1pj
         lhDiYbvi3i3+NaBgJaqpdIcXZ19lyCn6o1+8jzPIUQrCXMpwUNkuI5jNcPC8hpnKKvKB
         CKWrIHEKr2/PgK22u1biPCbcNhb9uJeYiIL8/PgacKmhfCiaq/JLPvJYtj823gnAlzs0
         CdMQ6unJiaA9L0yznnRejW5zNwuznF/FwUWRki7lI72VlfJlWXjeT2iU9n1Vx537/zVa
         0thw==
X-Forwarded-Encrypted: i=1; AL+hErH4EonL/XbEObpx0OjWP+1gNpv/r9hk4yBI1NnRiZl5caoOQ8UgSMogLDm1bBREiOADLZGfyPILcyALMKkoUUM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x1+xsqpMkBMcgCscC4SV+OTjcN6NBGMGxZhQaSout/4H27gic
	PRhDBQzTbhUnV7V8MyN684DK/I95rstXWBQVoggJQcf1MCOPGOExRMQ9
X-Gm-Gg: AYBFou1dSB7bEclCDF8aQcYHU+234NzQ3r1NUDoHRU19vr5ejb53xa6E3Lx25n3MH8N
	Ox8/Fyy61CPd0E1vMcJO3XD5vdZhCDJO8XI8RLzJnQp8tvOQ4hGKxd3cEDvEXTc+gRqEGgYWKUo
	qZBMiRMdPATg7xbfCl2/t7E9t7BI8MoY/T6FHsVG6Nb+ZS9PS7IFqy7wxpQkHX1COfMBRQWRgZX
	ZkKQjVf6Tsp5HM4v6Hr64U3mT5bdyKNCn1oPjjtX58fjHGVCYHw2qEzCKm2GFVpjKxebLypLgW2
	Osm7q77OoJaP8duF3eWN6cBBMYIEHRSeJRxjqHFHaQNoxz5vRJC6UNASfBmh78dO6ZZiMBeyC1K
	4fSSeRVuqZlDPyPo9E14NuHNf2MXL88M0XU/WjUxQMVsZgurpmhyQME+KHe5TxMYeRP4ETLpXuS
	FbTsxq3NU7N8t8S7aAm53Z4j2qBaRWbTMLICiI2ZQUymjP+Aw9mH2yiLzHA2hbiupwt51n6tuFn
	9mSjfJJFTxxNDSWVtzaAjF5gxTd3i1cZXNXZC42NAvmfR04agYko1qC3PPFVSXBgtGekYsl5eJr
	gd46Zg1wqoy7ofkamlFZ1dxU63GmdTLDJ3hWxsoXKZ5F9lwk4NMt0Wa2BKeiXrAB6R0+xyyeQpN
	cuJQSe891/bclMWww/fH4h5uYUi5mxab072CQEOtiXCDvkuUGnaDAQ+I0wOmuvK0=
X-Received: by 2002:a05:600c:1d29:b0:4a1:f7f4:7cf1 with SMTP id 5b1f17b1804b1-4ba023376d4mr4246085e9.11.1794253742529;
        Mon, 09 Nov 2026 11:49:02 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02300988sm6618615e9.0.2026.11.09.11.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:49:01 -0800 (PST)
Date: Mon, 9 Nov 2026 22:48:58 +0300
From: Dan Carpenter <dan@cryspen.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Dan Carpenter <error27@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] keys/trusted/tpm2: rename "bool" to "boolean"
Message-ID: <avIjqp3n29DKkpPp@stanley.mountain>
References: <avFcjHwnh9mrOEnz@stanley.mountain>
 <avHelQ1nxsDVcQkZ@kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avHelQ1nxsDVcQkZ@kernel.org>

On Mon, Nov 09, 2026 at 04:54:13PM +0200, Jarkko Sakkinen wrote:
> 
> Are we migrating to C23? I've not followed this too closely.

Google AI says that we will adopt C23 next year or the year after.
I argued that it would be would be after 2030 but AI said, "No, there
is too much juicy stuff in C23 for kernel developers to wait so long."

I don't have a pressing need for this patch to be merged.  I was
just playing with some compiler related tools noticed this.  It's
the only place in the kernel which uses "bool" as a variable name.

regards,
dan carpenter

