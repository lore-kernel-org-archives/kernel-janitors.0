From: Henning Schild <henning@hennsch.de>
Date: Wed, 15 Nov 2017 07:59:10 +0000
Subject: Re: [PATCH v2] docs: fix location of document that got moved
Message-Id: <20171115085910.493d7bc7@hennsch.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170901195721.16214-1-henning@hennsch.de>
        <20170920180204.23427-1-henning@hennsch.de>
In-Reply-To: <20170920180204.23427-1-henning@hennsch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Alexander Viro <viro@zeniv.linux.org.uk>, kernel-janitors@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>, Eryu Guan <eguan@redhat.com>

Adding kernel-janitors to the list, maybe some of you will pick it up.

Henning

Am Wed, 20 Sep 2017 20:02:04 +0200
schrieb Henning Schild <henning@hennsch.de>:

> commit 9d85025b0418 ("docs-rst: create an user's manual book")
> renamed  the document mentioned in the header. Adjust the link to
> point to the right place.
>=20
> Signed-off-by: Henning Schild <henning@hennsch.de>
> ---
>  fs/binfmt_misc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
> index ce7181ea60fa..b5f1ae5d3217 100644
> --- a/fs/binfmt_misc.c
> +++ b/fs/binfmt_misc.c
> @@ -4,7 +4,8 @@
>   * Copyright (C) 1997 Richard G=C3=BCnther
>   *
>   * binfmt_misc detects binaries via a magic or filename extension
> and invokes
> - * a specified wrapper. See Documentation/binfmt_misc.txt for more
> details.
> + * a specified wrapper. See
> Documentation/admin-guide/binfmt-misc.rst for more
> + * details.
>   */
> =20
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
