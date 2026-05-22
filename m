Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768FF3563C7;
	Fri, 22 May 2026 19:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477970; cv=none; b=BCoVH2nu6hrqqX+M3sZGpbGmDnDq57cSxKDmvJiY0eC7LQG8G1lVnODqWWF7IH6t8OZo6Sv7fAWm+ZYQzZwlcVgdZPJUWYevxiU1Apf7MAVlnfBKKz/SypsYJtPjgZPSnQBS+YPrZowqiDbh6q11y/ozKVwqv5y0QdhWGModOsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477970; c=relaxed/simple;
	bh=rSGSfg4HNocKCYckQK1TU3UBFOchokSC4dL5Ob65f3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DqA7FbHMPtg9g+83AZ5azgGJ+kX9Mi30wV42MmXnjqmksUTD/ILCqkGvYZtYY7KrbI/DH2wGa5jhhOZWGokeNnZd1CQUB7/9cvC7D3KpNcBiV9SJjTXiCTA8biFSFMbocd7t6TJ8KlZc4MsQejsX7KzGhty+aGlhKLQHx8Gz3Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=CuzK3XCd; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="CuzK3XCd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1779477952; x=1780082752; i=markus.elfring@web.de;
	bh=rSGSfg4HNocKCYckQK1TU3UBFOchokSC4dL5Ob65f3w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CuzK3XCdIhuTQn63SIDV4dv7keNP73aVvNi0cfvysKYoEUDCitRNBXHAsNL2RnMB
	 /i0ZT5CFuc4NZ35ECzU8WXbyInhj6nHaJhhwprTjVnHiOIZqGzWQIgpS/VrXIJoLU
	 89zBpeSXolXysYfBbUGzfPFoHK/w/oZh6C4B+SB7S0MfBFkWPr4d86sihAjhu4hxv
	 KKOFOoAXzzN9eIz+0IpC1u3rC/qdD/va64VuHm6qCvuENrQagV8MC+ksdZ5mIPDIR
	 8FIkz0rmgo264eCnJW+A1se7CDX0kVRDhO0UBnS2okIlxXkdaBo0X/B8z/nacmRIZ
	 iyrRXjg3vYKEDBipxg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M2Phc-1wULWg2eMg-005wmn; Fri, 22
 May 2026 21:25:52 +0200
Message-ID: <5c7dfb0c-2498-42f0-9561-c4a92e4b4bf3@web.de>
Date: Fri, 22 May 2026 21:25:51 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: clocksource/drivers/owl: fix refcount leak
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 linux-actions@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <20260521041901.542964-1-grandmaster@al2klimov.de>
 <c1aba09f-0a74-485c-b787-59b215a3bd88@web.de>
 <fe494c36-04e9-4714-ab49-5f05bed66c9e@al2klimov.de>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <fe494c36-04e9-4714-ab49-5f05bed66c9e@al2klimov.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1epvK6hBcSJ/OL1jU/4Jx6ZegRfxCztQ5ZH7iNLhEU76WvxkEV7
 jimDXHlF+xPbCtgmJuu6i1h4TePeiMEQpZqPbQHOe/sly2hHn94bCsxrxDlPbb4Xr65Nnte
 uXRH7N0sfFqIBQsS9KT05hF6qnTEsBaRSsiKgCsAfOkpnAki0u786d50+XRQ1c2v5xRrEWf
 a1oSXnfLGmyFiqQM4cptA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BwPYaVTC8os=;GWeSVwP4VmiDNXX+ps8hFyICTjd
 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
 HXZSdDS6PXNtn7BXAAfyzeKEdKcErBqEoxqg=

>> How will chances evolve to adjust variable scopes accordingly?
>=20
> Is this even a thing in Linux?
> I mean specifying C variables anywhere ex. at function begin.

Development views are evolving also together with the application of scope=
-based
resource management, aren't they?
https://elixir.bootlin.com/linux/v7.1-rc4/source/include/linux/cleanup.h#L=
136-L153

Regards,
Markus
