Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EB941A91E;
	Mon, 24 Aug 2026 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572826; cv=none; b=t12O82/+w1AYPfhNFGidSQOd7svsKwHsd5f2TulMZFSknL4PfNQXqPBkV4K+zlkonSYqw6AKPXk+nxTQCEo820m85T+OPJ8y6sDuUP9QczkWpzOAaf+aHqM50Zs+D2xij3RkfnCAOxT7OTVYLn8OdEJjBPWqlQc+c06aJ6Tt0tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572826; c=relaxed/simple;
	bh=62+RwwvwBs9flF4NhLotZyvHsTVuGBmcx8T5gxkggCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nlk3c2CJenOUDcT10JmMSIjYBJisB1o1xD+Fha0ae6ZQ0Lnm/pFfOF3oqOc7BxAmdlGPxgbqVTzFES1MkL9ElQwJq0ls8axSO71t68y9z7Vg2nvLFYwj+5tAk1BXDKtEPfNAIvphJAtSSjsazNrbdmSx87jgv1+Fp859sffWOCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=nRCEMk+1; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="nRCEMk+1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787572821; x=1788177621; i=markus.elfring@web.de;
	bh=62+RwwvwBs9flF4NhLotZyvHsTVuGBmcx8T5gxkggCM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nRCEMk+19YYoSnrn4/FSd5GyIGXTcKB0v+NJpXj79tR8/cyI92jLgMqNHc7z8Klj
	 wex/0Gwhy2w4ngXyZUbCweIna1sodJUQtzmd4G3LyalYaxxeX5B6mQzXbXaZEjuif
	 wLw+sz9G3vsnwWnG+klui/PaGDBXf8hOpo3br8Wpy0Bk/YKDaDRpa7aajizg6dDFG
	 TUUQgwBUIa7wJC7Chy/6xANQ1UZjbEYUYrLMPDfgSI1zSYPQs1qZQjGLbKg2GSOE8
	 2LBu5C57hLw19JxZsv9I6RYLuS6qVzSznpIL1NJ6QKlbdMtL6m0r4BOX77eIT8rGY
	 pV6fu/OBn2ANZpAhfA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MHVaf-1xBtcS258z-006g5B; Mon, 24
 Aug 2026 14:00:21 +0200
Message-ID: <4e6642f2-c42a-4ccc-9e6a-51b7c9e05e4d@web.de>
Date: Mon, 24 Aug 2026 14:00:20 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: arm-cci: fix device_node refcount leak in
 cci_probe_ports()
To: Robin Murphy <robin.murphy@arm.com>,
 Manush Prajwal <manushprajwal555@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <6a887550.f7f62383.10ed1b.5875@mx.google.com>
 <5bd32eba-881a-4395-841d-909536262dcb@web.de>
 <566ce354-88f0-4e68-86a4-a8d68bb65254@arm.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <566ce354-88f0-4e68-86a4-a8d68bb65254@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0V8cm89j+8+JIvAVff8UlBokp1Une7vqwO5JSFvU1FFDn/RsAap
 h+dnlg+X5oWn7mI6+OZ6r7HA/KlljaRkZPyTbux8FTdp+uHor6CK2mueeSAWeoXKTuUrhui
 T6kCBPHpYJfYeX1rQNQ0F0/D/NAIteDSbPDSAC0zsooqkN2waGCIz15ll+DOWCeF/U1u+7Q
 7hGzRjZEFQhArv/Qc9xgA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FYML/a6VJwI=;06Vq2be0Kw2lMipAMwq3I6cd51e
 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

>>> cci_probe_ports() has two device_node refcount bugs in its
>>> for_each_available_child_of_node() loop over "cp":
>> =E2=80=A6
>>
>> How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D an=
d =E2=80=9CCc=E2=80=9D) accordingly?
>=20
> No.
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/stable-kernel-rules.rst?h=3Dv7.2-rc5#n15
Have you got special imaginations for the bug severity?

Regards,
Markus
