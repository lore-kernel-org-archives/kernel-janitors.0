From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Tue, 05 Jun 2007 16:48:35 +0000
Subject: Re: [KJ] Re: [PATCH] bugfix GFP_KERNEL -> GFP_ATOMIC in spin_locked
Message-Id: <20070605094835.5ada50da.randy.dunlap@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87odjvu1on.fsf@wanadoo.fr>
	<20070604210018.0eaa20a0.akpm@linux-foundation.org>
	<87k5uimzkh.fsf@wanadoo.fr>
	<200706051333.12219.oneukum@suse.de>
	<87ejkqe51t.fsf@wanadoo.fr>
In-Reply-To: <87ejkqe51t.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: Oliver Neukum <oneukum@suse.de>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

On Tue, 05 Jun 2007 18:31:42 +0200 Yoann Padioleau wrote:

> Oliver Neukum <oneukum@suse.de> writes:
>=20
> > Am Dienstag, 5. Juni 2007 13:05 schrieb Yoann Padioleau:
> >> Ok. Do you have a preference on the format ? =A0a <file>:<line> format=
 =A0?
> >>=20
> >> Is there a place that gathered all those implicit programming rules=20
> >> (that copy_from_user must not be called inside a spinlock, etc) so that
> >> I can translate them in a script for our tool.
> >
> > How much C does your tool understand?=20
>=20
> The tool understands almost all the C language but the analysis we do
> for the moment are intra-procedural so when we look for=20
>  spin_lock();
>  ...
>  copy_from_user();
>=20
> it can detect cases and code paths only when the two function calls
> are in the same function. It could be extended but it would require to
> do a full analysis of the kernel source. Maybe if some functions of
> the library have an attribute in their prototype in the .h such as
>=20
>  __might_sleep copy_from_user();=20
>=20
> it could help.
>=20
> > You might basically
> > test for code paths that go to "might_sleep()"
>=20
> Ok, thanks. If you know other implicit programming rules,
> I would be glad to know them, or if you know places
> where thus rules are written.
>=20
>=20
> BTW at one point I think the Linux community were using advanced
> static analysis tools such as the one made by Dawson Engler (now
> Coverity). The communitty have stopped using such tools ? Isn't the
> role of sparse to detect bugs such as the dangerous copy_from_user()
> inside spinlocked region ?
>=20

There are a few people who have registered for access to the
Coverity database and occasionally go thru it looking for bugs
and then posting fixes.

sparse can check for unbalanced locking, but it needs annotations
for those AFAIK.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
