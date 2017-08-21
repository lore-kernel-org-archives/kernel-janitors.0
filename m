From: Jan Kara <jack@suse.cz>
Date: Mon, 21 Aug 2017 14:06:15 +0000
Subject: Re: [PATCH 1/4] isofs: Delete an error message for a failed memory allocation in isofs_read_inode()
Message-Id: <20170821140615.GB31870@quack2.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ed931e75-f443-6e19-ca56-4c1ad027dc25@users.sourceforge.net>
 <40baa0f0-b3a2-6ff3-4e8e-f172e0f74f76@users.sourceforge.net>
In-Reply-To: <40baa0f0-b3a2-6ff3-4e8e-f172e0f74f76@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, Ingo Molnar <mingo@kernel.org>, Jan Kara <jack@suse.cz>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sat 19-08-17 09:15:57, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 18 Aug 2017 21:41:24 +0200
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thanks. Applied to my tree.

								Honza

> ---
>  fs/isofs/inode.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/isofs/inode.c b/fs/isofs/inode.c
> index 217a5e7815da..2d3f090944df 100644
> --- a/fs/isofs/inode.c
> +++ b/fs/isofs/inode.c
> @@ -1324,4 +1324,3 @@ static int isofs_read_inode(struct inode *inode, int relocated)
> -			printk(KERN_INFO "%s: out of memory\n", __func__);
>  			ret = -ENOMEM;
>  			goto fail;
>  		}
> -- 
> 2.14.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
