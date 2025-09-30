Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAB5217F2E
	for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 20:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759265240; cv=none; b=bGz/wkiREigpTxUbTwNqmREvyx0/6V0ItanalWXLkmy/oYpbKaYlaDUfqpZwHps1TW0rm/P8cPu/lriHce20LVviR6uEBAyzUsohtFUrPA//nttkrQFMXd/Yxc9eNJSuaGRELx4XICjHMuFrPnstDQ8l6Vz8n23NEjk/OZ6mJec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759265240; c=relaxed/simple;
	bh=PQp+mzVn36GMibrfg+qbvSy27kf/GpxKYLgRVzy/VAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6Q1m7ODX4KDEst8vS6uCGKQ6uYkBJhdZTAYK5VNTx2KJ271JF8qVLDI2vUn5kAKoOFUn39+3KiTJbPJP8GcS8bcWluWv37UjQi5JaQggmJA/NVj5bwAr0KPQQla2w9TD+FhHt4WpMPms78kRETVNRGbbxz01ZjKdpHw/UDbaNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LH+G8FXF; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LH+G8FXF"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-782023ca359so4000584b3a.2
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 13:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759265238; x=1759870038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4q9dIY27yfmOm2lPjdRxqNm8D5c6q+pKNbNue3M/Deo=;
        b=LH+G8FXF1J44xHhM5DL+mnhgvpj0UTb54kLxG/iAfWCYPWecp4nyJOfW/nn0GPj/0k
         scuFKZ7Se7sNbW2pljPxRl9kyDkJhPiThknGBqqJ2N49k+qmjJLBtmJuu60rOGaASL8m
         lR0H9ik/CmXcZTvm/qgXcD3mRnErWcLiBPkxmt10LH5FLua+e3TUAcvbz/vjABsVwNIy
         B4TupSJ/IorcszD0uR5Tr1YnlEZXtl+A9wsRrx9iPSP/hOum7kOC0X6rs/ueB9ArGSax
         34viyktohDL3hrivT0/3rGVgW3LG07oZEkaQzO3k8/TtRd/t2WV6TB+hCGEjcfBMxKZH
         rCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759265238; x=1759870038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4q9dIY27yfmOm2lPjdRxqNm8D5c6q+pKNbNue3M/Deo=;
        b=Jr0yJEbXfFw2yi9ZezIoHlTVCNjrB83Eua4msQuQzAlrVaxnYedtrXCbJCUlOgebwd
         NqmGNonkT5BxhxpXA7CPwyaG5ly2iiYFbBDzMgV1HdHa4Hyl3uPZhg/nDs97AePzm42V
         HLKQY7XtHFeJ67eDmxGhKZ6USjbpG2StLA6bBgvPQYSdmdbLGc5AFQHuwJk90/AmVLDm
         63UHuV7x65Wv1IDHdQo5s6D9+jPSWGW7hEvBMh5mQoM9ATVSuGLRtBAiAITofafWSaLW
         JY6N3OhH3ktLxW8ZwhWMyKJjsaXmKNTf0ulmomtfPaWZ80xiW+9bnnVsWILT/XL7xT/x
         nhog==
X-Forwarded-Encrypted: i=1; AJvYcCV40NPcKPSeWHFnrDM/nGIGfPxIkTwn2h0X0S+4y+jDst0mWCX4pstL8t1oT4nSmkdiyr+wN2skHB62/eHtLho=@vger.kernel.org
X-Gm-Message-State: AOJu0YysUr8IrZlyaN8O8HJTyx4W4bNS8n1pJeIkZrUcMzNN8WjjWx1A
	Ka678X8cC4o2+b78YHRZacgwftpqjrE3Scgx/CBv8EbCv2cfWZJv2yNH
X-Gm-Gg: ASbGncuBPpGxXqsaG1wYKjpb0MDxFp/5Xi1ngaj4iyBum6k/2OJepn07ibJus0G62HF
	cWfL4J601n0Z8kfP35kSHtG2GNX4JfJNUMhRRM6dw60emX9XA4NIh2ePapYRQPH7Vp6USw2uqbu
	i/6SitjGpp0sz9sgDdAMRYwuo9Zn8FVCAg9Oaz9WA5l2cKk7t/SHSjXKha8EkmUiTypVF/EQvaH
	2n4tMCqm8n4Yq5E+hVTTYnaTRBU1bULoTI4KnO+JLaYqz+DSySy2Am0faTMRtXziXxwxURFTa2P
	2k4hvGCZt4fkiNQbmMvEHu97FrD0vV0XcWZ5n94BmedS3/26nr+EhygFoM7hbvdnV6NI1ARbawp
	3jCSGABz28frJSJYI1eZM7KNsxkw8jDLxL1TQrCkMPOIIZe9OxSpwFd9a2US7r51le1qlw0HI4N
	CzkG4EfIu/j/8=
X-Google-Smtp-Source: AGHT+IEC6dRFuhURMrPckMM2r4CsW2F51u0tQLeeyg+l2I+P6VWKxeFYlVv/8UkXSsU17ocJM17U8A==
X-Received: by 2002:a05:6a00:2da1:b0:77d:51e5:e5d1 with SMTP id d2e1a72fcca58-78af4160624mr780730b3a.19.1759265238375;
        Tue, 30 Sep 2025 13:47:18 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7998:b3be:d4f5:19f4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b64a87sm14641306b3a.69.2025.09.30.13.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:47:17 -0700 (PDT)
Date: Tue, 30 Sep 2025 13:47:15 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] Input: aw86927 - Fix error code in probe()
Message-ID: <3ei3j4hkws2konaabofa7vc373n2uam7pycppzxdmnrie4efkg@42kbpjocrrna>
References: <aNvMPTnOovdBitdP@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNvMPTnOovdBitdP@stanley.mountain>

On Tue, Sep 30, 2025 at 03:25:33PM +0300, Dan Carpenter wrote:
> Fix this copy and paste bug.  Return "err" instead of
> PTR_ERR(haptics->regmap).
> 
> Fixes: 52e06d564ce6 ("Input: aw86927 - add driver for Awinic AW86927")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied, thank you.

-- 
Dmitry
