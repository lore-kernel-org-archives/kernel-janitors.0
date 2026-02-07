Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FBD1DE3B5
	for <kernel-janitors@vger.kernel.org>; Sat,  7 Feb 2026 16:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770480577; cv=none; b=ffVC2ce121aE+kqQBStMdAKolP0i5Ijbgn/BJD2W+xqPIDwMUoGR2kkOZ6/LNMWXWSO3J8XOStI+iCh0RLS8b3cz5QciPnIlwQSTeJeJ/45b/Y7PRb14pAJQ0M81zAIr2+dfw06xdHHOK9g/FzrCo8ofu2RkXY2gG7uPyuZiVRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770480577; c=relaxed/simple;
	bh=Go6o+fPW2vfcvS7DHrVPUB1C51P0F8I280rZ9fGZJFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3nT7rqVxPWSjEVmfJ5qIu/A2vUpohVblysu9pnjxF0gqyyox8Fexjw0Abq/uUBdG0OtaIHfWNzhqnuBQCkMBhI9yHiLuorSTTZqGE5C+EkhZCKdwRzQP0Cp8PqMi0Ogniyaru26UiU5+wPlQ+W2B4CBgHzVC+/z9rMoOfyBXkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWwRA8u9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWwRA8u9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so33186865e9.2
        for <kernel-janitors@vger.kernel.org>; Sat, 07 Feb 2026 08:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770480576; x=1771085376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zh0gpgjFwNimG3qav3V/O/Bh53M5i2Ji+XR/lDx+9ZI=;
        b=RWwRA8u9yflEh7ctzWU4XW/z29rIJeU9I6iAXB4qow5IofvLXzKSoOmrDOxu28BjCI
         +ubZe4SVGDfA2N9Tvjly3wlp+XIlXLkuJg55zFLAIsVl19V5ixz1MFSgllf28spUyNL8
         Kw3HqzQUGMxIwa1JUgtVWDtjEmj4u6Aj1t3pp7adtwd9Plm2nMxdNhbniYBeXAmQMr1i
         ccYGZ57RMYq68WiplSd6MscI/qYYmwdQmAs1TPjSSdLNev+rKFrjR0bDeDtCX6cVHV9h
         pQHwEgEC4rr/ueFwV7dSNa6+YR+4rtobwEqBpK/F8VQCQu8Mc0bC1oWJTTsRnDIEJrRD
         xTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770480576; x=1771085376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zh0gpgjFwNimG3qav3V/O/Bh53M5i2Ji+XR/lDx+9ZI=;
        b=fG3/vUXmniQ/O7Xssi1DBp5BOz389geHclh++LpAvj+V4zzh0m68S3YQZxZFWIHNwy
         UMO9ZZswWX40NzBSnnsYaPzhwyuQigvebfwOFkui8bk15VJkNdo+MsmMAVYn3YYimh7h
         HCxVOUa4bDOMcYWpPPuAc1zdrrQzVasUTJq0/5HPs2aKovAKpi4T9nvwHq1Eq93PNVj6
         aujnQR4/rVckFen+9oosHB+PDW9eJeFQDP5G9WjEKQtRweu2OuZXZeOuNPTQ3uoUZc5P
         K3O9IRKlnIWakNusYSDlLmfhApSvFyjUjHK/3OqWXj8XMpPGJPMVrX1KCafIRn71CZ84
         G0nw==
X-Gm-Message-State: AOJu0YwoT2+PwaVdYDysS/J9wwQARX4SgNe3O1db0kx+3+5lbBzae0Az
	fhC2ntDxHZl/bqUaRpF8Aq97qZA9qq2HI/5oGGN7zbMWDQTz5MBZPIfPWTz/dA==
X-Gm-Gg: AZuq6aKlCASFWXElg4CUNflBTOPqdsu0brI8cEyL9mpONC26lAofSvCF89nKSTS9bMB
	tQ25K8aeHee0m1MTwdBykyURVQRk+iWvQ7SA5+WgsHfYz3RyeyOLVcOuwPcwRcS0om/5dcGWtzM
	e4Sq0H5Gw7SGYINRd05fnPfOPU7FiL6NfhAqiDPyrlZt1KqEhBIs+8cmDd2o4KFtI1HC+mfIlfG
	qY98wXtgnC/vx2/YAn9kklodlCmTvokWu/Ox7Whxt8ZdIoIYnpJQcGGWHAyOYY/cv2tHpA1yV2k
	GYrgNZ/gPSJvYxVonSmg7/sS5F9gROhTeKf6+9j7z++cSq4lbZdBGwANE8wxScuVV52mHX/AR0y
	VcBeOYYQDdvjBcile6/XzIk5wuxnwNBNyJNXZYYvX0WlyLA8k22Efam6OD6G9ZP9W1VVpHPLUw0
	Gp+1FSNuo=
X-Received: by 2002:a05:600c:3b20:b0:47a:9560:ec28 with SMTP id 5b1f17b1804b1-4832020df6amr83848325e9.13.1770480575641;
        Sat, 07 Feb 2026 08:09:35 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48323c12d74sm77930395e9.2.2026.02.07.08.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 08:09:34 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: linux-alpha@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linmag7@gmail.com,
	linux-kernel@vger.kernel.org,
	macro@orcam.me.uk,
	mattst88@gmail.com,
	patches@lists.linux.dev,
	richard.henderson@linaro.org
Subject: Re: [PATCH v2 0/1] alpha: trivial: remove ^L chars
Date: Sat,  7 Feb 2026 19:09:16 +0300
Message-ID: <20260207160929.705315-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260111112217.2126872-1-safinaskar@gmail.com>
References: <20260111112217.2126872-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Askar Safin <safinaskar@gmail.com>:
> Remove ^L (a. k. a. \f a. k. a. form feed a. k. a. \x0c) from arch/alpha.

So? You missed this patch?

-- 
Askar Safin
