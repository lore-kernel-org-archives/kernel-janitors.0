Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1033C196D;
	Tue,  3 Feb 2026 16:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770134464; cv=none; b=WwmuVjfI1d0N4l+LiPgv8SWtu/Soq/e4PCnS20oltgFc5ECZzf5Rz83kO6QwTTU3jHLheMdu4RMvqIyle1LL9C0bsmKweCXq7lR8jCaoR28ciUkU5p+vngQ6+S4kZdH72qbmlzLxP48H6cOGd5NblXVl2yQPm/gvU2B2PMd4gYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770134464; c=relaxed/simple;
	bh=2MsbjN6QvpuNZkNedXE5btD54U8mCeUojgEpgDX5Amk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=TuslpXPOK2rR/LLGxOJme3eoLdSI6MaR9cJ5j6tkFucyG1PrEvkPvEZ6tXdoDAqCiCun3Wt6m+9XvIgRok6jlffq9PZo+rJPJImFQHuH123bk7ipmHzD4PT4or486rkRLZ0izpl20xrY2TdcroU3/ZBdInoaX0cY1sFDDUunaRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=kkl1oda3; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="kkl1oda3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1770134454; x=1770739254; i=markus.elfring@web.de;
	bh=9/KN6h8aX+hGdKDskaI2dI5kzyiwiPCJBEeNlXbqIHo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kkl1oda3CYbwvgzwNETXt0/2ado8QAh9/sJDtNGRD85Xy0zspzL7v2le+9ubn9o8
	 iKFPjqfQ+KKclj/qLPlM2I3wnZt3Al1gi93mDmHfo9T5Xnq4aS/prSNGmMgOCt0xC
	 tvlrMzi5/u/yvjOk8R+v5dYiI6dLrm14a8jPwIdiGVlVVdIvNd8+/3DmuBg8gxdHx
	 cbMNci+rqrW93EwUHd2Pg1Ny7r7aUMbUGbHF8kCm5dk2j0av/tXemIht2ioHJ8BjF
	 ot0rvR5RVD04bJbyeTQ8nPNIrd551PHYMHOfSGLqy8unsxj/HXfqygJCPZ0VLhb2Q
	 tNWD/aQencshXaU8pw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.207]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MaHWj-1wJZ5P0D9J-00XMVI; Tue, 03
 Feb 2026 17:00:54 +0100
Message-ID: <7ad7ccba-5ef7-48b7-ae45-f631e574df3b@web.de>
Date: Tue, 3 Feb 2026 17:00:44 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Felix Gu <ustc.gu@gmail.com>, linux-riscv@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <20260203-mpfs-v1-1-666b8704f8f7@gmail.com>
Subject: Re: [PATCH] soc: microchip: mpfs: Fix a memory leak in
 mpfs_sys_controller_probe()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260203-mpfs-v1-1-666b8704f8f7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Pf+dRCj08X9aQDrnXWfVA4kXUMsiWKoZIPeXmABZkL8ooxyB6D2
 /7JGHZHkcY/Vy4A0+fD2kBPz+dwghFeOTjwy4uhdriIXLOpErG63ISAHz+b6/oWv2ZUiV3K
 l/rTSuTFOcuYh3wfIuA50YlmMNItW+byyWZ1UuJ4gIXugE6ksYCvezPhECPpvYfYp6DSCHX
 /1QcS8oyfg344Eir4badg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ry2IWOaus44=;rCdtgKL9BYfUlEPUNq6MfOvzCAB
 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

> In mpfs_sys_controller_probe(), when of_get_mtd_device_by_node() fails,
> the previously allocated sys_controller was leaked.
>=20
> Add kfree() to fix this.

https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/soc/microchip/mp=
fs-sys-controller.c#L128-L177

* Were any source code analysis tools involved here?

* Would you like to complete the exception handling by using another goto =
chain?

* How do you think about to increase the application of scope-based resour=
ce management?

* See also once more:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/stable-kernel-rules.rst?h=3Dv6.19-rc8#n34


Regards,
Markus
