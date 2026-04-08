Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25A239D6C3;
	Wed,  8 Apr 2026 08:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775635873; cv=none; b=FGcTc+he1oLPWp6zuslEgXr3xQ3i+aNSeszPPW1VWaao+jbjexpDNvXE7LGUWcz0OsrbzIllACNLZyjFOVpIX0r09dh6BCzHYiafj0aI7DsubjzK3lvEfGJNW+cDoLDmeZQwrZhlmjphnwWpjMCwdYLwJIfZ7dCVqNjGEgdeoqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775635873; c=relaxed/simple;
	bh=3MayaakOGz0xaBeZPadG5b8AwM1D1LmeZSK9WOejPwc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=B30Vl+AmdKgW3XjAhFq2/dpp7hY0Uu+5hRWoiyTProZpSZ2crtJiZBawPBgkOFi4lWpiAZ92RjdRxPd7a5CISBka8liG8rC2GxalHLWCGOqL7rwAyPcJbfNHc64LDDbobhWDFVb1IQGeS3kO+8I3uLKhXYSYTD4tZ4879DJwZhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=STpfcXrh; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="STpfcXrh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1775635858; x=1776240658; i=markus.elfring@web.de;
	bh=1x+hJuTLcyV6tpLom+iDe6VA1qRTgU3HaT/6G9Sk7Oc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=STpfcXrhRBtoxks+DjusVG0jBEtbb+19dPDy2dfdfbdqsEPCTxVla5IwagmJffj5
	 +VvhGHwhEsr2kno/4XqUrKIKTOHk73UDJtpY5Bm3RbJkaqrOL0xopKLtLlgzeXsgi
	 uVZ24/rC65F/JOgSWcg9137OAQ0Ms8lVaIzxVfbpXjqfTKFhon+N1ZuP/sTvSjDyX
	 MR6ULErj3rRUJx8O9d+yBZVDscFbzMuwW5OLPi4yzabNeYF7eVXm9IQGzO5pxKq0l
	 FLlza+XK6xxbrHWrMUoLkEGhNqlXfKFLfy/Hmhr6EPjWC13quW2oloKlRGoCnwNKA
	 pJ+0n2eQEokCyFOrgg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N8Epu-1vOFMY2xP6-00tVyF; Wed, 08
 Apr 2026 10:10:58 +0200
Message-ID: <95fde24d-b15d-4a61-91f4-ba9326c7e614@web.de>
Date: Wed, 8 Apr 2026 10:10:56 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, Peter Rosin <peda@axentia.se>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Kees Cook <kees@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>
References: <20260407035306.243905-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mux: fix use-after-free and node leak in mux_get()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260407035306.243905-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ouasod29db+RBesL04fah8B1dRYKHaIvkUyAFDrYn2ei5JXPdj7
 vCc4lQFCzcbgKK8QCMmo45ZfiTU3V0xa7JRTAXUixibdiopSbZx80dJavism53drCpMrCyc
 vuKQ4hq3hwrx9ERP3hPy2f5QxKG3ngw2U96Dxp2gPQUM6cpHzgxn1c4vGCQWEofDv84p1pn
 saSbPId5N6E7p722c2bdg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fFcDHRGOE4w=;Y+eAhgABvXzOv/nW4YD87kgpX4C
 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
 AQeGiMXdgFmgszZh7S4M/y3DqgBkCSCww==

=E2=80=A6
> Fix both issues by moving of_node_put(args.np) after all usage of
> args.np, and introducing a common error label "put_and_ret_err" to
> centralize node release.

I imagine that another label can become helpful also for the statement
=E2=80=9Cret =3D -EINVAL;=E2=80=9D.


>                          Also add missing of_node_put() in all error
> path.

You propose to use such a clean-up action for more cases in the implementa=
tion
of the function =E2=80=9Cmux_get=E2=80=9D, don't you?
https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/mux/core.c#L520-L=
609

How do you think about to increase the application of scope-based resource=
 management?

Regards,
Markus
