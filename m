Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C440CA55;
	Mon, 22 Dec 2025 01:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766368484; cv=none; b=fhR5iGDKgobM+BueL8kH0Tym1LGgsgLJJDi1ub+bWKS1EZFrldqC2tOAnraZU4lcFGVMwNAJxJ6K1aIjXvc+wKvBCsz2JRZRTBQEEPETZ8uF13YR7oABQHU/RSl+beIfFr+YC4oY8nCCA/Sh1gI3NCHgPWIUi3VFjfQ5hODqP5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766368484; c=relaxed/simple;
	bh=hstSQlRrclpj3vOekMKCdO+1kUTSaifMxDJmnxbHoqc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WYsCmm4O3Sjf8pae0fzu0yUcrQazaKR5xaTSPHwx/pRxd9aanL2j9AnknkYxuAulTpOcQpprIb3TUnkMdkIagYuGhB0EMhqXf44aodLkFsoYeBLuOc9xUZFdeTPi7z1fq2VXlGueU80jtZJ+EyKc+ibpJFtmgaKZNncslaYvfAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Fs1r3HLm; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Fs1r3HLm"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BM1sC2o92481742, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1766368453; bh=hstSQlRrclpj3vOekMKCdO+1kUTSaifMxDJmnxbHoqc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Fs1r3HLmOwgyGhTU5Tbw81mPhJbxUnAcej2U0PFOAcsZ6i8DJybjmNm4O8UbRa8ag
	 wgEgNaEh9HL5x44MFM7zP2YjHmvYYo4IoR8XvQfehSysv9Ea08nwJ5MyDiF3UdLIDN
	 +8hiHmIUpIlJZ5w9+nv/MoKzcDrYq9DmrJ9Nlpup8VQfRhrLi+HGsHPgBOI/DHBB69
	 fxtyb0MGU5oJ9fOWFOtGmqz6sHyoP5bREJRRVNR27wSfWNoAarwZATSq/DbRF1zymF
	 +OcJ9FNyGPuxs+Hll/DstMVS31C1sY0wow3EbsMCVMvdovoopDJBjlhcehNrrd+JDh
	 Hc0WGFrxeXpeQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BM1sC2o92481742
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Dec 2025 09:54:13 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 22 Dec 2025 09:54:12 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 22 Dec 2025 09:54:12 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Mon, 22 Dec 2025 09:54:12 +0800
From: =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        "Takashi
 Iwai" <tiwai@suse.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org"
	<kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH next] ASoC: rt1320: Fix retry checking in
 rt1320_rae_load()
Thread-Topic: [PATCH next] ASoC: rt1320: Fix retry checking in
 rt1320_rae_load()
Thread-Index: AQHccY0LFtKkl4c9ckC9yVIttVbc4bUs6EOw
Date: Mon, 22 Dec 2025 01:54:12 +0000
Message-ID: <98f9d4af7fd245358d49081fd3632bf9@realtek.com>
References: <aUZiNJ7pzuahXFYE@stanley.mountain>
In-Reply-To: <aUZiNJ7pzuahXFYE@stanley.mountain>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

PiBUaGlzIGxvb3AgaXRlcmF0ZXMgMjAwIHRpbWVzIGFuZCB0aGVuIGdpdmVzIHVwLiAgVGhlIHBy
b2JsZW0gaXMgdGhhdCBjdXJyZW50bHkNCj4gdGhlIGxvb3AgZXhpdHMgd2l0aCAicmV0cnkiIHNl
dCB0byAtMSBvbiB0aGUgZmFpbHVyZSBwYXRoIGJ1dCB0aGUgY2hlY2sgZm9yIGZhaWx1cmUNCj4g
ZXhwZWN0cyBpdCB0byBiZSAwLiAgQ2hhbmdlIGZyb20gYSBwb3N0LW9wIHRvIGEgcHJlLW9wIHNv
IHRoYXQgaXQgZXhpdHMgd2l0aA0KPiAicmV0cnkiIHNldCB0byAwLg0KPiANCj4gRml4ZXM6IDIy
OTM3YWY3NWFiYiAoIkFTb0M6IHJ0MTMyMDogc3VwcG9ydCBSQUUgcGFyYW1ldGVycyBsb2FkaW5n
IikNCj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8u
b3JnPg0KPiAtLS0NCj4gVGVjaG5pY2FsbHkgbm93IHRoZSBsb29wIG9ubHkgdHJpZXMgMTk5IHRp
bWVzIGFmdGVyIG15IGNoYW5nZSwgaG93ZXZlciBJIGFtDQo+IG9rYXkgd2l0aCB0aGF0Lg0KPiAN
Cj4gIHNvdW5kL3NvYy9jb2RlY3MvcnQxMzIwLXNkdy5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvc291
bmQvc29jL2NvZGVjcy9ydDEzMjAtc2R3LmMgYi9zb3VuZC9zb2MvY29kZWNzL3J0MTMyMC1zZHcu
Yw0KPiBpbmRleCA5NDQ3ZTc0MmM2NzIuLmMwYWNiNmFjNDYyZCAxMDA2NDQNCj4gLS0tIGEvc291
bmQvc29jL2NvZGVjcy9ydDEzMjAtc2R3LmMNCj4gKysrIGIvc291bmQvc29jL2NvZGVjcy9ydDEz
MjAtc2R3LmMNCj4gQEAgLTE0ODAsNyArMTQ4MCw3IEBAIHN0YXRpYyBpbnQgcnQxMzIwX3JhZV9s
b2FkKHN0cnVjdCBydDEzMjBfc2R3X3ByaXYNCj4gKnJ0MTMyMCkNCj4gICAgICAgICAgICAgICAg
IC8qIFJBRSBzdG9wICYgQ1JDIGRpc2FibGUgKi8NCj4gICAgICAgICAgICAgICAgIHJlZ21hcF91
cGRhdGVfYml0cyhydDEzMjAtPnJlZ21hcCwgMHhlODAzLCAweGJjLA0KPiAweDAwKTsNCj4gDQo+
IC0gICAgICAgICAgICAgICB3aGlsZSAocmV0cnktLSkgew0KPiArICAgICAgICAgICAgICAgd2hp
bGUgKC0tcmV0cnkpIHsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmVnbWFwX3JlYWQocnQx
MzIwLT5yZWdtYXAsIDB4ZTgzZiwgJnZhbHVlKTsNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
aWYgKHZhbHVlICYgMHg0MCkNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVh
azsNCj4gLS0NCg0KQWNrZWQtYnk6IFNodW1pbmcgRmFuIDxzaHVtaW5nZkByZWFsdGVrLmNvbT4N
Cg0KVGhhbmtzIGZvciB0aGlzIHBhdGNoLg0KDQo=
