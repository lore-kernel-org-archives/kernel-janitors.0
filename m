From: Dhaval Giani <dhaval.giani@gmail.com>
Date: Mon, 15 Mar 2010 12:54:15 +0000
Subject: Re: [patch] sched: remove some dead code
Message-Id: <8aa016e11003150554h549a5853o7b21773915ac2451@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100315082148.GD18181@bicker>
In-Reply-To: <20100315082148.GD18181@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>, Dhaval Giani <dhaval.giani@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Kay Sievers <kay.sievers@vrfy.org>, Ingo Molnar <mingo@elte.hu>, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Mar 15, 2010 at 9:21 AM, Dan Carpenter <error27@gmail.com> wrote:
> This was left over from "7c9414385e sched: Remove USER_SCHED"
>

Quite surprising I missed that. Thanks for catching it.

> Signed-off-by: Dan Carpenter <error27@gmail.com>
>

Acked-by: Dhaval Giani <dhaval.giani@gmail.com>

> diff --git a/kernel/user.c b/kernel/user.c
> index 766467b..ec3b222 100644
> --- a/kernel/user.c
> +++ b/kernel/user.c
> @@ -178,8 +178,6 @@ struct user_struct *alloc_uid(struct user_namespace *=
ns, uid_t uid)
>
> =A0 =A0 =A0 =A0return up;
>
> - =A0 =A0 =A0 put_user_ns(new->user_ns);
> - =A0 =A0 =A0 kmem_cache_free(uid_cachep, new);
> =A0out_unlock:
> =A0 =A0 =A0 =A0return NULL;
> =A0}
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
