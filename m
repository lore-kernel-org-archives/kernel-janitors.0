Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AE017BAF
	for <kernel-janitors@vger.kernel.org>; Sat,  8 Jun 2024 06:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717829587; cv=none; b=MTLfF5pIOC6L5I6oKEwz3kWDlouyNxxdFiFZvhT9ovI/ttgfw/E4z5osYh2gCrgUc5RHOPP7G/CczufrFIG8EYszaycX34fViSKWuBwcEdUtngiPt3YWwBT2YRaSvYDKCPcKOaW+FizuwXg63/DFfeMwCyZ0C+c5GkWoGwqQ05U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717829587; c=relaxed/simple;
	bh=oQIHcN3t0mGos6nkIkeUNHAGyPzrGqA67aW9fAkcaHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TmbfaOCh4Gm0dHYYJLowS6SOfzr+UFd2JcT4oPNnngOfceQ/O7ENPIJ87mlktWsVg+ht7umP+ft1jMvcnuxXHAARWUWLrO3eaJ1g+gM1aE6JxB2EVcLEHGzjcw0fDumS1H0JDL0i1GfjXrnCoycNUVJev2h7VbD9fwn825Ki8Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=VaeowVvQ; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="VaeowVvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1717829576; x=1718434376; i=markus.elfring@web.de;
	bh=oQIHcN3t0mGos6nkIkeUNHAGyPzrGqA67aW9fAkcaHo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=VaeowVvQ4DeKPp2b2Ghs1Aqt80Cxcfxat3mgzFQcSeg74a7N9/aDJmG7jbAB2bEa
	 SsAV4TbQbUx3i4t7ZmgHf50D5hp2ayoW52QNueuEtKsrp7TsJDUAwIRERyI/m16bk
	 Abv/YaGXVbnYUBsNlPmZyqxfXDviYzroj7YmA8aZyRbL9CQB3MPhyQ38S3p8kwhhI
	 HhHIEzRxn6jOyjK1gH9Zo0+WcZyfb7flopJQtOLBvAHwY0PoKtW8jqAIAVVkiAO1v
	 QGS/PtkCPVWdE70yA8hazEKg2V6I08pDGVOjqFME4tb1Dxqq5yixd+YoGAwkp5iFG
	 WNmOqDQp6iDnX0YMyg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N6sBp-1sVEiF20nn-00ww3z; Sat, 08
 Jun 2024 08:52:56 +0200
Message-ID: <63657b4b-b516-4993-8836-0b757f968401@web.de>
Date: Sat, 8 Jun 2024 08:52:44 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] Determination of lock guard data (with SmPL)?
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr
Cc: kernel-janitors@vger.kernel.org
References: <7eb9626c-da7b-414d-bf50-da1eed27be31@web.de>
 <alpine.DEB.2.22.394.2405261847380.16852@hadrien>
 <9d79a2de-10fa-479c-b720-1c4a2f51782d@web.de>
 <4bad748-afee-713a-a2d7-30b6e5c1cb28@inria.fr>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <4bad748-afee-713a-a2d7-30b6e5c1cb28@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ciHrHpRuRZdVO+RhDqKLoRKld7/wpDTU2cSQ2v2zr2FYd0MSYPO
 X3Hq8ja7VA/vEasW/3nevigCA11gPnhBGZZdT2bCCmgVthXXZe9bQZysQ8udXT0fb+tFx/u
 FeMynjG8sYKHj3nAHzmDZgD1mVq80cDBJOF12WhbBRN2vFoVm4iTRCRKNE6xQTgfGbaCQma
 7Zbzs7eWZ+2MOOdIGC5fA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3vd+JJxa6t4=;UbMDIer3No2WVxeavpHF4mQbNrv
 8hV/K65L39f9JoM/4f2NaPCEnV+TZtVk/ArKmFQNBctxhtqHKgA5/NepbmeR+L8w9+++5Hzk8
 cT7jDb16GwaZhFhig3J6u0TH9T8n8vifQA49mHQkgIcaSvBVKogPt+9q/4EfUXbluqr99FEt6
 uwNHiGqZTQ6aEXDUEOJlRNrI+bQ3MNGY8mBgRByrLZPVqfFU78XN2uVeNep4f/pcho0HarHnl
 R7lhQa8sdjUULd3T0dYUwQMpPfKsFtjc4gm0sc6hckNGvwpcW9dW1z9myAjqmr+fp1Ii0sewj
 Uxi4SPVYtOsEBdoJ7ah4bJcg0A79o971mnvq8cZrMtAvGMPJRUc9Q8Pjwil9siR/4EDk0pZEn
 /EgQt+bvlAqnebCx+5iSNTTf9pLMq0W+EBmgnIzxx9A+lVdu3+NliHsnFj0W2gvO3UkjgICXN
 iPVPUOShhbzwaCRe+r2ZyQ9SzzeWRs0kLEneDBsgtcSrf4L/IgcoBM+yIsLlGMKAH1ampzlRY
 2Mk4Bw/VWxGn4oLcwbuzzZQRgOJUMKL3K9dVUJRGPFBQrHVpgVu1FiTKzMeCPLBdJDjajkkw7
 UmQ6z6OGG2/zYhG7nQ7L1RJdr8JzXBK/I1DF+pKrTG6+MEolfUDApzmscz54apgMj9wrundJI
 SOqSU058CLly+CfkJQRgxjfEJr/TeJhyhBe+xw+vmliDsW47OlLPs/8EiBCk4qTfGrl0PMTto
 Mxu+Syu81vUhQISBsFtaqEryOFSscaezzoJC6W90iDqCR++4BTwZ+Ph2yqWiwNP5V6Yz7xL1+
 dXtwVt3yTNyOVDx2ELtUu2OACsgbWyJ4wg/TxT6oDQU1Q=

> What exactly is the problem?

Another development concern (for example):
I would like to benefit a bit more from information which is provided as p=
arameters
for macro calls.
https://elixir.bootlin.com/linux/v6.10-rc2/source/include/linux/cleanup.h#=
L179

Thus I hope that something can be achieved by =E2=80=9Cadvanced=E2=80=9D s=
ource code analyses
also with help of the semantic patch language.
May I expect that some data should be presented according to the following
tiny SmPL script?

@display@
@@
*DEFINE_LOCK_GUARD_1(...)


Test result:
Markus_Elfring@Sonne:=E2=80=A6/Projekte/Linux/next-analyses/include/linux>=
 spatch --include-headers =E2=80=A6/Projekte/Coccinelle/janitor/show_lock_=
guard_definitions.cocci spinlock.h
=E2=80=A6

No data are displayed by the software combination =E2=80=9CCoccinelle 1.2-=
00008-g75525032=E2=80=9D
(because of the specified SmPL asterisk) according to the selected macro c=
all.

See also another known information source for further development consider=
ations:
https://elixir.bootlin.com/linux/v6.10-rc2/source/include/linux/spinlock.h=
#L537


Regards,
Markus
