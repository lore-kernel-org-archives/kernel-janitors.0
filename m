Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813923;
	b=nq8UTKf+iwNVjrfzIpwtpC3tAERKglyUGl418qS3QPiBkFLFjjKQ4BQg9VMv+o+wsJ1v
	 vONApECsCYonu3ajBOArhYB30b7prpQkjDQmXZMNmC7bcxBGMpYrQSWFVnGLHRa+3Xy0/
	 TDomZvXQ1EVgZAQTd4mkwUC5qqRoTm6VRUTHo1D7zMFnovzUliwa35oN/oFXrzkmGLfy+
	 mIqm6IoE/wFiuymV871wvgUtpEz59QP/n2Ly3lA1ag5hL6Q46MUNPmDFbZ8545J9cO9Cz
	 5vxQ/oNwYzwHkvq4Ses+Vp+v25hfT8SEgGIgHuKpUWlxV99zc+Hvzmhz+KZERoNL6Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813923;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=56yP3IqfUFiVeMplPku6VZ/myY7f5O2yb5iR8hw2xtI=;
	b=TzYjKaP2ILtXNxFbmhoD0pnOJ8lfN4o8wXr5x0fQlD7PZxK8zRJhOd0d7WLbiydG6eBm
	 C+5unbd/imQHOr4vz5yXt+EEKk3p0APH2kS0AOioM2g2r697nimJwBd9xs/eKsbcziPLs
	 9QUGf7oD0WQFQlVYJrasvFE/q+pJMNG2CHub/JhHWVTEdWLz7H/8CzyLFFyGySeCHxayZ
	 fbJ7Tf2WEG81hGPkmXg7VNbPziuywdFksUlnWulyA4PHFpDMQPVvqmJGp64tOijsN8uE/
	 ytX+eudRC/R6DUaDcevD6ndylviwOu8XTRwC6PACoWKISVt7yPrssKXkXSEA3cP30Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=BYYy2M23;
	arc=none smtp.remote-ip=212.227.17.11
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E80606A33B;
	Wed,  4 Nov 2026 17:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3E80606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=BYYy2M23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1793813906; x=1794418706; i=markus.elfring@web.de;
	bh=56yP3IqfUFiVeMplPku6VZ/myY7f5O2yb5iR8hw2xtI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BYYy2M23/Qft5kbKnunKwkJOWyvzDStj5bez8E8It2E6ScYoQdFYXWtChETD/EGp
	 kOnDc5q1rypZNZ4iFGQ/dzJvfoHFDZeh4zBlVFtP9dD2Y64gdCINILdlXere+peZg
	 SuMLygPwT3qf1mR+2ZKMO9rphi3R5RnDla7l4rPjQH9fQ8iaK4vNjvP8WyX92iz0/
	 nZs9uoaplhC2wmA3kUebNnPowTWCei1Ii1SkhjX7l/Bnwqg9SePxsbz9ef3NULC9f
	 NkjWBvMWpfvg1U49hy/fWMJ3sOQkGIJUR063DCoynxFZnVP8cOkkdKxXJjJnSI9Iu
	 45YdCQK6DgLsc8CiEw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MVrg7-1wyygx1BgL-00P8K4; Wed, 04
 Nov 2026 18:38:26 +0100
Message-ID: <3f79de27-213e-4622-bca1-a5f382ecf32b@web.de>
Date: Wed, 4 Nov 2026 18:38:20 +0100
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tzung-Bi Shih <tzungbi@kernel.org>, kernel-janitors@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261104162038.48622-2-tzungbi@kernel.org>
Subject: Re: [PATCH v2 1/2] reset: Fix reset_control leak when put after
 controller unregister
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261104162038.48622-2-tzungbi@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Wda5L4n4+0eT28guUrfccEeAJd416czjekyMQfFvZVryimzSuya
 V9WGHKhAkX1lpyhrJSGJkOYrzEdHDGyJocerKw5Kn85WKwgy1R/ROStJeds/UXb34/PAWLB
 wf6uSm4Ci+vCnd1ZtiMupP6p/vARZXoQzXIJtaDXOwwyJhMC7DmFzV2mhDcLQBX99bBhqBJ
 2cm4/ZfJPF+GlCqg9KyLw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HH/k90hhJZ8=;CMR1CGH0r/J9EZGcrXVjETba1QZ
 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
 KVw84ghxddj+Uf7YR9UGdEr

=E2=80=A6
> +++ b/drivers/reset/core.c
> @@ -160,6 +160,9 @@ int reset_controller_register(struct reset_controlle=
r_dev *rcdev)
>  }
>  EXPORT_SYMBOL_GPL(reset_controller_register);
> =20
> +static void __reset_control_release(struct kref *kref);
> +static void __reset_control_free(struct reset_control *rstc);
=E2=80=A6

How do you think about to reconsider the usage of double underscores
in such identifiers any more?
https://cmu-sei.github.io/secure-coding-standards/sei-cert-c-coding-standa=
rd/rules/declarations-and-initialization-dcl/dcl37-c/

Regards,
Markus
