Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D432F43
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Jun 2024 05:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718341507; cv=none; b=Uy9euJO6OHqNwmxK0EYGGAqlrz21o9M2gyuBy4otXbljFyPs5vrS/sOHK6waexJhzwrLRarl56IzZsRkVx6sST1f/L2PsY5Q0P6BVKq3lVOWMqweG2rRKeWPmkKJXZcM82z1N9oWshn2FBCUJvLz4yU6fuBHRWbccklSvCbdGD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718341507; c=relaxed/simple;
	bh=IukhxcX3qDkzoO5Zy8Nrlq5s8wAmwy+/c7BkQCbdyC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4et2EM2DsElqwfHQ4Afi5F8d6H8xvFY+LabR7jyEln9wJ6sjW+wG6RiavDGk6pCiXjGvww4wK6t18sbMaHJsYFflq1k3Rz9pKxubSwDsnU1grsww2RrUaT2LA1rPQri5TiS2T6eHmDMcTHH89FCxMHL+/jyEFijpBB/86YpQaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=frsyOYeN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="frsyOYeN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42278f3aea4so17619375e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2024 22:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718341504; x=1718946304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EWNNIgMpJqUN8OKFztHzayuDCT95LOD3ZJqMZeNQQ+c=;
        b=frsyOYeNNhtC5G+KKj+t9vsEKuI8OGC4BgQ2i8q/RDNlss/jTB0geMP/Ys5pIqNQ9n
         UzInjbAFKZvUv34qm9GzzhtP8Hz1+gvQ0BuvcIIbdllC61rXfPC7ll9f8W0YdliJGNgn
         8LhdKVuWOxLPBmtHt+sMD/3QodxEm+uGZwytO+L6iXrG9Bl9995dz5w3bljh0qdAA7Ly
         0fS0SY/h+mBWIOYzWA8aj4J0vn38BExFPn2lFmganm80tYH/1U/c5hTKOWAVXG0yUThM
         6kAtYcdyKrlfHRpWLf0fOs4jkLpteubLMfBTntLE+3W+dAHGcIPYsDoQ5IBxoCVi1Cuu
         RDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718341504; x=1718946304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWNNIgMpJqUN8OKFztHzayuDCT95LOD3ZJqMZeNQQ+c=;
        b=wzHba/jU/FcNar0tdjwU0BtbuiNUkylKxvN7Bbgoud3hbeJITggwCIapwToQqFCf+8
         dPmAz8EAGnutzlDMZ09fsyhU0fWNM1BgAsvx6L1MjeykarQacVJY1RdGlgITxoIxrOxh
         aIepM6BQUAG9WxM/rEvid3gpD0odbtLX/3QWdEa52Dl1M+vszcM0kbk3dtWsywiTi3jL
         5bQU2U6SBt8raMMt/1vQyXFkguCmKF9goTOlMLlaPe9Jrq0G7hzEtSBhVWEj3Pi2HdUh
         Qh1nv05AEAR8BPrt6Dln16OIA32bIs5k5ZtkUjDCsjFgfEQ6kzvxQYT4u1VAG2iSdAsn
         UgdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVibQGQ7O84dopip0MXTbFbnwpJf/rw7EnXmg0qAe39ErD3NofRUvDmk/PzYEchPu+P8KMb0LVBZbQcK/dMcm+v2Vcf8HVkYrGAbiVDlOg/
X-Gm-Message-State: AOJu0YwcYFrqrY5YPFdPgMOR81Zy4WaRDK04o9CpmRkhuhHkAqTxbgLi
	XB4/eNwnUS7jCIN9SC4npsrdKxWPbdRWirTp5CD8FlLnyG8furJUb7lLzUtlr3WZQh1b7vHncKy
	2
X-Google-Smtp-Source: AGHT+IHAc0Yh7ji0lwnDCu2Lv4w/FZ4Yx74voqdotxBtp/d5ml1qvOCQlfNZBB82HLxJCmKCwVO2Zg==
X-Received: by 2002:a05:600c:4ca9:b0:422:52c3:7fe0 with SMTP id 5b1f17b1804b1-4230482c1e9mr16109225e9.22.1718341504275;
        Thu, 13 Jun 2024 22:05:04 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de5d5sm83206355e9.33.2024.06.13.22.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 22:05:03 -0700 (PDT)
Date: Fri, 14 Jun 2024 08:05:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ben Walsh <ben@jubnut.com>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Handle zero length
 read/write
Message-ID: <590a7d8c-6bfb-45f1-bc26-d99837cff2a2@moroto.mountain>
References: <20240613212542.403-1-ben@jubnut.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613212542.403-1-ben@jubnut.com>

On Thu, Jun 13, 2024 at 10:25:42PM +0100, Ben Walsh wrote:
> cros_ec_lpc_mec_read_bytes and cros_ec_lpc_mec_write_bytes call
> cros_ec_lpc_mec_in_range, which checks if addresses are in the MEC
> address range, and returns -EINVAL if the range given is not sensible.
> 
> However cros_ec_lpc_mec_in_range was also returning -EINVAL for a zero
> length range.
> 
> A zero length range should not be an error condition.
> cros_ec_lpc_mec_in_range now returns 1 in this case.
> cros_ec_lpc_io_bytes_mec checks for zero length, and returns
> immediately without beginning a transfer.
> 
> Signed-off-by: Ben Walsh <ben@jubnut.com>

Ideally this would have a Fixes tag that points to my commit.

regards,
dan carpenter

