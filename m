Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9F6455162
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Aug 2026 14:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787928759; cv=none; b=dw1A908AGLY9ExQwQKR49xbupbg76SHeAyi8Vq4bQBx5VtYa0EQ+rpVtyf33Tt7KG85bHUeor4dqQ2ZWicz4Maq/WNkma++Yz91xjiJyOZnZle9vdM4UWOkrLWbfq8ShEtBocANBg8tyMEClCOMBak07zake4+qL6MZvwwoBLiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787928759; c=relaxed/simple;
	bh=aBEb+nt1MHMspoMMEYk1waL7DafR90meeREWzQFWE7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MKR/FwSpEAKbGPjeLP+sdvN+7NKfFQX/us6kM6MUlrlO9x8CyaTejacL5DRyjTTVwWge11/o+ug8vJ7w60JbUVUrD/3S20svm0nskQhZ/8GnNxJuvObymUhUZJpZPfv40Ypb3I0wCqa7gD8dlugOCZ9lVfK51BCxFuz1tAIh3yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=XKVb1rC2; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="XKVb1rC2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787928755; x=1788533555; i=markus.elfring@web.de;
	bh=Oi8mFqO0i1GmDMbigG2Xu4rRbVMaeiiLDk0Wi3N+EaA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XKVb1rC2dhw13Quyvmtq4uqW8g0SJ6mEAR7j2EpSgSyYJIU6tdX1cdUvM+puENIZ
	 gQDa42iuS0LeMxkXYl1prQKHbiNi/782W/zUNS92FO29A3+i8vZoyYZD9/IdzMvh+
	 mZrk2bBR/ow8xyojL+Ztc2DLHgUiZHpulvz0sqcZ0dEzTzIp0qvWQqHK6SZeeI6fF
	 MZ73qrJDZDkjeJKIiPeH84QPlbKZD4Z59kGNB24kmO7aiq14eAxVio3Mh+3Ywoiy/
	 7lDKqqqujagiF0ZGN1HpLP0oSuHph0i/NHIHjSg1muGuDwC0zy17BAtu19CtzfIPT
	 IZhDD+YCKJS2MIRQQQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M3m9J-1x0FBw1pwp-00EZEa; Fri, 28
 Aug 2026 16:52:35 +0200
Message-ID: <b2fd77fe-fc97-412e-a5d1-69b88e27f61b@web.de>
Date: Fri, 28 Aug 2026 16:52:34 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Improving support for deleting selected macro calls with SmPL
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr
Cc: kernel-janitors@vger.kernel.org
References: <9e729258-a720-4b8f-b0f0-e84f3a984aef@web.de>
 <a0b9259-987b-1c92-2e86-3409ecf87e@inria.fr>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <a0b9259-987b-1c92-2e86-3409ecf87e@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8jdIVDywyCDoJ7d0LIhGEG5aCj1LQu/WuoI9HNDH4U6Ing1Rp1J
 pdG4uqJDRkJATB72vX89P6X96uBtdLU+oLanBYPk1AjkBnivmBcuoY10W4TwK1Rz39N785m
 G65NmMD2Bg7cW74FlwM58n7GRiv3gYpPlXNuVu7tfiI+lx7almsRlXTWp6dxNUy4dfjBO52
 9xeDzUyE5P6mKUGz3JsUg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2cn/LVrCLR8=;ZX0AFiit87aXJPCa9gR//ds7CcM
 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
 NA/fqLuQ==

>> Another SmPL script example:
>> @deletion@
>> @@
>> -READ_ONCE(dev->mtu)
>>
>>
>> Questionable test result:
>> Markus_Elfring@Sonne:=E2=80=A6/Projekte/Coccinelle/janitor> spatch --pa=
rse-cocci delete_READ_ONCE_for_mtu.cocci
>> =E2=80=A6
>> invalid minus starting on line 3
>=20
> You can't simply delete an expression.  The resulting code would not be
> valid. =E2=80=A6
How do you think about to improve the error message anyhow?


> The problemn has nothing to do with READ_ONCE being a macro.  It occurs
> for any expression.

I got the impression that some expression parts would be replaceable.

Regards,
Markus
