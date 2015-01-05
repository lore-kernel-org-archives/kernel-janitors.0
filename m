From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 05 Jan 2015 21:55:16 +0000
Subject: Re: [PATCH 1/8] fs/9p: Deletion of unnecessary checks before the function call "p9_client_clunk"
Message-Id: <54AB0844.5090405@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <54A01326.3050306@users.sourceforge.net> <54A06AB9.4020505@users.sourceforge.net> <20150105112206.GC15033@mwanda> <54AB02F3.5020308@users.sourceforge.net> <alpine.DEB.2.02.1501052239290.2025@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1501052239290.2025@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Eric Van Hensbergen <ericvh@gmail.com>, Latchesar Ionkov <lucho@ionkov.net>, Ron Minnich <rminnich@sandia.gov>, v9fs-developer@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/ne=
t/9p/client.c?id=D8282ea05ad119247122de23db7d48ad6098cfa2#n1448
>> http://lxr.free-electrons.com/source/net/9p/client.c#L1448
>=20
> What do you mean by "work in principle"?

If I do not stumble on an unexpected name space issue from my static source
analysis again, then I would see the linked function as relevant here.
Its implementation provides a clear input parameter validation.


> But you don't want to do a dump_stack for no reason.  That would at best
> be very misleading, and I would imagine be quite expensive.

The error response is clear. Are any software developments efforts expected
to clean-up the call stack for unwanted null pointers even more?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
