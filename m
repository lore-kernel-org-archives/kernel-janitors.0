Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E7B2D9ED1;
	Sun, 26 Jul 2026 11:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785065456; cv=none; b=lmZYgvYa/TGENTNBLicHZkVuKVvmRo/wkGGKzLmp+Bb6CX/0oGinEVqmh80hinNii6rRBlrcHM7s3iBvQMwPOLeETS+pNC/Fj7+htmOWQ02xZ2361cufJ6WyEyJVoCR1RC84jkygmDhu9Sn2t48Z2SNU/V9vPcoAvrw/+j5TiCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785065456; c=relaxed/simple;
	bh=tP1IDM8L2vbY51EOneUBJ1aZbS6pXirXSZ5haRNva8E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=l+opqSBTfCjG/agNbBLsKPdQ1wLQTe8r+5AX3aSlkTQPo5LbLoYLKnWRrU1eOvF44+2v8Jvu3e1pt7RkDn3FzMITx3ypG/2lWm2TxTiW9ZGX1jcG6Y9uvj5buq9oh0hvK0ZbOqc06fdO8InT/rWmy/5JKZXY3uxh0UuN5nedlHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=sPzwyKEd; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="sPzwyKEd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1785065452; x=1785670252; i=markus.elfring@web.de;
	bh=UO2QPbK5djjTjlEQm2NzEm/OhDHwKOoNRxQRfeGJvNw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sPzwyKEd3GZuD5n4zBM4l9niVx70fBcbabTXsA7SYC3xoG74P6CAELPLlvUtw0zi
	 YlshvhMq4e9AUtD0b2FVK3/OsmzTuQ7W2EL4caKCxlrjo/DSdQmKFxvsNpUIGyJD0
	 n6FtsU50sZEHCPpp6wQ01fcGzzyngK+N1j3DR1VmWFgFWuuq7NJKq5JtnhY6x2hGD
	 Fuf4he9alyuduyk/F6ef25pgCIIGg7JDqMLoLBQBek1v6M+8r8YNY1lMDfXT46FVC
	 8HaJNdWTJhqbOkQpNTB9rNw3yCeahrV/D/3eCEjzWlkLtpzleGHUZoc5Z/l8IqBDR
	 VqLRtidZubVoevg+eQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mmhjw-1xDcZG0mOM-00cnHv; Sun, 26
 Jul 2026 13:30:52 +0200
Message-ID: <077ae2e1-c471-4e87-9d40-caddd3a8a358@web.de>
Date: Sun, 26 Jul 2026 13:30:43 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [cocci] [1/36] coccinelle: misc: add cond_return_no_effect.cocci
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr,
 Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Nicolas Palix <nicolas.palix@imag.fr>, LKML
 <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
 <20260723184538.3888637-2-ekffu200098@gmail.com>
 <CABFDxMEuccFb2zPoA_Fdc6jswhqzMN62At9kEFqGBL5DZOj3DQ@mail.gmail.com>
 <514fd536-291a-bfad-fac8-15e0d0611689@inria.fr>
Content-Language: en-GB, de-DE
In-Reply-To: <514fd536-291a-bfad-fac8-15e0d0611689@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MUYiaAnQsG2WtZHVUpKDeeItb+9ZxZo/OnWr96bPSl+PX8VK9ET
 g1yohnZE6I+WH7FduJTVitJfXq7JP7H/+kpmrZym9Klo+jcF+edaxkZv4lq/G/qx9OdKY52
 BHLYw8J6tt5yc60g413TutZ1qk0D75vex+J/izcUR36hD6ZpOzn5VqWI6yt3+nOQCBvDJMw
 2Z2dvuk4yelUd2/lZL9JA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FKipdNV3tsY=;BLw8/6SUrOPZ9VY/7Po+SzqGoAI
 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
 =

>>> +@depends on patch@
>>> +type T;
>>> +identifier collect.ret;
>>> +constant C;
>>> +@@
>>> +-      T ret =3D C;
>>> +       ... when !=3D ret
>>> +           when strict
>>> +
>>
>> While testing the script, I found that this rule can unexpectedly
>> remove the declaration of a global or static variable in the same
>> file, even when it is still used elsewhere. There is no such case in
>> this series, but I will fix it in v2 by matching the declaration
>> inside a function.
>=20
> I think you could avoid matching the path from the top of the function t=
o
> the declaration by doing the following:
>=20
> declaration D;
> statement S;
>=20
> (
> - T ret =3D C
> (
>   D
> |
>   S
> )
> &
>   T ret =3D C;
>   ... when !=3D ret
>       when strict
> )

I would appreciate to clarify such an approach for a bit of dead-code elim=
ination
in more detail.

I got the impression that some versions of the C programming language do
not handle variable declarations also as =E2=80=9Cstatements=E2=80=9D.
https://en.cppreference.com/c/language/statements

See also:
https://en.cppreference.com/cpp/language/statements#Declaration_statements


> The first part ensures that it is not a top-level declaration and the
> second part does the check you had previously.

I do not see so far that the intended source code restriction would be exp=
licitly
expressed here.

Will further software extensions become more helpful accordingly?

Regards,
Markus
