Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CFD169385
	for <kernel-janitors@vger.kernel.org>; Wed, 29 May 2024 12:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716984673; cv=none; b=Ex8CVOlLoOCfkuy/UquqhbqBd0YmFIxncw1ngC1hzFOScrd0CdHFuGsc8CLzDicHF73aNB8RelVhrhmpikxX1pd4Kgk1n89k8phpMTYNGbEwuBAC6hT446WVYgCN3Yuvr9zEg1/H4SIFXAsjwOAKSV47yzYoOTq+KSqbd1j8Vns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716984673; c=relaxed/simple;
	bh=Ru863ZDNNkNexAR3UTGrc56hh8W7AeBpyMyTBfHTT28=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RnCPZvo8RFzXapFJR5WcZL7pN7k+BrMcelmw/ToouBbUBFPBGJhFVDx6sv22FroAnO2g4Ce+1Pzh2c9kq+YRcRmdnuEb96AKdpjQxmCv0vBrtWIXz1XrssDsKCAtSjQr6t9vR6wLgYOSk3K9QXl2fTK/p0ZmbWiQynCM7l3bhpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ZevaaE4q; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ZevaaE4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716984662; x=1717589462; i=markus.elfring@web.de;
	bh=44LtRPpJS9k50xR6wW/+Q9GMBsFbqhXkcW4HPHoBVP0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZevaaE4ql5oMwDeAtKax+8qVeshkazxM7zf3aPBQMnRX8SCS1VXgqk/Urf5m/rFj
	 iZJPSDEYvrKpz97VsMCrrzTXBz5DwErGU+rW70IWyF0e7SwSVHNk6GV1M7EtYlSq7
	 TkkYLzz6uhIcBweXpuqo51fOD2VTvj3xvmbcxMTiIYFZ3cKa75DeEI4JWE8Q0T9HG
	 vwSo86L8LB+LE3lusuIojFISdZLGKTOJLG8slK5PpksGslTUPLhGJzfNj8hmg4Psi
	 dEhCpf/n2VdjDo3rqHsA98AuEgQkzTk1c6cf9bnryFxsKIp5tYdAX0P+DJ+QvdoRC
	 j1eXYrjUsHJCNIgsIA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MidHZ-1sfHph0OkJ-00iz9j; Wed, 29
 May 2024 14:11:02 +0200
Message-ID: <2dc6a1c7-79bf-42e3-95cc-599a1e154f57@web.de>
Date: Wed, 29 May 2024 14:10:50 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] Looking at guard usage (with SmPL)
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr,
 kernel-janitors@vger.kernel.org
References: <7eb9626c-da7b-414d-bf50-da1eed27be31@web.de>
 <alpine.DEB.2.22.394.2405261847380.16852@hadrien>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <alpine.DEB.2.22.394.2405261847380.16852@hadrien>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zZ9hv8fYAElNjOlZxlxgzZ5uTXJPSXI0yJ7CY9+cj+rh1R4+JUB
 w9Si27EzJB3aXTEaUeUEPYIg6j3KDz8JdT7b1ddjpYEVqtyLFX2u0595L/hEO9pZd7TfB0u
 YWhFU74wW9yLFcUELBx+bzj0yeWIESk8hVrM83cS1mYGnQMTnsqVHwVi8gOFoPMwl0XuszY
 tZFnexDE+zKLOHudZpwJA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:utnD1sW6RAo=;WksEr1mpu6wx0BhlcFPjESewXKD
 /uWhdhKiIGoWO1Pm3MLwnae72M37VMqSYCf6EhMPLgF+J/bHiaqJZgORB9ErpWpxkbSPJtV5U
 d173krFB0NrrU0sUY4Z2poosFVMxesEhypj9nHhX3xs9YnbfTOIhVfZzEEhXXd4kfcF6FhyKs
 bftPhtjh/xNt0ABTtTjqnuDylIcQvo5xHAfle036uFbTP+xsmUJl2i61XsLThDzymceAUuloy
 v7vohESg11FDPBHkuHABus8M/TUhFgn/H67r2VKNrJN6EEnnBLSFA0nstLi1SfMvWZ2ffscvS
 Cl5hA8Fye9yP0GInM3VdLncICTc2q7kz47YBW0zoKzMona6rvqTUXTfTA/1bgxYaSWgePi1Zh
 Es/Tm7p1U47E3aLIdIL4IEFNkLTToruk4ou6CHLelfi0RATWcBhQn5rdnmR3IHt9r7aYUm+uz
 bjSpFcEOULoH6iVC2Mfy+MnJqdgdPHoi0MDLiE3OxhFn9vdUTvt7A68SoTmONAtpozHFmBGYH
 bp8VIfHfPuklIr0D322JyQd194s5xmnJbLmYMe7XQuQhY/ngGVbVzuN1s/O/DHhUIU+e8h2Ry
 6yrt9TYzJr0o+ueDSMZa4a3tj1B6Bi6TIAa6EjeZ0EFlq7loHKEgS5Smck2ou2/y9JrVJfMuS
 BOPFNaFSC7pWdvmV0Gjg0K4q5AuAwel2IoF+RvEwblwhNoWgP8by9p4a8yop7nSH8SlWHkVZv
 zPRNlt6/XFotpvkvsZOhFk6EK4PtrrkO/TvqhnaD38P/H1jLkqWLwdKUmy0wbFmsVpYRvlho4
 CHb+Q5KGZKQoXoEYV3B+7uvglPS9w+irmlNcAA4xf6mPA=

> I'm not the one to decide whether we should use cleanup for mutex locks.

Would you get further development ideas from another bit of source code an=
alysis
which can be performed also with the help of the following small script va=
riant
for the semantic patch language?


@initialize:python@
@@
import sys
delimiter =3D "|"

def format_data(places, item, input):
   for place in places:
      sys.stdout.write(delimiter.join([item,
                                       str(input),
                                       place.current_element,
                                       place.file,
                                       place.line,
                                       str(int(place.column) + 1)
                                      ]))
      sys.stdout.write("\n")

@find@
expression list el;
identifier item;
position p;
@@
 guard@p (item) (el);

@script:python output@
input << find.el;
item << find.item;
places << find.p;
@@
format_data(places, item, input)



Thus it seems that special =E2=80=9Cguards=E2=80=9D are used at 678 source=
 code places
of the software =E2=80=9CLinux next-20240529=E2=80=9D.
https://elixir.bootlin.com/linux/v6.10-rc1/source/include/linux/cleanup.h#=
L124

Will interests accordingly grow for further collateral evolution?

Regards,
Markus
