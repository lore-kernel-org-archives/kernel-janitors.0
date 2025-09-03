Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE412ED84F
	for <kernel-janitors@vger.kernel.org>; Wed,  3 Sep 2025 08:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756889752; cv=none; b=UPLEfdA5Y+bHjHEh1bYlf6aBxhECKKTn4LIlgzkFfmCjqmHEvmuz9vX9GJfs/EnzAMNELQ8Y+Dv2pwIDHHKZf3D+O9eyAxsr8IDJjo6qmbRM2TS4Bua2MBwSo6eJHfx2jrzgPUfumToGD+ARpUYGEFHYMM3dvc2Sd4DL0+zrrQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756889752; c=relaxed/simple;
	bh=GYN9iaw7rAier/pATCqUnEp3Xj8mNzeugHEcM8SbDPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bk5WXdQsUd3viUJ0HYa85l9uV22MRsozKr1r9PoOD4LTCZyyhp4GKGGvugrTwFje+7QdbFZ9y1jRO0vba584BCCQgiiG5VdVkH4eJoPLN3tPCZjL4ZTgSP6Shfz2MV1FlCV6VCqOOb933q9ZXnGc1YDVzAMHlMnw1aXWUNE9GB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CuL7ZXrT; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CuL7ZXrT"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b8b2712d8so33765195e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 03 Sep 2025 01:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756889749; x=1757494549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5cV4mqPmxW1tPyF9dbost7ZwM2Dt79PTTYDkgTZFQBo=;
        b=CuL7ZXrTmUjw1fvqBh2MDozJxPqXGHzfp42WV0RZO25tFjW6Of4f+cmHZp4G9SNDcw
         lzQvQWzpjG3WxsaQ3/yBBKhel4crElo1Cuulw5rp2XnPCaYhpTRmW9FVnE6TMNeLHNi5
         jsnr0DVomD/nC7JMLm/4EtJpx+rrL6qn552W/6qaqteNjNczWV4QKftJz6jGNIUOlwGy
         JCfVCOvTl8WAhPWpNOhfVcKAk3gRaYfTGk/yOqimqIaUPg1yjRz3ePcDvltIdfAXk38B
         Xl5QLahdypr3pjj33m+ALNBpNtewEVCx4uhpZZ3+J70HWipFTdvWh3x5y2gdqi5RiGMo
         UwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756889749; x=1757494549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cV4mqPmxW1tPyF9dbost7ZwM2Dt79PTTYDkgTZFQBo=;
        b=KHfAvVcABrz1o9II0LRDbwsrc8wUmHKjo26JQHdC52uD0Mz0Vk7qUdDjhCG2i71aRr
         M5LuJF5szWFrqIYtmlCpZ4kf9uRGwfen41ukMuv5pQWB70UggJYV97KOn5mBZgX0JNEa
         rd+VOJyDyvulmSYFDlc0JfLsmD5CIap+i58E9VOOO74sLJVbh2OIbEe4ZfvDz/pur0Me
         EqlOABwnEwCFi8VnN98SaLP4nSAxl03EI8TTdZUSPvs4AUuVVe8Ac+PaPJBLNgC6gLh4
         7Wyc9yY8TeNx1SfJQvgkjtMDQl1pAXSYU9RGaVBDoL2awt/NsWedPASyUylD9hXE7UU1
         IJgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnbQcywhRBAlfikm7Cuxbv8QAcr66apiB6vkVyudNfeOIwxMhCbz4ygWITq6OgBwFFNrvzcFDVk+JndlOHjVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCrUcJ/+WmW6Eac24VeYc8bvApPiqxrOoVn6VD1iRMAUKa8RYd
	TsnGSSMTi709JGoeXuncEeSHpQWhlrVJ12uJKkT5hxUI51pzkcM2yofN9e17fk2i8c0=
X-Gm-Gg: ASbGncvLUkgKChGsHSTrnRO1vN8nbWGXCNaQFFYDLlYjy0HgcKy50XhJvpIuY5XEk0t
	V2XTqaPmsAD+bjsD5Fg8oIUZn1IIgdVTbbBPHm3GsJGuqdG1ooO/hdiGf8VpNyvYL1I7DYxj5l5
	pwIMMsXQjJQSNsuV0quNNNOk8HES++wPFnsUKg5QPhDPr7F2046UfSxJSpsJZnQ0vtAVTMBBfDY
	y7QJIs5TnzeK2IndXc5btt17ht+pMtNKemG2qyMYN6NTvA3de35Yl+JplYwjrbb2dSvQiPRnmPg
	i5b/xemnIA9wSZuC47QPZMXnJQNvKjbGl70Ze9ZpjZmoZAvW2d9RzMMT710CD/tRdHEPBHsaDLi
	AdNhKdPUzsck4YDL1gIbOoG40bVJfXZ11/5+rLw==
X-Google-Smtp-Source: AGHT+IH/I5haMU97rwsp/23eXdJD7jSFORVKYid/zP+DHP9530edfSTunocGOnjSttPgmZD8RbnDJg==
X-Received: by 2002:a05:600c:1f1a:b0:45b:47e1:ef76 with SMTP id 5b1f17b1804b1-45b8559849bmr123014385e9.37.1756889748976;
        Wed, 03 Sep 2025 01:55:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3decf936324sm1205616f8f.9.2025.09.03.01.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:55:48 -0700 (PDT)
Date: Wed, 3 Sep 2025 11:55:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>,
	Shaoyun Liu <shaoyun.liu@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/amd/amdgpu: Fix a less than zero check on a
 uint32_t struct field
Message-ID: <aLgCkRO8jkzwuxW5@stanley.mountain>
References: <20250903082018.2702769-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903082018.2702769-1-colin.i.king@gmail.com>

Are you editing your CC list?  The get_maintainer.pl script gives me a
longer list.  The most important thing is that you've left off Shaoyun Liu
from the Fixes tag.  Added.

The kbuild-bot did report this bug on Friday so the AMD folks likely have
a patch kicking around on their end, but just haven't sent it out
publicly yet?
https://lore.kernel.org/all/202508290749.ti6u3cLL-lkp@intel.com/

Anyway, the patch is fine.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter
