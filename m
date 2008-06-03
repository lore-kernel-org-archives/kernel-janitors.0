From: "Mark Asselstine" <asselsm@gmail.com>
Date: Tue, 03 Jun 2008 12:16:54 +0000
Subject: Re: [PATCH] ext2 : correct comments in fs/ext2/balloc.c
Message-Id: <919fe2b30806030516l4e7ba605kd9a01a18865cbdcc@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30805311115t72773c4u66999762bb53d157@mail.gmail.com>
In-Reply-To: <ea11fea30805311115t72773c4u66999762bb53d157@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manish Katiyar <mkatiyar@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, May 31, 2008 at 2:15 PM, Manish Katiyar <mkatiyar@gmail.com> wrote:
> This patch corrects the wrong function name mentioned in the comments
> of ext2_free_blocks()  function
>
> ============================
>
> Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
Reviewed-by: Mark Asselstine <mark.asselstine@windriver.com>

One comment, lose the timestamps  they add no value.
>
> --- a/fs/ext2/balloc.c   2008-05-11 23:54:40.000000000 +0530
> +++ b/fs/ext2/balloc.c        2008-05-31 23:44:20.000000000 +0530
> @@ -478,7 +478,7 @@
>  }
>
>  /**
> - * ext2_free_blocks_sb() -- Free given blocks and update quota and i_blocks
> + * ext2_free_blocks() -- Free given blocks and update quota and i_blocks
>  * @inode:             inode
>  * @block:             start physcial block to free
>  * @count:             number of blocks to free
>
>
> =============================
>
> --
> Thanks & Regards,
> ********************************************
> Manish Katiyar ( http://mkatiyar.googlepages.com )
> 3rd Floor, Fair Winds Block
> EGL Software Park
> Off Intermediate Ring Road
> Bangalore 560071, India
> ***********************************************
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
