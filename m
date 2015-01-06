From: Dominique Martinet <dominique.martinet@cea.fr>
Date: Tue, 06 Jan 2015 15:02:02 +0000
Subject: Re: [V9fs-developer] [PATCH 1/8] fs/9p: Deletion of unnecessary checks before the function call "p9_
Message-Id: <20150106150202.GA31294@u-galfione>
List-Id: <kernel-janitors.vger.kernel.org>
References: <54A01326.3050306@users.sourceforge.net>
 <54A06AB9.4020505@users.sourceforge.net> <20150105112206.GC15033@mwanda>
 <54AB02F3.5020308@users.sourceforge.net>
 <alpine.DEB.2.02.1501052239290.2025@localhost6.localdomain6>
 <54AB0844.5090405@users.sourceforge.net>
 <alpine.DEB.2.02.1501052257270.2025@localhost6.localdomain6>
 <20150106081253.GA22484@u-galfione> <20150106092719.GB22484@u-galfione>
 <54ABF260.9020904@users.sourceforge.net>
In-Reply-To: <54ABF260.9020904@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Latchesar Ionkov <lucho@ionkov.net>, Eric Van Hensbergen <ericvh@gmail.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ron Minnich <rminnich@sandia.gov>, v9fs-developer@lists.sourceforge.net, Dan Carpenter <dan.carpenter@oracle.com>

SF Markus Elfring wrote on Tue, Jan 06, 2015 at 03:34:08PM +0100:
> > Actually just seen that this precise example is fixed along with more
> > similar code paths in subsequents (!) patchs of the set.
>=20
> Do you refer to my update suggestions with a subject like "One function
> call less in v9fs_=E2=80=A6" here?

Yes. Looking at the patchset as a whole (and under the assumption that
calling p9_client_clunk with NULL is harmful), your patchset first
introduces many such calls then proceeds onto fixing them.

Thinking a bit more, I think that instead of just changing the order of
patches the cleanest way would be to submit this as "reworking jump
labels, making NULL checks useless in the process".
Still only looking at v9fs_create, with your patch#2 reflowing,
p9_client_clunk can't be called with NULL unless a bug happened (either
p9_client_fcreate or p9_client_walk returning non-error but leaving ofid
or fid NULL), so it'd actually make sense to remove the quiet check in
favor of the warn/stack dump check at this point.

Is what I'm saying making sense?

> > It could actually be interesting to see if we could get all such
> > paths "fixed".
>=20
> Would you like to see any more specific source code clean-up?
> Which kind of fine-tuning have you got in mind?

I was really just thinking that if the code flow is thought out the if's
can be removed harmlessly, but that it actually needs to be done the
other way around.
I honestly am not involved enough in kernel coding style changes or 9p
code as a whole to suggest anything else, sorry :)

Thanks,
--=20
Dominique Martinet,
CEA
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
