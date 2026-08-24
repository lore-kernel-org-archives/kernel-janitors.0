Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BF33E3DBC;
	Mon, 24 Aug 2026 07:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554864; cv=none; b=Ofvl23ZZgQ8Zf4slRWJPEVqeWUmUWEv7dQ3OuCa0Cw2KdXDNwMwp/mn/QoIE8aD0+TAxoIsqqEGED+wPSyrJ06OJ/7btyi8INS7PyJhqKwj2zKea3DJ+CEbyaYWSv+lYQPDCWhVf8ix9dapZnmma+iT71i2eZDBNL249BMKgMwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554864; c=relaxed/simple;
	bh=jTX8OGqNjsZhq81jH+pEaTGZV+CPm2T/jV6mqFiZCmk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=j3pRLSEtLHEkqOGPjmbahHHXZ6RoF/wEnY3iTyMoR/dYJG5lvDzQpHkm50r8S09v9ydfCSyYK2U3Uu/DT4j3FziOxO+mdntZNeweUdh7McPOWBnbhSM1AwndAZhp6ov4WIenNdYS61843XFBg2Or5oLN8XLUCHT0vlpDEQ58BgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=JeWs7bop; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="JeWs7bop"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787554835; x=1788159635; i=markus.elfring@web.de;
	bh=jTX8OGqNjsZhq81jH+pEaTGZV+CPm2T/jV6mqFiZCmk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=JeWs7bopAqbn/SwhpiFb1UixNhb7o+hrIGykRIyAPJs2IigpbER6BlYeZAR3dGvk
	 A6vYWAvBSfdq+CcQ4yl54DI7/VEvig6x4jDcDdSb1sFkSH56cF/KSTLTnbx8F9R6K
	 yoKtbXRvw+Rq93D8HvVuxr4EnhhAhE3/hiIzxiA9xKtHDEsayudCr4O8qYcTcsYSp
	 mW723L0lb9Vkv8BEBtA9Irqjzz0v20dPfdR76Zs7Q8+PRLa9yBGGeAjLdyw7GJMSN
	 y5VLaZ1iQPhekCEFQJtRZFjMnbuiWDZ2pudDi63iqQXH1VkBv+bJyAPy9qEEQUdVC
	 0/TpntqEKA5QoYrBEA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MJnrh-1xDReM2L8L-00QStF; Mon, 24
 Aug 2026 09:00:35 +0200
Message-ID: <5bd32eba-881a-4395-841d-909536262dcb@web.de>
Date: Mon, 24 Aug 2026 09:00:32 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Manush Prajwal <manushprajwal555@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Robin Murphy <robin.murphy@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Kees Cook <kees@kernel.org>, Punit Agrawal <punit.agrawal@arm.com>,
 Will Deacon <will.deacon@arm.com>
References: <6a887550.f7f62383.10ed1b.5875@mx.google.com>
Subject: Re: [PATCH] bus: arm-cci: fix device_node refcount leak in
 cci_probe_ports()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <6a887550.f7f62383.10ed1b.5875@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YS48fue2fxs4GPaG3KGVc1r5XQnnDlxSgfztRYnzVizHMgEc0Cx
 bOpghIwvNuOxYz1mTIEJFfBlJCImCMlUJORIxQjPEp2dFXnvJa7kH/038p9ZGOa6qH2TAK6
 /C27UpuB6BQ3IYRlotyX09mkVir+VXJHUwvPVCtnO2Zknk+Nmd3DAoHpda0DB3TeRXqcUmX
 jTonFd3isQkOyhcqYEm7Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:O6y1AQSM1eg=;/XK+cUFuUL78DErUidEer4uWchU
 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

> cci_probe_ports() has two device_node refcount bugs in its
> for_each_available_child_of_node() loop over "cp":
=E2=80=A6

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?

See also:
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv7.2-rc5#n145
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/stable-kernel-rules.rst?h=3Dv7.2-rc5#n34

Regards,
Markus
