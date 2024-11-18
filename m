Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7087C13E02A
	for <kernel-janitors@vger.kernel.org>; Mon, 18 Nov 2024 06:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731909810; cv=none; b=Etz5xswgdCfAFaDkMLvsrQQ3oNX0EtucpkG9z0F0zJ0WmuwB3ZZ40TLNU610zmX4uGvtRoW+jOiBqWGuNjbRMaoYP/JRgFLo2jvzw3o/T1aGUNCEX0ZCwdTGSYHiiyOrTJVeIoOeUCXa05sVzOz+AStbqy87dmduF/vcKo/obHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731909810; c=relaxed/simple;
	bh=4BAXl/N5qs5x1KD1SM9rYhuStYyPUTHtfJIvrbnxABo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VN4zA5CCeZWU1iqj0OahK8lP1j+dS18RqY7gkI3pXxjBPo8xcuVrLx8Cl+mwN4oLhUH/RUtG1I1zCMvBK8o3olwXoCupkzN9d/HsjgNC+eEw0LbcBwkXZpCqb5LwDtA5/IcdHNgPgBfzELTEnEoYZ8G38qLIm0xhtc/YmKehy00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h1O6cVvK; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h1O6cVvK"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so32950665e9.3
        for <kernel-janitors@vger.kernel.org>; Sun, 17 Nov 2024 22:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731909805; x=1732514605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AR8vRiyQWafhkwLMuApVW/fxma/Zo6ed3zIRAdgzhAY=;
        b=h1O6cVvK6aOIMYaUWJprIfXU8YVaS2b3GxbNg/wa1glq40lKAnNvDEFZLYoyRym1A+
         eEoX30YAmEouelMstFimJmFcpUs7hDyVBjMAjuhWUgOPoNBwlPQC6hOHuDFcL+SLCRAJ
         QrCOAMVoL/Mz6vwSrDFRt2aqDMo2L8qZ1osUoPgfHn9pR4xqVWgVGkEJgyPsn6I2gpWA
         EtVBM0CSJD09rajrVnWOsmMqKeTnmu6m4XumK6kYW6s6IlkqJvEiLs9kPBB7XCOFDQFB
         syKEIB3lY4BR/YGuB4Va5/QWR2MTiGja+m6tM1RhmzopuTcJ1aiCaWLEKcwmSo/P5twq
         bWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731909805; x=1732514605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AR8vRiyQWafhkwLMuApVW/fxma/Zo6ed3zIRAdgzhAY=;
        b=Fkzh2GjCy4TsdEfKEWjHhu2rw1yyHPYObxPPuxqQIfhcoccX0dzTQFCK4IWFd2CIT1
         S2bicWJPSVltVPm2sl1LpgiF+O5kTEQGDGZ4Inq3irgXfopPlPTw15J4DEWD3mlDl85K
         Y3vctLG+C6r+dqWNM0R+utVncSNFc7I9DmOKmkY7U8f70R84tew/kVBQPNmp21SIIOeZ
         6V7JJkdBFV5OBgmh1ltVBiAGUXnkcLMz5qKLGRP5fe0k+kFOwYKych6/Nm15Gexlj2IH
         rrHibcnjXrQQVmTkJc35oIBjZqw0+duwB0y0l3omR8VFiudD0pTPTiuKDlldUzttlF5J
         sVpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi3q/WBTkqJ11VZCkQ3BDIvl1M1pk6PfQxrP3khs+Bluvk599aNwd7Z5e3dlx5R02jGSMUQtg3QQEYTWAt0jc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoexsrMZ/+8RoUxCJFD83cAVOqT48kxAFfW+2UVyuKFPN8ahyF
	sVE8f22bRfPA/WmhEj5eTAUJx3o7wBavWDuU8ix+JD8k0ERZa76/VAESvXKCcs0=
X-Google-Smtp-Source: AGHT+IGbozm5imyvI1diBD8cPltGKKe70Wh5xUrFEtI3IIMcZHzRvhf6hhocFPZiJAaaikEibw1ZfQ==
X-Received: by 2002:a05:600c:1382:b0:431:5d4f:73a3 with SMTP id 5b1f17b1804b1-432df74f0d4mr84755155e9.18.1731909805553;
        Sun, 17 Nov 2024 22:03:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3823ef97042sm4424753f8f.35.2024.11.17.22.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 22:03:25 -0800 (PST)
Date: Mon, 18 Nov 2024 09:03:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7915: Fix an error handling path in
 mt7915_add_interface()
Message-ID: <98b8f06d-e8b7-4a49-8508-ea87c385bd30@stanley.mountain>
References: <b9d8fbfc19360bfe60b9cea1cb0f735ab3b4bc26.1727639596.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9d8fbfc19360bfe60b9cea1cb0f735ab3b4bc26.1727639596.git.christophe.jaillet@wanadoo.fr>

On Sun, Sep 29, 2024 at 09:53:40PM +0200, Christophe JAILLET wrote:
> If mt76_wcid_alloc() fails, the "mt76.mutex" mutex needs to be released as
> done in the other error handling path of mt7915_add_interface().
> 
> Fixes: f3049b88b2b3 ("wifi: mt76: mt7915: allocate vif wcid in the same range as stations")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

This fix is still required.

regards,
dan carpenter

