Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF6543E488
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Jul 2026 10:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110961; cv=none; b=qBIN84zEQbJItNUa4kL66mlDqmjdH13QjqqmYe+nYf4NoY9sk53Bero8tgni3UsSern2Klz3EbvP8GEaPB5Pd7jxVldv4mS09lFkWAqlaY5X71+Bgf5NW16KXzu3LZpMEKOpxEdKAgkcpWhX9QUZs/2Wxp8qNYua9sVyciAu+DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110961; c=relaxed/simple;
	bh=RYsCY38hXfetDYpNXSv6HtboJtdEpHbINpvt31eP/o4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZlhr6iBIROklGX1tINCvd5Pl3I1ToqIHkJxYhAGSp4leD6V8qJkFzdkPC30cEnluA4V0sqHo5DwAtyr67vWOBNbHM/1OaX55Fv41jMSe6seU8Dh4GOGW/kxhFFJL576n/qgk9scBAmUvbP7yD9orzRjinw12kcxfKB5KYDikNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvbmfKRz; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvbmfKRz"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6a2c1edb210so1137463eaf.3
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Jul 2026 03:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784110959; x=1784715759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YFRVUyNnsvCbhkxmCbV4fjw8KVL0SYAGHoyknd5Huqo=;
        b=jvbmfKRzTGWm1MKyu7Wx8HYRGdBSslbn5kTUIlQXcBHcj7ibTDuPGO54ZxYYkyZ0b7
         /5DCotcBS+Z7hR4aLWV3d5wC321abbdqFKLsGvrVUYfp8zUOr3x1ckUVySuoWsgPc38B
         B7OjGORir+p7Bhuc+bnLkPYczsmezV+aviXlXqLLDnnXEOZCDzfvzrbaZ93TQE02BdCU
         zcywqJbV7XzreB+THMylVC0EhKIRMfgbt7KGHoYGg5u2nz8D+FS6w/i/uQhvOidWAl2G
         5ZXz7gH7POXqO/3cJj6XDvqRXsH8ryU33Tvdi+lqwanCxPItgJgs2g16XqFzG3eqO3K7
         3wTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784110959; x=1784715759;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YFRVUyNnsvCbhkxmCbV4fjw8KVL0SYAGHoyknd5Huqo=;
        b=KcX+FUnYaSHaaJk2Pz7H6nGKdUDKkCFjHlrL43/E4o7imGtNT22eo64pYUuMjzGiGt
         /p/XjrvJygu4IhI6rWiHKejEQKAtrvP2TnMHqvVdJ+BmX8C7gaQKdHsND3QPLIz+2Wxu
         01nqGr9+WazLKSu9wsi0T2fxuDnwypB1sSRQvo010J0m9Yb6PypFv3VbCL1x8Kl4++fU
         tCnhwSfPmvf2EC2uSDP4Z4kZdPZ1lXxPHvf+o7+E3qbIbIp05b5CbOSENP9H5KL0rBRr
         t76SueZJSDtztyoBgtrXwAiKBeYygm+izvcWh+JZkfGuG5i3WWe+lHliPsTidHDTIlBq
         5xaA==
X-Forwarded-Encrypted: i=1; AHgh+Roy57fxrDGSO+brrxKviJe9HHjgb+3N83QMmA84GqW2C7RDf8kXFujigDxP8dtQkNp4Jhq+iGzTcBkQzhkzy0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxZbAGzH0hN8uHUX+CSHI+KU924nJhioGhRlKvqb0xjd+e/hEg
	RsQEmA4/+RuYvkGRoylLvVZqVueZdYOggvtKX6x259gLBYGIbynFoFhv
X-Gm-Gg: AfdE7clnWNLt92KF12IY2zP54UeByAT6oy90jj+bowCuXx8IXjNCDEFNalyk2HZoqmR
	8zj6/rWUs6tw8sf1Mfg4K0yB//U3Hynop4o1XxNzt+bOtW7FObELYyJIQ2MY7xH8ell5QemC7MH
	6YQuT4W09Slic2eaK2GCHsiXqxsq3RPXh/XIlRlfNsk8dapWswBZyQFSMsw7/+Bi9yaoxUbtuYs
	/CJKImcTjEqGx/jtx1T5Zz7dm6L7rpBz7UxQau/Hu69/nw22I73OzZ2IpQofkPUpjx283fHYu+l
	7+Xk+qoVYEZMwbYWTwHNEBNpz1DcW8BNT/KVLjmNMW/HqkMYUjwHNhCrOWr5WYkTR6bkOB4oF2E
	YHIomixqBX5/OU/HHg11hqQFUW46s7niJyhDfRarqec2WbSW3Uo02bd5z3iT4Kk7l3hZ9THV5yk
	1V7rgA
X-Received: by 2002:a05:6820:1350:b0:6a1:8606:44c2 with SMTP id 006d021491bc7-6a3da05ba34mr1315522eaf.54.1784110959511;
        Wed, 15 Jul 2026 03:22:39 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4561f2680d8sm2782008fac.14.2026.07.15.03.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 03:22:38 -0700 (PDT)
Date: Wed, 15 Jul 2026 13:22:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Colin Ian King <colin.i.king@gmail.com>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] iio: adc: make read-only const array config static
Message-ID: <aldfaM2aks7qOz2C@stanley.mountain>
References: <20260714165012.184651-1-colin.i.king@gmail.com>
 <alZs-uLJug_rnRnq@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alZs-uLJug_rnRnq@ashevche-desk.local>

On Tue, Jul 14, 2026 at 08:08:10PM +0300, Andy Shevchenko wrote:
> On Tue, Jul 14, 2026 at 05:50:12PM +0100, Colin Ian King wrote:
> > Don't populate the read-only const array config on the stack at run
> > time, instead make it static.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> ...
> 
> In all patches like this it's always a bikeshedding possible of moving static
> data outside of a function. I have no strong opinion in these cases (when the
> data solely used by a single function), but in general it might give different
> readability experience (it's harder to notice static data in the local function
> definition block). So I leave this exercise to the maintainers of the respective
> pieces of the code.
> 

It's an interesting point...

At one point Smatch didn't track static variables and it used to
generate occasional false positives.  And it's like you say, those
little "static" qualifiers are hard to spot in a wall of declaration
text.  I've never considered moving the declarations out of the
function scope but it might be a good idea?

But in this case since this data is const, the static vs not-static
doesn't affect flow analysis or readability.

regards,
dan carpenter
