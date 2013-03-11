From: =?ISO-8859-1?Q?Arve_Hj=F8nnev=E5g?= <arve@android.com>
Date: Mon, 11 Mar 2013 23:57:48 +0000
Subject: Re: [PATCH v2 2/3] drivers: android: binder: Fix code style
Message-Id: <CAMP5XgchLsz=MJsousY+qQU3J_Y4D7U2jC0xqb4yhbNwiMS8+w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1363030315-10229-1-git-send-email-mirsal@mirsal.fr>
	<1363044388-11409-1-git-send-email-mirsal@mirsal.fr>
	<1363044388-11409-3-git-send-email-mirsal@mirsal.fr>
In-Reply-To: <1363044388-11409-3-git-send-email-mirsal@mirsal.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Mirsal Ennaime <mirsal@mirsal.fr>
Cc: Greg Kroah-Hartman <greg@kroah.com>, Brian Swetland <swetland@google.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Joe Perches <joe@perches.com>

On Mon, Mar 11, 2013 at 4:26 PM, Mirsal Ennaime <mirsal@mirsal.fr> wrote:
>  * Use tabs
>  * Remove a few "80-columns" checkpatch warnings
>  * Separate code paths with empty lines for readability
>
> Signed-off-by: Mirsal Ennaime <mirsal@mirsal.fr>
> ---
>  drivers/staging/android/binder.c |   42 +++++++++++++++++++++++++-------=
------
>  1 file changed, 28 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/staging/android/binder.c b/drivers/staging/android/b=
inder.c
> index 43f823d..4652cd8 100644
> --- a/drivers/staging/android/binder.c
> +++ b/drivers/staging/android/binder.c
> @@ -2927,57 +2927,69 @@ static void binder_deferred_release(struct binder=
_proc *proc)
>  {
>         struct binder_transaction *t;
>         struct rb_node *n;
> -       int threads, nodes, incoming_refs, outgoing_refs, buffers, active=
_transactions, page_count;
> +       int threads, nodes, incoming_refs, outgoing_refs, buffers,
> +               active_transactions, page_count;
>
>         BUG_ON(proc->vma);
>         BUG_ON(proc->files);
>
>         hlist_del(&proc->proc_node);
> +
>         if (binder_context_mgr_node && binder_context_mgr_node->proc =3D =
proc) {
>                 binder_debug(BINDER_DEBUG_DEAD_BINDER,
> -                            "binder_release: %d context_mgr_node gone\n",
> -                            proc->pid);
> +                       "binder_release: %d context_mgr_node gone\n",
> +                       proc->pid);

I don't like this change (and the others like it). If is not uncommon
the align arguments on that don't fit the first line with the
arguments on the first line, so why change it here?

--=20
Arve Hj=F8nnev=E5g
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
