Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8841235AC09
	for <kernel-janitors@vger.kernel.org>; Thu, 16 Jul 2026 06:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784185055; cv=none; b=lRI08vlAL0Urcd/sIzdTYHfLNtMbri8eSzgVUXpqB/FUSVQgT/yMCt+ASGvg7p7kKeKranIdD+/qIvf1/+fS5KMhw9OklJMjB9TxTPN3dmHKY09OA6SkpsZz+MqqldjBf7bL87zNi/B71MyJLZGvZNZheM1S6M5LTv4stDzMauM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784185055; c=relaxed/simple;
	bh=xLil7Vstv8VY9VX7lK3ig+izqWkJrIls3b9UTEkEz6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUmg+RVfo061h2Opj970G9jJkGdmqr/cDJR30f/sjQjjQDTlThcTyNq/PDOsA7IckLvAwueXYNy7AnX3aFfu46gQOmWgb7bjTaQA9DuAAOwCekZVOdlM6UuFsRtPuAri/mk4skAKPAg6z3H3w9Iw9W2JKw+yCtArEIJdyD+SGaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EY62NLIf; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EY62NLIf"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-44cf70de986so2107999fac.0
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Jul 2026 23:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784185052; x=1784789852; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JQwzC+SeknlTO8OOS+hCXasYqtaWNkX7Yw3a3+TJWPU=;
        b=EY62NLIfBznC09stdXTxujzdKFbtzh26E4CDLhWZV6mm3+qo1pWH613W0SqQiASh7v
         rEe9aGuGXlhOSEL+G/2DJ2CA4nD3xGRRTuBRGroSPDUjSMI649zUOUQQ8TbOiHD6gmpy
         22rckdMZ4SKhJ2q/WciopsiBujh2vX2OpOa11XIXYDk13XIwkQbbDNvo9r0gxlqWSSiM
         yxJ+G0qz6sZKfxOhSXO+zHBsqmZ+pgHXhHonCWAC8sLwUCSfA/fRvxBO81po02FvV6GY
         yzTKec2LgADDvDhEEffe0j6SePmLwP5lQbOi5u0tkr+7fAgN9Rva0CO+GimSz5PcBPEU
         Lkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784185052; x=1784789852;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JQwzC+SeknlTO8OOS+hCXasYqtaWNkX7Yw3a3+TJWPU=;
        b=WdPoDtHD7nev7M9kL3R09+2HQuxkE+fMHTl7CKFtxfXB2WZo+BIwpiiMjLLUwYjcFg
         mfum9VyS+LW7Ca5j6XJ4JKhTjrG+tGuaS4+nXSzb6xEKSlQU9xrQMkUUjLeYGjVE1oSb
         NQuJJ/+lsKRyEd3LU2n+P8cdf4yxUVXI5cLVRwnMka0Q+cl0ER44yu52z6D4Pwqf1aRt
         QtOM7YnXuU5I1YDCgdZPL5dbYStJqzbwhAEAVZTXolbEHtqE4zfv+Hh3pdFTI5Q7/Y9Q
         sphtJMq9dS+rL7S8qRjeSbyJS86xaEKkBYn1iifuhSJ/umgN0lWwK9iu+6Cx5y7fq+/J
         Ytmw==
X-Forwarded-Encrypted: i=1; AHgh+RqZY+eN/D/6PEN8b4Kl/5VPhNW2cWEg/nupSBmORWZ1yQKULswBvTSBZ6oxtRdryAlUUvWNLr/dFPoeOUZieiE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz50MUm9FGXNF0d08cwcj4Z2ydA8/8K5Vz4WlzJ47Okls/SLlo7
	9chpLa2d/5EwOtbCjU8Ngb2kaeP6JcswPnQQkAFK2ofU0eIBr6RXQgci
X-Gm-Gg: AfdE7ckEMteEtuwWjjSFLvR2DeaAG04DwI7AY5boxUyH4MSGk/UL48bWZP/sRFLWoxP
	PT1qUoBQuTMmcQFxjRDTD6DIrVrzDdLPl1fUsZE43FUEFpjaw0yDADMXAF7BXEyVHpUdrxN9/QG
	rFYRErzGzMgGboZpLOfXpgqOGKgVdJZWeWaT9Z4YttzdI6pfsqSskoezCjCJk+PpEtNLRHYGnCn
	xpo70N5QxBMk8rYWuGU7WYsMqvhAcZpRs1fuQauU1/UaYC5whcC61eLtN7u2+22jtuq4wS3NJbb
	zFFFZUjd/tzjabGLbBZHPnpnKePB99XNIu5JgH4/2h+IGaefN0vbY2krq2xFYeSZbHOMREp6iHt
	zpbD+N+ybBFJ5k7cN8kXAp7/8juHQLe0onixSEOUItAZ5RB9mpnCExtw4DbBkMC2QTD7pHA==
X-Received: by 2002:a05:6870:4596:b0:448:9e35:c3fe with SMTP id 586e51a60fabf-4562b5fa188mr3879300fac.11.1784185052273;
        Wed, 15 Jul 2026 23:57:32 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45191643abdsm21502202fac.11.2026.07.15.23.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 23:57:30 -0700 (PDT)
Date: Thu, 16 Jul 2026 09:57:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	MD Danish Anwar <danishanwar@ti.com>,
	Michael Grzeschik <mgr@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Yibo Dong <dong100@mucse.com>, LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: rnpgbe: Pass an expression directly in
 rnpgbe_rm_adapter()
Message-ID: <aliA1EIIrX82jGR-@stanley.mountain>
References: <7958e26e-a4f9-48ee-8d79-3797016944c5@web.de>
 <alScHkiC3EmGzOlI@stanley.mountain>
 <8110bb3f-70d9-4f0f-82f2-ffe1262b2962@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8110bb3f-70d9-4f0f-82f2-ffe1262b2962@web.de>

On Mon, Jul 13, 2026 at 10:22:06AM +0200, Markus Elfring wrote:
> >> The address of a data structure member was determined before
> >> a corresponding null pointer check in the implementation of
> >> the function “rnpgbe_rm_adapter”.
> >>
> >> Thus avoid the risk for undefined behaviour by omitting the variable “hw”.
> >> Pass the required address directly to a function call.
> >>
> >> This issue was detected by using the Coccinelle software.
> >>
> >> Fixes: 2ee95ec17e97c58b65e978a08b75fa8cb6424e4e ("net: rnpgbe: Add register_netdev")
> > 
> > There is no NULL dereference here.  It's just pointer math.
> > No need for a Fixes tag.
> 
> How does your view fit to information in an article like “Fun with NULL pointers, part 1”(by Jonathan Corbet from 2009-07-20)?
> https://lwn.net/Articles/342330/
> 

Of course you can't have NULL pointer dereferences but this is not a
dereference, it's just pointer math.

regards,
dan carpenter
