Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4917D28C5B2
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 17:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745429398; cv=none; b=UJ8OOtDFmTFWIsxVL/dnIzfG6w3i4BiBDA4oG9rXaoTEGKj4noGBg9Z77eT/eLG/GK4nQzWwt0ZC/ESpZXR8PlES+cE8JKgiuwAtYQKMJ/fo9J/7XM63KoGNHjfs1ALb1ucjknjn3Qws2JQ4I0WElQV0xybuLijBIiNxSKM44vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745429398; c=relaxed/simple;
	bh=0PhYhQW3e9niKo2H334ixansrbnvf1A301EOSSFBo6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwGBwewHmL01Edc+BLuAfCHm0733F6i6gJOWVxxJzxL6E9nAFyOmNBYKv6uY2soYA/sDcBBd7P3FpePLcUs99oblKqTY0QJw16Mcqpy3hv5cWGdeXHolpP5dnJ4l0f05M7Q6LA10sJoehTteNZYQXZk36BWcPbqUkF3bsnlyKHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HL/jtx2c; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HL/jtx2c"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so10266395e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 10:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745429394; x=1746034194; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oH2LFbAba/qda5PxRdibIeZbcQh5j5Nil5v6rguHVm8=;
        b=HL/jtx2cjZihqX5BOg4aSg79hqiANrp5ZWl2xMRv/RMpSXfMkY+tpQzSWO09XGbKm+
         3WRSm1kDssuM8sk13ag/TGfkSQ56AZswsu1qi/T4Y2AxIlqFqhvV+Y0Jj9lj84f3tqDx
         u1Yj1hZzx+/KdOrByUlU9TosArtzlTORqqvPHxdk9PVbeTOcQOlcCgtIfD8/+9zerZ2D
         I9gTT9kMwW0NYpdu5NytDGaQKObYRAj4CTQbVHPFCd/74l4JkAptLVUqUAweBFUjUvc9
         DTw60MGjoaC9i9dgk4HYXE7z2T/niyz28B9gJuB9Hsxi2yKjS41bpbm3IllayS9nJTgG
         06wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745429394; x=1746034194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oH2LFbAba/qda5PxRdibIeZbcQh5j5Nil5v6rguHVm8=;
        b=GH5F5Zbv+S8/3t5EUtWM++NPlP2NIJyql9txD1J/5xpOkLt5sdmdMHxmsP20iRlnzF
         lozMuqJ7pK1jKSuuGicu4EoCHhsELZ3H2iE8bpZXOvlCd2zgNhDDjSc0E9aYTPMbfSyg
         FVU6al/7i3JrcREGOnVwVjhuKB5Le6qeZae1vbWLyV6y7oG44ihOJfbfVH6lOmF8q14G
         PEAKYiGuC9OfdHhtr7ILlu4ExV7I9rb6FRkzPhBetj1GdZwkYVkOzlXZjpk5ITr7ij+Q
         Nl4bvSd/GQrPzxqAxg25juD4/DDPjddioYiCuTl0nsE05xqFeD7z698ADcmNYhW5VEBj
         D86g==
X-Forwarded-Encrypted: i=1; AJvYcCXHGBdI+iACuqMtSLJ4zsnm/ZcshybSncxUhan6sIK5ZyCL3kO1BwZPtfH5IVaPzqgbDH77IOmNqWjFGauHvlI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSMj6kfzHTOMRMeyBbeER7VfCIqVOD09cSMXmlHi8432Jf2JcB
	nElEEu1/T25LTBHmDwSbk/3gsFHL8NREWUDB1qz7AVbqbt5v5QSZv3VTpHDUjaQ=
X-Gm-Gg: ASbGncvYBR4vUTg5bjg593P/IyUQ0HX9TnyoxhuGbnB6g8Hv2WKSkDePGB4gcFAhtvf
	GhZvhqC6K5IBItziRLUuMSDYLEOBQqKeUUVHSyMehVaVGGxlY1WjodUjhKKQyqKZbZJHXq28tFM
	6nNEr4a2iMdN42VfSBUfoQudcwuNN215Z8tFmlCwy+LZOXVhwC1q96wr8osu64M115mXpCDEIkl
	SewDmRq/1xUrqG32VzOHDJ0vKijyVnq924CMIxrqrazIaIXrs/cgyMX3sgytGlVPYwJ7NlJW2BX
	Y3RoS9HeVQLyPycAORslWBqW3kjMNeXY5A7hrR0spDX/KAG3EDxwMX5z
X-Google-Smtp-Source: AGHT+IHrc3jKIu/dZDdMN5LGx7SYc5pxapEttECD3if6r0VvjDHa20st5SLgP98C6SszLOfYP04REA==
X-Received: by 2002:a05:600c:cce:b0:43d:1bf6:15e1 with SMTP id 5b1f17b1804b1-4409aa605c0mr554375e9.1.1745429394577;
        Wed, 23 Apr 2025 10:29:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44092dc229esm33348255e9.40.2025.04.23.10.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:29:54 -0700 (PDT)
Date: Wed, 23 Apr 2025 20:29:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] i2c: Fix end of loop test in
 i2c_atr_find_mapping_by_addr()
Message-ID: <a22d74b9-06b1-4a4b-9c06-4b0ff7f9b6c2@stanley.mountain>
References: <aAii_iawJdptQyCt@stanley.mountain>
 <2427370.em1n7HOibB@fw-rgant>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2427370.em1n7HOibB@fw-rgant>

On Wed, Apr 23, 2025 at 05:25:44PM +0200, Romain Gantois wrote:
> Hello Dan,
> 
> On Wednesday, 23 April 2025 10:21:18 CEST Dan Carpenter wrote:
> > When the list_for_each_entry_reverse() exits without hitting a break
> > then the list cursor points to invalid memory.  So this check for
> > if (c2a->fixed) is checking bogus memory.  Fix it by using a "found"
> > variable to track if we found what we were looking for or not.
> 
> IIUC the for loop ending condition in list_for_each_entry_reverse() is
> "!list_entry_is_head(pos, head, member);", so even if the loop runs to 
> completion, the pointer should still be valid right?
> 

head is &chan->alias_pairs.  pos is an offset off the head.  In this
case, the offset is zero.  So it's &chan->alias_pairs minus zero.

So we exit the list with c2a = (void *)&chan->alias_pairs.

If you look how struct i2c_atr_chan is declareted the next struct member
after alias_pairs is:

	struct i2c_atr_alias_pool *alias_pool;

So if (c2a->fixed) is poking around in the alias_pool pointer.  It's not
out of bounds but it's not valid either.

regards,
dan carpenter

