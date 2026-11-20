Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158407;
	b=3rCCAJpFzSXYNXkdYeHnkmr+/jwAmvqHPgCauAlYm3oMduxPwgvZ1pE3EcPmICDPh1qj
	 677gRaSVOnugkrkPQkaFVrYxekLQ2FDK07leiBbBoa5LzwaM+cwECQZ2MnJLVTUTvewVh
	 xOyRtJO9PzR+Y+FGKA2ybbU/uIpbRYQen+GRvzwWuWHn6hlOxwXdh08lYQC0z3yZjnj2Q
	 dB7LPEnAW14xL1tqbI3UvI4S2yvzS0UrmOY/Dmiv0XvH6mKUR9nanxi9y6Ko+Tveb2rMl
	 dGf4qn7hKEPfQtPbuAHAu4TGarJvhT2fPgNk+n48K9jRGwnCT8K4DWiw1WTOAuqzuZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158407;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=CY72Zq7lo9Y2YudDGog7+uMWBPN0lY7PTfwCBrr8w2w=;
	b=l3SKNQFd6HwiTiiKrGzr90bpNROr3zjS+G94toXexYCDaSY735GF1AbEJu0R2Ez0VX2t
	 5uuH8WzVlI9sUIQ35/LvWhAwk5uHmvrSTs3YZB4nH0k8XmmsJkyX5BHH3+IIudDATa/l2
	 kcSYr1hHbhtSATipJ/jXa12cFqDCLiP5zwemV9+8NZ2byshIr8NtaOFViWNpN6O3UCgn5
	 ra/xjE2F0KimeCAxdJB6j9eiUgUn0ufcve8Gm3t2Zz8lCI02grZrvR47ht1Qj0J3dngQ6
	 fhflgnf/GMyWjtvSi9UXZx4d1V6t2UY7NsYYpXZYtkl1otizgTwHWYOp1RT7xBK0bKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=t+bjaloX;
	arc=none smtp.remote-ip=212.227.17.12
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610A9606A336
	for <kernel-janitors@vger.kernel.org>; Fri, 20 Nov 2026 07:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 610A9606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=t+bjaloX
DKIM2-Signature:  i=1; m=1; t=1795158404;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:T2DPjBFMTsKnykXpgqv4ZgIiYhuH
   9ZAv96lOtZGd91NXG9+laRSFZzlC9YBeAsjRdMNJsgsyAIaWWntXrRe88nGDmihRPHPsv7MR6cW
   myOGyw4BMpA9yVEd9XMECEHHnxRZmC6BcjVRrj8Yys0pM4s1+tw0ZUw0Fjs0q2pI4fzgva12Fik
   stzJv9snfzuBGqUDtb2qOZZ67nqRMS9Z/OW4V7T6Q+rmo/9rdwIB2TNpKYpKO4uOkDy7YxaycOl
   /36teR0+/Rmy3P8LHRRQdR4aRdQ+H8D1pUIw1JaVuDJOEOCfCYA7LtpSE2hBBr4wl/l7G5wheaK
   3CGpWLXJ0Zqq8g==;
Message-Instance:  m=1;
 h=sha256:
   LmQBWAL1+b2yn7l8bprLnpnLOjsOXHvK8lyGpn2+mwc=:
   CY72Zq7lo9Y2YudDGog7+uMWBPN0lY7PTfwCBrr8w2w=,
  sha512:
   AUWxHWkylSOh20l8dhtSXNdHLf4zsyqjZmhGSydftN5jQL2LqPui3E6s5ilbfe69hWgQZIlPPJ3ZC+1jGgNN8g==:
   +39wfESTkURYC62uIy+wzVsmAn4Ov8mLqATMhYd7n4+khrt4mNVDbNIpbyQhDIIG9RjIIbwFGaUBcYCQcMnXWA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795158401; x=1795763201; i=markus.elfring@web.de;
	bh=CY72Zq7lo9Y2YudDGog7+uMWBPN0lY7PTfwCBrr8w2w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=t+bjaloXDUk9AtfcpWQ0HpLkJjaJujbpo/W+6aOkXZw3dk94M98XTkqKi1DABkKJ
	 neUICcqhG7PssIK5vT5y0N3+5/6MgG9ST1FsO+mihTBNhFn6HrIQfyDMT+m+Gw6Aq
	 W6M50eG1rZhR0V18+KTzLROQPMbHrDL2iVDegWxf/FJroclK0cnbEUD1TGgMERT8e
	 Wpy1K5Tr2NgNUVlME/2S9zsWEalCJLjD0+Ao4t5r3lhdHB2lNRRUKQtoXpMTF3nJ2
	 A2vf7lNBb0i9cE2b9rRgNKnf9FihfHtEydmLyZm5LsFcn8T/T8TZO9iBwMhovoHFt
	 D0LoOsahJBRSnmYDsQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N0qr9-1wXVci1MZB-00xEj6; Fri, 20
 Nov 2026 08:06:41 +0100
Message-ID: <b0dfbe4b-53f3-41fc-a0c3-5158bef05259@web.de>
Date: Fri, 20 Nov 2026 08:06:39 +0100
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: usb: bdc: Use devm_clk_get_optional_enabled() in bdc_probe()
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 linux-usb@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 Al Cooper <alcooperx@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Justin Chen <justin.chen@broadcom.com>, Neill Kapron <nkapron@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <07112f96-430c-4109-9aca-e5d17e333d67@web.de>
 <111e6c03-017f-47f2-a941-cba45697c1e4@wanadoo.fr>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <111e6c03-017f-47f2-a941-cba45697c1e4@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SI0aCLEtQxAlvDvzrHnPufKePai99XkibqrJMckMmgFvstWfi4A
 nmJ8+h6p8+/MNgCYj8ECDZsEmxXj0Go0LLsbuJxFc18oU8ChJ1oIw0ECx0szml6lJWtzN+C
 DOxp2v1hkpvIunYdnZZ0Z4kfSaXvMA3d7ve54fwCmL5Q2DKtWZ2xj31oNr2P/Nf/anDS+sY
 vQqlRGKBbOV2x9m1NFYHQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OGIMLH3Rgqw=;quzV4LLURFx7hI8ksA31DxVgfgm
 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
 w==

> this patch is wrong because the remove function and the error handling p=
ath=C2=A0of=C2=A0the=C2=A0probe=C2=A0need=C2=A0to=C2=A0be=C2=A0updated.

Thanks that you pointed special patch review concerns out.

https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/usb/gadget/udc/bd=
c/bdc_core.c#L483-L583

Regards,
Markus
