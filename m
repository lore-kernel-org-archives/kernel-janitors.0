From: Richard Weinberger <richard@nod.at>
Date: Sun, 17 Mar 2019 23:49:53 +0000
Subject: Re: [PATCH] hostfs: fix mismatch between link_file definition and declaration
Message-Id: <1760676.zAVrM27zAz@blindfold>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190317230909.7373-1-colin.king@canonical.com>
In-Reply-To: <20190317230909.7373-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: Jeff Dike <jdike@addtoit.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-um@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Am Montag, 18. M=E4rz 2019, 00:09:09 CET schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The function link_file declaration in the header file has the order
> of the two arguments (from, to) swapped when compared to the definition
> arguments of (to, from).  Fix this by swapping them around to match
> the definition.
>=20
> This error predates the git history, so no idea when this error
> was introduced.

commit bf4f804738544a95b8bc8d6a7e2629c3fc0240dd
Author: jdike <jdike>
Date:   Sat Dec 9 22:52:44 2000 +0000

    hostfs now mostly works.  Almost all of the common operations are now
    implemented, the main exceptions being mknod and executing files from
    a hostfs filesystem.

Enough archaeology for today. :-)

Thanks,
//richard
