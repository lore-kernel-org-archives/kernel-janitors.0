Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C0B275B1A;
	Sun,  2 Aug 2026 10:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785665235; cv=none; b=YQhaKD3yF6on2bNsRNN9Gtk0heY0c6N4A2sNkzDtNjsLzbpyPjVJdkgVdpQCh0GEw1ve+50hSt5F9TcUShsiLCR6RI4ORvFa1LVtxlxPRUXv6ZnVwRukFDDHUC9q52KdE2tALIv0wX2fCjowq5PWTchI51GnP06SaKtX3GjhT4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785665235; c=relaxed/simple;
	bh=QUojRzoarcedS30GW4krky/2dS41CmTjGQkPIE707oI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=o+KHN2/Yc/MJgqHtiUcDNTifzXyTPdchOOtMkzlziimAZY3IUQaNSN/6mojGIYSk/QCJi1PcOa1Oh5jS+0MdctKUj72uTgBlsvCj01LvfCnM59XupSqNe1I26eNHtD7zCoD8VMI+OTYoPw7SphZemlWcuGJr+NcvWalzNK6fWAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=hKnMI/49; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="hKnMI/49"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1785665228; x=1786270028; i=markus.elfring@web.de;
	bh=ZedcYkFJAAYIFAuz/Ch1/yB9b4PGkhKgYVoKK31PvhM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hKnMI/49FoMnC3XU3WHok7nH+CKTe1AyD95g9xXEdrFF3EM4uSrCugoRyI3uKNSB
	 6yIXxvhqTsWUF/B9Y0E7S4Ka8kdIedzH8QeKz1SvH4Ah64twvAbjOLxbUVAzyW8XN
	 8r8kwd0a95qAKML4xsjXmD2lqqEk/6jxyehRbcSpt0UhAVlpQgofxsIrXXWRs8xsO
	 PjCs1LNLs+78iqvOF/05dz9ES4SXgy/RJordu4uk/6Pg9jkOyLcsIduxvJbmsVgl/
	 Oxb6ng8n98R5LlqCIqha2FleNVXnl1mSGFwaJCoxl/8XHA3PtPvLpFZcsziaVVx+S
	 0nQSGVMpA/yzINxYRQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M7usw-1wuIaU1iYk-000w6W; Sun, 02
 Aug 2026 12:07:08 +0200
Message-ID: <2babf3d0-8765-4c3d-b5e4-eaf14caca610@web.de>
Date: Sun, 2 Aug 2026 12:06:51 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] Improving output for single characters (with SmPL)?
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr
References: <202dfb21-f5a2-4550-8a1f-aa07d84db345@web.de>
 <be2727e1-907e-487f-8522-e5aa694b1c38@web.de>
 <9f8ce18d-67bc-4c01-b3fa-8605c9856b82@web.de>
 <9e187875-e472-911-c280-59dff6b7c80@inria.fr>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <9e187875-e472-911-c280-59dff6b7c80@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G8QLRAClcsjnESUoubTUXmTC7HGxm4Yd7gr7H9I0CVROezHUsI1
 nM9j1cUHJpY8nwOT11botvXfcR7t6XSqRyPN55bqIP0g1XacR+obSlekEXR5Ma7D87az6No
 rdDyKltyYUB+bGXJLGpm0l5f3L6OmZIZ5Ku1PFynO7iXqnmijtMglQGHIsMl/LKLINhTaSX
 b9UWH+l98PQqsXu2eaO7g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FFEbDe0T8ng=;J+2bagisKbD2HZKnV45Wets1SjF
 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

>> How can the generation of duplicate difference output be avoided here
>> for other SmPL script variations?
>=20
>                                             =E2=80=A6, but if you have d=
uplicated
> output about herder files, it would be because the header file is includ=
ed
> in other files.  =E2=80=A6
I would appreciate further clarifications for corresponding case distincti=
ons.
Is it usual that header files would be included multiple times by other fi=
les?

Do additional developers care any more for working file inclusion
also according to mentioned source code transformation approaches?

How will development interests and resources grow?

Regards,
Markus
