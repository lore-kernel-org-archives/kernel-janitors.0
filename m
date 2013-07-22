From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Date: Mon, 22 Jul 2013 19:25:01 +0000
Subject: Re: [patch] fsnotify: potential use after free
Message-Id: <51ED870D.8070904@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130722065327.GA14617@longonot.mountain>
In-Reply-To: <20130722065327.GA14617@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Eric Paris <eparis@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 22.07.2013 08:53, Dan Carpenter wrote:
> My static checker complains that if we drop the last reference then it
> would be a use after free.  I don't know if it's possible, but really
> the atomic_dec(&group->num_marks); should be done while we are holding a
> reference to "group".
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/fs/notify/mark.c b/fs/notify/mark.c
> index 923fe4a..27e357e 100644
> --- a/fs/notify/mark.c
> +++ b/fs/notify/mark.c
> @@ -262,9 +262,9 @@ int fsnotify_add_mark_locked(struct fsnotify_mark *mark,
>   err:
>   	mark->flags &= ~FSNOTIFY_MARK_FLAG_ALIVE;
>   	list_del_init(&mark->g_list);
> +	atomic_dec(&group->num_marks);
>   	fsnotify_put_group(group);
>   	mark->group = NULL;
> -	atomic_dec(&group->num_marks);
>
>   	spin_unlock(&mark->lock);
>
>

Hi Dan,

we assume that the caller already holds a reference to a group. We then
take another ref for the marks->group. This is the one that we drop in
case of error, but there is still the one held by the caller. So its 
still save to access the group and to decrement the number of marks 
since we always hold a ref to it.
However, thank you for testing.

Regards,
Lino
