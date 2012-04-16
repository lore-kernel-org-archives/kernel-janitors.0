From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <elezegarcia@gmail.com>
Date: Mon, 16 Apr 2012 19:03:28 +0000
Subject: [Q] warning BUG() related fixing and janitors question
Message-Id: <CALF0-+VyPmN03xhkQ_aQf_Zdc+J=DT1_MvKzQCVri4Fwbi83RQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi Dan,

I would like to know better about the janitors list, and what kind of
patches are handled here.
I've found a number of warnings in my building and I'm not sure where to
send patches and
what git tree should I take, since the warnings appear in a wide number of
subsystems.

1.
For instance, in kernel/sched/core.c

static inline struct task_struct *
pick_next_task(struct rq *rq)
{
=A0 =A0 /* snip */
=A0 =A0 BUG(); /* the idle class will always have a runnable task */
}

You can see that after BUG there is no return statement, which will produce
a compilation
warning you disable BUG() and it gets defined to nothing.

There are several of these warnings here and there, I guess as a consequence
of BUG() macro.

---
2.
Another one is flat_set_persistent() which is only IMO properly defined in
arch/sh/. The current
definition produces a warning in other architectures if binary flat format
is used.

So, I guess I should send a patch to each arch-specific list, right? using
arch-specific git trees?
I would like to have just one git tree, and not ten :)

Thanks for your time,
Ezequiel.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
