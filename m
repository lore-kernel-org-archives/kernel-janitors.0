Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008EB1E1DE5;
	Sun, 26 Jul 2026 12:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785069775; cv=none; b=pxoyO6yMl1RV1fhLG9Howi48krMlyd+DVHqUDeaOvLL9f2q6puKw1tBewhSjdIYaRO3SsrLvFFb2eQ4bXigxQeUEmsKtazYIsQ4rIxuCHnXUebdS2cdGFPbqhc1GuoNNRlBmLsNx7owF3ZHqdMdkXE5s2NGea8baP0UdRvtvh+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785069775; c=relaxed/simple;
	bh=wpHCWfSiUz3zPdYr9YBfc+e/wyX77FLmsLu3rSseT40=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rJcY0SiTLoPF9n8RAnBpPrg/Ht7LOGCyPbtbcVclGMijRXdzyd/OJF4+aWxzK5oEeXURorflYRy9W94Yq+s6UJVmMJtdvXCJl35j0oUxbMSYBtGrlBLZMWfK9ytlB6OAYxWdu9WbBsDZIrrJ/wu7ZudKc6QhU+wySJek/f5VlU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=MYvTX84c; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="MYvTX84c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1785069764; x=1785674564; i=markus.elfring@web.de;
	bh=ocjACrony7XPEJIXKvjwO1j4ihp0MX79gZraNKRN5h8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MYvTX84cD6Gg0Q4Qc5Ykv+htOw2zuJbD0mo2CT3RXj0rHbk/2Z2kTS5982w7jkZS
	 54TKXS3WSIWA9+Ayxdx2JhDERFQkcN5BGDc0D9Jwa8wSZEJgPexp9FSaQpdkJ7GFS
	 DTk1XObY6vk9GlxA9SeuWE2MHrdnuMUfc0FJhiFfNIaEKXnONI8BU9iScZeyUu5an
	 fY7V63zpGBbiztu2yTZNZF+nVaflhFipfk1fthyffqMDGg05TTD9BskSGJ7W3q/O+
	 QMGT7Xc+A+z8cOeVIN/EGWKF4qMhOuOYuG2Q/i9VkMogVM8Yxtr1qy6t5chOdzn0S
	 s2TCsLaxZtwQle/ehw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MlbHC-1xDzYE1Yjy-00lzsY; Sun, 26
 Jul 2026 14:42:44 +0200
Message-ID: <b801d91e-fd0f-44df-bf8b-7be8805453cf@web.de>
Date: Sun, 26 Jul 2026 14:42:31 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [cocci] [1/36] coccinelle: misc: add cond_return_no_effect.cocci
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
 Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
 <20260723184538.3888637-2-ekffu200098@gmail.com>
 <CABFDxMEuccFb2zPoA_Fdc6jswhqzMN62At9kEFqGBL5DZOj3DQ@mail.gmail.com>
 <514fd536-291a-bfad-fac8-15e0d0611689@inria.fr>
 <077ae2e1-c471-4e87-9d40-caddd3a8a358@web.de>
 <6a456a1a-3c5f-5514-486a-9e3f9d1361a4@inria.fr>
