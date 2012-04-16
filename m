From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 16 Apr 2012 20:57:23 +0000
Subject: Re: [Q] warning BUG() related fixing and janitors question
Message-Id: <20120416205723.GG6498@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALF0-+VyPmN03xhkQ_aQf_Zdc+J=DT1_MvKzQCVri4Fwbi83RQ@mail.gmail.com>
In-Reply-To: <CALF0-+VyPmN03xhkQ_aQf_Zdc+J=DT1_MvKzQCVri4Fwbi83RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, Apr 16, 2012 at 04:03:28PM -0300, Ezequiel Garc=EDa wrote:
> Hi Dan,
>=20
> I would like to know better about the janitors list, and what kind of
> patches are handled here.

We don't actually handle any patches any more.  It is a place to
help newbies, or if we are working on similar code then we CC the
list so not everyone sends the same patch 7 times, and also it's
for review.  Send patches to the people from
./scripts/get_maintainer.pl and CC kernel-janitors if you want.

> I've found a number of warnings in my building and I'm not sure where to
> send patches and
> what git tree should I take, since the warnings appear in a wide number of
> subsystems.
>=20
> 1.
> For instance, in kernel/sched/core.c
>=20
> static inline struct task_struct *
> pick_next_task(struct rq *rq)
> {
> =A0 =A0 /* snip */
> =A0 =A0 BUG(); /* the idle class will always have a runnable task */
> }
>=20
> You can see that after BUG there is no return statement, which will produ=
ce
> a compilation
> warning you disable BUG() and it gets defined to nothing.
>=20
> There are several of these warnings here and there, I guess as a conseque=
nce
> of BUG() macro.
>=20

Don't start messing in scheduler code if you have any doubts about
what you are doing.  My advise is don't send a patch for this
warning.  Most times people leave BUG() enabled so we don't really
care about the warning.

> ---
> 2.
> Another one is flat_set_persistent() which is only IMO properly defined in
> arch/sh/. The current
> definition produces a warning in other architectures if binary flat format
> is used.
>=20
> So, I guess I should send a patch to each arch-specific list, right? using
> arch-specific git trees?
> I would like to have just one git tree, and not ten :)

I'm not sure what you mean here.  What is the warning?  It sounds
like something is wrong in a Kconfig file.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
