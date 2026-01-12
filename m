Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3525330FF1E
	for <kernel-janitors@vger.kernel.org>; Mon, 12 Jan 2026 08:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768206418; cv=none; b=KxaKXcLA0spZgLkNTHwcNChrFoZqZQAvThsUCRJNq4fma3QW18g3zoz7iyWr7h3p1zzoA4nmh4tVIbd1vAwrAf7s4AZ4FjFAwQuCPJZ0GfVGWL8D8D/AuqdozUxUjorj1UTs0RdjCXEjgv4HnrA/XcUpHk+pIb9pu1C6BmA+Hv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768206418; c=relaxed/simple;
	bh=PuWAjjq9YrXOY/YeKxnLLx/uXIvacM03hu0GiN3MDm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwCGI22m6LJjSoVZ+sVlCaKPQ2Fb/UrvwlLx1gUcfz3mYzPdNJZtQO4IlUVaCRApv3LNzXAq+riErhpyUQQ6ffFnimn/sUSE/x928S0nxBjMjGIcT/8f5hLcmi8qiCSo/c0uT4vEi1JR/SYuExVQFgeb7HDWtkkcUAwTrxOHC+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lUuvD9p9; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lUuvD9p9"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-477563e28a3so32937915e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jan 2026 00:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768206415; x=1768811215; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZC0DHZS+P3sGEVCdfDj7Y+FJ8IlnwpNEuGNXuXov+ic=;
        b=lUuvD9p93wARKiODPXbE57XAAteBQRm7NXnoZXJ0cw9U1I4to/6g+DmmUlChdA7kns
         SJ6/m9uOhWcgxuUvuqdgl2oEsu0PSzKAXkNKCd5g8gThl7zzGWCvYTzpO4vw/NDNJlLT
         R4cjeUXzJHITeeK6/gNSvCPR0XwOEeaZwNdPsl1WlulUaT9TLdllqqvenxZ+2r3ZyyTG
         iPqluX8go1PX3MobkHltR5Xqf6TTgDcTHpBp5rbEvM03Pz2digTvRQ7kk92c7xU7pxLJ
         BMOMpAMmhmdHQPNYrxERjK7Fw14yRnVqkz7UQFs1WWDr9g7LdzIMQQi0NgxnwPzZXmkv
         VK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768206415; x=1768811215;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZC0DHZS+P3sGEVCdfDj7Y+FJ8IlnwpNEuGNXuXov+ic=;
        b=FSecYCASzoFGabCJ5I7QV4I9pXyL+wwT9SN8oOxr/jCUp5PLHGGMhk6jBZfiZmZ8mm
         W1TzKV9HiXyldyMAx4bZqawaHZw5fBSVPEZbC1MmsuP7zYj6A96c+KGNUoArmz7y/UDj
         /Hzl8Dclb8MR/wcYYgAJEcpCNdOeLu4vk48pVs4SEgckfto8wBuPDkE2rt6cpo3/sxjH
         scdt/P9F/1I/RCz4wvIK1o8gcO0Z2eHAtiAVi1eTquzYJKJ3LpM/emHIioYBT6mr/4Ru
         4XTm1Lbwt1BGzDvdn+NIAnsAtOgus1oTqFrsdB0n+VBNY+2DRPypJsqiaq8M9ewI3mMd
         fr/w==
X-Forwarded-Encrypted: i=1; AJvYcCVMAjLTGBu5ObdHnMFs6sZuj6XunQaVLvwZvsRyyl5gQbNJ7NdEa06HE7w8c7ZMMQTz9b3jemUwRLdocFDRUac=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBJevcPVoeyk0DG96uuoofkdMiaphIcSs2Zg2AYKqBraND1cHy
	bcMy0CaT9Qg6EPrlSGLLHicWkGnqTs+hwbG87IcIpCLtRaAR/JPvHuoCh8kAs3sOjoa4mQ/WZrr
	IhVKj
X-Gm-Gg: AY/fxX48rT45LAnzo7LuIDSkVGWk6Ba5IYNCi8gR1Ijhb0fME3bYBggJrpQep3nCH/x
	2Hw36g7XzwoALiEBR2hwRcMgoDtoe77FLkW6LLLNkZYpSpmk+RCaJ71W6pybkDQWzgPRG7/Ohpl
	aHZTFkeIfKCu3lf2nACE0mp19iUZWFxryXEvYuym+w+J9Mu94DTCTyE9MRQaogXRixMKomdJwKf
	BeynrnulV6iRQORjEXvIx3lEjxN1k8sfjOGOZ5Ze0EMEF32XdzjRNIXr9k68CKsT+wwQZKofduy
	Ygy345IZXPmw+oZms5jxvLix8KoBiDeCtaNq2l+YkBJfBEWVkkOHNZ2eCmjKXaIGKEMqK4XYKBL
	lujRBU/+n0DtWttTzJ1nxGZ/xmW5rFIFXFRsZP0URHs/zqN1NyeUo5/kTzb7I1bybZ9K1g7GVNf
	gsEZETCfTNuJuENlV1
X-Google-Smtp-Source: AGHT+IFbBbC9fKaRkOJtSisp6obozjfPCjhneka9YIKhPUP1zuA8mpyRuSMy+JSdrPF+1j6pMtPRHQ==
X-Received: by 2002:a05:600c:8b6c:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-47d8486ccebmr166152255e9.11.1768206415540;
        Mon, 12 Jan 2026 00:26:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm339349495e9.1.2026.01.12.00.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:26:55 -0800 (PST)
Date: Mon, 12 Jan 2026 11:26:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	linux-sound@vger.kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vinod Koul <vkoul@kernel.org>, kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, lkp@intel.com,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] soundwire: bus: fix off-by-one when allocating slave IDs
Message-ID: <aWSwS0PQHumb2TJG@stanley.mountain>
References: <20260110201959.2523024-1-harshit.m.mogalapalli@oracle.com>
 <732ad24d-d88f-47dc-bb6f-bd1b64ad354e@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <732ad24d-d88f-47dc-bb6f-bd1b64ad354e@web.de>

On Sun, Jan 11, 2026 at 10:27:08AM +0100, Markus Elfring wrote:
> …
> > Using SDW_FW_MAX_DEVICES(16) therefore allows an ID of 16 to be
> > allocated, but the IRQ domain created for the bus is sized for IDs
> > 0-15.  If 16 is returned, irq_create_mapping() fails and the driver
> > ends up with an invalid IRQ mapping.
> …
> 
> See also once more:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.19-rc4#n659
> 

Markus, please only comment when it's a bug in the patch instead of
wrong advice about commit messages.

regards,
dan carpenter
