Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85BD26FA5B;
	Mon,  9 Mar 2026 11:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773055032; cv=none; b=HrQA+PS3HGSajnQMlok7hqqt8iG8Fsr1J8JZyOrcanVEAIC658w1XCbJeH2lVq2lpmzoWrlfHPwv4ddJAcSvdGxaPdAuPKepo77S3419M6tJqNFvp8UR5OOwogrOt1I4+amgcEBkqAuYNLUlc5qCHsPyi94RP2SS6Hw6Rn9HLLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773055032; c=relaxed/simple;
	bh=4yzwcxbWI6ztTVUsjhBw5dVFglDeBTxLEyBl2hskVRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=leySfZAsTS6wrfCJYKVDb9lhctrUnKUcLM5+h/QWilhm/XRXqeskQQFrHo/OmAe/qKLKaoJhm1HJexaeWlE3+y1Y9RR8He0P8aoe1OIuGOFihIVAMEmlY3HOEV9qTwZGJ1BDdpCBuBLz6puEeez0iTlysN18eRiYQCB4W8tFFxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=RBbNvaYF; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="RBbNvaYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773055022; x=1773659822; i=markus.elfring@web.de;
	bh=+bpqzBndy1gJ+F2JoC2Ew/16XFgs6z5eCQyxldiZgvM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RBbNvaYF/wg4HySsBzR/gOnNTioKsqxENdIVdwaqUNOq/UHe72eFBPeFOoa5p1yO
	 0KzFRE4DyiMxD9W0Zm6JfR3HMqRh/2Cpl9CL2gHxygrrwhMaBOaHPXAK7oGh/71t7
	 SrKhmzwWpocCqDSdCIVTbV55A0gSoZ0arg3lyLWpaJK90LZ3wG10b9zgapss8WyNw
	 Wf6B/WwRDO915JzjPtXTpAlGP6gAMqeEdYomZhPtbLB8SvYM9jQ5Fa+y80yJJctOK
	 O7jel7KAXDpTYlBMPWafti0dAiUdKpX/9IQGqNt/A10IpghUslEPbS/C9Ro2cFD2f
	 DwQ30Rmt5vMnCXowPA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N5CQh-1vYEDD0Ghx-015CNG; Mon, 09
 Mar 2026 12:17:02 +0100
Message-ID: <cab3d2a8-4c3f-45e6-9e7f-8bdca48a6209@web.de>
Date: Mon, 9 Mar 2026 12:17:00 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] [PATCH] scripts/coccinelle: Add script for using
 ARRAY_END()
To: Alejandro Colomar <alx@kernel.org>, cocci@inria.fr,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>
References: <cover.1772752564.git.alx@kernel.org>
 <f1c9dff525752dc5a839760269a1c96d6e0870b4.1772752564.git.alx@kernel.org>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Kees Cook <kees@kernel.org>
In-Reply-To: <f1c9dff525752dc5a839760269a1c96d6e0870b4.1772752564.git.alx@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ah4CMhuaf2Bep++Tl1PtGMhZ1KivVVnTxAP7I2BanGDC2O2jTYT
 HlV/Z5GWfRLn2usIwM3agaGPk8kp6aBSA0eIp8+yTEC3qyiwSinW7qiUif2KnNS54II9kf6
 eMO6tu2KDXQVLUZpf2dc63VaicDrqZBvWyC8ofXru9T6hBWhO7dg4tkVVEY9Sn8q0m7/hYz
 kvcmeyixUXDIL7iv39c5A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LryntZdtivY=;PeCRsnvfJpnjiPROhLMVDQgI4ZR
 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
 snoh6ehsWJZOaAfZoR/KhS6yh56nb

=E2=80=A6
> This script makes it easy to find more places where that macro should be
> used.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.0-rc3#n94


=E2=80=A6
> +++ b/scripts/coccinelle/misc/array_end.cocci
> @@ -0,0 +1,93 @@
=E2=80=A6


> +// Confidence: ???

I hope that a more reasonable value can be determined for this information=
.


=E2=80=A6
> +// Comments:

Please omit such an empty field.


=E2=80=A6
> +@i@
> +@@
> +
> +#include <linux/kernel.h>

I doubt that such an SmPL rule would be required.


> +
> +//----------------------------------------------------------
> +//  For context mode
> +//----------------------------------------------------------
> +

Please omit such extra comment lines.


> +@depends on i&&context@
> +type T;
> +T[] a;
> +expression b;
> +@@
> +(
> +* (a + ARRAY_SIZE(a))
> +|
> +* (&a[0] + ARRAY_SIZE(a))
> +|
> +* (&a[ARRAY_SIZE(a)])
> +|
> +* (&a[ARRAY_SIZE(a) - b])
> +)

Extra space characters may be omitted directly after SmPL asterisks.


=E2=80=A6
> +@r depends on (org || report)@

You may omit parentheses here.


=E2=80=A6
> +@script:python depends on report@
> +p << r.p;
> +@@
> +
> +msg=3D"WARNING: Use ARRAY_END"
> +coccilib.report.print_report(p[0], msg)

Would the following command variant be a bit nicer?

coccilib.report.print_report(p[0], "WARNING: opportunity for ARRAY_END()")



By the way:
How do you think about to omit a cover letter for a single patch?

Regards,
Markus
