Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57400C8DD
	for <kernel-janitors@vger.kernel.org>; Sun, 26 May 2024 16:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716741274; cv=none; b=grx466PDTVt2KwXPh0SzMuMOKxtwpEvZSyqiGmFyqboWZ0r1lzmM+MVJzE2/xKCq+TRkwzGU1uSbByNf80vTzWv9TM2trDqCGahDKE0LS7WYoy1Ox4TWylovt3KkzHrhBg2o/Tc4y3lQSIGIjbG+Ad5nbrmuGmkDDs9SKu+b8Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716741274; c=relaxed/simple;
	bh=CeSht70Q481t89okFGEJz8KJIkfkhm+b1kqEDnmSDCA=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=K703N14ha3yxLzEQtlhSVR4VUXhKLbsRbZyO265JcCooKztxa/1vdmM88gE59GyLxiHcr5speqtkxKsYgQ3nYw3y+gsJL19IM5Tj2IEEN8PKqLYt/ibWgzP0xLsdPzRu9bvaQzu5lA4HzgalALkW4rDBlcv/TXRFOLys/xPXtsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=EGGbFf4l; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="EGGbFf4l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716741268; x=1717346068; i=markus.elfring@web.de;
	bh=HkaZnmEzcOJk6LYUaZQ6mhN0oNEcrvHRDz4epjy8g4k=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EGGbFf4lDtn1iL3J8T6FwCyqiIOcmbV79uCQ05Gbq35I6OEjbEg1H2j+HdjUXBfI
	 gOSGMTRFOmWsb2p9lfS2QPqwg/7Uueo7A4oUkQ4g8ga8SNHbXZIjNkZNQVual8t67
	 kAOlKVwM9lUTieueco2bGSy+D8E0fjwvMQwfWGbQvZLVJo9FHxfKH3dA8j/hmlL2m
	 gLo4ixW+IwnWgKcEIu0hpIdumhf39ISqezCGgvIEYrdsnY5Od7G8s5+AX4JXSZqOR
	 QyuJ1AexjPjhGNiYh89A/vVR0vlJNAIaZOuRPIUU+JH/gJwgQ/GeppP0G5T6k6eYL
	 sqDgrzagPgZuhSv1Yw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Ml46y-1swfsN3UcO-00c8iV; Sun, 26
 May 2024 18:34:27 +0200
Message-ID: <7eb9626c-da7b-414d-bf50-da1eed27be31@web.de>
Date: Sun, 26 May 2024 18:34:27 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cocci@inria.fr, kernel-janitors@vger.kernel.org
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Increasing usage of mutex guards (with SmPL)?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WenWFZ/QirNitzimPB6U2RpkUo+GsVf2PqRfzThyEmQv9BamDtz
 wYcyMW+vk+FzkEFC+xT7JlGnK7GPRDwbVRsx3AVNG14RfBxuKCrx3Q27tLTx+biyCmmxjIN
 3AYzdW04c6XJCOMkBRE+81QYJFkCo7J3ri6yM889M61nWD1djeE90Gj9kDXU1ydsI44UiUd
 wZLDTPp0KR8RPNtNXL94w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bOaTM5Eqsus=;LIQy42UP4X6VIwsWHxeFawTRug8
 g/JcZ1OGTJIVKNprQZ6giudMXyyMK92fZ4N8Sm+uiZDcIZCrYXEjeAYhg1oe+kMqH0xTZ/4Vt
 MwesNxJbtnpwPgLCGy5rS/CyhBPasEPFHSndV94b6oo+K1I7ElFsWE3I8kNrVbbXwQ0jvzgNX
 O/RRixkKZw4NQssfkqlG+xRKbca/HNPcbzx9dcL6i0bStS1KaqTqh8rLoaT/ib0i+ANhBft/I
 Z4j/1kv0hz5gShVmUhEG1n9oUgUfYEuwbULR8aN8Ue+5kHZELnzi9+pf2TaL/o8HIejKNIaFv
 opjaWYf79PAdVr440DrJFFBRHTZK33W9JYPM8Dbfnjvpzin3xNHs47vhO/i7xnfjCKuRUlStg
 A4Ou8OOG3TlDjw0qY3Yx7fuNb0ADJdWeu6vVj9Wc2bSKzoEV1/e5O/ppHQYNCajxuH/RG0DLF
 722mzkzcXBYctZnFYFK7klm2CqZ2VnnTCw7ahv/sVjxsByKBMhWuTjq2djZ8LGEhq/rOMP1OH
 qxtiAdrua/usfDnLyZRZtpVrdu2mPnmomI7X8Rq/ApIfb1u3bOvZW3CdvrKDjRcK6Tu8pNHbK
 c+f042l6362SyEh7Cu8IwbZ7XH+rsEqrYOkDOGUqiGVxNjsixmkaFEm9m3iPLE6H/mtC1LFxj
 333g++29op8khHUwP3768HJCgwNA7v9sO/QIIO9ioq0uJJLxS8nz34XyOJY8ijVa6XiW1kLa0
 mGm2SQFabva/Y8Fcyqzs7O5ANqT9JNSEQqcnq+5Z6g8dAalO4vTeOIMcJ2c0LNkPz2syUrpZf
 muYEK85gWuRp5Asmwj6fetYXuKeC4IfKwwcMwn2yjYTYc=

Hello,

I constructed another small script variant for the semantic patch language=
.


@replacement disable decl_init@
expression action, e, value;
expression list el;
identifier rc;
@@
-int rc;
 ... when !=3D rc =3D value
     when any
-mutex_lock
+guard(mutex)
           (&e);
-rc =3D action(el);
-mutex_unlock(&e);
 return
-       rc
+       action(el)
 ;


I tried this SmPL script example out on source code from the software
=E2=80=9CLinux next-20240523=E2=80=9D.
425 source files were found where some function implementations could be a=
djusted
also according to the application of mutual exclusion.


Will it become helpful to offer further SmPL script variants which can be =
used
together with the tool =E2=80=9Ccoccicheck=E2=80=9D?

Regards,
Markus
