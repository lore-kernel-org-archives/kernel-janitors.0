Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D575C20CCC8;
	Thu, 23 Jan 2025 12:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737633982; cv=none; b=pcyhUlDySRQE+g7RrlKyLCgRc40+vZ+XuFKCWJ6CSJST+iYSKa0mtxdXvuTRFf1oTEh1tptbHk0MU40CD4+AbwWbo9LrAZMNcGcRK/xW0HgjlWjmHV+8D9nm3LzxqFtgolYCmkmBOoFVLoW6H3BOlI5XI72V0NF+j34W0yXynSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737633982; c=relaxed/simple;
	bh=UTqiET7WvIyNmxkB9HztfBX6a1pIICycyDq3ehfiDBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=KMRmWByhTWXXoLhRky+HCtrkKahz6IVcWV5u3D6IoKWD9Zas3abO+JfnjPtDV8coW+rXZ2JxoDsuLHFbVRC0csb7QCJQ5LSCsJujcQL7+ZKncbJvsOmCuIJ63qCcdWR5rXE6JyZijxNQ3Hc2Uay+B94nehPrphLBe0EztvjRPuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=J0/5sZUr; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="J0/5sZUr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1737633969; x=1738238769; i=markus.elfring@web.de;
	bh=UTqiET7WvIyNmxkB9HztfBX6a1pIICycyDq3ehfiDBg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=J0/5sZUrC3lKWzqNKO4jFDxE1IqTSEZq1Jw9k0moBbt99Ke6hwlOJ9/wQuDVTPD3
	 BIIW6PEz0OAQ+/OuJK4XX2qtgJjn3p224Zu0N4lDFq+qDtKp0bfL6tanrHdsZb50d
	 4C3F4CFmFhE2g2SKbCQv+zmbMRa2myKi2/k3uTvLPHWraJnc+JM9E8zEmXnVXBiaG
	 XJQa4UYk9xjE+q9z0FrXzo/o7IZepmZaDcmIK4clVh7XdaZYnVWUurhhHQrhTDveE
	 hTxLvGuMZmfHp63fsglJ/gauLkyqt5VIPZBCxa4lN04ZiMlay7GjwCN6giB9h88kt
	 O/Rzt1J3jVlFGO1tpA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.29]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MYcll-1twg6c2iFn-00Sq37; Thu, 23
 Jan 2025 13:06:09 +0100
Message-ID: <07da64ca-e645-4a29-bc21-c3065ad5a3c4@web.de>
Date: Thu, 23 Jan 2025 13:05:54 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] linux-next: virtual rule report not supported
To: Ricardo Ribalda <ribalda@google.com>, cocci@inria.fr,
 Easwar Hariharan <eahariha@linux.microsoft.com>
