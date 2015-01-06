From: Dominique Martinet <dominique.martinet@cea.fr>
Date: Tue, 06 Jan 2015 09:27:19 +0000
Subject: Re: [V9fs-developer] [PATCH 1/8] fs/9p: Deletion of unnecessary checks before the function call "p9_
Message-Id: <20150106092719.GB22484@u-galfione>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <54A01326.3050306@users.sourceforge.net>
 <54A06AB9.4020505@users.sourceforge.net> <20150105112206.GC15033@mwanda>
 <54AB02F3.5020308@users.sourceforge.net>
 <alpine.DEB.2.02.1501052239290.2025@localhost6.localdomain6>
 <54AB0844.5090405@users.sourceforge.net>
 <alpine.DEB.2.02.1501052257270.2025@localhost6.localdomain6>
 <20150106081253.GA22484@u-galfione>
In-Reply-To: <20150106081253.GA22484@u-galfione>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Latchesar Ionkov <lucho@ionkov.net>, Eric Van Hensbergen <ericvh@gmail.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ron Minnich <rminnich@sandia.gov>, v9fs-developer@lists.sourceforge.net, Dan Carpenter <dan.carpenter@oracle.com>

Dominique Martinet wrote on Tue, Jan 06, 2015 at 09:12:53AM +0100:
> Simple example, without even looking at the multiple possible
> interactions with multiple clients hammering the server, can be taken
> from v9fs_create in fs/9p/vfs_inode.c
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/fs/=
9p/vfs_inode.c?id=D8282ea05ad119247122de23db7d48ad6098cfa2#n652
>=20
> jumping to label error from a failure in p9_client_fcreate (e.g. EPERM
> or something perfectly valid) will, with your patch, call clunk with fid
> =3D NULL and thus generate a stack trace, while it is a perfectly normal
> code path that should only return to userspace with EPERM.

Actually just seen that this precise example is fixed along with more
similar code paths in subsequents (!) patchs of the set.

It could actually be interesting to see if we could get all such paths
"fixed".
If so, I believe this way will ultimately lead to cleaner code, but I'd
rather see taken all other patches first and keep this one in v9fs-devel
branch for a bit longer if this makes sense... Well, I guess there is a
test window before the merge to linus tree anyway, but given the number
of active 9P users it could be useful.


(All other patches in the set look good to me at second glance, now.
To answer Dan's mail, none of these are bug fix as far as I've seen,
just avoiding unnecessary checks for null or calls+check/warn depending
on whether you apply patch #1 first)

--=20
Dominique Martinet,
CEA
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
