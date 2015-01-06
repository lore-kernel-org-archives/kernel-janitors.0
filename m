From: Dominique Martinet <dominique.martinet@cea.fr>
Date: Tue, 06 Jan 2015 08:12:53 +0000
Subject: Re: [V9fs-developer] [PATCH 1/8] fs/9p: Deletion of unnecessary checks before the function call "p9_
Message-Id: <20150106081253.GA22484@u-galfione>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <54A01326.3050306@users.sourceforge.net>
 <54A06AB9.4020505@users.sourceforge.net> <20150105112206.GC15033@mwanda>
 <54AB02F3.5020308@users.sourceforge.net>
 <alpine.DEB.2.02.1501052239290.2025@localhost6.localdomain6>
 <54AB0844.5090405@users.sourceforge.net>
 <alpine.DEB.2.02.1501052257270.2025@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1501052257270.2025@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Latchesar Ionkov <lucho@ionkov.net>, Eric Van Hensbergen <ericvh@gmail.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ron Minnich <rminnich@sandia.gov>, v9fs-developer@lists.sourceforge.net, Dan Carpenter <dan.carpenter@oracle.com>

Hi,

Julia Lawall wrote on Mon, Jan 05, 2015 at 11:01:55PM +0100:
> > The error response is clear. Are any software developments efforts expe=
cted
> > to clean-up the call stack for unwanted null pointers even more?
>=20
> I found the original patch and looked at the call sites.  None of them=20
> calls dump_stack.  The behavior is thus not the same.  With your change, =

> something that was previously treated in an orderly manner will be=20
> converted to something that looks like an oops.  I assume that the cost o=
f=20
> the dump_stack will also be huge.

I definitely agree there, this will create unwanted dump_stack messages.

Simple example, without even looking at the multiple possible
interactions with multiple clients hammering the server, can be taken
from v9fs_create in fs/9p/vfs_inode.c
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/fs/9p=
/vfs_inode.c?id=D8282ea05ad119247122de23db7d48ad6098cfa2#n652

jumping to label error from a failure in p9_client_fcreate (e.g. EPERM
or something perfectly valid) will, with your patch, call clunk with fid
=3D NULL and thus generate a stack trace, while it is a perfectly normal
code path that should only return to userspace with EPERM.


(admitedly, the linux vfs will do checks first to ensure that the
function is likely to succeed, but some servers can implement their own
security model on top)


Other patches in the set look good at first glance, but I'll need a bit
to find time to look through implications they may have.
--=20
Dominique Martinet,
CEA
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
