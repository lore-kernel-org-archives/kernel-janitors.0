Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850B821B184
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Aug 2025 15:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754321583; cv=none; b=JKYAad9elhT0jh+CEbeQtUStQyrt21lUKW/H1WMj/B+9KK5Vd4TOa0FpzrQfdRe4dNd6M0/2I/TsO/p0UNZl4n//k8m1/d77kSBEcag4VpI1QMOaiihwChRnf4aUCafgh0dNwknSDCAaOvzbc+BAprCV2j7CE4/nKMRGY5Af1GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754321583; c=relaxed/simple;
	bh=IEV3WI8iR3tWQrx4B8sCmIPKxn8VMU7PesW2t6hVe+s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Jc481eYmAPx4Q4RtCwGo1vbskcJYldDI2TilbMJjdWfNiXzhiZfS9sbUMrokicPsiwkH5Kfp4pW3/q3wFT7p1/Mf17qR40qdXZBINLPy9xbl5AJmdKQ0UHLXNXyuNqAZACt3sdQeN6qFvBTrJXNWp0kCw6W+uLZ74Fhj7r0vrSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mDzUYLGi; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mDzUYLGi"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-459ddf8acf1so5413275e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Aug 2025 08:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754321580; x=1754926380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XY+MBRKRSJ9LhmXiUjg3J9ea4YavkXYPCieLQE+Ncn8=;
        b=mDzUYLGiJ3CMCkfqNB22OuUuuuQUdHfVu6NQg50drkhbGVK9g4leRpUaJ1u/vAmA1A
         IM6mteiH5FGfGpPDQILuEHwnvBtwjJkwjLr0/Hg6pg0cTvOHDS7nc1j/cpTcHinDzA3g
         /o/2DJMaa05cPtHfAtdInvjzO9vS+7svyA5CvASzSXAZQIhc2adglx0EDHZAhC3lEfhu
         WVvvTmJA35EneCB8Nipo0d7QOPJeHvbLkNWeL7K7J13DQdkvVa+ljUK7xJ/9YAYbixiN
         adF2PtCiTso0Z8Tb9O4727lTAqjloH2/Nk6R/ycZ3sOIS6lmncHrqSW0OXQQHQYHSyqT
         3ApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754321580; x=1754926380;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XY+MBRKRSJ9LhmXiUjg3J9ea4YavkXYPCieLQE+Ncn8=;
        b=gjD2ANje/JoyT0XhTGGUtiSc85XpchmU3p3FI3qBXTMLhjrjVxmFumzYITag8mUsKS
         cQxTuKpA4dEFDPMd6XK+Pe2f59hucP4QzGUjTVrPM7f4bFpxfMo3QEbawbvoyeumhROT
         6gIU7+8d0n7EWqrIu8N2l7mO7qDHZQGUKnWstimTlOON8OHmqso78a3wNHxF4KO/6pnV
         p9yjRi6RgtLvMjsSMI7a5L+/3AIDCdbAAWQId7eE4MGdaR0c35zvD9VpivNNDF6fo4y0
         FKD9d3ChbURwBGKOqL57q69pcGn0NPh8+ynU8wMEiKAweww6MaH909jTyD6UW5gqwJGF
         TmhQ==
X-Gm-Message-State: AOJu0YyX7D+QykTlhakYcYpvy7DOh5vQRtUXJaL+IzpKMIa6aqnOV+h1
	OuPIEKMqxpnZ23MJMskkyIIZikJNnC6zW0g6AC4oZgP78QsxwxRcMgtdofHmZSFsEUM=
X-Gm-Gg: ASbGncuDsMLqZbXWJnJSQzyR2ixvEieLONd6ER0rsFudq8y8CkDtsmROTRjcqzhcBmu
	K9ugTAF9VX4lhVxtBizoFj4RYqCQ9P7JAPkt3NGOjloRvguGPlXj7aYvDaqLGmte01cuDdJEEYy
	QsKc2sftsd+4Xpp6PIWZMaPtil8TSqWHSc0osMsRq98FlKcWZ0xZBX7VJxrOq0GL7z2Lmj4UBCQ
	4vfvScKEdHVCOFzPvTGOtO6j36G94nDkqbqttLWv/MjQU1iE68SoGs3JGZqcEsp+85iMoFOt9qO
	PBMEQN7AH8nw9Qhxtw8Dc45Ax4DsXUI+M3DxD/X5Oei/kd7WpZkdj+KaIhif7wx9lTb4kDgNOVs
	nVctuaibMWcYtaptFCX3fjI30V6TInLHsz/MTHnTM2pM=
X-Google-Smtp-Source: AGHT+IEQreC1eHGihD2HvGw2z4zkQ8JJctAymKDEGjS+hjYaXiioW7ASwN/QLFRl5DugavcTRyqUkg==
X-Received: by 2002:a05:600c:1548:b0:456:1ab0:d567 with SMTP id 5b1f17b1804b1-458b69c6b97mr74959325e9.1.1754321579743;
        Mon, 04 Aug 2025 08:32:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47ca5fsm15664010f8f.63.2025.08.04.08.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:32:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250724112358.142351-1-colin.i.king@gmail.com>
References: <20250724112358.142351-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] drm/panel: Kconfig: Fix spelling mistake
 "pannel" -> "panel"
Message-Id: <175432157897.3671011.9847593575052354034.b4-ty@linaro.org>
Date: Mon, 04 Aug 2025 17:32:58 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Thu, 24 Jul 2025 12:23:58 +0100, Colin Ian King wrote:
> There is a spelling mistake in the LEDS_BD2606MVV config. Fix it.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: Kconfig: Fix spelling mistake "pannel" -> "panel"
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/368ea3f33f01b618bd645aa61b673f92e9aae767

-- 
Neil

