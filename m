Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0616B394792
	for <kernel-janitors@vger.kernel.org>; Fri, 17 Jul 2026 21:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784322852; cv=none; b=oI9eVlP///TMS8FH8+vL2c7nWN9PgxRLvqnvSxJmrNTtN5F3mSoF8td2+x+vHI8MAfPhjrt5+zRhws8VOMyGlPJPDiEPS93p/RZDizapx3l2r4H4vsIlGZ47hCBQ9D42dZ5lJU+EdSTimpHiY42HWsmotW2bMoVuMP7GHObR7/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784322852; c=relaxed/simple;
	bh=XM9neNInhG6hGapxARO8DnRxo5Je6MmvjK4WGCKF2Bk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VbTRPBV73l1jY/wfW7B7c2neGG/e2j2BwrREVhb8TrQb2sPp+xHlYyxQA/5J1rdHP5G+2WqWuNRvPArwA171lrNeCBUK4+fjE+qvrGWzwIjmXSHv74hIMQpQWlWGYWsrL/JkqcjJ8lo3jNU6z7nW5y6C5gt6IVw5snq/DGWncfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I7HG6mQ2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CFi5kTn0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I7HG6mQ2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CFi5kTn0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784322849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3n8ovVroS/g0E1kqDzhNKBMWW9UR5F3sPuTt8jUlpU4=;
	b=I7HG6mQ2cqbWiOnpbpX541XZbBtmXN6UuUS8h+XMRzvLqWqw0UNqNXSwHiqvpBAMG0soI6
	SvYooxAebtMpCRiz8r+cWbrSciWrpbTErYcqCTi7XrKX5zwybPaox0wvIZ3yqyICxWAbuc
	xyp+hs5Mlu3ol/I96utlGyEDgz4vZFM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-iOuFHXdTP0GlUdQPdTgUBA-1; Fri, 17 Jul 2026 17:14:08 -0400
X-MC-Unique: iOuFHXdTP0GlUdQPdTgUBA-1
X-Mimecast-MFC-AGG-ID: iOuFHXdTP0GlUdQPdTgUBA_1784322848
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e8004d60eso1077591585a.1
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Jul 2026 14:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784322848; x=1784927648; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3n8ovVroS/g0E1kqDzhNKBMWW9UR5F3sPuTt8jUlpU4=;
        b=CFi5kTn0Teju53tZjHA6RxND9rpMOSf0tC2eyPaFWMSCIipF2+RLkrhTBpsxAQopQW
         XE3v7YZ1l59c87VmmP9ErfMPO9YNOxTGqNtNDnb5MDpBhVndz6RhVZ1T64BK6R71B0xq
         Mn5FQYjCsQurLHBhjV0ouH73M0kVBccRYKGCGG9iJRtMGMS7q8tbe8ulXLiXmv5kYTZL
         WhPEUR7D9focSGyWWA8/4CdxG2PkkifaKTljnQbKjH57dhPk00JFKV3/leJDMs4+x03o
         R7Fw5oYUixcngtnDAwEHJ3IXczEL3iJgH6QdEsKZX119mGRhKJRf+tby4Nq3mrpbGvVl
         sOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784322848; x=1784927648;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3n8ovVroS/g0E1kqDzhNKBMWW9UR5F3sPuTt8jUlpU4=;
        b=gSY2W6w84kvBh9nqQpJZ+pZ/F499ce5eRBGkpIP6Sgg+50fiAByiqbfM5c3631UTNV
         4SFwm56iT2O1TOH4BjfZUK45cb5UWaUL7G6SWT9JA941my0eJJasahS9ua3o24A3qU4B
         37GAtesQZVpBj6vCryzv26A8krQeFNIX9Hlr1KJS2Dm+rjbXP/ghHXbiNringcU6OwjP
         g6mlnnTe0eYdZgUnnpg1okirf25+H70QrXBo0PP39r8ZTSsX3TgEM+YTMOKn9fbqJKAT
         KUQ3TP91pdyw8i254Ot2/6v+LYqM5mDSglGrK5PS3ru2eMgJOmSVBDjT2Q8Pe7ACzSvU
         F3QQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJDJWP3eJBRSVG6mmQF6UKoAPnfQpbaLe12Vkb8crtreBaLD5mO9oPfuo6EICRicS8+JMObXUo1GAPxafqv84=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlRu1LgWTwHgWrXG3ut+PcmGfvNpk95ynOVp31abEPnrR/wiqS
	+eA9snofyAXA8JfeWga5k/tO2ETDJo7o5qccNePnUjv4Ip0famnjMxmUm3w5LfLKDm11AN2d9Bk
	8SdjrsKe9DFgVQnIU047OSm0bTAgGsp8z2cFb9r7abJnP/JJKirjx9KU+mdowL7Y7mhyTxA==
