From: Dan Carpenter <error27@gmail.com>
Date: Tue, 14 Dec 2010 18:42:57 +0000
Subject: Re: [RESEND] [PATCH] kernel/panic.c: Fix two checkpatch.pl errors
Message-Id: <20101214184253.GB1639@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1292345888-19129-1-git-send-email-toralf.foerster@gmx.de>
In-Reply-To: <1292345888-19129-1-git-send-email-toralf.foerster@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Toralf =?iso-8859-1?Q?F=F6rster?= <toralf.foerster@gmx.de>
Cc: tfransosi@gmail.com, kernel-janitors@vger.kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

On Tue, Dec 14, 2010 at 05:58:08PM +0100, Toralf F=F6rster wrote:
> nothing else
>=20

This patch is not helpful.  I mean that in the sense that the code is
just as readable before and after.  :/  Please only send patches that
make the code better.

Checkpatch.pl is a good tool for staging but outside of staging you
should only use it for [check]ing [patch]es.  The problem is that
pointless churn clutters up the log and breaks git blame.  In staging
that's Ok.

regards,
dan carpenter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
