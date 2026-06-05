Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62D9399D0D
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Jun 2026 06:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780639966; cv=none; b=ZwptU/sA+QgiI6v8CorIE6Ac5odfk/E/Wl9b7VMWbGKKttiosaciJB1+wTmg/53K91P0bw45nRBMjl5zbF5iNfGELdpkXtG5lZDnmhfMNVgj5kVmmJiW1NqEslZhWSbT3KY081L7o54QRbVa0pTFgKtMRmCxmjONsLseMwGL0Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780639966; c=relaxed/simple;
	bh=7iU6z91ycljbm0po7ZNnr4gsCKmCcBFKZQnQbJmK7to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lT7jgqoh64TBmHN2XmuSYG4YhOoEf8Q7DNp8CaPSX3IExuVPKvCvWBtGiNgFjgMb9DuIQNUQwWc9oibNXW+RTH3oF34UAbzEZZgBCsXvcCxLBoLR6iyIHcEbmW3ryWgXMdQ+4ZXwIKCDIKls5oocBkBidhzzOkNvtJsT059m2po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dY8DTxaj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dY8DTxaj"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so15854785e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Jun 2026 23:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780639963; x=1781244763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lgxx/Rs2dNmB7kmYA8c5lq8xrDwo/RsROcUUe32SZ/o=;
        b=dY8DTxajQfSDiVsGelG7WvsXa7jfXDTZkOxWCpe24eNdmQj9wDOxa0NvYNVyLhIdux
         Z2oIO1BwQ279LO5RK/VNgileTlXlonnSKu6e9fuLvwmba0rAGTNGcIsmhWysT0ySo8ON
         cdnDP5OFnvBxzhJKTCQ6PWBhao0BKB5yTZttukD+oCXYcvXtR0HQyY5yTCMYpBtlrdiM
         gG+PwHlukRFfVYiNxJ2SXVRGgGxVoC/SuaYkP97NS3ACQo9OAOlbxSwpyqmBG7niXQnU
         qDwa2Qxte2IOQjp5zlKJ/mBGMmF2OV4WnZAII100N12xoR7ky6XLgJq4lRLJCmVFABnt
         bX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780639963; x=1781244763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgxx/Rs2dNmB7kmYA8c5lq8xrDwo/RsROcUUe32SZ/o=;
        b=fbxgZCIUJpniNV9MSYbr0BYczztVZfTRHucL3Y0cbnnZjRQwc0sO5vVamNNP138ZWL
         1KUGRKfLPJTX8b8QMRhLxx0nsIAg32omsKFyQ9iiP9PXxBx7mpHCDthUPzeS3I7WU1cK
         QEP2VY/rkC3M5BMtaTdQf/UjThZpOB8/92DSQQyufZBNdNWiSytJJ6lfea4u6XC1qQz0
         CWnocklEbiuxvYR5nGubYiin1qN3Pw+TiD+Wjwyh5s4obLkeaklvo+9obPyWgGWNfNew
         Z98d8kkZxVHFgVJo3lOZkQz0Bi90w6OnkkCyBxb4URvsAJUM4IWxs+rDj++eqxFN3NWF
         6TJg==
X-Forwarded-Encrypted: i=1; AFNElJ977it0AR8qqH6P4PLk0qHfy0z5ihRi03SAOEeiO/qYxMK9oH8n3Fhat2HGInp+n4qNaZDTNEmcW7Xv2OfiXbY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrZNwzLHgyF3ae6Oqnxw6FMY1ySImoDJIXVymAwxL75XoscYee
	le4FCUERtSxZBzN8ov9oNpXJfNJifQr4P6TH3Fldj62gO6Ou7u5qQ/Ly
X-Gm-Gg: Acq92OH4tTxJALa4sX/AunSz5j/ObzZhvyerzVeTa+mM1cvQdXcqufidjhqTDIUhQ5p
	7RDjlQUa4jr+lBIzI/zWzv5PHqxasQudC5mYyA+87ZJHod4+Vy8MF+RbgUY/WEn++/Mwv3nwG4V
	1uNCviv2A7N7zFcHGXqMwEL6VB+9KT7EeCVgQV2yVOQM1sS0iYO2+/rZOBGQ3Sk+6SC30foS7Kb
	q9q2gDR0Iwk55226aC4YIw6UsAoTaSN2c0+32T/UfSGhIO3BFvXsbmAf1qhKPd/HYw67THHTMdQ
	pEwklkkt4i+si36KfXH7bgA/9K1/rVZNTsjE+Tg0riksY+dNrb6SGWKnWrEin70OuRv40j146VM
	8uGx1N96R1Mnqv0AbkCmiku3QI8LchU+WMZIoMah8WzeEJ0EDn9anSYcIRXDXI7nsDUSp59Hbb+
	OzQlSIfuBY+gwbejLMSKVFYUGzY7LfVQ==
X-Received: by 2002:a05:600c:3515:b0:490:b5d0:598e with SMTP id 5b1f17b1804b1-490c2604783mr26573285e9.21.1780639962756;
        Thu, 04 Jun 2026 23:12:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3e59f5sm129250445e9.14.2026.06.04.23.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:12:42 -0700 (PDT)
Date: Fri, 5 Jun 2026 09:12:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>, Nuno Sa <nuno.sa@analog.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iio: backend: fix uninitialized data in debugfs
Message-ID: <aiJo1kjN3_XDUdBc@stanley.mountain>
References: <ahP3O2tQdu4dNx_c@stanley.mountain>
 <CAKqfh0En4pHqSfxfd2FHSDTxfWx6BfJLfeQ3xup4bwfLSTrZRA@mail.gmail.com>
 <20260526191946.409160c8@jic23-huawei>
 <aiEpmqKwFuIMRfdl@ashevche-desk.local>
 <aiEtIGOFhF8AfUCT@stanley.mountain>
 <aiExQzpIOwPgwd3-@ashevche-desk.local>
 <aiE3N6zErq2WcCvS@ashevche-desk.local>
 <aiFVuvVtaWbjfVzA@stanley.mountain>
 <aiFWg6vC2cVbONTK@stanley.mountain>
 <aiGRzFrSU6QUL4R2@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiGRzFrSU6QUL4R2@ashevche-desk.local>

On Thu, Jun 04, 2026 at 05:55:08PM +0300, Andy Shevchenko wrote:
> On Thu, Jun 04, 2026 at 01:42:11PM +0300, Dan Carpenter wrote:
> > On Thu, Jun 04, 2026 at 01:38:50PM +0300, Dan Carpenter wrote:
> > >    168          ret = sscanf(buf, "%i %i", &back->cached_reg_addr, &val);
> > >                              ^^^
> > > Uninitialized variable.
> > 
> > s/variable/data/.
> 
> With what I asked in the previous reply and what you explained there
> (thanks, btw!) I still think your patches are not fully correct. They
> will require to atomically write all or nothing. If we want support
> partial writes we need to go with that differently (reset ppos when
> we got enough or more than enough data).

Requiring writes to syfs and debugfs be atomic is pretty normal and
works well in practice.  These are very small writes.

regards,
dan carpenter

