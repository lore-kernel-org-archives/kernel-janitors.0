Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3A31C3029
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 13:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740747859; cv=none; b=pVfIXpQ6hBzN8T1oaGbsCZQo3FbuZdx9VUVIZXtetEMxJ3MZle/QQ1Va9BXFSOxjsxdDAzC045K4ggU2FNMwOcQqu9gBN15dfeWZUHQ+sonZevxeJOi0g99wSuyeGOvs81yr9TiSlH2MzvITYJyi28IIGTf8daEHIZ571DSVKZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740747859; c=relaxed/simple;
	bh=VhPyMoEJWSHzL635uSgBkZm3dqp5Xsq94bQLc3MM460=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GaKlyiMFrzYyz/q04H7O2mHAqTgFZ6T3nYL6k9CszO5XfBSdnSZdoaA7zeGCTY81zFf/87Cn77oJqucc6OBLEpz4PClIoauAePOGwAF4xGWgPttdk4hUdBrgxJZbc9rFZIt/q8p7wryc/6fBd2K+1zgr/7/JkF9TVtZjYG1k//o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q/cro2no; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q/cro2no"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaec111762bso366204566b.2
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 05:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740747855; x=1741352655; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=10Fkhp5xsWvMhzDZ9Hnkhm34939uK3s6cg26798CuOw=;
        b=q/cro2noUaTTqpexN6t86qhlX7eBZntO2OL3xf6hjUUA7x1l+DBXMWpcsrPX0WrKXX
         y1DZeespD+Tm8P618HqS7YwoK7162gR6V+cUnJiRCKrtHv4ZWE9KUsizpNiK488rv1Vt
         6FqTS7NSlBK0aUMGIERJ1Ur2sjunPUOdlglO/8RPUzXPDm316dtr/ccbBAF7jv2v2EcM
         3+Wk+6oBC+4hyWwP/TixxqmnIvJlvGrJttt5OIPSLEkuhhxcAdoUwhdDjED094hk7fap
         MQIjpS+9N09Qn3chD1xUrJ0yUZzqB+rXMtVTmbD/V0Q0JhYYjcPuCaTVqmtCQTawT7C+
         8doA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740747855; x=1741352655;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10Fkhp5xsWvMhzDZ9Hnkhm34939uK3s6cg26798CuOw=;
        b=Kfmp4xepGmtWKV8jJJlFFFRp6qAMxMywPygde1B/JjuC6nKqQbwfipx9d2FPFB5fxT
         C+8gsYVxl+5Tcng3hLFk4BcqzUCa1S53JpMt1vdnz6u2g8eK6PYhtQz2GED+nWIBn2ys
         swIfD55CIH/TaCZNg2h+U9mAB5qEakhUdN3OXQpvFkbN4nI96FkciBKOV6jP4gnmCvAZ
         YVD9Wyoo3lFm67gFKGMFw1rs/qhFuv40uE41mxlSZmb9Km/f6k1FBPFqCwC63b837bMi
         tsnLu2iTAzscjjHnktnNznc2NeurXuMIgC1r7uQIsA97K9ZPGDcT5XiOjtA0wicojYtz
         IVjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+eFAZUCPjzBbcuQ/tNdPtsIWd8RImR5IDTU3bPhToTz6LxQNs6Ni3wjVgD/mX4chPH9vPxVYuo8zx+o1Kick=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYcdPD4qU9lBTjgAjJirABLRRipXjMn0bmftfp7IQVGO48ZIl/
	GvgIHvJvD6lGVecHig6fM6yH0YPv4Pk58DsZwTd5c2kupnVEZnprlJdtVaRt8wU=
X-Gm-Gg: ASbGncvpWl5eYW6gYGxEa4kqCNVENAsixUtyGAsQrqRZctYPVzcuB+jFKg4l/UkNa3S
	m7sInlnV8WNFjsJplyxlxYmNA96HLTvQU+y+2FCAuHD+OIwNNWt2XdgdxnpIdgilhzPn0qPUSwT
	pYVVH2sN7QjOMiSYGIWlCIslvePI7t7ERQ2mOF4E6BDvNH4sjpy90ctAk/fuQ94d4yQHjh/4GYi
	np9BdahPcQPtnwmOIzkJA+bMxgo+fS3mDCLl0hwlHzZEjUFbbS9P8lDDQNMhpFFViHWoZsI73oi
	Gp3vTlYQGQDd+Txo9uHEmGLaCDDyNvA=
X-Google-Smtp-Source: AGHT+IEUt1hmwix/p/NTJLkhDfTeZ90IH3mBi7jSL6LBqNJkRYtj0rKm6mJr2PdW+AYQwRFhzgJHvw==
X-Received: by 2002:a17:907:3fa7:b0:abb:b31d:778f with SMTP id a640c23a62f3a-abf25fabb6amr318360466b.20.1740747855227;
        Fri, 28 Feb 2025 05:04:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf0c0ba408sm286438866b.37.2025.02.28.05.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 05:04:14 -0800 (PST)
Date: Fri, 28 Feb 2025 16:04:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] [PATCH] gpiolib: Fix Oops in
 gpiod_direction_input_nonotify()
Message-ID: <084aad2a-83ae-4027-a934-797f53962256@stanley.mountain>
References: <0f3ea3f6-8ae3-4352-b790-de0642edc4a2@stanley.mountain>
 <CAMRc=MeF42NeNJ_kR7H7oJsCHt=grTtN=c-3RbjFhX=uRQ5X9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeF42NeNJ_kR7H7oJsCHt=grTtN=c-3RbjFhX=uRQ5X9w@mail.gmail.com>

On Fri, Feb 28, 2025 at 12:06:24PM +0100, Bartosz Golaszewski wrote:
> On Thu, Feb 27, 2025 at 9:17 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The gpiod_direction_input_nonotify() function is supposed to return zero
> > if the direction for the pin is input.  But instead it accidentally
> > returns GPIO_LINE_DIRECTION_IN (1) which will be cast into an ERR_PTR()
> > in gpiochip_request_own_desc().  The callers dereference it and it leads
> > to a crash.
> >
> > I changed gpiod_direction_output_raw_commit() just for consistency but
> > returning GPIO_LINE_DIRECTION_OUT (0) is fine.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 9d846b1aebbe ("gpiolib: check the return value of gpio_chip::get_direction()")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> 
> This doesn't apply on top of v6.14-rc4, could you please rebase and
> resend? Thanks for the catch!

Sure, of course.

regards,
dan carpenter

