Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A92194AD6
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Sep 2024 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727710027; cv=none; b=k3979FjKV8VarnlTg8VbtF8eNC7IeELcYhfMkdgD1j8+HaIaGCoMSul0XiVGPdn4XsfC2Prv3JgnopOPj7WbNwbnfUmCjY71y4WAjuJ/+HAy8bLma/pD793ApQy+qPxtYC4GX32vP+4oNGHEVTh9v5Lt7UUnbR4dfvjpZbpw7hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727710027; c=relaxed/simple;
	bh=uaCv37xmX/Ty+Ewl3LTIpNSRFKq50QIRpf8eVC1h8fs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L/hsJF43mpIg9djqwF9OjBCX1u5ztJX/RxGbPhYJoJpqIxW/d/v7uFBDak+rztSuSqZWaHUoICjztCX2dyHBMYJ8G4pTO0M2msWKnYAWk2zBI/fBSA5AWPe0LWgSUP3v+QPkrPcwgcDTMx5SrqCwab4TBbYHglY+NP69DKSWGNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1svIId-0002aI-IW; Mon, 30 Sep 2024 17:26:59 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1svIIc-002f72-Vp; Mon, 30 Sep 2024 17:26:58 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1svIIc-000DNW-2y;
	Mon, 30 Sep 2024 17:26:58 +0200
Message-ID: <9ebdbbdd938ceaa4e58d4cc26e2187fecf5856b8.camel@pengutronix.de>
Subject: Re: [PATCH] reset: Further simplify locking with guard()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Markus Elfring <Markus.Elfring@web.de>, kernel@pengutronix.de, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Date: Mon, 30 Sep 2024 17:26:58 +0200
In-Reply-To: <b050730e-ac7d-401b-8210-82453d05b0e5@web.de>
References: <20240927-reset-guard-v1-1-293bf1302210@pengutronix.de>
	 <b050730e-ac7d-401b-8210-82453d05b0e5@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernel-janitors@vger.kernel.org

On So, 2024-09-29 at 12:45 +0200, Markus Elfring wrote:
> > Use guard(mutex) to automatically unlock mutexes when going out of
> > scope. Simplify error paths by removing a goto and manual mutex
> > unlocking in multiple places.
> =E2=80=A6
> > +++ b/drivers/reset/core.c
> =E2=80=A6
> @@ -1041,29 +1036,27 @@ __of_reset_control_get(struct device_node
> *node, const char *id, int index,
> =C2=A0		}
> =C2=A0	}
>=20
> -	mutex_lock(&reset_list_mutex);
> +	guard(mutex)(&reset_list_mutex);
> =C2=A0	rcdev =3D __reset_find_rcdev(&args, gpio_fallback);
> =E2=80=A6
> =C2=A0	rstc =3D __reset_control_get_internal(rcdev, rstc_id, shared,
> acquired);
>=20
> -out_unlock:
> -	mutex_unlock(&reset_list_mutex);
> =C2=A0out_put:
> =C2=A0	of_node_put(args.np);
> =E2=80=A6
>=20
> Would you like to preserve the same lock scope (which ended before
> this function call)?

Thank you for pointing this out. Yes, and this should have alerted me
to the issue with goto out_put from before the locked region.

> @@ -1098,7 +1091,7 @@ __reset_control_get_from_lookup(struct device
> *dev, const char *con_id,
> =C2=A0	const char *dev_id =3D dev_name(dev);
> =C2=A0	struct reset_control *rstc =3D NULL;
>=20
> -	mutex_lock(&reset_lookup_mutex);
> +	guard(mutex)(&reset_lookup_mutex);
>=20
> =C2=A0	list_for_each_entry(lookup, &reset_lookup_list, list) {
> =E2=80=A6
> =C2=A0			break;
> =C2=A0		}
> =C2=A0	}
>=20
> -	mutex_unlock(&reset_lookup_mutex);
> -
> =C2=A0	if (!rstc)
> =C2=A0		return optional ? NULL : ERR_PTR(-ENOENT);
> =E2=80=A6
>=20
> Would you really like to increase the lock scope here?

I don't think this would have been a problem.

regards
Philipp
