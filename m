Received: from mail-4396.protonmail.ch (mail-4396.protonmail.ch [185.70.43.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD67315D26
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Dec 2025 16:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765471231; cv=none; b=uki9aRSbOK+uprUOPmamYabYCscWYEGhpPcK2TugCdWQstk6rvmsitecwhLrvQvE4fQvga6EsXtqU9mpGLALghGtB5GEq+neKNKa/UPkQmpp3J/Cr8IKDu3ZGGT/h98uGXS6wZtMe18JFD/6FZOK2IWYwzvGDeOH7sB1aTDpWHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765471231; c=relaxed/simple;
	bh=HfYGMq/eC8FJidMtkQ8oj3FKImNrKd5wnRrpAfmbGf4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mn4OdCJJGcrnx2vZpBNWCKYYMGCUp+MbxApab/EC8G9MGaKBtqBdGrm60cqv7SjeDVOpdbf0jD7HfbfG28ixKbVO4mF+3mQsa8HBIzmwlXKNdT3QULXlFKOiYIftrBBPKZKvpXUt0yCtiL+A/MiyWjw2RJt+I/mn+Y3yvUcPzS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=emersion.fr; spf=pass smtp.mailfrom=emersion.fr; dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr header.b=tKUrmg/A; arc=none smtp.client-ip=185.70.43.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=emersion.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emersion.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr header.b="tKUrmg/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail3; t=1765471219; x=1765730419;
	bh=HfYGMq/eC8FJidMtkQ8oj3FKImNrKd5wnRrpAfmbGf4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=tKUrmg/AxFBnSzzdok+YzybYUdRyEGDqGowWLPYfiTl0b0AWXbnRdLVC4GQUcBcuZ
	 6mlzCap5q9rRYzGMFyHPhrhyQM5aag+Tq3WLyl3vwKMP3SXaWIabH2yQeeZbFNQWxq
	 SSDseSxG7FmboorbxynA36a7B4kVMtIwj1dawb3pnFjsKXSgqDxZH+Y1Ic+DC4TYaO
	 BF62uIuBIjEpvMrsQQvU6vu6qM00t9jjitJKDFjhWamlYZbdTw0WoT7MlqnAsdIEHl
	 gwqVf1SSw+KxqLPUIZtykZLQxiwuQv3rAc7YaDTo010vxfTmlGujFLw/XETYtTQ4lv
	 dMCJORdrPrIpw==
Date: Thu, 11 Dec 2025 16:40:15 +0000
To: Dan Carpenter <dan.carpenter@linaro.org>
From: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Alex Hung <alex.hung@amd.com>, Sebastian Wick <sebastian.wick@redhat.com>, Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/plane: Fix IS_ERR() vs NULL bug drm_plane_create_color_pipeline_property()
Message-ID: <JgyhoN6h3UMhM6E3z1092ZDRNRDlyrrQnpUsMb_ldKowPZ4kvmeTm_VmzkrJLJw67DUW6R9r8L53hThH5DCdqwVW2ggQnRoA3Jm84bN2iEI=@emersion.fr>
In-Reply-To: <CN7gZcz0WnfFN-FgfhFlSwX9naLEVoV-H6FCniOPp3glGzIEFRK1-SXlVbb5S_B34TxYnCOBQZj4ldqZNCl-Igw2zyPeUnaruX2ngu__loE=@emersion.fr>
References: <aTK9ZR0sMgqSACow@stanley.mountain> <CN7gZcz0WnfFN-FgfhFlSwX9naLEVoV-H6FCniOPp3glGzIEFRK1-SXlVbb5S_B34TxYnCOBQZj4ldqZNCl-Igw2zyPeUnaruX2ngu__loE=@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 41222457666ef806f0cc23ef76f7ca273fb936d7
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Pushed, thanks for the fix!
