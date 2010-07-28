From: Pekka Enberg <penberg@cs.helsinki.fi>
Date: Wed, 28 Jul 2010 16:53:06 +0000
Subject: Re: [PATCH 05/10] mm: check kmalloc() return value
Message-Id: <AANLkTimhz5D4jthc8__HvHekznWSftXqqDihzjKbW9=P@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280335203-23305-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280335203-23305-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Nick Piggin <npiggin@suse.de>, Jan Beulich <jbeulich@novell.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org

On Wed, Jul 28, 2010 at 7:40 PM, Kulikov Vasiliy <segooon@gmail.com> wrote:
> kmalloc() may fail, if so return -ENOMEM.
>
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Acked-by: Pekka Enberg <penberg@cs.helsinki.fi>

> ---
> =A0mm/vmalloc.c | =A0 =A05 ++++-
> =A01 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index b7e314b..f63684a 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2437,8 +2437,11 @@ static int vmalloc_open(struct inode *inode, struc=
t file *file)
> =A0 =A0 =A0 =A0unsigned int *ptr =3D NULL;
> =A0 =A0 =A0 =A0int ret;
>
> - =A0 =A0 =A0 if (NUMA_BUILD)
> + =A0 =A0 =A0 if (NUMA_BUILD) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ptr =3D kmalloc(nr_node_ids * sizeof(unsig=
ned int), GFP_KERNEL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ptr =3D NULL)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> + =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0ret =3D seq_open(file, &vmalloc_op);
> =A0 =A0 =A0 =A0if (!ret) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct seq_file *m =3D file->private_data;
> --
> 1.7.0.4
>
> --
> To unsubscribe, send a message with 'unsubscribe linux-mm' in
> the body to majordomo@kvack.org. =A0For more info on Linux MM,
> see: http://www.linux-mm.org/ .
> Don't email: <a href=3Dmailto:"dont@kvack.org"> email@kvack.org </a>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
