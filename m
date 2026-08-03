Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEF037F32B;
	Mon,  3 Aug 2026 05:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785735665; cv=none; b=k2BCU3YYMuhzwjyh2sX1bmilMUioKa3oHZ/YZ+N+fXHpXtZGS/TjiBLK1hQTtCQHus9vBCXEdSYoEYbMxifvq1hOxO77ttTEI2WLk8NHsvBzyIXeMPLJNC6stNNOHT6so/uKlNizuLqi4Fnl7G3joCttggfx2EjmP3b1W+8VDs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785735665; c=relaxed/simple;
	bh=y7vaKgXkZ3uEeAZRsP2aOtbFYXzxuM4Kn5AeV14HCsA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=tBikTwFOWyn0JD2OnDJnRpAlbqs2ribUqUDwpj+XKlbTDYouYh6KvoLQYXro4rOtyvtNIzSRwFRO9MjObh2suoqR8fFRSanRD1BgAdr2ZOIEecQpEPSu6arnTJacMNFg5fjYEGAO60RPzGZH53MdBc24I+cqxWtDPKsCmNiFZYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Fa7cB/+8; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Fa7cB/+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1785735655; x=1786340455; i=markus.elfring@web.de;
	bh=y7vaKgXkZ3uEeAZRsP2aOtbFYXzxuM4Kn5AeV14HCsA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Fa7cB/+8AFM1Zc5Wugy+17Il6FRlVozG9ZhKua9Cwbgr4A/q7/4NdCzckDDw5cwd
	 54JpFB1mh7JIIDdTK+eNFr9kUGVpRLUNAz5S9GPC2ziK04N0bW4L7cKq89i8gHzdu
	 /yZO+5aQDWIM61PQi87hCiJ1b/PvsqY6woSBdSNAmcgbkaEF0VFUWeZirwgjVtkvg
	 lcGlPXydlYbIPtoa4kPlu+rfKPjIlQc+ocwEychbm8ZCwaS4fDGGeRWmg76O6igsv
	 5Uaphv8cm7NphqPDrynpiCZMEhYa2wWVDSUhkstxJBiNmU4f360B07eI4GIrdUh8F
	 biw0+bWa7y1ma5fktg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mrft2-1xDzDH0DhM-00n8Af; Mon, 03
 Aug 2026 07:40:55 +0200
Message-ID: <14b5de46-bc05-461f-a7b2-65b2c99b738f@web.de>
Date: Mon, 3 Aug 2026 07:40:30 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] Improving parallel data processing for hierarchical
 structures?
From: Markus Elfring <Markus.Elfring@web.de>
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr,
 kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>
References: <202dfb21-f5a2-4550-8a1f-aa07d84db345@web.de>
 <be2727e1-907e-487f-8522-e5aa694b1c38@web.de>
 <9f8ce18d-67bc-4c01-b3fa-8605c9856b82@web.de>
 <9e187875-e472-911-c280-59dff6b7c80@inria.fr>
 <2babf3d0-8765-4c3d-b5e4-eaf14caca610@web.de>
Content-Language: en-GB, de-DE
In-Reply-To: <2babf3d0-8765-4c3d-b5e4-eaf14caca610@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:meqGhKKcjdJt1Ts+YzCB0XZ6cOk+Bc4yO+c1DW1+nfQLIUSm5jA
 JoA8Y7UTuJQgNHkoUJ2OKmar9xfPJ/ga1uHPsqkhZrBdQaDmsVO4DE2wpKIv7mm2F8K9EfM
 FS0lP94xa6i3EAF/tibKLQZhdBO/lXqkzE/ynyRxHyodEFyPSbumXsB5X+7+dcS/J+L95lu
 bU1Bs4jyZW22XY3ieLXqQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hTSr0q5lKCk=;hbvgNmdmQHChWe4cTEBy6lbjVXz
 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

> Do additional developers care any more for working file inclusion
> also according to mentioned source code transformation approaches?
>=20
> How will development interests and resources grow?

There are some challenges involved especially according to parallel data p=
rocessing
for hierarchical structures.
Will any more design and implementation approaches be picked up accordingl=
y?

Regards,
Markus
