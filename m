Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAC7183961
	for <kernel-janitors@vger.kernel.org>; Thu, 30 May 2024 09:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717059947; cv=none; b=OSElOotz4mPfolsGvUzCXOGZywgSP18DWpUgEb2xCjJPdW2RPrKEJ/lwK9n1TdhIRae62dj00s8s2iX9rm/xh9V+bVpX2z3aDuOLXR1edQfgnlX6dpTsEit6W2u4Nm+aP5YKfIJH5QaKw1PR0qQN7XOq5ac5lYS19KyTBBU3rVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717059947; c=relaxed/simple;
	bh=AKA2sgCHan22Dyd94SfDgIjyQAoUdPZIvOVvutCvuVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O4v8VXm9q96ABnDa7f1esaM19J+wCCJp51lsYx0AVhd2JRN79Tp4iG+O0WWk87leROsNktJWGoH2q1jRBNSh60jdvvOFUZUfxlSQ0enIYWlzXT4WI7yNvruoB6ZBA1u1TkK79nSCYsqisYCYeBip/8d16QfvkFlExezyCByA//k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=t0l2ueHE; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="t0l2ueHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1717059941; x=1717664741; i=markus.elfring@web.de;
	bh=AKA2sgCHan22Dyd94SfDgIjyQAoUdPZIvOVvutCvuVk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=t0l2ueHEf8zNHMCl4EGJ+CCVzvT3ShrV652nYACpY/wzrEBd7/GFaihNmcNoNLBj
	 sp/C8Rad+h93apnlxpsMWbrBpdG1XjEsq5Z31HFYWL4c0T8hmjKJHmL8AzC2fhoX0
	 3pTZRHU6b1ho8BYTmWY2gXxdBlhIa6m1fcWbi7s8B6xh12RgX5ckm1RiDz7HSNk9P
	 E7d3SJrU9IU4Y/L8cQI735tpby2ltVM3f5UwguSQ91qleFfPJwpteTBkZaXFFNZWl
	 LUVB2r/kLvrEYtPYXAvBTcIaQwKEUgfkL2x+v6dKX5dtIi9l+ybyyU+D7IIkCFgnX
	 03+cWnQHUqOvSmAtvQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MA4fW-1sJnn44Ao6-00BkTW; Thu, 30
 May 2024 11:05:41 +0200
Message-ID: <b9fbac02-a1eb-460e-80f0-07b32e704bb2@web.de>
Date: Thu, 30 May 2024 11:05:25 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] Looking at lock scopes (with SmPL)?
To: David Alan Gilbert <linux@treblig.org>, cocci@inria.fr,
 kernel-janitors@vger.kernel.org
Cc: Julia Lawall <julia.lawall@inria.fr>
References: <7eb9626c-da7b-414d-bf50-da1eed27be31@web.de>
 <alpine.DEB.2.22.394.2405261847380.16852@hadrien>
 <2dc6a1c7-79bf-42e3-95cc-599a1e154f57@web.de> <Zlckg1LH-2TBew85@gallifrey>
 <e6de2b59-c9c5-4714-8a4d-5c5970b9fad4@web.de> <ZlfIl39GRcXKFRn6@gallifrey>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <ZlfIl39GRcXKFRn6@gallifrey>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AciCZ4igdXJ1+CD2A9wqTq2M5jfvMDtL70rSIU7q2o4EjzIHqeT
 xoluV8gh8a4PR0CiB77DcsjtiIO6Nb+6MwUTKLVSbs0PtIYAKQY1ORRiMM3Tbs5LKxJlOSL
 ZFFf9t90OpaaL/Vn5uD8THh+kXr/FkaBZr5tPYm3whSYVPrVv+5q2nkdAxiKikIOp4rjDNl
 ZchodNYRvmqph2Y7g0YCg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fIjwmVIt960=;TxgzFQ+8Z6+XX1EJ5yousZPcRj1
 Q2+1X4MEyOK16P5/APIoeuXyQRjmUjbt1ZRhWuSibjQ2LtxVlK5y7xbFfrQEdPWklW1IcuWBE
 ZiDvQO7OzgFaBr4Yh/CuheSYwRLJSkuJI/9DaKJbOk+0ns0rTCozPSRouBux3bdQu90geE7fi
 wP20BrI3yc6q6YKctO1CRX57lykcydMxnXSmTDaNmijI/dAYwEaFDFvV+eoJ+dlb7H15+xo1q
 J93m5WTM1Kad7g4XvzbATTYnOX7Dyb22oi3secSQVSPnaf+wkFU1Ti5lDRWecAJPEDE5Vp619
 cOGXeurULulJgMtqqU3yd09wQY6yLKVEp889KGMxGmIYDmcvpSvsqafJ03hqduWiSuRTMOfz8
 emhyux0z+ZYL6GbobgDaY3YPNvOW8PN+OHcLAARp6F6fuFqmTAfpftzAXOFMkVMTTJYFli4ro
 IoedjKtv4/mFF88ZktxR/Ck/5seK06heFzvBZddnv0bGFzJsgFaCInMGA60DsWfpjYY7QiHow
 gF0zhNopX0Q6lP69jLptJR0DaT4I6/aHYVH7wpWSp2X4jNgIs5uv7KImLI/ijti0lGK0EeZdP
 gIyedyy6wy9RNxdEEAeX5abDs366Oq3TzvTZPNvmItFAUHFLdndevstG2eqg68PSEUiDDZx1o
 W6E+Do7yLujKlOHASLXlnozvJ1mn/kJNTpFpgEiGuTWHi/gxhp6EtfFncbMq0fzqLDyko3cdz
 hPNX9wWvrecIgzVmBam/Zh1EUfEqtcr/HOSRtd+lROYOBDyFjfD7wZB0IMbWDuScLR+/nLrI0
 Ds81+LdX1DZrNr7ccGjPz1RW6EldX9M0WrpkaYeXr85dY=

>>> Is there a way to look for functions that have a lock, followed by unl=
ocks on
>>> multiple error paths?
>>
>> Probably, yes.
>> https://cwe.mitre.org/data/definitions/667.html
>>
>>
>>> IMHO the nicest thing with guard is simplifying lots of error paths, a=
nd
>>> innevitably someone forgets to unlock in one of them.
>>
>> Would you like to improve the support anyhow for more complete and succ=
inct
>> resource management in affected software areas?
>
> I was just suggesting a perhaps more targeted approach rather than
> just looking for all cases of lock/unlock.

How would you like to handle source code analyses if lock scopes
would occasionally be distributed over different function implementations?

Will development interests grow also for checking combinations according t=
o
other pairs of actions?

Regards,
Markus
