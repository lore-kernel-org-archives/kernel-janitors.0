Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wDjT5R11"
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C3D170C
	for <kernel-janitors@vger.kernel.org>; Thu, 30 Nov 2023 23:53:54 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40b57fa7a85so10476265e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 30 Nov 2023 23:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701417233; x=1702022033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fnpedeSocBCRbtfOah0pjGpceoXFEpBt4fqfQaogKNk=;
        b=wDjT5R11U7bBCGCy69qDYkW4efFwLXEbmTLzhGJlgt5SuwxDI6LRoBq9EbQw8Jqb4P
         9LEcUugyt1YPTY89xNrLCabnOx9hoXpjINXcI7X4JISqVRy0WqJO8jqh5iO1o7ilaf5k
         793XGYUnnPE7bLbsjXDXsFJzIExt+YR0+AikqpRJdTE2NO2SAxMd1TTQ5YY5Ndrm3OH2
         NNtGjuLc1rejrKdupsNXlVWUyjQou34WL7Rr+vszLCjSAq0qqJbe4K1I1zIt7LQAbvIC
         FYkS7GcW5BWHmQ+G97Tq8dI/awKzo+HHceEL6qUg/485fq8s8+uVeV1g9/Ar3dALDKsD
         cdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701417233; x=1702022033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnpedeSocBCRbtfOah0pjGpceoXFEpBt4fqfQaogKNk=;
        b=TYq3A87LGy43YyWP3qoB8V7gxN/c21zvZZdl4w332xw2WxsTduYjJ6auOAau/Y2WRV
         uILFiOEj8i+xE+WUaJ1XLpS1rdgyg3YQ1f8MyMLKY4ZAkbh5g+hmOMsYFvNTLYdETFv0
         fywfd+v75VAbfZrCYUG6xyxUqnovk/pNHzaxhkoDzAUhDrRTQd2szZNlG3DDUw8wNj9B
         RekYy/iFlXBd+xjsVLPes+IuXBj24mSvnXwov6VCSW/ypY+W9XRKWXeQANUrNDYKh5LE
         zmAsVbATlfC6TyhemR1mJhtp69QrVQSUnX0hYdvnJcc+XNlIQfc2G7jB9ib4j84LCmxV
         mNFw==
X-Gm-Message-State: AOJu0YxTw2g6WeFlf+kjdo9HHKs9QRhFXyjcvbJar0ZyZAllkGMNddw2
	pBgEk+k1p0cy5HSDQX7006AXVQ==
X-Google-Smtp-Source: AGHT+IH/ROrJyeX4iIdFVBF87rue/OanNTumC8XfVpTFYtF89rY2inQaA0rq5BPHn99Kigq0vO7FSg==
X-Received: by 2002:a1c:7c04:0:b0:40b:5e26:2382 with SMTP id x4-20020a1c7c04000000b0040b5e262382mr379677wmc.51.1701417232693;
        Thu, 30 Nov 2023 23:53:52 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id je16-20020a05600c1f9000b0040b56f2cce3sm5336261wmb.23.2023.11.30.23.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 23:53:52 -0800 (PST)
Date: Fri, 1 Dec 2023 10:53:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: hare@suse.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 0/3] scsi: aic7xxx: fix some problem of return value
Message-ID: <d37560ef-d67f-4493-a7bf-1d192ff7351d@suswa.mountain>
References: <20231201025955.1584260-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201025955.1584260-1-suhui@nfschina.com>

On Fri, Dec 01, 2023 at 10:59:53AM +0800, Su Hui wrote:
> v2:
>  - fix some problems and split v1 patch into this patch set.(Thanks to
>    Dan)
> 
> v1:
>  - https://lore.kernel.org/all/20231130024122.1193324-1-suhui@nfschina.com/
> 

Would have been better with Fixes tags probably.  Otherwise, it looks
good to me.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

