From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Nov 2014 15:42:25 +0000
Subject: Re: thunderbolt: Deletion of unnecessary checks before the function call "ring_free"
Message-Id: <54720061.7010401@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>	 <530A72AA.3000601@users.sourceforge.net>	 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>	 <530B5FB6.6010207@users.sourceforge.net>	 <alpine.DEB.2.10.1402241710370.2074@hadrien>	 <530C5E18.1020800@users.sourceforge.net>	 <alpine.DEB.2.10.1402251014170.2080@hadrien>	 <530CD2C4.4050903@users.sourceforge.net>	 <alpine.DEB.2.10.1402251840450.7035@hadrien>	 <530CF8FF.8080600@users.sourceforge.net>	 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>	 <530DD06F.4090703@users.sourceforge.net>	 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>	 <5317A59D.4@users.sourceforge.net> <546F16A5.8030405@users.sourceforge.net>	 <CAMxnaaVLhKHjbzUJy5p_0n8BUprzSQ=A3sdF6iQzW_wqmq8N4A@mail.gmail.com>	 <546F2E50.5040804@users.sourceforge.net>	 <1416593688.6651.39.camel@perches.com>	 <5471EBAC.40903@users.sourceforge.net> <1416756022.6651.45.camel@perches.com>
In-Reply-To: <1416756022.6651.45.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Joe Perches <joe@perches.com>
Cc: Andreas Noever <andreas.noever@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tre=
e/drivers/char/tpm/xen-tpmfront.c?id=FC14f9c1272f62c3e8d01300f52467c0d9af50=
f9#n268
>=20
> I think static functions can be named whatever
> the developer chooses.

I agree also that this implementation detail is correct in principle.

Is a renaming of such identifiers feasible so that the probability of
other name clashes can be reduced and corresponding static source
code analysis might become a bit easier?

How do you prefer to handle name space issues?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
