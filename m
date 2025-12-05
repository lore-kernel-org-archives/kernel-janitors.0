Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABEE32E738
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Dec 2025 16:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764953689; cv=none; b=A9QmtwbeZ1o2AdWMc/JRZy9AnFJ0G9s5xxhKcPPwzpJbqEDgjicDum+DSFMa9UpNIuQhmryQHndFqvXsp3ooFRfkua7z1mojSZc7BS7obCh8h92TLOFjrH1BUz5T2t0O55WGyQ7IzjKyHt5tV+e6w7INLZzckBooxbiDQSysofc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764953689; c=relaxed/simple;
	bh=BX7vL0QBxUG8IFjN/Vn7c2cEpPMdLWrE7PDrv9RLsU8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XwSeRSG4sZ6oP4yRPRs4ynNYScFeoX3ymFhMSOFyV+96Ay/uITkvi5KtM5I0W3e5XHM355Zjir7d1tzh4zLm/JvNv8s6IWUM3kBp2DC9Z2hsLltt10dtcid3A1leDpwukI1Pa3wvlrifJ/E8/biRrfpRBwO0jPNWf4rND1j0FQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=emersion.fr; spf=pass smtp.mailfrom=emersion.fr; dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr header.b=nY5LxwS/; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=emersion.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emersion.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr header.b="nY5LxwS/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail3; t=1764953669; x=1765212869;
	bh=BX7vL0QBxUG8IFjN/Vn7c2cEpPMdLWrE7PDrv9RLsU8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nY5LxwS/xDKA4BojeQcQzVauct/6v5Rg6Sl32I5kdd3CZLiat/NA9+t30Vu09UioG
	 v8s9fwX5fkA1ZPbgYUoFFK6Xod/7DWY7BNzEObOgsnkb1544KJsEgveMQ4g44mX0Tg
	 QHYFws0puYZp5Upvz2iVPZ6NXUIzI/BkllsZFUVyjgC/tCty2NsFTnlh66EXJKUBBJ
	 DW3FPjWlWpkGrkyPrBeS7Z5ZOPmGVqmHvYzSDz5hWB+NxqueliWp4eAPtJcPxW75Cd
	 YXe9JT5jR0FRdbS26xUZzAij6B2grszIPbZtWNHKZBOckmzPw9S9PeQnvY4fg+lvAX
	 bqUAcTpmP4rMw==
Date: Fri, 05 Dec 2025 16:54:20 +0000
To: Dan Carpenter <dan.carpenter@linaro.org>
From: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Alex Hung <alex.hung@amd.com>, Sebastian Wick <sebastian.wick@redhat.com>, Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/plane: Fix IS_ERR() vs NULL bug drm_plane_create_color_pipeline_property()
Message-ID: <CN7gZcz0WnfFN-FgfhFlSwX9naLEVoV-H6FCniOPp3glGzIEFRK1-SXlVbb5S_B34TxYnCOBQZj4ldqZNCl-Igw2zyPeUnaruX2ngu__loE=@emersion.fr>
In-Reply-To: <aTK9ZR0sMgqSACow@stanley.mountain>
References: <aTK9ZR0sMgqSACow@stanley.mountain>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 6055722f007a4713addc3f24ea81304fe1bf3a32
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Simon Ser <contact@emersion.fr>

Please ping me in a few days if I forget to push this.