References: <CANiDSCvLCaMdJVSMahNgg1UQMh3naoTrWGh=9+4p8pePWyLStg@mail.gmail.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CANiDSCvLCaMdJVSMahNgg1UQMh3naoTrWGh=9+4p8pePWyLStg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ETKQyoQm+2wisY4zMXlznKj4rTVYFgMBgmfgxnKx8kRLbgjOYZ5
 sKpHCL0Frerjxr6hiLBdhqHfZ8encQXBH2d9lFELMtfZiIJ0v8HjdYE9lfWpM9dG9jKqfgs
 v/Fri3PLZYiEw3+8bAFq1ErlEpheQAarn66/PaZ6WoJ7ebhZhiSWk17IFd4G1TrYEO9vpOQ
 4ODEVFwC1eEFjqWMfesog==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qnxH8L+R42U=;JcHHDYgJ+ZKhG7SlbXIjDav3hR5
 dBZ0q0qG15YwJ0kEsR95KGfVJMMLaN+lxnLX3hp7cf0R+JWHQSqwQjqgrx8YArb1YXUy32tRp
 zL//Ndq0QzTq7jTh6MD4Hcbdl8NvIFsuFsqaGLok8EtX4eN9r73ndqovoV7UVwXLKS0agm3RR
 33SwOaBD/F7yx5JxvgdDLQ+6nQvTUqZlSC5zapaRJBWLsrOjyC92/+IV3Ihl0O2RLthNoMqjq
 V5c868qdHxGE9ZQt9U4gDnTi7zyz5kNKMoWly46rLbbr+uLx2NqIDOaY5qyncLZtZDOyLJLTK
 b+NgEiAyoYpW9qQjRTJbYOqWvbEEhuVR+F/BEhe+zzOoD12E17954jzyXNx8IFhDUc2ho/OQN
 tV1SQOoM3nUwW3N19OyfOaGTY+KWoP50Twc5ddv/Xu6IOqyGKhEa/7IKk7sKOumzFmBqLlpd5
 Hymn5dHdi1bE1NVrzz9GT5QxeisSygkourf24m3tsvHkpOv6pcVcEg4iBIkJbFOd8ncRaqiar
 mF7bDVOyVXn9quOaeqqSrsc3OUF3EKnyI5h+cuztrHtuRzeM61kJxtTTBBEinLNh2VUo4HIas
 hMMy2Ec11Ol20EE3UFUKujDNZC0IzMyBdHjV+L1a5Tce76OtZWke/txaVZh2JE3adK7aRVtYV
 /L9VUWnl0Jh11I1TC1xJY5TzRNq95tVoX8ib0NZN9vZKH3oos4I0Ep5KfED2lxqeo7UO2fC6P
 Pefw7c+G4nV/dXrbjNZC47YTRpR9FFwU4jSzhp/bRPG1ffUF1qUEA48OQdW8t2Oor0otQ7CsD
 TwYIXEIK3vC6wz2nq55frC7mJTZrmNmKOUbR39EAQOolrYPWGNOPOoo31GUCWPQNfs3dvdKrW
 WsieonCAVhJnfP66bVVbCNiVU46zBdFJ31gN2h/sxaPA/QjvipUaDuc4VW/FJdsl0qxscZ8Z/
 bvGZmf0/tphuyZHOXM1FFfgUUH9hQ+1XGwrYvMnvt0Xwj6l+Aew1ah4X/3zNkKRosqM5J8IqU
 tfX7usXuTgbHF+Eu7lONcEyy1I2mMMb8JXMBJ6FFfBnQ3HXCu329h5q5AVBNffsDmXsoze1Jm
 rgoV/Kxj7l42IJVM4bHw86abgNBZ26rMc9/vzE9p3nDz4jxXHKiOV/beW7vVl7kdrThYNbbg4
 ZCmOxF2nzteO2VsPCNVMpaMHy7xaiFzw7HdacbGvq6CiWzmj2VcM8Hv/2f1iFownjHDbmSWFE
 elbw+Oif5GaYcTvzeARDJEzF2IAAIkVeiQUyv6rZPNuVPlnChU6Gioir9muH4xW4c6Jz4BpA3
 T9Ce0T9zRV3G/IokZWJvS5zqngjQrAY109mVv4xfVpvu/bF5fGs8PVUFdWDFzXXtzbm

> While trying out linux-next I have hit an error in cocci:
>
> $make coccicheck M=3D"$dir" MODE=3Dreport
> ...
> /usr/bin/spatch -D report --no-show-diff --very-quiet --cocci-file
> /workdir/scripts/coccinelle/misc/secs_to_jiffies.cocci --patch
> /workdir --dir . -I /workdir/arch/x86/include -I
> /workdir/arch/x86/include/generated -I /workdir/include -I
> /workdir/include -I /workdir/arch/x86/include/uapi -I
> /workdir/arch/x86/include/generated/uapi -I /workdir/include/uapi -I
> /workdir/include/generated/uapi --include
> /workdir/include/linux/compiler-version.h --include
> /workdir/include/linux/kconfig.h --jobs 64 --chunksize 1
> virtual rule report not supported
> coccicheck failed
> make[1]: Leaving directory '/workdir/drivers/media'
> make[2]: *** [/workdir/Makefile:2094: coccicheck] Error 255
> make[1]: *** [/workdir/Makefile:251: __sub-make] Error 2
> make: *** [Makefile:251: __sub-make] Error 2
>
> Deleting scripts/coccinelle/misc/secs_to_jiffies.cocci "works"

Would you like to increase the development attention for better support
of involved operation modes?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/dev-tools/coccinelle.rst?h=3Dv6.13#n71

Regards,
Markus
