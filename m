Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BF43EEAF8;
	Mon, 27 Jul 2026 09:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145880; cv=none; b=oj30cSetrHcw7Lka2Zrm31EcLaBCRelUuCLGzTp5fiSoIVQI3wHvWmeyB6XiUBSzMMvNcxuM1ycRfMxaoI6NZ3htqLVWgRtbIHv8Z/WShZyR3L6iYzABuFP1x3kJtUSrLAHEnj8g8dH6U2olKJy3xtb3iv9UODP9q7/XorOKWFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145880; c=relaxed/simple;
	bh=PdFvoYzy2BEmaR+tXu5WqI5k7PUZcVtQy0VE7k/14g4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=pf0JKqr9qlbE3pmQFZCNfYspVD80EA0cY0Fc+2+rQxbxsEr+YQ8AbNDpjX+TpkladgMZ4VepIL/eyNnOcg2d0h3XP3LxxZJTXgRTJp4/XctvMSmYYAFr3u7VIahIGT6dDc6vKPrvjfiyn1TZ3JitiOoGPOsMbPIJaZ5+QMJyS4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=smuKUVh6; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="smuKUVh6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1785145875; x=1785750675; i=markus.elfring@web.de;
	bh=ziIjELpKdrLZUW+FwhwHi9x/N4Nf+G5U3ag3HroZHPo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=smuKUVh6z6UU2rOUapWsEBi3NsP1hM9QH+997+t2BbQyUjM4HTcdoTwZVx+nDyGl
	 +vhnFcvEWx0Bkul6xJDuKRcbdqmJvSME7803k9dISHD702re/AnWy8894DHIAGget
	 Jx8tdUWlP+RlSZPDCxI++lUsA21atBw0hhm4KEFaz8m092veP2DBtNEBZm1L4Jca6
	 tvsQRIbFzYkZmPzkXdVN8yl353KMt6ND0b0nnHjjeaPEype8pQOnp0GHfcwr/eBw4
	 /B16trZQLcmz+ZLjqQbQUdvOsTWZJoHFSySuZE6deDJxoDAoj8nhXL7l8MSv1Z2wd
	 pNbGPEq+GfIAq/rzIA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M2Pda-1wopgr2PiI-000aFi; Mon, 27
 Jul 2026 11:51:15 +0200
Message-ID: <5ffc7c46-525e-42c3-9530-8792c632ccb9@web.de>
Date: Mon, 27 Jul 2026 11:51:04 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sang-Heon Jeon <ekffu200098@gmail.com>, cocci@inria.fr,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Simmo Saan <simmo.saan@gmail.com>
References: <20260723184538.3888637-2-ekffu200098@gmail.com>
Subject: Re: [cocci] [PATCH 01/36] coccinelle: misc: add
 cond_return_no_effect.cocci
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260723184538.3888637-2-ekffu200098@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nm8xoxqkXdsN2+3RVzkIiz2PdGJx0/FTcB52P8F0Uqz197QetH/
 IpMi1p7Sf1cXpQspdm0CEMAYyRZzNDYtXUAln1ctF7iHafrZeMtrH/Zvz96eTC6DVP1tsBo
 Cs6ZCk/LiEk09phzrGopvuVPavIZQn4e8/pMfuzYSi57uwIhKAbXxGXXR/JYsMbmSw+75nN
 zV4sXXtelcUk9BGaCnMAA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GjBj6LIKrqs=;t1wK3FA5u0bFt7Hz5oxi/zNORKb
 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
 2Vb5pB6XOPQOrFCtn0t/w

=E2=80=A6
> +++ b/scripts/coccinelle/misc/cond_return_no_effect.cocci
> @@ -0,0 +1,121 @@
=E2=80=A6
> +@depends on patch@
> +type T;
> +identifier collect.ret;
> +constant C;
> +@@
> +-	T ret =3D C;
> +	... when !=3D ret
> +	    when strict
=E2=80=A6

Previous transformation rules can have the effect that some variable defin=
itions
would not be used any more.
Thus such an SmPL rule can look succinct for a possible source code clean-=
up.

I suggest to take also another look at information according to software
run time characteristics.
Software components are still improvable accordingly which can be seen by =
bug reports.

Example:
In-place parallelized run on a directory seems to be stuck after 17 hours
https://github.com/coccinelle/coccinelle/issues/416#issuecomment-508015867=
0

Regards,
Markus