Content-Language: en-GB, de-DE
In-Reply-To: <6a456a1a-3c5f-5514-486a-9e3f9d1361a4@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9DCvdkpDFtBQpA5TuxMRR2jt4Wwjh8NjIRGP0LZE7lZQVGEaZ3K
 HnbhIdHBHR/ylxFfZJCujfPOq9nJcyAtP/R/v9VICgCQju33bcSSXw35KYf+Dxsjrg0kmin
 q/34XywCre+m+uRc21sbrC0Vp1BNRulRbd4pdek1onsnwVhl+XC/50n4Eh2yiIiD9UjdNA7
 ib6o4K5MDYGZIeUw0vJgQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:r4+1/bTiZiQ=;CngKwYpNZLos6ZI5b3eXDWvHMWq
 5nP9ObZFCwfqGwUYMmGCpOX27ehpY5OFqJ8p57XJhtkyMpa299/cHfuwWX+8jRZirDn3T3fgy
 7iUyzeEDpcaOYUVVdLEMKSmaur9Fju5UXaCBdOetC4hc/P+D+I7aqF4Ste9DEdtbcV2hjG4ua
 K82wottOo0FvkxwoW4L1gPg9KS8nno72zKUZu5J8mXTCDgcXbnGeI+Ty64BA9ZMD/Ri8yjIZX
 vX7MFx59H+1ZTLgi5PE3uXK4rEE+00jVyzwFmxQIewJxWRx5ukGYlsAKwxSlFrRUa8QbuUL0X
 16DvLUrFQcYKbNEzSXqu0EkXnvn6H2+AWbLsowEFJ6bb7fNQ/chgbq0A6vaxludQ8bzgpxyld
 T6EG+WtClMyjpMoPw9EyfQpmVtdxZ7xGJCzhozojfs+x0Bb69ahERHqtBgpkV1WgPWHWb0wwt
 kFKVMEN3zIC4l55lBPyzG8QtcqI0IxIEHxqsWTkj8elCoIRQ+E+J4DimZPE+yJd20QaoUDbRR
 zc1PWW59tlLDGPpXfDEqgq7VH3ASEogSA52AlvhaU7zPxzKUY8J+NFcruUzXONM09adOAzlo2
 lUuXUCf9ZBZv4ZXNDVuVPiPnxNu1aQHGO3di7xjITgQjGMBhG1cu24yLWB26LSEaTBkwyY83Q
 DTg6Pjxk+5n9Ug9Cf56jhjd7/+KuExf2zfx0Oh1+mNDIq7i4bcyGKNIox0pyRs/1+hZrw+8EO
 21hpubdtLwc6ZoQdEzh8EriscgsdGT1CAKy8Fez8Dcb3BFnQghAQd1h63bK/4kBdGYMD8t5QA
 n9O1nsRGYmFDlnPgyNxfSCuC5ZEawzF5qJRz+Ik2rI6d/84Jx7qyiWyd/NjxiHNVlA1Fy3c1Q
 X+hL7qvByhZAMkVJcWuwC6PrqHc0rxMWzxEaidqNzIO8PF91DTTk0PNYv8mP+BxR8nmF/IuGu
 +4W9KHTorP9I9HeFsz4hIIOL8RYJPRTJtGepEERUP7zXCgwu7Qawv7tTD+OIMlQ1fEp+z7OCe
 /CBNhBMGQoFB/P2tcvlFQdmgNz9LEmdYokw6yi+Jxdhf6YCC/lUB3XXTkn8aj0PPjuJAOrf/I
 bJL0GdBIrg7988NWGpH7SlOZMf/fL5JYqRmBDXDvuX4s6TNm07wdff+6CLA5ai0/mO57ENsms
 5xms0nBYbm9n/0cmBtFbTuhUmsxNyaVaswu79Aj0S2H34pHIeo732HNmI5rmvEifb5xv8qoqc
 5C3BHPIRrub4Z4eAM1T3jZI/qgCU3N6jh+IeFgIGEj1IDfw8AbFPQSrDqV33BvT8MhAMwqAkI
 9hOeMthQRvgl4mouV9v2lPnwmNvGh2ia+V1QHEUuaMTXWmDo+cisHC5u3PKe2DLfmraxM7s0B
 Eio45itmQzUdVt58tCph7CEKVM59oA5lFdCwlm5UUQrnyEkImKUoqKnCHicB1gf8uKVgS4+Zy
 fTRhhF0IRRPkPry4wKy0fuKo4Tj0dt3zDRm2gmvJalQf8nlO/Mwvj7KBe5mTBjN4WV4FSSb2O
 2GM4X2jtI5iEBpiiLPo/78tNHDHiHqCdXpCd1c3WJJsaAFPa6IfScyR6NyVsGl9c236J3+Fmz
 v/+43DdLAOUkuH48wWXuAxcrq7Ni55ZEqzHNM6eX6+WILIc0qdnip3hnwe1ta4vdWr2njKksI
 x0w+jyjxdR3T6LgYn2xbbVdqxDNTny5T9lBbAIyVWN1vO1pcuY/g5keBErPRr/4EfwjvDB4fy
 ydjH5GzStJPKD6pLoDcyp5sULThoPRRd/n+n8k+upQYKtmhTSPNE3n06v+phMrvoA/zIolB94
 aFbpMPG/6qbkB/Dem/s8auwxHm+pR6Q0kRx54+o6yrTXcfCjZP48Gqt/VvNS/PLhPCap4AjEH
 H/B+uyGMCgCl2kTG9rTJOf54Dl+kl0cNT8KAe4bBnHBk+izijW9/wvUPlSJbRe9ycM19Um/12
 IYHe2/UWhhQBdEG2PsyQioOaaoEi2dyrHf+wuvS03sdyAF/wLAs3ZdmBXWqSULBGZpCO0itH4
 g8WTvdacAWHE6pzB55/gbo4VHLvx8ceMLa7d/WizvHSH1XvODXGqq3CmvxA2dqozozEyV+2tj
 9APysKgBKqfCT8qwnL43eMUHxghQaRfROFU2MiyuxNDv6pbSkwWmBA6hxsoVzd+d6GOKghaU/
 fyVviookxFU0WTqmQKjtK7NyMI3rH3bkPSZ+YqjwDWf5OhYSwqXZzPqoeXtqkq8FFmaLt2GdN
 jEQckod1Y1CJUNLYbibZNQ6WjJm8IlRo8Gtrqo9UXJ1D3TaftXQ37UYaFneHirKq4lMMKKY9H
 zPKUUTAvyWM30pQ3tgjTSFm28ALfcX8J56nMDF4Qm8tff9gW1kPhx8gOL3uSPV+nyhBR02+KD
 F+4zqO2DrDGISFBHumUWPkFDzYUOZySU64skW+HJHJBpfuvBalN6S73+6/0wUb0MnYaqdAFF8
 aACfAQlT9UUm8TUiffWcS5vVQwXOVVGwmjV1Frn4lDxsrrOukvHSgmd3WXKZuBtO8TrMyGoxu
 ZgKTQ1Nt+Z0eyIZdxyue4+Wdl/TrWklnIC6xS3DAokQlLl5g5fXeGk5btzIrZJ33SvZDBqJyC
 Kv5hzpfiwe61SsFOJ5mt2D0T2tfCZXIG4pnslIq/Jl6w6Gn2bG4WF8Qi3mvew4LvZWouGiPXO
 JJ+XS6Ovq9SpWFs5KdNQcGPLJMYZsN3t58u6i84h/ZKuI82QGDtbkNoCwKSpU82Ig2jIa/Msi
 44h2MNzfM4tBD5x+KcMNzO9A5JJBAUvmiSApkogIwHYnEXYS5LBnT2Y7tk69SM3DvubGrNqad
 hBncijlC2xDJBurK/wKlzA8g7YHhV/Mcjrwu8DfnpbHyitpp+7Xw4OFObvUnKMk/7LxViPGBW
 sHkUB1KN33ekG+ShZt/Su2EOJ4QCEzyo2Bk0YD91pEQLPlPhc5h8vDnbuNjLk7GwJuxqkOjjV
 F73fRK4/CWrEavVIRuT2eMTXDkfZ9On+YOVPH7Yq0HvG6LcZh0q4KhIGjiKKqmF0o37aSv557
 uJ3AAygkqfBhDZJzMUkDhB+CthfZRcpI7g+pwpvQeZk89rAKTJGAzCAxNDH0YLwz/SATmdznX
 shPhCr7SYodwdrq/LSe0PcnAgJwP3+coxVEl6PXrV1+9/mvvRDRtzdEM/IC3HpUPuzy1SuC1o
 g2krYuuN+tstd2/Y1F0YpQGIFe4aQMETGhxsryNO/oKF7R/+dItykaG65vTTM0miKfQOSpll6
 8DVKkgcLbHE+LNFpFnJhZCJtcJoSrsqGxTtS+314rzxr1s6//uSikfsqkZxWS+VA5BEBtWanf
 jeXARANf9+WHbT8mDv8O9Q9DcBk4eEYHZD87hOExu0F0Q0cIr4UvTCo0bh5rbzshQVB/xIGL+
 573bvNali/V7iXEVeyKkxxo8szIlKb9wLuojFqmDm5c6ho96XxKOqyZnbyBMGGZYqJu5gHiY2
 7ln6LFBZ6dPv7GULGvNG3cvUD5NvyPcUdbGXTgUKtHr8lmFoffeSgmea3VjUJT1cOLt07LI1P
 NzQ0UK6XlT8wf6bZBixkSiD5Vvz8yQrA4HUwuVMG9Jtk9iNVtrPcohlGzfye8t2uZFVVpIp3G
 TRdZOJ2FnOour0BcpyHnpRrpizZkwpdXfUyZXOgA2AmErOTHAr7e7aE7bskGzalFD3ZsZdkhe
 ZFSyG0MhRB+PZ8gKPU5r0n/b3ggyHlg/qc8CwKRGCoQKmCVJ1Q4q9IbEBlHDd5HVwefBmX1xb
 RyyZ7YGZjpuJNtSkh89d0jajqvKLAGKqB1EUOufiMo7f1aXU+InL7VBCmL/3CsXazsBjHnSyb
 LBS4ia1T7kZGoug3rmjQ9dGAKrFmWUW3LqIJiavAL3aucqA8E5RNswToUT+jvwkmkzq2fsrnZ
 3+j7Al5IlPkvzcX7+DR90nZPiJ70vl5oNr+AhAfpWVfxvktx18Rwt7m5f2bR5KryALVla1RIy
 +p494goUrG+WnN4roiu0NYCvzM6oBC/wl57wiqW+4ap/AwBnxSNLCKutu1we1WsTAbsTsgKzv
 FpYPWAhO7L6FTiYrdrNdYa6/OzVZy/3+XfAxbbJcid4LFM1gbOnh4jeBpR9jVOsiglvj1IzOX
 /SkPujY1pKp8tRIKReY6IbaT+iGUZ471rwKLp0+eVoP02zB/JJUwj6SU29JE5jkrjJ8N9nujc
 yZfbI7Cb73vsXDXJze3uTp+7qVMTkv/C6eGrKOuy71/WTN8Rlbb1Aq+x8Z3lEFMg/r1GMOoRR
 nHjZLo3eME9X0AHX7KAfU7GiTW6g7aczJlnW4PkdquYYi08SjL9aYR69tfIKSjKrCPePurzPy
 9uZ79tQ+luFCEM5dtXBwfZ0bJizfNRA5+hEzy/8p/JTdk60OBp8TLTMapr10QxJJnwL058ojJ
 8RJRDwF/fRd+CYWiqr1cr3JVF3k+vo947g2846wyN+VFueOteY7JWT47AURWulwT4AePcghj3
 lO4y2APFxhNbL0XjMCn6+2yoGyDYJDfygViX96V0lyq38FCDW3ch+JbdaslrRB6EnOra7Y6ep
 CRMkvJFOxzhtyH64zZQnxHV5TPrgsO3CS/eE1xtMD0wYOCaiNKQG01uXh4xjOUBub8BVDpupL
 mu+5TkaCQ1Uq3bQom+IO795r/WpQSZ4H3HPo0lAnRToyOl3zrJNxwL8W1g8aWLz+Tu9JdUVtK
 a3fcxH2l98n/sTXgw/kyBzrduVw3UGcQCqUpMOnJFrulIc+OgMsXjZA7TwAvxKkntff5Owt2A
 y/93E2IkdoRaoA8Xy2csg0R78n+ucysqb6P0vwdiIrnDfh6hhaA0Jz9EdPiurn+chQYN3BAdv
 HsgDCsScnXanQE8M9dRxHrxm1wvGlhlOpSLeLhKO1yE8XLWhja3/9zh9AUErR4WNf8o8C83Nn
 /WAtLOzySF6fggLrS5q4EbeTAXPJ3qJVPNlQ6qLO+Gdg+5cghs8TC9oAap8pha9yUNsK2Meu4
 pIXH4Wi+M/9nLlAuDeSRt+EG5ClKAa2jFwcxvaTg1VZl7UAtyjsJ52dm+RkhTHD777ChqBsfi
 dxQS1FwABdJRLuIRimO1E1TbOlO87XrzNNTwNXvzTY19WGkRErbReSiDjMp3IzTdlib2sWxRx
 sx23YmQAkLVg3FhWlH2Xc4KqE0VliHb4flbXO7MC567gk4aR6HGDVndpwtXk/D1RPb/sWhVYf
 DuP9uNqKW7lYAW8xo3XWJD3UM6F8WExM6m6ay6Eb9CmZfK54LY2O+h+PcpC2YLwLxXsiKpR0P
 vIoNiQbfcEDcSLsLwrhtxMraEZNKlEYRvya6YuH1v92IpNlIv7Z/68iB1F6/ixJacFZX6Xc3T
 0/JBKfOQP3E2eQ+lUAIlXrAW5lPxlp1kvc1x/GYmkTFM7+FYbGM96iCiMmeaygECbKz6GIGWC
 +mjti/xPYRe3n9M3JNJ+OxZaOedb7DOti94acTZOAfxj7V8o99LQ0PNSAjD/VGBSZIyFsYGx4
 5llQ2tQZgEmmYMcev0zJYj+yVgLnVumTNqtPOEV4JoLZtWHpdXKmZSAHDzjN6odDbWETlXHeP
 7y4/hzblBlf+Du4ZYHNGl+ew3yZCkAm86wH/hFvjY3o61KL3EreZZ980aTUWOAD5PT6lU0UrZ
 bq9TfNaX3xN4fEMHU+qhx8vnDkEmsqZL4m8B9CVbbVKMB5NAWJNOTLhfq6ZT6Ece8HDt6ZvJ+
 uk/nyyBgXNUHNG4M1pc5FXynQGvwSd3GF7xkGPziYzNESpD4bG+2Rmb/4S+wmg7R+RS7ukADZ
 t7B5FICJZ0cdBJFUTDqQD

