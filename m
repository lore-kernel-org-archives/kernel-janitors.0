Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7404717727
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XzR15MZS"
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D94B7
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 07:07:59 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4079ed65582so33024825e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 07:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698674878; x=1699279678; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+x6+LsrjZdB8dHUELRSubYTsHMKRqi5GBjTWofSCMDk=;
        b=XzR15MZSaJ5rcYRcqgEh7c8vUnMlL5v9R+zWTwbI4usZ3aPhMF5rinw2t9iEsxbYEy
         H5gp4XB4XlAF/bySz4rt+PGc1f9nyW3YWafsXXMnE/bOlaJUML8A/VkrmnMLZRS7GJ3k
         QAHXipYM3oM7fyBAzg8G9PLSi2//LurYS2cgeE8y21NB+MrZWFOi9KJcUk2uz7GvyuvZ
         9DhRI/ZZbSo9WlgwrqMO3uyewsXb+6ijOq3wlwgL9zZFDAO5RLCee/dqzKe0IV2X0e+o
         X6QWMr3R1z9/hSMtDLx0pBB29Is//qmbc7/DrsFFH8bxOV15bcdUt3Miq1oRUyfipYIP
         nqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698674878; x=1699279678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+x6+LsrjZdB8dHUELRSubYTsHMKRqi5GBjTWofSCMDk=;
        b=Tu8zDCicBvgF9j/eLVp6dCJhJNnTzMSP3Ug0x3gq71agj6n2+JKlwjS6XFYB2B33rU
         dC6tg898h4wcat6g+hj3XFyoPb55sFYiLKdGGXf9WpWp2+ICE3bsX2vRvrwSAoNVj1Qq
         /hibmzeHNzwIsOMS+Ae543mqM6m2hnlSEOl8vVvahFQDF+X0qGE/cVYTmwjB5wirZFVQ
         PBdzwp1Q+Ze/f5yDN4ZwJdSeZa/zsTj2BaZzjLMa+OaPJ8UI665HZykwt7Uha5FPgoe0
         GZe2UsgtvQZW0lPayPWJwIVjl22Mtuf26l594kTED07QP50or5++0zAg5GypfOAujx9h
         wmYw==
X-Gm-Message-State: AOJu0Yww4MXSt/uIvk0+9f7SsyXhw1/ILDwSzgvjXjsstTd4eoBnbmTF
	xLVhpwuSUj0DoqXeRWUiVY1nKw==
X-Google-Smtp-Source: AGHT+IHa3PONe2ZHFjs1Ut/yXYmZH5eEEBpHXQF4IG+q5Drd25RgyRrQwRp16iOxIIUmK+4amlW37A==
X-Received: by 2002:a05:600c:35cd:b0:406:872d:7725 with SMTP id r13-20020a05600c35cd00b00406872d7725mr8744073wmq.1.1698674878017;
        Mon, 30 Oct 2023 07:07:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g10-20020a5d46ca000000b0031980783d78sm8241952wrs.54.2023.10.30.07.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 07:07:57 -0700 (PDT)
Date: Mon, 30 Oct 2023 17:07:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Tyler Hicks <code@tyhicks.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, ecryptfs@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: Simplify
 ecryptfs_crypto_api_algify_cipher_name()
Message-ID: <72f7eca6-3566-46fd-9ff9-386b4077d55d@kadam.mountain>
References: <2c4bd387e8036854d3338400038fdde8dce3806a.1698672391.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c4bd387e8036854d3338400038fdde8dce3806a.1698672391.git.christophe.jaillet@wanadoo.fr>

On Mon, Oct 30, 2023 at 02:27:32PM +0100, Christophe JAILLET wrote:
> Use kasprintf() instead of hand writing it.
> It is much less verbose.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

