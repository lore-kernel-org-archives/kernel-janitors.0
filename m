Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AB915CD5C
	for <kernel-janitors@vger.kernel.org>; Fri,  7 Jun 2024 10:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717755145; cv=none; b=mPgA4ItaRPR40gK0rHn5NDzhG8x52n7YuBLpY5jMlArKWuyqzVL/Ammm3CpAvGxFD+BuEafHDpzJJH47013IQs6GKRPvapJzVdzQDzSg+0hQspaHveTE00dAaoTojPQCNYojoqdG1BKkOb3384cdLEJtdLcUW4Xtwp/kOnkKh+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717755145; c=relaxed/simple;
	bh=0ywILY/BBkcIiyvfCqrHA81jtvWblraMFlD9Ievvm3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tAodGQk4gAApZQn21/pIwPq8BfbwlGnY37pjhSx5Z2RnvQsPE6HbYmMc7wMgegkbmImD/anL2aQRN81i9JlUtajlPgTGtJ/9cIG66+TH9bJsn/w3Q+SAPBAZfQ/hU895Ro98moUdrzwoXyegDemVQIY44iFUGEe0RW66yCGcj/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=L/68/PiP; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="L/68/PiP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1717755140; x=1718359940; i=markus.elfring@web.de;
	bh=ruOidOrwZOaAxxId9EG9bGAERRkK5J083Bdh6wCcIZE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=L/68/PiPtOrSmuT0r1u1mWV12xQZAnt3STxZZXvfZOu5n5uOYgCinIy3S6gYaTyC
	 EmFaGIKk178buBcwAANPVRRo7lMynhFvBCvRTrt+ii8NLVg/HMRSSLzNrX/Rzn9Gs
	 Pl0gwcJH4tJZET0JVhX71KRQk67ghf7iBiAS08cfEr6MCzqlBA/sePxD1WtC6AmUz
	 czAYbxWWwTbzpQ0+LpI1O3GkV6ze+uhyDvJGF8ArducwcqKqSf8zwFfK3CJ00e8Ad
	 tDQQaqEVxv6xr+yft259MVEwHAzh81EU/n7dU/U9djiUeN0iRRKzvjNA96Il7b7Nl
	 g+QrkvpHydcEtBF0oQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N79NA-1sVp3g1SdY-00xJNz; Fri, 07
 Jun 2024 12:12:20 +0200
Message-ID: <cccf7214-3a98-4c4c-89ad-bfaef1776261@web.de>
Date: Fri, 7 Jun 2024 12:12:19 +0200
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
 <9d79a2de-10fa-479c-b720-1c4a2f51782d@web.de>
 <4bad748-afee-713a-a2d7-30b6e5c1cb28@inria.fr>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <4bad748-afee-713a-a2d7-30b6e5c1cb28@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bfb/J339Xa287nZwYLQi/yoI8Toq/qUJdi7sxahdJtul9dYZrhE
 34dfn0sqJwkECFcJaZTr17NineLPcJJKezymM5W1BGxZR6AsRcMrvT+A2XaYJ6C8IPdtSlh
 LFI/YI7G7HPiBkTBWqkLMyKNIRskolAtulGUcEzWHFw0zh0lr7L204M0TDDd4L1wKB0ZcZI
 AmLeBMixVLbsxCy08zoZw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ep/9XwZt/yQ=;1Ict5Q3FnzFA0FxlurPvJFLsb3W
 tyVnSCzVdtqSaCa+MqybCgY9qvb6UrDigbKH59iCWPfa5LY2fzcAKA4qA4DfcaTdJ/Sw+IjiA
 NxxE7e+UepxMbacCbpZGja6EtPGMm9E9DWpPVJ9HcR4kGfIjLMVAsMabL8zO4bhfZ3IsK0lXo
 fYIy3n4ltjwH2yQ7z3xUaYAHDr8e1lc3AVMHlSrvhF5epM3MXlRf1stklHP2vwsnfEpEtEKJz
 +UcdATn6CsvXxXxZxkUmLrZvXTw2ls9IroMnRIcUr9sUMVQZlIh7Kwaagmf7BUB8szQncnH7z
 Y5AsKVw8pCA7Hw92KFnoi1q2bMXsPVOgbBVQTxX1owGiB+N843UAiE9xRJ9s+L/kXo4JoNLfh
 YRuk5pAjijoVqmRE2OCnas+6QBaA4rG5ZVzCFS3td6p+Wxu4VWO1r7xVqrjlrBar73vfnoVQN
 lyFpMitheNAp7/jZuckd+cdFI7IQOlgTmLpEysZwblfZgqyYR319PpZRVWTFFpPIncNI5rmJ4
 pvDSxxM6X4ruM75BLE2MtpH3sjEhpiYgnQzNDyXxODEhLOukklLBTAOww/a0qFz0uIA2+JmK1
 1EbHvmEMKej0evdoc1CpdeCo2+7RKpqmoU5/IfYc5A2RWpWWDuaT7Y5bmEE4m73Hg4kGlMsRu
 SDGsKv5NZd/F9aU9u5Ubvg+U5hDTBhLYxgyFcG7hIDh9kYTggDoU2czGG8gJmtIirsjPLiem1
 G3uLcnLnPNSjx4wYogAan/xge7EstyXSvUDAiikNmuAdem47AtiL/H23KEWLYirpb/gBz5qmj
 9jkuodFQRG4eLQk/dz0SoeQZNMglYY6cOnpLTJy2LkxRE=

>> Would you become interested to support the conversion of another tiny s=
cript
>> (like the following) for the semantic patch language into a correspondi=
ng
>> SmPL script variant which can be used together with the tool =E2=80=9Cc=
occicheck=E2=80=9D
>> any more?
>>
>> @replacement@
>> expression e;
>> @@
>> -raw_spin_lock
>> +guard(raw_spinlock_irq)
>>               (&e);
>>  ... when !=3D e
>>      when any
>> -raw_spin_unlock(&e);
>
> What exactly is the problem?  I tried this rule and it worked fine.

* Such a simple SmPL script is working to some degree under the constraint=
s
  of some known software limitations.
  Thus there are challenges to consider for the rating of the correspondin=
g
  application confidence.

* I would also appreciate further positive indications for the integration
  of coccicheck SmPL script variants.


Regards,
Markus
