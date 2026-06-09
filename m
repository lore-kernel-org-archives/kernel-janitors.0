Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C743016F1;
	Tue,  9 Jun 2026 08:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780993179; cv=none; b=nzTVxPHlp+zivAAYa/GY7C1QCYZ7NHkEvtwoV77G09V5ju8i/iGioQJXr8t2cmM1s9x0yY/u0POHbdWgFQd/Jk9n8izkHKe+6ab2dzoSBClO9jMuamxNXwH481r6fGwXvYICoaEmE+GdSKBHfp/6lEgtcmpl07ltuoQj1V9YBUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780993179; c=relaxed/simple;
	bh=cUjGdn4+Io6OGzogiDps2ykTUJaaHZY7oPr5juH/OoU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=beHrRSFNIc/Mq4ufgJw4FoxOOrzW5o5uhO3AkoEveJZSZjCWP/eHLbSpGkbQu6cck1K0fbDAGJFfxiAsDULvAaeNlIq2VKCi04pXWPViLik6GrV8wi3amRLIfNi+HORfngTh77QojjKXYqQjwKoN4s+E6OY9MeoHgNL7bYr+P6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rvckHEWS; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rvckHEWS"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gZMJh6jc9z9trF;
	Tue,  9 Jun 2026 10:19:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780993173; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PkY1gt9Nl/47kZMtxCPcEsFKk0hBrEqWI+UAe5w8Z1A=;
	b=rvckHEWSCfi5zaHK3WSVlgi8apHETFfNEt+WNo2Bpf1dJGu7lx2RF8SizADVYUgl+68UP8
	1kiEVnyicRlLsh6v1sxsjJ515XJ1WcUX485xsKcZu+UuVWP5GSFM30OZumybPuZkcL4LTZ
	xuA0YBJ15QySKCG+j7F0g1m/GyDWKuYJB2gKzzkMqmRlhcUEvSzW+ILMPGJMKfHesZd99O
	VLR8BUWfQv78FB88czPeabBM73y4kjhDPgJoH09RnEFijzVU1+W0rtqpqlV0YvlpFPhnV1
	+DORfV0YHBcnJ4hiXWkUSZCyApZlpH/Z3/Nvc71wF/sT4ByOoDAaK/OEGlQVLQ==
Message-ID: <a18c75843097322729ead2de6208d4e6924e164d.camel@mailbox.org>
Subject: Re: [PATCH][next] drm/sched: Fix spelling mistake "sumission" ->
 "submission"
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Colin Ian King <colin.i.king@gmail.com>, Matthew Brost	
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, Philipp
 Stanner	 <phasta@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 09 Jun 2026 10:19:28 +0200
In-Reply-To: <20260608172315.34626-1-colin.i.king@gmail.com>
References: <20260608172315.34626-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 1119736fab8938f5a7c
X-MBO-RS-META: ngg3pqx85xgypwzzadycz53tmg3iwnho

On Mon, 2026-06-08 at 18:23 +0100, Colin Ian King wrote:
> There is a spelling mistake in a pr_info message. Fix it.
>=20
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied to drm-misc-next, thx.

For the future, drm/sched submissions should also be sent to=20

dri-devel@lists.freedesktop.org


Regards
P.

> ---
> =C2=A0drivers/gpu/drm/scheduler/tests/tests_scheduler.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c b/drivers/=
gpu/drm/scheduler/tests/tests_scheduler.c
> index 90d31888cf92..285546a2218f 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
> @@ -599,7 +599,7 @@ static void drm_sched_scheduler_two_clients_test(stru=
ct kunit *test)
> =C2=A0	 *=C2=A0 -=C2=A0 qd: Number of outstanding jobs in the client/enti=
ty
> =C2=A0	 */
> =C2=A0
> -	pr_info(" [pct] - Job sumission progress\n"
> +	pr_info(" [pct] - Job submission progress\n"
> =C2=A0" [cps] - Cycles per second\n"
> =C2=A0"=C2=A0 [qd] - Number of outstanding jobs in the client/entity\n");
> =C2=A0	pr_info("%s:\n\t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 pct1 cps1 qd1;=C2=A0 pct2 cps2 qd2\n",