X-Gm-Gg: AfdE7cnn0XByCmVw2rCJROQiYAmG2jKT7VtktMm24sWjfaHQA58TZ5FOsY0pcprnj1i
	EWxWLsdqd/2MzNL5BTfotO+OvREJ4bb+DXomjYzfC4EXjwW+KQB3JGGmuglj22nIs+cZyuD0QQr
	dHAS/h3hILis5+fxcLtIUNf7NNw4MjlAvv3DJOQZRpfCmh5SV1ZM2HqpLNGFhMlP5napFFXebYA
	CvAiub5klw20hYTv/psf6Hm7JkPW0/Yx6fgf8oGcVw8W/GRYHduUNm8wG/TbisQTfr9+B0hh1sn
	FLkC1NXJT7Enj5LIrq3IMjs13Fs69VpdR3R0AiBB4IquaMIWLvmzLECwJHDllnznZhEcFROv
X-Received: by 2002:a05:620a:390e:b0:930:b12c:158d with SMTP id af79cd13be357-930b3eea06cmr491923585a.38.1784322848228;
        Fri, 17 Jul 2026 14:14:08 -0700 (PDT)
X-Received: by 2002:a05:620a:390e:b0:930:b12c:158d with SMTP id af79cd13be357-930b3eea06cmr491919185a.38.1784322847719;
        Fri, 17 Jul 2026 14:14:07 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b5461a16sm247735785a.33.2026.07.17.14.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 14:14:06 -0700 (PDT)
Message-ID: <2aba63b4d22a329259f335b1a69a4642ad1ddb89.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Omit a redundant
 pm_runtime_mark_last_busy() call in nouveau_pmops_runtime_idle()
From: lyude@redhat.com
To: Markus Elfring <Markus.Elfring@web.de>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>, David
 Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann	 <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Fri, 17 Jul 2026 17:14:05 -0400
In-Reply-To: <e3631a8e-b4a4-4e14-822d-2199f1576cc9@web.de>
References: <e3631a8e-b4a4-4e14-822d-2199f1576cc9@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next in just a moment

On Wed, 2026-03-25 at 15:05 +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 25 Mar 2026 14:55:01 +0100
>=20
> The device's last busy timestamp was set in a wrapper function since
> the commit 08071e64cb642ae19ebd6ffeb13b4f3d130b5860 ("PM: runtime:
> Mark last busy stamp in pm_runtime_autosuspend()").
> Thus delete a pm_runtime_mark_last_busy() call before
> a pm_runtime_autosuspend() call.
>=20
> The source code was transformed by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_drm.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 5d8475e4895e..62ac9593230f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1209,7 +1209,6 @@ nouveau_pmops_runtime_idle(struct device *dev)
> =C2=A0		return -EBUSY;
> =C2=A0	}
> =C2=A0
> -	pm_runtime_mark_last_busy(dev);
> =C2=A0	pm_runtime_autosuspend(dev);
> =C2=A0	/* we don't want the main rpm_idle to call suspend - we want
> to autosuspend */
> =C2=A0	return 1;

