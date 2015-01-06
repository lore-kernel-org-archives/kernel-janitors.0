From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 06 Jan 2015 14:34:08 +0000
Subject: Re: [V9fs-developer] [PATCH 1/8] fs/9p: Deletion of unnecessary checks before the function call "p9_
Message-Id: <54ABF260.9020904@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <54A01326.3050306@users.sourceforge.net> <54A06AB9.4020505@users.sourceforge.net> <20150105112206.GC15033@mwanda> <54AB02F3.5020308@users.sourceforge.net> <alpine.DEB.2.02.1501052239290.2025@localhost6.localdomain6> <54AB0844.5090405@users.sourceforge.net> <alpine.DEB.2.02.1501052257270.2025@localhost6.localdomain6> <20150106081253.GA22484@u-galfione> <20150106092719.GB22484@u-galfione>
In-Reply-To: <20150106092719.GB22484@u-galfione>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dominique Martinet <dominique.martinet@cea.fr>, Julia Lawall <julia.lawall@lip6.fr>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Eric Van Hensbergen <ericvh@gmail.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ron Minnich <rminnich@sandia.gov>, v9fs-developer@lists.sourceforge.net, Dan Carpenter <dan.carpenter@oracle.com>

>> jumping to label error from a failure in p9_client_fcreate (e.g. EPERM
>> or something perfectly valid) will, with your patch, call clunk with fid
>> =3D NULL and thus generate a stack trace, while it is a perfectly normal
>> code path that should only return to userspace with EPERM.
>=20
> Actually just seen that this precise example is fixed along with more
> similar code paths in subsequents (!) patchs of the set.

Do you refer to my update suggestions with a subject like "One function
call less in v9fs_=85" here?


> It could actually be interesting to see if we could get all such
> paths "fixed".

Would you like to see any more specific source code clean-up?
Which kind of fine-tuning have you got in mind?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
