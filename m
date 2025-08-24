Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C0A1E7660
	for <kernel-janitors@vger.kernel.org>; Sun, 24 Aug 2025 18:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756061686; cv=none; b=F++iyBx4ZpBgBjxHqY7KzWhZaPlFSXYBkyaGXzGWOvnzeMFn7UP+Pr8F0pdoDqMRGD6MfHLbIflms12mN78psXygXm2ZCnZiD8ehDQCslj2Pjdzo/dAkrWOYKODt4xV/D+Z+krinbBai6Knoi9vEo09ZD/Oiqi+lQwQpMO4ZbnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756061686; c=relaxed/simple;
	bh=Su9fVUmbbEoXA8/x3VGnp+xHkiw3aMwd14wBtFK2re4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Q4P9RZ4G/qShKb1JILUh0D6mOv3z2p4usyokeVrb/xsKpOFH4z0Z+QH7BpDxLWjPz46nNM+DyunNMzU+z3Qs3YysEyZDK9r5jWaAH1ddtWjqUlYmG0EAVAb2VnJ7UP/pw8KfhpslOf3kOnWXJ+FkcJE2UWaEuhCzEy/fNSHX3g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=KAnteFgP; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="KAnteFgP"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so3187615b3a.1
        for <kernel-janitors@vger.kernel.org>; Sun, 24 Aug 2025 11:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1756061684; x=1756666484; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4RBQN7ZcwLGgu6eJi1GMF63RINzrO56jY30XvA+HQE=;
        b=KAnteFgPDSGTz26iIkVQw/jDko6d+xAfJu7Mz+i+00lfj7teIILln3TyuPzphcj74y
         JIkTWogK4q7HkXdVZImvjIWHmE9AF1inJ412jgvbaG96Amp7dFl841ZxQeVE3A2gzz9u
         jGSlmB3WoLSQ5RLVrWZ9X3XrfOlyfGBK6hoBuveoLuyPhhxbQUe8ooVfmT80fQoTyNjP
         caNDC5oCt8Ms0podkMrCZa6BPS9oWV0SsNmuXLGoHoWODVMM8KbqABNqj9gmqmQSr47a
         NlP8+bQH5jtMGaNAyBZhf3Xv+XUdobo/SfaPZgAIstVrygprHOIzD6XVM0Ab1Lun7k09
         98gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756061684; x=1756666484;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R4RBQN7ZcwLGgu6eJi1GMF63RINzrO56jY30XvA+HQE=;
        b=S5wA82MI7MSLEqW0z1N3WmtC1DP6x/6TiYyjY9zbdFNURZUHVIabburNJxdSLSoHOh
         Pg2B9leFUmT3tJBZD5r86rSNBDRK2Y9Zv2yPz14LHCpnG/m6r2wZdlUB2+R5IhmlUgcx
         RYO/RX+l8v7bIqNK39fbOCbhrhxhmZIkT2coEDqYLpwbRGfK9pKSWK961zLXJ8V2U3el
         eZiVdvY36U07MLdill37dBL1YyuylELzxfmC1nmGWr5MrVWrIhCbyRwGMkK/veF9YDR3
         XhGx5/XMzSf94QZiwKx+cxcn5fcmCxeOGFahkCPrI+cc4vZLvqiYist5aZO6mXGMBWrv
         2JjA==
X-Forwarded-Encrypted: i=1; AJvYcCV+v+dApNygmQQhlAVMQWJZmKXgoy0Wca0HQrGXqlxVSizkqjRlB4HWQkvkFVr5T4TNXU05rgCCneAYyq75p5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTzGG831rev9vm16+O1JTP6Vwdr5FkIi2R4UIu5+xWjndTl2h+
	pLM4Y1O4+eoHbO26COUaPpFXbqIcoTZUMUO0AXCEDJ6mLeSWXEB2n7CVfZLDjh2Lx7M=
X-Gm-Gg: ASbGnctHWUGcsUBPmirxtITOt9ML+Xw9z/nvzc+HqtQpJUgbR8UZOByrj/p5lMsgRig
	0ZqGfiE+KyaP+JWp3+VeKSGrqj2wzVrS4AIr54P0Y3a8ecl4cKzrFE7g9ecoBL4qGN/t39ypEsP
	msKf6OT/yX/1VcUooW0NfD/hS7MyjSUibcapLtTlFl3fs4D2Yx8FHZHdc8mjYLYVVvilxH84zu3
	539zWYuUxQvbHlkxetHZAmH0GpSXdfmM9nhesezdwZv06q3+InNv1VGx6iQ90t7NcW+PiltGa9m
	mrO+lg9oR+exiCM77mHAoBqEN4eMz9ZKT9vmgQr7s5UR+NTvpVPzJ1Bce99J6RJmgV7YiixZ1eq
	iRA3orbmyi4P6vKk1mS0=
X-Google-Smtp-Source: AGHT+IEDk7at3Bpgbpj+v0Eh4vjn2DF3yviRYYO1YRDu0NiWwlKlGxDy4FGz5GLe85FB4ML7qbBaOA==
X-Received: by 2002:a05:6a20:430f:b0:220:898b:2ca1 with SMTP id adf61e73a8af0-24340ddec04mr12861606637.21.1756061683987;
        Sun, 24 Aug 2025 11:54:43 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401afde8sm5257723b3a.61.2025.08.24.11.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Aug 2025 11:54:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 24 Aug 2025 12:54:41 -0600
Message-Id: <DCAVWVJ990VS.255346CDNF1GK@brighamcampbell.com>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jessica.zhang@oss.qualcomm.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Douglas Anderson"
 <dianders@chromium.org>, "Diogo Ivo" <diogo.ivo@tecnico.ulisboa.pt>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH next] drm/panel: jdi-lpm102a188a: Fix error code in
 jdi_panel_prepare()
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <aKcRfq8xBrFmhqmO@stanley.mountain>
In-Reply-To: <aKcRfq8xBrFmhqmO@stanley.mountain>

On Thu Aug 21, 2025 at 6:30 AM MDT, Dan Carpenter wrote:
> If the mipi_dsi_dual() macro fails, the error code is stored in
> dsi_ctx.accum_err.  Propagate that error back to the caller instead
> of returning success as the current code does.
>
> Fixes: a6adf47d30cc ("drm/panel: jdi-lpm102a188a: Fix bug and clean up dr=
iver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Good catch, Dan! Thank you for the patch. I'll try to be mindful of this
kind of logic error in the future. Please let me know if you have other
suggestions.

Reviewed-by: Brigham Campbell <me@brighamcampbell.com>

Regards,
Brigham
