Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16232209D
	for <kernel-janitors@vger.kernel.org>; Fri,  7 Jun 2024 09:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717752081; cv=none; b=ggYXoypaoEnRDgnL6FiTLep2Y5U5Bc61ELjF71JRKf0Dp3hGXRXk37lDyWQrXkIYHfxFUiwcMvkaXZPqFvOjzKCeFpKZjDORk58BT9v5qBMB/pqJHLIoidcjc7/SRJettafMSdQc+0bJv5lMo7+4xvvjyiOApLuYjJnVs1K4uho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717752081; c=relaxed/simple;
	bh=49sXYPf/m7f/8TEcdYrXjSLE/cjSE/6WKOyKbihNCts=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=orT3Gelk8xqbSxa+kg7EtRYhqZ3xKzjlKB9Bm0sR5FUEbirn9Yc9XhZdppTQRKTUckTl//k/WUMlAIFE+fvD+mBrfPCMriFvYVIiT51tAEIBU7lfLomswq/cizeqnStwSdnCKBH+DL3QCuSL1mqggolRIDWeH/D9OpHM8tWZeOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Fha1FZw3; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Fha1FZw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1717752070; x=1718356870; i=markus.elfring@web.de;
	bh=Mwfleuz/kb7Oh1JTpmyhQay7cXMamxZ764v4CytyrDE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Fha1FZw3d59YRWcGxpHhq9KAOfgJDcTB69XnPrUnXiisMgiOu0bplMHY9P1P6j8N
	 /Q0Ks8Y7kOSkWDXhpn5mkjKjbbbxTQyU47+XzWiG7BFiKFphY+P6ByNWCWbWFqR9P
	 MgGR/xZI7FhOkh6kFLpXWgs8vWlQ7gYfcC1h842ycURQJOXxFndw87WXzLDQwQrBf
	 7dt4e0QjSWCXxeBTtl0KaGN0PNimKqNInsAw96YYKfmG8DkeCCgMGvZu7R96keW7M
	 Fbr10FZ5JCXncstau+SMoZ9pc9Dx8HiVvX1OroD/VUXaSkqNpogjzDDsrlmglWYTo
	 +Uo1xmBdHxTUby3eJA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MI3ox-1sBxYX1QWN-007oby; Fri, 07
 Jun 2024 11:21:10 +0200
Message-ID: <9d79a2de-10fa-479c-b720-1c4a2f51782d@web.de>
Date: Fri, 7 Jun 2024 11:20:59 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] Increasing usage of spinlock guards (with SmPL)?
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr,
 kernel-janitors@vger.kernel.org
References: <7eb9626c-da7b-414d-bf50-da1eed27be31@web.de>
 <alpine.DEB.2.22.394.2405261847380.16852@hadrien>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <alpine.DEB.2.22.394.2405261847380.16852@hadrien>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3n85O9CNk4ZNZ6s0Cfl5GYa8CQy//4pHgz/p9dphUhjH6+RWJvp
 QDPNSFcQ5rv0RADvsWRni4zMW3G7aYTw+rl/9ZS6HTuhruQwED8oYJFMBObZxoSkFbkkAUB
 283dL0IprnuJP1Z9DsPgq3RU0JqroePsGc7gTs4hqcxQA/bfwDvcYkyptgmSjr0n7X2L/4G
 w1hP11XM/luVQkJ82AYtQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:61oZFAYcRTE=;sJwqrjssad/HZTlc3gEi6vmN1k8
 z4sjn8IZOYiucpput0iRml0QyF5nnTpb7xeIQUoCreszfpCgDrX+rCpOuTb3A0cBJ+Icu/yN1
 mTAxNYrFAJboUDEua9nphrbrBmxLvZ0zYw+OQ/2ZnnN90o2Pe7gmXmHNxhAQ+gyZqSiIMuKGP
 M/fNgCGPfA5fofwftoqP1tSDA+rHGdEijxomiqNqm2zbSN3waqRgs7ZRxy51GMcFuAiOP8vxx
 j5eS+p3M0lwRZVbzyy4Y0xRC8AwrhQIL4z90z13edzYMk8lGpgHiWB2F4RMDgLjaC/nd8jrtc
 GMWwagQSGxeZbnryIPTBnjWiAtw7TE363/WtH0xzEUhgvs9C6alqhMUNHmRRE4wJDJpNG0chX
 HyTrspjKqMX0OEGeIuV4Say/MFiXYPILDbFYzKCSddKYcsjwutCqMZsKVAHIhlcLh8Ilo8Ym1
 r1Zo3kUNkDhwsl+l9t3mJf0b35lMOX1XsqlNrzAHStnSm+tHmNZKXZ6rYCY0LFBx4Yh6Q2xAg
 05qcCZKCTr/pwF65Rn7b8v5jg1GXCZ6JMRvnaPtH//u9Fr+w6RvMYaIvbwc4lXxUZe6ukc3c2
 SjkzNVzpEH+NXzGVAT07Se2W+KIbi23DRq6cNQFWpLaWDuvM+ZlKpjFP5fJV8WXJ0nubYb201
 Z0n7AiGksGefXZPY3djDxszEhN0WxgWCWcS8PcLiBqKXAU2lCz6wy94xBsmr5Se2UqUiKoWEY
 mxz4GwANflyazkaC0vezlSlxxL1U9+EZ2DGT3HnH0vcgqEVBwNkgu7gryLMoxZKfcVuytUeMt
 efz0GXCPvI2rNh3Wj/pyKRFeoXlOdKnuU61+9R4nIwc08=

> I'm not the one to decide whether we should use cleanup for mutex locks.

Would you become interested to support the conversion of another tiny scri=
pt
(like the following) for the semantic patch language into a corresponding
SmPL script variant which can be used together with the tool =E2=80=9Ccocc=
icheck=E2=80=9D
any more?

@replacement@
expression e;
@@
-raw_spin_lock
+guard(raw_spinlock_irq)
              (&e);
 ... when !=3D e
     when any
-raw_spin_unlock(&e);


Regards,
Markus
