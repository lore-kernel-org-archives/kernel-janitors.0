Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8012D3FE645;
	Mon, 13 Jul 2026 12:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944294; cv=none; b=Bqc15cPLYjHnctqP/sRkA719BY2ejNxpk9F+Er2QvZVOhWfhRPPWH3aiLwGMvuQaBlbayZs4cETPVnY46KAgurOlxVEK7/o5y1f+G541/+uBX+miQ7lu4BBmEfNlVTYNbOppWJmbxO2PA+L/e+8t9jQfPrjD2dP5dEtyWzO7sbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944294; c=relaxed/simple;
	bh=CcryPpPGx8Vno1IrQO7Ts++Vg74AP3Q43dkspRBYPVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vAw5xx2BYNYwYZNIlovyNuBx37SLb2wocESYifjntfogIAnkH0yAV56vv+HGpJ3XhvXYaYmwDPNcUOcppf1O+orKUtLJT17DTu3PUr3paX5gQmouDPCliQtxwgXWZsRWmj4epsR0/Zq4NgkitgTKiTkiWf9ies2Z4ZnDjMd9qio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=omAtwdMI; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="omAtwdMI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1783944288; x=1784549088; i=markus.elfring@web.de;
	bh=GJ2aa1eLZsaKqSyi9iohfKxWHpgNySjagm7TlBRdvRY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=omAtwdMImvfjUTMlx4I7yl7K/yR3lPKkTiMU2vya65U2RqUCtGoYC6/DSuFAebH4
	 UYR6S1l8VGsN77bbvXfCaBnZWZjAXaMicrquw3MYSQKZ9MslRQbA+U8panmNfrd9l
	 dgw7dXfGfUO2nPm9kfC+mYWVWLqAsIBvvmSuWJT9lKb8KsGtj+IU+guzoD5CzY05w
	 BVtVoJClGVUG79YdnBdIpaozKjQ0qsDuKZAGpDT6zoSko9V5rECxckVXZYMxEhXBQ
	 QKq8JpYf+pM1F04EOe+UAF4nQyvi0NJQoXiEONwwlJWpg3DRmOluwWOtPUecU/Zch
	 /suMds9maFWthoJDGA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N45xz-1x9kZ71NhZ-011AZa; Mon, 13
 Jul 2026 14:04:48 +0200
Message-ID: <90a1a726-0e8f-463f-b424-30e3737e75f9@web.de>
Date: Mon, 13 Jul 2026 14:04:46 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gfs2: Move a variable assignment behind a null pointer
 check in inode_go_dump()
To: Andreas Gruenbacher <agruenba@redhat.com>, cluster-devel@redhat.com,
 kernel-janitors@vger.kernel.org
Cc: Bob Peterson <rpeterso@redhat.com>, cocci@inria.fr,
 LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <5800e1f5-8681-e140-fef0-8b2c3b4b6efa@web.de>
 <CAHc6FU4RekTwC9jH-H898PCyufrE59NYqZWy_V3p7R7dOCaTDA@mail.gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAHc6FU4RekTwC9jH-H898PCyufrE59NYqZWy_V3p7R7dOCaTDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bGBuFJVQmlHXm2w9s+M5cp8qOLl0D3efNs05k/7d+C+zJOskvvU
 XuJtun/JAo5iXjXzIFpyJmuEydijj+mfqKm3RLiw6Bw2hvKVH5AmegGIrbiwIgQyIHLXLGi
 JMK715k3k+cd3kV2vimYWvlgpSGP80SNa6rhPin7P0kYR1biPwCngPoL6M92xR/VvSDBOgc
 4N0e5bRV13QtlrUydYaDg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:B5V4EkbhwkE=;WF5JoE8qb1H72aw4PhVTnGDuSq5
 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
 =

>> The address of a data structure member was determined before
>> a corresponding null pointer check in the implementation of
>> the function =E2=80=9Cinode_go_dump=E2=80=9D.
>>
>> Thus avoid the risk for undefined behaviour by moving the assignment
>> for the variable =E2=80=9Cinode=E2=80=9D behind the null pointer check.
>>
>> This issue was detected by using the Coccinelle software.
>>
>> Fixes: 27a2660f1ef944724956d92e8a312b6da0936fae ("gfs2: Dump nrpages fo=
r inodes and their glocks")
>=20
> Okay, that's a worthwhile cleanup.

Thanks for a bit of positive feedback.

Why is this implementation detail still questionable so far?
https://elixir.bootlin.com/linux/v7.2-rc2/source/fs/gfs2/glops.c#L541-L565


>                                    It doesn't actually fix a bug, so
> I'm not going to add a Fixes tag, though.

How does your view fit to information in an article like =E2=80=9CFun with=
 NULL pointers, part 1=E2=80=9D
(by Jonathan Corbet from 2009-07-20)?
https://lwn.net/Articles/342330/

Regards,
Markus