>> I would appreciate to clarify such an approach for a bit of dead-code e=
limination
>> in more detail.
>=20
> I have no idea what you are talking about.  What dead code are you
> referring to?

Variable definitions which became unused according to transformation rules
by the semantic patch language.
https://en.wikipedia.org/wiki/Dead-code_elimination


>> I got the impression that some versions of the C programming language d=
o
>> not handle variable declarations also as =E2=80=9Cstatements=E2=80=9D.
>> https://en.cppreference.com/c/language/statements
>>
>> See also:
>> https://en.cppreference.com/cpp/language/statements#Declaration_stateme=
nts
>=20
> And the conclusion would be what?  First, Coccinelle has it's own parser=
.

This is generally fine.


> It decides what is a statement, not some wikipedia page.

Does your supported data model deviate from known programming language sta=
ndard specifications?

Can users determine relevant differences from published software documenta=
tion?


> Second, Coccinelle does not consider declarations to be statements.
> That's what the D is there for.

You suggested to apply two metavariable types in an SmPL disjunction
while trying to delete special variable definitions, didn't you?


>>> The first part ensures that it is not a top-level declaration and the
>>> second part does the check you had previously.
>>
>> I do not see so far that the intended source code restriction would be =
explicitly
>> expressed here.
>=20
> No idea what this means.  What intended code restriction are you referri=
ng to?
Do you try to distinguish global variable declarations from local definiti=
ons anyhow?

How are variable scopes be taken into account here?
https://github.com/coccinelle/coccinelle/issues/322

Regards,
Markus
