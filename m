Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2934158DBA
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Jul 2024 17:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721754298; cv=none; b=tG2Sh+NnicCrY2la+aZOYKRqpAGDsNvYOzHgjmts4iiFM1a4n0KP4MA7vHK3y+rEDPQfLlx+M4ntN2T68judk2TR+eNBKzvUv49Ido8Rkb+oJkBuUlADNxXo4ST11ubVXPNjEk3dpwGDu44XxXPUH/tgIkuv1oOW/Su6CXrVFZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721754298; c=relaxed/simple;
	bh=rjm+XiXLjAv+cv8lsSElkzlnzNnwcUwpg8OI2sAcgqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apHxADbc006GPFZw5FcC9G+bHpCssYMGOukN+A7vUJie7UUNTVkg6dM3WXI1HJhFWXdhOyj14LqM5J41p6p1TxqIQbZcAM7WnvKB68BL0HuwFzqox4ohXRGmUdOwpRNGRtzSpWhKIJOz/1i53lh4cqRRYdo5VyB0uaT6IhcEarE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QFuvWIPJ; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QFuvWIPJ"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-70361745053so21687a34.0
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Jul 2024 10:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721754296; x=1722359096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=17PO6P9m/EPzTuaWqEoZXJbBkST2vM/pJLJreMB6/QU=;
        b=QFuvWIPJcJ8EFnQdZ4+EMwvjvVaE8w/RGKJI4t/pRK55VRex3xFoPFEVLEk0ENDt77
         oa5AhM3Lk+n81cqqKLBqTjIn0g36I8ssNpIJOp0sKYxcKp3VxWoH11vyVVjEn7ySTpJv
         wFUCASZ+zhxITL8IyXXcHtPvJKOlvW/LzFKq41pYnElHTz0SFXZOiGMTpdYTxZgvYisw
         GCGJ0n2m/geBoEFQUEGYUObA3Gpi+V6IyHMmwLYWI+w+uojP5U5LZZZ/ZFPL1o94XW6F
         EcVgkg42KIPbKwW+Fgd6aTbo1hVxvCEnZCrHmmKWFHR+Sm7dxD9IIYbQ4+UklzvL9kpx
         csow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721754296; x=1722359096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17PO6P9m/EPzTuaWqEoZXJbBkST2vM/pJLJreMB6/QU=;
        b=IYy5HcWuGemJemuNSz5Bnc6ag0mrV/KIl3CdXfa6avSfFwoIK9qoVj0DEZfnUBuOjH
         ByjSMyssy08VESiHP2sV3K++Vhk+k2jQ0KzGl/LfCyy7kqEihRXt4kwIqm+Hcqd4+J6h
         9c/cvcMiidiGr0JNVaahDv/cKJnjBAfo/vBM1vuCKv1ubNmTGGaAvDOcQ01VpGaSv0XR
         mGErYa8R42yJkGwc7oQLPGow1O0P4ndFaneS0gXgrEvj1DqR2orFjrwE0InT8fpJw2ll
         VzSjNsq7SG+1WPNAKOCotqqrmI8UhgGpdVQxETVM8A9tKfalxgymZHXm4GKXb2OfXYFE
         mVig==
X-Forwarded-Encrypted: i=1; AJvYcCVV3xmi2LQixT+okyB9g9C4VPMe0MdaSzJmHAU2YE6gW7zNMV5PDpwx44keCTktTlDH/P2osqdQ+qb931FRJSZRrZu58j1xw2UdZW/05PnZ
X-Gm-Message-State: AOJu0YwU3hU/HkpAiXl5FRtQ2zI/h9d7SOMRrrp3VSwEgUNpI4EveamJ
	5TxRiv5lmZfVXznAQHrcyCLDghMM9n/2PFkVH7FEkiblMlEFeWCKUsHfavOy1P0=
X-Google-Smtp-Source: AGHT+IEA0MFAjBrBs9eGln7moHaVSCxxONpZPV/R5VMZKTqO7d8zBcegIRMtxIjGeKGufDvuoUnqhg==
X-Received: by 2002:a05:6830:314f:b0:703:6563:9384 with SMTP id 46e09a7af769-7091aab9531mr1132985a34.1.1721754295924;
        Tue, 23 Jul 2024 10:04:55 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:eca3:bb93:d28d:1005])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-708f61747e1sm2057512a34.64.2024.07.23.10.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 10:04:55 -0700 (PDT)
Date: Tue, 23 Jul 2024 12:04:53 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Colin Ian King <colin.i.king@gmail.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Vasileios Amoiridis <vassilisamir@gmail.com>,
	linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] iio: pressure: bmp280-core: Make read-only const
 array conversion_time_max static
Message-ID: <abc73704-17c5-40c4-a92c-b69c571a006f@suswa.mountain>
References: <20240722151738.572913-1-colin.i.king@gmail.com>
 <20240722210111.49e66c4e@jic23-huawei>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722210111.49e66c4e@jic23-huawei>

On Mon, Jul 22, 2024 at 09:01:11PM +0100, Jonathan Cameron wrote:
> On Mon, 22 Jul 2024 16:17:38 +0100
> Colin Ian King <colin.i.king@gmail.com> wrote:
> 
> > Don't populate the read-only array conversion_time_max on the stack at
> > run time, instead make it static.
> > 
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
> I'm almost 100% the compiler can hoist this off the stack if it feels like
> it but sure, it might not and adding the static keyword probably obliges
> it to do so.

You would wish the compiler would do this correctly, but it doesn't.
(Or it didn't the last time anyone checked).

regards,
dan carpenter

