Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C2E339378;
	Mon, 10 Aug 2026 07:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345549; cv=none; b=jqVf6NSD/utrEozaOkRGnnp39lunzOyItawOvak6+tEZcZJRCWpbA6l9Fb49EdsyfBdhyR0YvZXfNW7EhtS+RR24ePrzl4iGAoZrkg++NnIG8ZFIr0v5YPmiRbOtAswF0B9wjvVugDko5Q1K0Jo2xtWbhfA0giHSes1rJSIrJPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345549; c=relaxed/simple;
	bh=9/Rslgi5u2PSrf2yBLgNmcI3fD2lD8zOrT6XGR0X4c4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k1y6UQtVteUFwVhUq44+kLU40EDYF4qZsiD1Qi8r4dfEBI/Gmd9oxWJy8INSvXI+n3rjwBZsbHRfHy751jGWoG/zTmrv1B8Tb9YZZHqodNRxHtPb9ND+eeePYRAoUmllLlVE9rib1oGxSkOHJ0yiG4AOBTvj98G7ZeYNNnOnmfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=F30ckZIe; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="F30ckZIe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1786345544; x=1786950344; i=markus.elfring@web.de;
	bh=9BnFXla2YGCs8bW1ImT8EK4kFo6U8/e7fU1ePbgiDI8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=F30ckZIeQUm/s9suV68K06VhrTSUUa3epPp7eLygfoO8mu8MSwUThZbEmztdnI68
	 b+jwNlGB1VX9+vbDyLQdjjTTK4vBAUrOS6LWnJnAyKiLuj/ATJI3WuBZohDDwYej2
	 C3pQeeNRsf5Sjr4W+dCD3qioI/Yd2KF2n9zHBVxkhXOyqYH9cTbuqXNNpcjWFU178
	 ZcGsy/8SyR5N6Ko8ewyLRreLWqSDVMANyXqN/Mjje2xMmrYfwDIZXaZ02DY0ANIlk
	 C50bGwO537+oNXn691bgBFEc4bpulUA1qKCnV5WDBq1IXZCRt5SbvhZhGhFp9k7QP
	 T58tS4OKUEZXrFmW/w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MyNwk-1x5TBL3doy-00rqgt; Mon, 10
 Aug 2026 09:05:43 +0200
Message-ID: <f5da5fe4-c10f-4a33-9910-55a6b2618e00@web.de>
Date: Mon, 10 Aug 2026 09:05:42 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] [PATCH] coccinelle: scripts: coccinelle: devm_free:
 reduce false positives
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Nicolas Palix <nicolas.palix@imag.fr>, Ricardo Ribalda <ribalda@chromium.org>
References: <20260809165340.1719736-1-Julia.Lawall@inria.fr>
 <ef5b5f36-a1a2-4723-bc34-4ec7a5350ef2@web.de>
 <27fd1773-a8ba-afe3-1cb6-51e4bc94d641@inria.fr>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <27fd1773-a8ba-afe3-1cb6-51e4bc94d641@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jWUjZgHkNwst3Cf03phaGBYsYIWHEOafGJmuw1ucpwWSzVfG6XY
 NNrv0bLbnM4LtmkhSL58O4EZGdMRip0Gj8LgUTrVE5MglBWXAWCXJhaZPRyr68zGoNGMkr4
 +z6pZuWKWFeGMn2sUsu3wxeyD5vAGf4k1uiXxp4X3OPUv2g/FkSA50q+5laOZycnFV26Y1Q
 /LleY3gHG03yhczxiqgSQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:inkSmO8iWrc=;N8Xl+faimp6sys4avh1RjFG8y+f
 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

>>> False positives could be introduced due to allocations using the new
>>> _obj functions.  Add these to the "safe" rule accordingly.
>>
>> Can the SmPL disjunction specification be refined another bit?
>=20
> As usual, a random comment with no context that makes the reader have to
> go look up some other information to have any idea what you are talking
> about.

How hard is it to determine technical details for a running patch review?


> Anyway, since I did take several minutes to go find the file and look at
> it,

You propose to adjust some SmPL code.


>     I guess you want the disjunctions to be ordered by frequency in the
> code base.

I imagine that such a design possibility can become helpful.


>             But I'm not going to do that.

I assume that further contributors would occasionally like to benefit
more from nicer run time characteristics also for Coccinelle software.
https://en.wikipedia.org/wiki/Short-circuit_evaluation

Can SmPL code become a bit more succinct accordingly?

Regards,
Markus
