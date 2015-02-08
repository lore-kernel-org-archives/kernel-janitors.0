From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 08 Feb 2015 10:51:18 +0000
Subject: Re: thunderbolt: Deletion of unnecessary checks before the function call "ring_free"
Message-Id: <54D73FA6.4090703@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <546F16A5.8030405@users.sourceforge.net> <CAMxnaaVLhKHjbzUJy5p_0n8BUprzSQ=A3sdF6iQzW_wqmq8N4A@mail.gmail.com> <546F2E50.5040804@users.sourceforge.net> <1416593688.6651.39.camel@perches.com> <5471EBAC.40903@users.sourceforge.net> <1416756022.6651.45.camel@perches.com> <CAMxnaaVb0253q7V-M7089Et+bfnmgN1E+Ttne4MFG8_U+CTbOA@mail.gmail.com>
In-Reply-To: <CAMxnaaVb0253q7V-M7089Et+bfnmgN1E+Ttne4MFG8_U+CTbOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Noever <andreas.noever@gmail.com>, Joe Perches <joe@perches.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> Do symbols which are not exported (no EXPORT_SYMBOL_(GPL)) cause conflicts?

How do you think about to mark more functions from your software module
as static?


> I was under the impression that those are module private.
> If they are indeed private then I would prefer to not rename them.

Would you like to help in avoiding difficulties around name space issues?

Will specific prefixes make understanding a bit easier?

Regards,
Markus
