From: "J. Bruce Fields" <bfields@redhat.com>
Date: Wed, 13 Nov 2013 13:51:04 +0000
Subject: Re: [patch] locks: missing unlock on error in generic_add_lease()
Message-Id: <20131113135103.GA27536@pad.fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131113075627.GJ25541@elgon.mountain>
In-Reply-To: <20131113075627.GJ25541@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Matthew Wilcox <matthew@wil.cx>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Nov 13, 2013 at 10:56:27AM +0300, Dan Carpenter wrote:
> We should unlock here before returning.

A buggy-caller case, so shouldn't be a huge deal, but obviously should
be fixed, thanks!

	Acked-by: J. Bruce Fields <bfields@redhat.com>

I'm assuming Al will pick it up.

(Though error = -EAGAIN and "goto out" would be more consistent with
other exits.)

--b.

> 
> Fixes: df4e8d2c1d2b ('locks: implement delegations')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static checker stuff.
> 
> diff --git a/fs/locks.c b/fs/locks.c
> index f99d52b..92a0f0a 100644
> --- a/fs/locks.c
> +++ b/fs/locks.c
> @@ -1494,6 +1494,7 @@ static int generic_add_lease(struct file *filp, long arg, struct file_lock **flp
>  
>  	if (is_deleg && arg = F_WRLCK) {
>  		/* Write delegations are not currently supported: */
> +		mutex_unlock(&inode->i_mutex);
>  		WARN_ON_ONCE(1);
>  		return -EINVAL;
>  	}
