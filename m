Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621DF2EFD9D
	for <kernel-janitors@vger.kernel.org>; Wed, 16 Jul 2025 09:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752656561; cv=none; b=Q2JJvlppJ8zSRcpwlW5t8D8zM4BOvPnb+pxp7pK9gOAQ0LV496zTFGw4KE1NpXJC0hso1dQGnm1XVe7S1aZW4O7LfU44y75PezwynJfUmafsQi+283xi5RQIomBORKz3rl4e+L2df6w9nmjobcR7rllOPx77erfiLu3F9n+HQbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752656561; c=relaxed/simple;
	bh=gWNSA5bMeT038SwG770NbaScl1hnC1g1Pzb74ptMoLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WYwRgar1gLs4vWmQa+v/GFGJM9tPenmu7GWE9THKPb1uzGUUKvYO49LtPyyUy7bgtjLKqM/rU/Vo1hes30Dt+YPZXD+VihOcsxThNRkx1YlunPcNwTkco7cp2SIve5Ex+6hZWZoK6bBgAjhJXFRsSXMm/LTRyYh+6DIArb3JVsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ghJ35+az; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ghJ35+az"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-454f428038eso45455785e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Jul 2025 02:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752656557; x=1753261357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DU+chVMZKPU+za4znspG/6bfzEqGboZ2pfvVasC68c=;
        b=ghJ35+azm1Z5dGdCCPB5ZVertZMZVqK0Lqc/EWrbVQpx3G+Zo41/K0n9X2hk3edisZ
         S9uTbkRQb2mUGMkPN45FtMwDvB4fk1Z1vQn83BINL8KmxtnC4TMhEILg+gYrFw4QHljO
         HKfEW8O9Xr9ZXHak4F/ooJPOhcwXrZA5LCaKexZOv5kqImlpWD3QsywpyACL3stWDuwh
         +6uh0Px4e0cwkzZ/q+/kpoqfw1bFPTaoVyh5hqutf4og53sJplxloVMK9+8OAYV2Z87G
         MH8HFf8vlMAfZG542WEoCqn4vaQYhlderjOtDhLtrdFXfsaLwj4+HTVwe/WIB0mkFr2R
         K4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752656557; x=1753261357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DU+chVMZKPU+za4znspG/6bfzEqGboZ2pfvVasC68c=;
        b=t5OcDvJURnb+qV2FSoYMUYBLn1Qt18KrkkG8ff3ckkVVmFL9mIswFXk8hVm2Ha+BnF
         CK1z+t9Z1tdn3sq7ZJLr/bASIlrhuk2Hv22UlruV6QND9YgRP1x5LRDao5R55HFuYcTK
         levrVInd9Kmqh2ZyAsbdP5DnTDoEJElbIPMfvGfk5mq6JuLYbMYhrzhBOum1EwlUPOWb
         cMgSBiGpBu4NQYmJn6/mgiOIFIpOHKR1UuxL338l7n7bFoHqXd8vMUsph9n8KzpXn6T6
         NKJNmGtGF2yvpkhcED/brghwn1y3ZbQfXbKJwvEre1CPRWm035qbtRWQ5kXVz5Z6LmZJ
         7HYA==
X-Forwarded-Encrypted: i=1; AJvYcCUcViWIoxPVB6RRFYKeYvcZhAwoQzd/+sXnGZZAeWZVsGf8k4ctUJH5ZfO9SBZK40Lx+yOGl3Sl0n8zIQn++rE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJUAUf6bZ2K/2XjTfC7n3O75mV4Et6aZnDeguzVBe4BWrJvVAo
	j0eOoIbKIZaiy6xZosqLxKlD8Qgp2S1R3syZGCbpDir6LCzHYBT4M/epIZBgdj72BQJUtHK0xLq
	f4QaLDSk=
X-Gm-Gg: ASbGncvDslYNs56d6YHAws14w4/4hpPU8TNPFBpBIvrZDLlbX+ODPUtxWkHBzDoilXA
	mxu0Ql3sIaS9etUJyM/BDgO5NEa7m5WGk0/jH7qXELhCnemmf+cCCYCFF/tqK+lOFZkG4waahnD
	Q0I9xO8Y/liZ261Bw5ALyFuIdp4/vphPvxqxl90/G5WPwoOv8N1SD0oFFb1pXTCwm+OqxsMR+ba
	T/Dp4QiHpzy32Kjz1/thgF5jaKqJu7soMewGSoXE/m7JmUd72ZD6P4LW7CBN9xM3Udox9nkXWrl
	3MDwaYA5Fp6YhvIU1FAFL7ZgxJ2qir86OS/nnt7dERv8qYpQdHWO+1vkUxxkm3Dg6Ox4ca/a05f
	GAUawfjf2wB61QXgdU8l+tFA=
X-Google-Smtp-Source: AGHT+IFd1A5c1zO9GBABwQI2kHUsUg+7vssajggMaoc11A3BqmcR80bJTa/022VUfiROeI8C7pZWxw==
X-Received: by 2002:a05:600c:3e12:b0:456:1bae:5478 with SMTP id 5b1f17b1804b1-4562e364789mr20439455e9.2.1752656556687;
        Wed, 16 Jul 2025 02:02:36 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e8b9:11d7:19c9:41b2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f33f0sm14574135e9.2.2025.07.16.02.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 02:02:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] gpio: viperboard: Unlock on error in vprbrd_gpiob_direction_output()
Date: Wed, 16 Jul 2025 11:02:35 +0200
Message-ID: <175265653234.14840.942937667387824922.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <9e72018c-e46e-4e55-83e4-503da4d022fc@sabinyo.mountain>
References: <9e72018c-e46e-4e55-83e4-503da4d022fc@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 15 Jul 2025 17:58:34 -0500, Dan Carpenter wrote:
> Unlock before returning if vprbrd_gpiob_setdir() fails.
> 
> 

Ah, of course. Applied, thanks for the catch.

[1/1] gpio: viperboard: Unlock on error in vprbrd_gpiob_direction_output()
      https://git.kernel.org/brgl/linux/c/5103fbb7b59f7a078284a345d82bdab0f0ee6d08

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
