Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F119E36215D
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Aug 2026 17:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786728363; cv=none; b=XT+janGV1BkA+pVf/FF4UqR82dFMUbUDMthFZPenLS4VVTCyD6GEgLboUAa6GY9LW8gd4yNegJOcZB4LBxCWPejGASGNfBs4zLRw+rLExMt37rTPl1Sfq3tgWhqoOJOoM8vFWIWqGYyDfWVZAPh3CutlYkoRigZXE/YDjcPr+fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786728363; c=relaxed/simple;
	bh=Iy8WJ61Pd/JkzHwvdwzWiJmcbOFQ9F/PsKZks9HVmaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=garMj68tZeg9V+tVr3nQmKR/LR5U7FJnwA0GSh7rxCN89i2uxyZGa5w2J/XwRRYnSmyciuLwPqhelCIr1P8HNT0Z8dw1RWbVTsd/kR7/aqvR9+sp57sFT9vZgP8lIUFNpo2KkF1qibhRApYg/B5t1H0Q54Toc1VP4/alRj/Hqls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=rolf.reintjes@web.de header.b=WGMXrA7A; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=rolf.reintjes@web.de header.b="WGMXrA7A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1786728350; x=1787333150; i=rolf.reintjes@web.de;
	bh=HZfrFrp4Xh3qfnqAfbbtrpd8rhg+OszvgrsGxINTyYU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WGMXrA7Av7hlnZ9Nth1vAzBns0rJkE39fFgIpctEcRnKvH/cFBCQ2/Yb726vF9+u
	 Bkif7yIDOxMTR8XxpiK0fF7X0rl5ENGPAUX/0pxcjfmuHaE0b39u7v864XUclnyoY
	 j/4WAm6EID97mKcUcQVr61PtLyYGQwIu2Dx/my4F3/Sl8cbweb+5qLsCkX3BP2rhV
	 WRKcKuMyoe0oqfbBUdsuL/FESaATn8q/6eB2IjHuXwnQIZfP/CKAv+dLwXfgeT+3Q
	 4aqbxKMKcUZdWJIimqRw/sfLCIhaL648ocC+gBxWTghXGEvpNMlvkgF/WOQxnkxAd
	 pvlwQ4dB+CH+bZJW3Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MQ8Wa-1wYsZC2dW4-00UkzO; Fri, 14
 Aug 2026 19:25:50 +0200
Message-ID: <3ec52129-0629-46cb-a0d9-cc4dc68a502a@web.de>
Date: Fri, 14 Aug 2026 19:25:46 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/amd/display: Fix spelling mistake "optmization"
 -> "optimization"
To: Colin Ian King <colin.i.king@gmail.com>,
 Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <Roman.Li@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org
References: <20260814171335.1099999-1-colin.i.king@gmail.com>
From: Rolf Reintjes <rolf.reintjes@web.de>
In-Reply-To: <20260814171335.1099999-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:H2qIpYqvGcZXYQIzcQNEoGgLjczrAJwd+R/fORj6YsJsOQpQy7T
 zKTSnovgPyTa0pYNPMLs9HwqEmzvgereTxhMwBTnhNGMzKOIe+bxUDulcczOKCMc8caaQgd
 AFc95gmjeVVorwXTIEdJOtuY6NArtoz285Dq4UgVxMdb1si01y4nLiRqNvpkSsJVHmpMp4g
 mXEbxnTXklT6AQGDJ0Qbg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:t4IcPigk0Rw=;Kp5OXxIHrCIiAm1ginZO9/+GvQp
 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

Hello,

Am 14.08.2026 um 19:13 schrieb Colin Ian King:
> There is a spelling mistake in a DML_ASSERT_MSG message. Fix it.
>=20
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   .../drm/amd/display/dc/dml2_0/dml21/src/dml2_top/dml2_top_utm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_top/dm=
l2_top_utm.c b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_top/dm=
l2_top_utm.c
> index ab9cadaf5a60..79ec5838c26f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_top/dml2_top_=
utm.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_top/dml2_top_=
utm.c
> @@ -123,7 +123,7 @@ static enum dml2_status dml2_top_perform_stage_optim=
ization(struct dml2_instance
>   	DML_ASSERT_MSG(worksheet->validation_result.is_mode_support_valid
>   			&& worksheet->validation_result.is_mcache_allocation_valid
>   			&& worksheet->validation_result.is_prefetch_valid,
> -			"worksheet must be valid on exit independent from optmization resul!=
\n");
> +			"worksheet must be valid on exit independent from optimization resul=
!\n");

There is another spelling mistake here: "resul" should be "result".

>   //	DML_ASSERT_MSG(iteration <=3D MAX_OPTIMIZATION_ITERATIONS,
>   //			"exceeds max optimization iterations!\n"
>   //			"\t is_permissible_found =3D %s\n"

