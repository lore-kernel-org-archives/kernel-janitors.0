From: Pekka Enberg <penberg@kernel.org>
Date: Sat, 09 Jul 2011 18:33:31 +0000
Subject: Re: [PATCH] fs/ocfs2/dlm/dlmlock.c: free kmem_cache_zalloc'd data
Message-Id: <CAOJsxLFu8CPmuDV4MD8vFmZYLpX3hYSKHOY29ChtsNrLfpzEvg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1310227479-14472-1-git-send-email-julia@diku.dk>
In-Reply-To: <1310227479-14472-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: Mark Fasheh <mfasheh@suse.com>, kernel-janitors@vger.kernel.org, Joel Becker <jlbec@evilplan.org>, Wengang Wang <wen.gang.wang@oracle.com>, Tao Ma <boyu.mt@taobao.com>, ocfs2-devel@oss.oracle.com, linux-kernel@vger.kernel.org

On Sat, Jul 9, 2011 at 7:04 PM, Julia Lawall <julia@diku.dk> wrote:
> From: Julia Lawall <julia@diku.dk>
>
> Memory allocated using kmem_cache_zalloc should be freed using
> kmem_cache_free, not kfree.
>
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> expression x,e,e1,e2;
> @@
>
> x =3D kmem_cache_zalloc(e1,e2)
> ... when !=3D x =3D e
> ?-kfree(x)
> +kmem_cache_free(e1,x)
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>

Reviewed-by: Pekka Enberg <penberg@kernel.org>

> ---
> =A0fs/ocfs2/dlm/dlmlock.c | =A0 =A02 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>
> diff -u -p a/fs/ocfs2/dlm/dlmlock.c b/fs/ocfs2/dlm/dlmlock.c
> --- a/fs/ocfs2/dlm/dlmlock.c
> +++ b/fs/ocfs2/dlm/dlmlock.c
> @@ -440,7 +440,7 @@ struct dlm_lock * dlm_new_lock(int type,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* zero memory only if kernel-allocated */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0lksb =3D kzalloc(sizeof(*lksb), GFP_NOFS);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!lksb) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(lock);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kmem_cache_free(dlm_lock_ca=
che, lock);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_allocated =3D 1;
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
