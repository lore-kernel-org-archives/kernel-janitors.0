Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A4317C67
	for <kernel-janitors@vger.kernel.org>; Wed, 29 May 2024 13:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716989059; cv=none; b=pVd+vvFW4Utw1qDZ8bV3EgyDe53/QFg7NDc3a5AVZ2bbdL8zVy841K+rihDV2jArkEjEobHLtawT4ejfRMHPL95smWTyB9M3x3KW2Kko3Q7nRIynWcqU6ygBXKP/MBagsobaz8aE04urV3B0+8xGIp6Sy4VLZEzb6kwyzwJs4kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716989059; c=relaxed/simple;
	bh=SwT1Hi3zkUc4mbxavJdwDIU28AlHdArcSEl5zkC4c2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OgxpO5UDWA62GRDNNuxdw+VVzj2dt12YGgXMuPpaHBBWqcmxWeKGWM+MzDfSDDFSpu4sePaayQq0a7SJxJCJPphxJUU68clxJR7NG2BEGff2WaxnLxgKUqsFyEM7LYfafGVYc9N5kMMotkRpWw9N92Qt60/m2vWh/aULpKjRzyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=JQmuP/eC; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="JQmuP/eC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716989047; x=1717593847; i=markus.elfring@web.de;
	bh=SwT1Hi3zkUc4mbxavJdwDIU28AlHdArcSEl5zkC4c2w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JQmuP/eCQnt8HdI6X2HdvRLQB0OQmplUUuuIe5TJfRSCf2Ib/RZNTnL0fY/3fr7p
	 xETDGgju6ESKWSonJSBE9PCSwSGXTB1TI7ES9VhOrhUFU6sl8fiDH7Ichjd8fmBnP
	 Phd6pLBeRctJvkyQ9+zakG8Pc/E+ihBXJp1onjatt+HpCd301ox2yOF8nhW8IvSh5
	 nMh90pY2q2/QvBh0XleUW2ASIOCV7SGSniPpkFiCzF9aYbIiQ3OGax63jz+wbX2n0
	 GfTa3uotJBFLJpNEkbIe8rSdmhcbKh2xcH5H1RlLpE+fj7EnpMTzChEFbovx6PngJ
	 g19jdAUHxIa/CW2NlQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MwA1O-1sT0kt3MAO-00s7Xa; Wed, 29
 May 2024 15:24:07 +0200
Message-ID: <e6de2b59-c9c5-4714-8a4d-5c5970b9fad4@web.de>
Date: Wed, 29 May 2024 15:24:06 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] Looking at guard usage (with SmPL)
To: "Dr. David Alan Gilbert" <linux@treblig.org>, cocci@inria.fr,
 kernel-janitors@vger.kernel.org
Cc: Julia Lawall <julia.lawall@inria.fr>
References: <7eb9626c-da7b-414d-bf50-da1eed27be31@web.de>
 <alpine.DEB.2.22.394.2405261847380.16852@hadrien>
 <2dc6a1c7-79bf-42e3-95cc-599a1e154f57@web.de> <Zlckg1LH-2TBew85@gallifrey>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <Zlckg1LH-2TBew85@gallifrey>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:5c1FsYEM2NyRYaw/Nu20egXTNsqmT3g83WjusYE5ysIbm+Wz1ki
 5Cu547w8aJIMTPjT/BJkwMu7wu01571xrD5zaqqVvs/zbtP4/MXIT7B2CO0e829ysHtKJ+E
 AYvWB9TWjKLhnmrgcS9FQ3iJsxdbH8iNXudN+ZSmJNTjIVuSQxDbm1LIFRCvb/UUa/qhdob
 SQG2lLZdM7xLvfsrhl9Bg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:X7T1phtB/XE=;2Qo+xjwzbwKG+ReQhZB6LgfLuUh
 uvJy4ytbb81gRiYRToViLfScMBHGsp+d8a7xjrEXaX3hO/f8Oo49ymM6WK1Rn7QkazQTeCmxa
 2Qf3c8MG5iZvdqvxZSTo+UfZQmti6DKGUFKcGniI561vx4e1sai/e67RdwQ0VviiOdiJzMQy6
 xLvwvgf07YxJexjG+ThFwh/RLGzjp9xXNaXJmZoW4Odd7z3D6jhDOFfOuqbRx6vToctZ3mvZT
 ctXNvsHIHz+l0Be/Y3AYgD8u5snA6jxvuM9dz3wGzCARIyr/oMlzIZ+RCO+1ppvOWDsFJ94Ok
 TbcFXbSsgm2G9hoCsUWEQK5sAAV6BYVzZtThyQoTqqVlyfeNx20F1msJBoKZBZNka2yWv1rd2
 D73pkpwqlkMK7i6Yj7ii0PlXqAqQAAKhaaIqBQzabT+Xkx+Fb3d9RSRerFX26fYbBTuFNNkdA
 +rgMaORF5fc5Ubr3/MMKi51dL3bEwfDCrfWB62cvrIFGO6lsgJgr1vCCCwW2lEjk6yqP0Gsmn
 gd/ak6OpNm/gSpVJDDzefaG4UibTATQf+7vMtdBK+ivKos7lZiNF1nb0KRPNmQYU8nhqrBhBe
 w4Gc+0hTSC5eHazF74JQ6whXQsP88YOxWT5ia0gO8vOZUfeehp9Ri9wY35RO01X2Ran75EQVJ
 VqkSYAuFgoLOtJTNlC9Im78b1aK1bIB8seR+o5wy24gO/V9OMNwRzi+bX46Q3qJSdOMojMnOR
 8nhUwyJmWO39L0CiAp+Dy9iw4bNTXrP66ISRuTTmORh4reWu0I1XLf5XncbaOKMtggr+Wz3/N
 Kai0WW14KEeyYDrPCbXPYDA8SJb42gIO7eJ8m0hkvPCPU=

> Is there a way to look for functions that have a lock, followed by unlocks on
> multiple error paths?

Probably, yes.
https://cwe.mitre.org/data/definitions/667.html


> IMHO the nicest thing with guard is simplifying lots of error paths, and
> innevitably someone forgets to unlock in one of them.

Would you like to improve the support anyhow for more complete and succinct
resource management in affected software areas?

Regards,
Markus
