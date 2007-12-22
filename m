From: Andrew Morton <akpm@linux-foundation.org>
Date: Sat, 22 Dec 2007 10:27:01 +0000
Subject: Re: [PATCH 1/3] ipc: Convert handmade 'max' to max().
Message-Id: <20071222022701.1ddd2ae2.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20071217023555.24944.62155.sendpatchset@thinktank.campus.ltu.se>
In-Reply-To: <20071217023555.24944.62155.sendpatchset@thinktank.campus.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Knutsson <ricknu-0@student.ltu.se>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 17 Dec 2007 03:35:55 +0100 (MET) Richard Knutsson <ricknu-0@student.ltu.se> wrote:

> Convert handmade 'max' to max().
> 
> ...
>
> --- a/ipc/msg.c
> +++ b/ipc/msg.c
> @@ -473,7 +473,7 @@ asmlinkage long sys_msgctl(int msqid, int cmd, struct msqid_ds __user *buf)
>  		up_read(&msg_ids(ns).rw_mutex);
>  		if (copy_to_user(buf, &msginfo, sizeof(struct msginfo)))
>  			return -EFAULT;
> -		return (max_id < 0) ? 0 : max_id;
> +		return max(max_id, 0);

I don't think I like that much.

I tend to think of max() as being an arithmetic sort of thing: pick the
largest of two scalars.

But the code which you're changing is a _logical_ operation.  It says "if
ipc_get_maxid() returned an error, then return zero.  Otherwise return
whatever ipc_get_maxid() returned".

Yes, max() will do the right thing here, but I think it's a bit of weird
trick?


I mean, if ipc_get_maxid() were a better function, it would return a -ve
errno when something failed rather than the present dopey hard-coded -1. 
In which case the code would read 

	return IS_ERR_VALUE(max_id) ? 0 : max_id;

in which case, converting it to max() would be even less appropriate.  If
you see what I mean...

