Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B0C225415
	for <kernel-janitors@vger.kernel.org>; Tue,  9 Dec 2025 13:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765288085; cv=none; b=dE6dNXky4SJQ0W7OZMucuqsIRd9pU1TuJ/b6FgAc7uLQrPl5nU6aLF9mjX7YQ5H2IzUwKyFITi5h6EGCu6lx/fibO/AVhRVs3agTPLcXrDE2IOnGgyCx/U75ZXfmhJpiPEyzlVmOZDOV2Vd8QRtw/M2zVDrJWl+DR2VMn3wCSto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765288085; c=relaxed/simple;
	bh=yMlkkS909suSag+J4bubDDFfhJhvtrF/Tlj2/vEeWuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwOlCB5TX9iq0JKShUg/rhrpGMAvw+EuvEl5ougRywlLRcvknszGBwdNdQGy0/UzZQKZ1YOUd9fryjNTzfEeOxU10TZSyFHKxltQ2Cxsq8yaIYR9gH6/4YDSJm89/zDhtWrIx59PNeN4/EOhpvsU8guNqtkx02n5q7yjIwysxp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tjVPklxd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tjVPklxd"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47796a837c7so50749615e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 09 Dec 2025 05:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765288082; x=1765892882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gR9Rp7xfBuo6EIdux6kY6lOwHf1l3aXnIwHH3gmXlNk=;
        b=tjVPklxddEWxCtq3lZEMc0vbvTruwUNbuh6y5GO4BYWK2ZMUn/uP1rOhT9V0xPDfE0
         BPBnYQIqxNdmRZHGk5jVuq4eGosTH74cfOmy0ENfjK3WQB6Db9HZQdHXAHjfg9Qy2Bx0
         8w9CmUxunle9cNI51poDC7++OHokjJEQN1aC0nF//hYgX3iq1uv8FjeAP9V47n9wpoWy
         3iQ8O3z2m4gDej4LkUqX+YJTwZduoF4U1YY+Vv5p75bFlqUl2wmj0PtSbQqe/l+wmddD
         EU19vLrvVbYSci85SoZ2AmDUNdHFkZh7ymxx43n7VBTappyB341aEX0zxsyJ8eMJi5Lw
         jNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765288082; x=1765892882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gR9Rp7xfBuo6EIdux6kY6lOwHf1l3aXnIwHH3gmXlNk=;
        b=ig0dTKr+VWGw9IUCDA855KrVLERKuq/yw+mpb1AexYZ5lmOdnBygmwOlMwnJPcXMHw
         exO3BjZpeODoaFzr9n7XzkNRru9/fuIelw+xtHXkswgbvzs/Ad7UCb/tQfdNB8vsmasi
         uFE2F4azI6vpjYBmvM+HtnT+UFFRF4WFDC3FjArv9tA2m6ozX3EYahZ27f9W2ZODhkcL
         7w+9Djr2j4YWVxuGOmfCrBQ0m+tfsvI1oL1gjarujFYITNcuPTRDhkGpndE/xzzEK/8e
         Pg3EBodFZUpk/WrQXRML4Z0fac3oJ+8FrXMRrJDVQ2mGlMYCREb9tgZIu807wKaBCmhi
         vgFg==
X-Forwarded-Encrypted: i=1; AJvYcCVs2ECS7UCPMF17IzuPnYBSpTc/41YtcbKXccgraf3JoGKhdng8OBV0EHvUWi7+usFlrU11KG7nR/RRoms7ayM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7PSzBsYSBkcvh/4T8sS55nSdCjKv4C/EOFrw0/jA8dsENF29L
	grz5nXqfnuAYjhlCjx2Nz0jU8EOfN2n6QL8ssI6WzucYoXvW4Pc2TcGpU6MFxw+9iBSg+ycknBa
	qIhfH
X-Gm-Gg: ASbGncv08bGxPK86RQVEMDFAMVfIHLCAZWxlFpzpCNoXDeEQedyo6NyvN/9Nnzrhimm
	wyTzmiML6/rUWamnw6V8p/47LveeK5e3NuthpR5mPOmc86pCqgwNzcQ+QI+eLwtwHyCW+2bgsBY
	gl0dyzmoW4kyLE8E83tYvO0wrhwDQuKpnkNnbPrDElel5uLUO0Ild/PJo8Xw0N4+Ts+cFlapqnj
	LK43U+h9Q07F73Be/Pn2l0ubObXGQHz23Seilw6km9BKpkS4Qy8E2YuZEL9Lt2Ej6D23FXmLuNr
	dyY/1w831TPdPMucMNXwTNJo/jE4BHhIESUMVHwXOSJKXJx9wFS3XUBY8Dsf8L3XiERfRrhqCFD
	XcA1gCMj6eUctsVqU76nkc1y4EvHUr7rLCFC2pK6DJFQFFj/iw28vVmJX2HdaElfdE1FITiz2tO
	sA+7p6OiO2vdWRHusqycQEGc27CL4=
X-Google-Smtp-Source: AGHT+IGef5yYlyo7EVp/T9KJWfVo8Fc1RNlqYKs7x4HdPy+PgaaGEreDgsueryhczBIbI7R/rUEPaA==
X-Received: by 2002:a05:600c:3588:b0:479:1348:c61e with SMTP id 5b1f17b1804b1-47939e1f683mr127692875e9.20.1765288081964;
        Tue, 09 Dec 2025 05:48:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d682f10sm44245995e9.0.2025.12.09.05.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 05:48:01 -0800 (PST)
Date: Tue, 9 Dec 2025 16:47:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] gpib: fluke: Fix an error handling path in
 fluke_dma_read()
Message-ID: <aTgojlpyUwqBrQLh@stanley.mountain>
References: <a7b70a8c5dda16c2ddfab4309b4371b91d0ebc34.1765004481.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7b70a8c5dda16c2ddfab4309b4371b91d0ebc34.1765004481.git.christophe.jaillet@wanadoo.fr>

On Sat, Dec 06, 2025 at 08:02:25AM +0100, Christophe JAILLET wrote:
> It is strange to call dma_unmap_single() with its 'dev' argument
> explicitly set to NULL.
> It is likely to crash.

I've added the assumption to Smatch that it will crash.  Which as you
say is not true, but I think it probably is the correct assumption,
right?

This is a one liner in Smatch.

regards,
dan carpenter

diff --git a/smatch_dereference.c b/smatch_dereference.c
index 15ad885af085..acd70ef9dec4 100644
--- a/smatch_dereference.c
+++ b/smatch_dereference.c
@@ -34,6 +34,7 @@ static struct deref_info fn_deref_table[] = {
 	{ "__fortify_strlen", 0, "$" },
 	{ "spinlock_check", 0, "$" },
 	{ "devm_platform_ioremap_resource_byname", 1, "$" },
+	{ "dma_unmap_single_attrs", 0, "$" },
 };
 
 void add_dereference_hook(expr_func *fn)
