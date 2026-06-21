Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3F1274B2A;
	Sun, 21 Jun 2026 19:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782069624; cv=none; b=lBgvJiEqbtJf0aJnj+ojf1YOCPMOi4xKTye5Ie9SIY2aTDnU5CpvbO/wCrbBsJdVsPxEpJkkKo9h/9TP9JWPIfBNGi+zm5dfNxAD8gfyqnwOODAsnKY/+US1omCsXT6/eV3h2WYmcoC79zg7HwY66FhbwCyghqCNsWI76B7maEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782069624; c=relaxed/simple;
	bh=Rli2EBPCnpdHAnPTZsYKIBq07Y7qOvYbcSeDI7IskUI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Lv9pkkn9TzrvjF7YMKN3Gc+YVD14s70mWCp1gGXVoX6rQp2Xb4gBoW/S6SKHNBAseWretCzq6ZeVp5NWlEVRo2Ll3p6OuSxuotDu+9B5UPCxQGuv1o1QUIAItiI2PIRQCxiulNZDKvXcmVOldQySFk/qu9+CG/MtdFn2CKY062A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=lYk0sILS; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="lYk0sILS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1782069607; x=1782674407; i=markus.elfring@web.de;
	bh=Rli2EBPCnpdHAnPTZsYKIBq07Y7qOvYbcSeDI7IskUI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lYk0sILSvOvkp95i4D5LCSNeOQ3z68ffzEtqwregguR2oa75q729b071UxHV6tvs
	 mStUY5QyUxSJQzjYXUSpxuK3aPEhFhnfaNjDfw/c+l3vn0+qlCbY66C8+/io9iikv
	 ABBIeltOW3s8wYDMpFxjBGnVUhemt5VlGssDM+jeYO/JcwbzSX8Hh6Th4nA2tyVhc
	 jS5TNRrkKrJ52h+3vLivPhqaxQir/p/vrOEbj9fYss48WOwl9NfoXs5x4CwJoBnC3
	 QrOtydbhZF7vZ0DU4OLSv/MMfs9cSvAHjfGYLuQEblASDMZB7EhIVkX7wvmp6sxua
	 u+CbfGKf7IaLrfeP1g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MCXVZ-1wTNDg1cdX-00ArvK; Sun, 21
 Jun 2026 21:20:07 +0200
Message-ID: <a011eb63-a0a0-41fb-b6cc-dca2959e2c77@web.de>
Date: Sun, 21 Jun 2026 21:20:05 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Weigang He <geoffreyhe2@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Andrew Lunn <andrew@lunn.ch>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
References: <20260610041536.2164285-1-geoffreyhe2@gmail.com>
Subject: Re: [PATCH] soc: dove: pmu: fix device_node refcount leaks in
 dove_init_pmu()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260610041536.2164285-1-geoffreyhe2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kLBblDlLxG6gc4gA0h3h0c/icG7UIIFaeEOgLp90b952J+suofQ
 gTv5wm/F+4ZJHiYMB1nXKsnXaf10uUD2HCvmRzazyeyFbRA0B8R7PVWRE31ayq3rzAtbrOg
 YqQL56fP45vAFOj5STybyJxBBNUcFAczVEM3dUUTyVgwYBhDK1q2miLkY4DPdeR71eIR/QF
 kusKDMMahIkchIXUabRaw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wC4hl+kBYCQ=;YsLLAVIh3JHgYLnF41bBjRAQon4
 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

=E2=80=A6
> Release np_pmu on the two early error returns and via pmu->of_node on th=
e
> iomap-failure return, and release domains_node on every path once it is
> no longer needed.
=E2=80=A6

* Would you like to complete the exception handling by using another goto =
chain?

* How do you think about to increase the application of scope-based resour=
ce management?


Regards,
Markus

