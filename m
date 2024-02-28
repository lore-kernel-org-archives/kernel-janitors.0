Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E329579B6D
	for <kernel-janitors@vger.kernel.org>; Wed, 28 Feb 2024 18:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709144170; cv=none; b=qDj9WOWDajrlB8uAhepeRAKKnbCPNXYlP0ert4mJG9QmuJY/PaWMFSRHA0sCKii/3Uq8n8op+Hx50NmLgMqJF+nAHLPXIjzAsw+pcbwVkr02VnXqbxPR/sJk4EmoZsJj02kUW4rnejCAUtl1VCxUugeozmvI44ZwPKX7PfMvuw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709144170; c=relaxed/simple;
	bh=1kWaysEbsM70DaSeLNKQutuegUR4y2SpD1yzaZdBcZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXK2+k4Otqm9hMoh2JWT5Q6G98KPghPLn42D38o4wluc3gk/hXXz39T8gjwAOOGf+PpZ/0ZQ5O0pCa64LfS/6OKLtaBIF5IUSI0A0G3giItXLo7+qzUVsYBoXpQ622uYacVyLYvLzgNXYEo20H+9gkusyEZjSOHubrQsUCP7Kog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CNynDODW; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CNynDODW"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-412ba5ce271so121295e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Feb 2024 10:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709144166; x=1709748966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4RgBQLcrgH3gOWvIgwazhE5Cb5mh+fuN2kUzWGSABzg=;
        b=CNynDODWiBx+yxNlHgWEGN4jdSPZWJceJp6wyQZL6za21GJJcMD35NLt2HLKzRQJmp
         3qIoqu0AKrfVqWhPpULhry1Ph0VwzzIndMDH4+y6a9+MP3cu/jr9ZP+ZgOdhZZes5nLr
         IJVHBypF3Q7VhslGnnfMjgfWjJ8FHZoPRXIPx8q0R4gE9cLVTyBZshiEWeIQGc4+E19F
         z/CrPle+8t0rVR8KtJVKzpcuhDZxP7+D9nQrsTpjuHGcZi30qP/avZUJOEtTfWOR9Jfi
         IJmjyfDo7GAft0AXZ/Bz2omwNFIeKTE/SAG6bc9iM2UMnU2Bxq0dhEEIPTbVKHKJaN38
         qzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709144166; x=1709748966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RgBQLcrgH3gOWvIgwazhE5Cb5mh+fuN2kUzWGSABzg=;
        b=FDB7JwTAiiRzZQ7nZ5zVXj6oWitpN8A1pLlnLrsh5r0A36StV/iAF9WXL3je3NRnU5
         xs3amWPNnkd019JaS6ukJOq8i+KBEH5ARKMh23sIkgKu4u594KOcQqHhoDwkK5zuTlTK
         9i2lRX2v1/At/BspOJM2ltcuDUVtMFrIe5WCiXYxONhrJEfFmRV5NmkR5MQgQJBfi28F
         xZ7nXz+eakWaazf9zUO8Q7X7/TIJDk7gBHmkDGmduyXBRhY1uqdTFkxS/HqQqujcPYBf
         hJbvvQWK9oMwaB0HVRuDs6ZXsHzZUNA2Yk+IZK3oLyXumVsQHqZRdk0AfhVKo3qLSZHk
         Laww==
X-Forwarded-Encrypted: i=1; AJvYcCVo+vlQV+T1SB38oM5DK4AFbS8oF67PWzEEf5tHs8Yhz/qXEY3HVQEVdM9kgSTZm82SJvpKhP81qDFRBOCqsK+1mxHoJUaYPnElgk/l3eDQ
X-Gm-Message-State: AOJu0YyEDyRAKibhwTuRO901VdgOhYVKvw3IZ7FiWm10Ub3jTTYtuENu
	W/EAeaPbcnBXiN3kC+vXX6jXvpYd/iknwqdPzc3Ky3BCAGchzb8QKN05WE7Gyq4=
X-Google-Smtp-Source: AGHT+IGZsW2+DV+RLS5eEUTSzNTy/jmxqTHtHvCRKzCxwdxk8Ibsv3Vpe1wv06Z7qlQn/p0QV+SOnw==
X-Received: by 2002:a05:600c:450c:b0:412:b3bf:8143 with SMTP id t12-20020a05600c450c00b00412b3bf8143mr272467wmo.12.1709144166247;
        Wed, 28 Feb 2024 10:16:06 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id s15-20020a7bc38f000000b004128f1ace2asm2757215wmj.19.2024.02.28.10.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 10:16:05 -0800 (PST)
Date: Wed, 28 Feb 2024 21:16:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Xie Yongji <xieyongji@bytedance.com>,
	Maxime Coquelin <maxime.coquelin@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] vduse: Fix off by one in vduse_dev_mmap()
Message-ID: <67af4fbe-9dc1-45f7-aef2-ed397da733ef@moroto.mountain>
References: <e2361611-e8e3-4c6a-9f71-30e81a65f793@moroto.mountain>
 <CAJSP0QVYUrkbk6beMB6nW1q9G3jMqeDzGwMagyXh1B1skFdHjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QVYUrkbk6beMB6nW1q9G3jMqeDzGwMagyXh1B1skFdHjQ@mail.gmail.com>

On Wed, Feb 28, 2024 at 12:53:28PM -0500, Stefan Hajnoczi wrote:
> On Wed, 28 Feb 2024 at 12:44, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The dev->vqs[] array has "dev->vq_num" elements.  It's allocated in
> > vduse_dev_init_vqs().  Thus, this > comparison needs to be >= to avoid
> > reading one element beyond the end of the array.
> >
> > Add an array_index_nospec() as well to prevent speculation issues.
> >
> > Fixes: 316ecd1346b0 ("vduse: Add file operation for mmap")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > v2: add array_index_nospec().
> 
> Did you forget to update the patch, I don't see array_index_nospec()?
> 
> >
> >  drivers/vdpa/vdpa_user/vduse_dev.c | 3 ++-
                                          ^^^^^
I updated the patch but the thing about vim is that every time you
press a button it does something unexpected.  Vim ate my homework.

regards,
dan carpenter

