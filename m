Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7651DE2B4
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 17:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746034817; cv=none; b=HCL3kD3G6CN7JSc3GG1xsP2d9Dt3EIFK/NLHfwChYV3UhOiJ4yLRjsxL0IaHjy4E/ENPq1kzcPKojPn3HfFWJ5Y6/HFqqK0zQNoLOwxBPACzR/Bn0qpM4hEtrnC7DuxXw2wT2bDgrlLZXyD69CRlCIviX55E1UU4Fv8pQV0hvFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746034817; c=relaxed/simple;
	bh=NDzeKYPe2I8Yfoh+f4eSw99RP2htupFat6fSOf0y+Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9E4v+niNZALfuxka5r30mukhsCwGCgOUJHX1bdRg2C/2aPy7/2v2DkEq+pwPrvBCODmAy3j5Q4Le/KQXRPt1ngsEAoZdC/WdIqLBTMRNog23Wq6hx4G2K2+8PomeBE1FK5naRMBGlkFwspcVc4M1t4cvwvTkzQAqbIIdCORpqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gP87IG3t; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gP87IG3t"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso99475f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 10:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746034813; x=1746639613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fTI+NTQY1S5fmWs9NCsPjnEhqIDgFiuLJ0sQ9mVO6og=;
        b=gP87IG3tzLQfE/9/oZlAJ2LJ+9D2gddvbiu323SYtZkJ2xTboQwRMxJx69Hf6r32nf
         CN9dvCM/fdtkQxNEhsdjT0A1kZzqE5voHnThBobnlkEmgS02cb8dqL7968BDoWdiqjOJ
         WBygYEcslwcPT6UXaKLYezu2C4Pocv2/Fex1q/lMimExLagdypHe1dgFkTmiEC7gWWP7
         wJOtF7dtoEvkUUsJhtr3mU8foK1zbp2TCzx8sTqaZ2kImpbjZzUdVNaF66sHOpL6dl7z
         9LIi9EQHYJCL1bTDS8pO9gZgKivbzzAhNk5HbrP47+jz8peMEY/yDsjFFNXvPcppVjKO
         HmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746034813; x=1746639613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTI+NTQY1S5fmWs9NCsPjnEhqIDgFiuLJ0sQ9mVO6og=;
        b=sheNEpX26pMwsb+Kb2YdfUGWG8yn4+vrKk8uBwjJdBpYTfESd0v2U4v5QfXmmYdUMA
         nx+wgEM8QKQyI5gIycvevt2BtiqQfWSoQXanaf/ijpt8K4IwrGTToPinZOitGpHxtpAp
         V5BTJJzibgEw6BsMQQA6KZIwIdfxfNN9Oi1feG7qBfULqSiH5JKnmQozOy316erudlL/
         Gd2i8LCU7bjutxVP2lWhtwbkAUaU0vQf4aBMHOt8M6eYpjSDR5g68Ta1nMwB7v/X/RPx
         D8hMuJvaDUaOfHRl6pRQL7Z3+O3itcjTpXcQf2FkwfirOeGgZ81rpDBgmrL7kgCItyke
         wHuw==
X-Forwarded-Encrypted: i=1; AJvYcCUmD+kZKErIEcSBgIzmgl1r1nbncp3b5BFj9zMu2XVApekRrb/IMAU3zqn3hhr+vWz7D2+2BEPDkB45666ghbc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz3tKdzbLb+kNypJTgm1Q/pkLy5YR678xePdGCXRbXzMRkk5q+
	ieUz63jBtVlZ3BIGXym4RdvO/LkqtSkOMqjEGnKFnfYQlyykfNAbCPA+CQBOwEA=
X-Gm-Gg: ASbGnctZotyAQopQ28ued7Iojn+lyaDH5c35Z8mFsP7iS0sovt38yIttk8t4Ks/gNAR
	fEFPN+eubjS7ES6vr2fomwp1A77DLJGeUDPMDWgudlWLj+HOpGwqKJmrTZmRyeRxhWb/+Mdwk96
	Ebxa1NstM+5IVqnIdCqwgnyAtIRHaGiTPqZxjCmKIs4IFuluo44rxEfDOSypqhypatsXg0OeTSk
	KV5VSj0dfWI8vaGcAPfxYJUcd3VSrUT/8DJPs7A/2zKyP10WcRgAb4BLWyC7nC2h4LkWDvLcazh
	7YvyFr3bT49jMPhodxYzEzSFuN5pjwgc16WUIkmZ0y0wwA==
X-Google-Smtp-Source: AGHT+IF1nO2qpvxe8YcGotQpsDAI9G2//rj00Y8Vv2gR//T8UoGu6ib91X10edaNaTJyuRE9TTivJg==
X-Received: by 2002:adf:ee0a:0:b0:3a0:831a:8fef with SMTP id ffacd0b85a97d-3a092d00c42mr301702f8f.22.1746034812866;
        Wed, 30 Apr 2025 10:40:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073cbf04dsm17858905f8f.52.2025.04.30.10.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 10:40:12 -0700 (PDT)
Date: Wed, 30 Apr 2025 20:40:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Satya Tangirala <satyat@google.com>, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] dm: add missing unlock on in dm_keyslot_evict()
Message-ID: <aBJgeV7pZ7Q47OCb@stanley.mountain>
References: <aBHZ4puON8GNK0vw@stanley.mountain>
 <20250430165037.GA1958@sol.localdomain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430165037.GA1958@sol.localdomain>

On Wed, Apr 30, 2025 at 09:50:37AM -0700, Eric Biggers wrote:
> On Wed, Apr 30, 2025 at 11:05:54AM +0300, Dan Carpenter wrote:
> > We need to call dm_put_live_table() even if dm_get_live_table() returns
> > NULL.
> > 
> > Fixes: 9355a9eb21a5 ("dm: support key eviction from keyslot managers of underlying devices")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/md/dm-table.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> 
> Reviewed-by: Eric Biggers <ebiggers@kernel.org>
> 
> But that's an awfully error-prone API.

Yep.

> 
> dm_blk_report_zones() gets this wrong too.

Ugh...  dm_blk_report_zones() is too weird for my static checker tool.
The checker is looking very specifically for error paths with missing
unlocks.

regards,
dan carpenter

