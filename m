Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AF6367
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Aug 2025 14:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754318965; cv=none; b=nqPVDnSB9WrdOf05ndGQPD49rd9bpmGTF+0iiwi1o6uQ7q49+HdXcEQd4DVSShc5ABtTxmY+b8+8ND1Ci7TMM14FuH5onzqRBVLhK7S5KkwwF05A1WcJZUF0DGMZC3Iha3/C7lpqPyqHANkynGYv+7VEWL9dbFBlypDsqeLCuWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754318965; c=relaxed/simple;
	bh=VUlFsH8Z1SwZJTEqRqnj7yvZt19eBcmsv1QjxEHuuDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzjAN8i0iTSVqUyj3fMaYyqIZJN9EOoRssCj10XeqhEKtt7gXOl8HEIgynFGbdJ7QaqMbubzXMadOFYSYki9J8pfwntFdBTNmqg/OfqA5+J7p7qhfB2jGy68fo7UlsmK+ZswdeJWMgHM4CrD8IIL2m9ioLNDf15EqVgEjykFVno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ahzPL6h9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ahzPL6h9"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-459e0a249d6so2735e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Aug 2025 07:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754318962; x=1754923762; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5MAh85Y0saa+euoszKw3nA4pGBPwcX9w5nxBz0NKd0A=;
        b=ahzPL6h9cD59BkDG0r+kCOHMNFnRsl6Xygb5ecwHoJl4dUeeKBwj5+maE5fpNK0Q6F
         L7lKQ54YqE4q/WMuDUhy0jYPpg/raaub0fTgDG02WFV1aJh5aI0yI7xF23kaeMfvZhml
         zg0XXJOPdkUcTVN0z756eAYOHvasfR47sdaXakOtLLtQadWJPUv/HZa5d5S2kJYbx0B6
         j40Lvrh7I95vGO/rQVjMKNsw6JNmEIOQeIxFtiPwn+9z2Fgc3Qq5Ky1JvqZhn7gU7j4+
         pKp7cqTwa4uq/VdP2CkZpqC4r9juCp+gKB5OJDqu+fQjLqzxDQAjiA5QPQt+2MQBRX8G
         ozCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754318962; x=1754923762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5MAh85Y0saa+euoszKw3nA4pGBPwcX9w5nxBz0NKd0A=;
        b=wd5oUMupCwtZ1fC6B7QSJHvzfE5aBASPAEPNuiS5KYJTu4Cafx+duI7FGr7i6DyxTC
         iwDagRxrXjfxKSCfyedtTAuYgACgKV5iWlkYmOtTK7F9MZjFSWqjOpieOvDXHj00tkcs
         ESIjbI1Ut0LFW32hSTRdWztLeSbYNpV55sb0dX2e+199P+0h4y054f9zud9ya/tM5p31
         rlrZXLKuMVL3LY6NqNXfI0QatDXV+dWShTib74Eru97fnomOLDPn5tds/p6SHh+xtbVD
         vlZeFeplydaWI0c/5mTnhEg3y5F1fFWPMwIdaXL1oaQ4DvL06HcvFxtl5ATJWa9A5KOY
         T5KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDICblEc67jScJVPrWcNGSeZRutB+UyPkzk9kRDmYIVRfdBVcbAH/kXNGR0UloQKBWniED4RJPZ2aHtHuXY2c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9IG5LLKmn903GUMh6uTDQaSZub5mI1vLoN6LY6kNIZJc5vShk
	X/5Hr6SS2U3lAKMv1mzUDr1F2Ln8NgdVzSxOxfnyzl2eZl6y/coZzYudr9HZIK/oEAjt06L8SLd
	qeKEY
X-Gm-Gg: ASbGncs8I5QFZRQafz4piNklgZAeI/dWnZFT7nze8zLYqXVoRL0Em+tvcgaGMrAzkXk
	EYxia2wPr1cSrUmloHg9X7jrqpsbub4meiLWVK9ulm4qq5aLmL5kwD/pE4PcJEjZQ6t24DX2Vaz
	ZJj9EBqytMGc3oevXEhBTnRHA0n4N86EumlHK49TbFUPX3v3dfSzYgEbnCkRPq2CyoRt+Niqr2l
	BdJEX+sIE1DAcG+dntDzXAHqovxvC1+oKIzJGE7qF8GM3EfJRd+F4oVt355ynKJwirIZY85NjWO
	vqZDqe4vRjj5lOQf3K3Gi0rVViyEUtLQ9031vVUeNn1+XNdceY16TIl4wCGwk9ehIAOuu8gJdQW
	DV3tfmLdmH2ylPZCj4Tdneh9CAjPuTHTMKyywaQ==
X-Google-Smtp-Source: AGHT+IExUksj+hCR+gj7NMUPXAk78VVx0bqD4AGsjGqehS5x2aQlIlZBpW0rJUPuZBL200EPhOnGsQ==
X-Received: by 2002:a05:600c:3b9f:b0:458:bc3f:6a72 with SMTP id 5b1f17b1804b1-458bc3f6d41mr61463425e9.4.1754318962444;
        Mon, 04 Aug 2025 07:49:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458a7c91c0esm150589255e9.11.2025.08.04.07.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 07:49:22 -0700 (PDT)
Date: Mon, 4 Aug 2025 17:49:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Ethan Carter Edwards <ethan@ethancedwards.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/amdgpu/gfx10: remove redundant repeated null checks
Message-ID: <c82931b5-0de2-4e45-a80b-3a90b0cc98a2@suswa.mountain>
References: <20250801-amdgfx10-v1-1-e1dcbe18d84e@ethancedwards.com>
 <CADnq5_N+bQppUAD-qR8QC8M6nW+oRF8+7z=Qakcxc=a6Z8q4Gg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_N+bQppUAD-qR8QC8M6nW+oRF8+7z=Qakcxc=a6Z8q4Gg@mail.gmail.com>

On Mon, Aug 04, 2025 at 10:32:43AM -0400, Alex Deucher wrote:
> On Sat, Aug 2, 2025 at 4:22 AM Ethan Carter Edwards
> <ethan@ethancedwards.com> wrote:
> >
> > The repeated checks on grbm_soft_reset are unnecessary. Remove them.
> >
> 
> These are not NULL checks and they are necessary.  The code is
> checking if any bits are set in that register.  If not, then we can
> skip that code as there is nothing to do.
> 

It's not a null check, but it is a nested check and it's a local
variable so the patch is correct enough.  At this point we know that
grbm_soft_reset can't be zero.

regards,
dan carpenter

