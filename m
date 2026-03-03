Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A0D38657A;
	Tue,  3 Mar 2026 09:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772529947; cv=none; b=cqaOIiz98lr0OV1vt5EmINpUWdWLcnmgoq97NDDCHdJGMGDilyB34hs+Gz/c/5IA8OQPMA4+uEMIEKtQvI82ONJkHNME/3Ib1Kn1sJUARynH9a4Zcj9Z1zCT6XYCKGW7GBEaOTtAZV2hh88RBLSu7PcdJ9lGXunT3/5PCWR/ysA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772529947; c=relaxed/simple;
	bh=sp7fVEVAQ2UA1nj02ingD3tDVaDxhthsuSvajgFhQ0k=;
	h=Message-ID:Date:MIME-Version:To:References:Subject:From:Cc:
	 In-Reply-To:Content-Type; b=ZeOA722rtfMGa+BOdYZrUK48uUgSqfF4mohpHkyGD3oTJe6vgXUijzuzNMhnb2xyjRqWld8BavhZTnr506KYtwcT6XB9s1jIdX2Y0XKDJpweZ3q6zwVxu8bV+TIFK4xqLZTQf9b40/u2UwxKebMUfKAbhVxZ64IC5VNjwOJJQuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=QIfjBVtc; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="QIfjBVtc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1772529938; x=1773134738; i=markus.elfring@web.de;
	bh=sp7fVEVAQ2UA1nj02ingD3tDVaDxhthsuSvajgFhQ0k=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:References:
	 Subject:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QIfjBVtc+mQBxWWEEBqV6gwWhxujlAOzX9jVe9LG7q+qM6EKvuVv29FCYjRVNsyf
	 OXSTRlAqhI8dYQzEm0F/HLSg8w1Why/MSncc3t8yZgzyINqHwo1Ft8jH7O6R4hTya
	 ToxmsmOkvdjxMe9B3kvWixu9JyylcpjfDthOI2X1tfgggdaU0rj0W8EfiH84Puo8Z
	 l21W/Ax+XXx3fc1WkMevNIj2j0NyATOkwOvNTFUAvDiom9x9NJX8FQRat12fJimWJ
	 z1POXx5hBIW3HbBYuGCErIa7634QwCqxNQgRq6DNaq/znpESDo7Thj9jG5aWrR42s
	 XvgvGiUkPlLx53l8YQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MRW2R-1wIcJY3kJR-00IvbO; Tue, 03
 Mar 2026 10:25:37 +0100
Message-ID: <26b4b813-4ded-403b-bcef-3941b4dbd0fb@web.de>
Date: Tue, 3 Mar 2026 10:25:35 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Felix Gu <ustc.gu@gmail.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Srinivas Kandagatla <srini@kernel.org>
References: <20260301-qnap-v1-1-8131c9b2d118@gmail.com>
Subject: Re: [PATCH] nvmem: qnap-mcu-eeprom: Fix struct assignments using
 commas instead of semicolons
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
In-Reply-To: <20260301-qnap-v1-1-8131c9b2d118@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:q7g9gHJ1FcckDNVYZy9p7XwiZU+KU6P2q8OVLAU3vcO7zxSaE1F
 k6NsV9dEP4PsCS6z1j213i9S3LDm9hf9pkcfkQ5yKD2rbPvUVuaYjNvi5/3dtaS6+okgcAy
 DaaYrVIX8p5bYewgEVNauaduyRMAs2HU54HaiNIQEOaOoTY628b+l3LF+rO+WqUZZB/WJvU
 /44UeQJnlrMyGY01cCcsQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0RdvKGMcHRg=;E5tF9B8WtC4T98o0l3TA4I5cCyF
 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
 FZxK9Yz+xK2qC/bcIJU/DaVp17DQf

> The nvcfg struct member assignments were incorrectly using commas instea=
d
> of semicolons.

Would a summary phrase like =E2=80=9CPrefer separate variable assignment s=
tatements
over comma expressions=E2=80=9D be more appropriate here?

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.0-rc2#n94

Regards,
Markus
