Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BB139AE3
	for <kernel-janitors@vger.kernel.org>; Wed, 21 Feb 2024 10:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708511404; cv=none; b=PyVS13DBYIUgaW6hchZm3O8T7H/HqwE25duDHOO5eSVG8HViOJymwxvMeQ6oHIyHjN8qJp8PzVV77q3hkqnjD8dxtsDkF0ye3a6QUUkldUrCKVZkZ8t34NPk9d6uvw7eN9dZadxTs5KwvdEZKOm8qvwcQ+V1a1hGPP1UCP2WYZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708511404; c=relaxed/simple;
	bh=zN3CUjyqFa6s+ccG3j8jMp2uTOIsTEDMHBCEpbfZTso=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fWYmmZwsRVLLIn2ZL+tKazFvxdGT1hAQkQNO5EGtvgwe5Pk7loxP18n6aeuiU2svKJje3CsUgXWRSkCpr1EFAuW12ARsN4EZf5lR0ZyIkb11kKAoV1WGnoynAhJzwEsNdFtdxRGj4LrVIT0oTj9cle3Emxj1/EfgTbHNc3WrwpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j8OhAzkE; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j8OhAzkE"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-512cc3ea7a5so1645424e87.3
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Feb 2024 02:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708511401; x=1709116201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+mM4r5l6LdT+myeKsizMxXaYG6u+Ya5ehvtYFAaVog=;
        b=j8OhAzkECgP/tYLEZi9tFPzSxd8lh7rf8dwRqD7p8Nz1BogRGbQgqogX+OWMlgPqgB
         6Nh0YMCD3LhcefTaXgRwnMKNwDt+FwAAc8b1kJ3+lUP5IeiIIvPKOwga19On++z7yLHN
         YOtNDw+bBJLiU+U5UNw7P2cfgWnisIgU0KTpalgroN7BvUhpoUgBz/aioyAAa5TOCfsm
         Bqdu8k0zlKJkpMtfSQOn37sXvm45VmJAOkWupklAknpFf1Dp+VqDi9oK1NjhuEzuyhcA
         +zTKafZXEn34h8L4EdIAr55y05bxzY/4L4DeO1fGkJTTD00JbuaIs3rPFwcICNh6IVr0
         6BJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708511401; x=1709116201;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+mM4r5l6LdT+myeKsizMxXaYG6u+Ya5ehvtYFAaVog=;
        b=IjTE/fB0LGDLmyx+b4YbqBPplbcqGYMHPE1jVR1zMUUZt/ibUp0eC0QzaZJmmqZTEy
         +mTDqjW2xt0/OY2iyE603T4tCJWsOO7+CMJZbmZE+Q8rUIHyYkFqf9Me/w9jkXnUveXU
         3ahFSZAS0oDI0ZauVFb6at18bdzbumAzQs8IAZu4nDQUWw902suVhvfzQKkixxjXkX5b
         C+2dPjqblBHddmwFIT9+9ZgSOZf2qA8NdwbUMgOxAp/9Eu3szg7QS/MFoZtwFE19Xq3v
         TPrgkpwjkjPalgO0XDL0LkqtTGkAL7R8oH0+jQBOoerK/sn/o7oY/K3E/7p978RZDek9
         Ty9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUC6Ek/vFNh76QS9kULWHQwPKJFXk4nTE/RlzjzaFsEG8nVtTwRqnsokqS5YJSSnh3qhix83iKvqJ1tt65OTdThyzAQ751OL8styF5HB6ip
X-Gm-Message-State: AOJu0YyBGJArohpJ3gKtfQSywFLsgv3QvfjE/93dxb6BpGuAlhVtbBsh
	Hca7uAX3buBbCKH+QXtHsEwyyra06YL8UwC1rG3YigGm1N+Z2GrfxOjnslRec50=
X-Google-Smtp-Source: AGHT+IFFL+ABu8gjgfDs2IgE7A6VsxBjDJ7JgNFs6fxZ2tfP6QvuaXN9LjhLHtJOCqL0CyKELz72vA==
X-Received: by 2002:ac2:4834:0:b0:512:bda2:7bd9 with SMTP id 20-20020ac24834000000b00512bda27bd9mr3913100lft.64.1708511401064;
        Wed, 21 Feb 2024 02:30:01 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c4fd400b00412590eee7csm14681095wmq.10.2024.02.21.02.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 02:30:00 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 alsa-devel@alsa-project.org
In-Reply-To: <8402a9a8a45937fe2e62617ff0c7408503692b20.1702745212.git.christophe.jaillet@wanadoo.fr>
References: <8402a9a8a45937fe2e62617ff0c7408503692b20.1702745212.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] slimbus: core: Remove usage of the deprecated
 ida_simple_xx() API
Message-Id: <170851140025.26081.6374799105426333526.b4-ty@linaro.org>
Date: Wed, 21 Feb 2024 10:30:00 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Sat, 16 Dec 2023 17:47:34 +0100, Christophe JAILLET wrote:
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
> 
> Note that the upper limit of ida_simple_get() is exclusive, but the one of
> ida_alloc_range() is inclusive. So change this change allows one more
> device. Previously address 0xFE was never used.
> 
> [...]

Applied, thanks!

[1/1] slimbus: core: Remove usage of the deprecated ida_simple_xx() API
      commit: 6e8ba95e17eede7045e673d9e1b6b8ee1055a46c

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

