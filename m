From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 05 Jan 2015 21:32:35 +0000
Subject: Re: [PATCH 1/8] fs/9p: Deletion of unnecessary checks before the function call "p9_client_clunk"
Message-Id: <54AB02F3.5020308@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <54A01326.3050306@users.sourceforge.net> <54A06AB9.4020505@users.sourceforge.net> <20150105112206.GC15033@mwanda>
In-Reply-To: <20150105112206.GC15033@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Eric Van Hensbergen <ericvh@gmail.com>, Latchesar Ionkov <lucho@ionkov.net>, Ron Minnich <rminnich@sandia.gov>, v9fs-developer@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> The p9_client_clunk() function tests whether its argument is NULL
>> and then returns immediately. Thus the test around the call is not neede=
d.
>>
>=20
> Not true.  You are not allowed to call p9_client_clunk(NULL).

I find that it will work in principle if we refer to the same
function implementation.
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/net/9=
p/client.c?id=D8282ea05ad119247122de23db7d48ad6098cfa2#n1448
http://lxr.free-electrons.com/source/net/9p/client.c#L1448


> I assume this patch adds a bug.

It can happen that you will not like a corresponding error message
if the callers will still pass null pointers eventually.

... Trying to clunk with NULL ...


> I assume this patch adds a bug.  You have tried to introduce several of t=
hese
> kinds of bugs.

Do any other contributors want to reject my update suggestions
around software components for "fs/9p"?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
