From: Jiri Kosina <jkosina@suse.cz>
Date: Fri, 18 Dec 2009 14:03:41 +0000
Subject: Re: [PATCH 01/10] Fix misspelling of "should" in string.
Message-Id: <alpine.LNX.2.00.0912181503280.3755@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1260567342-8327-2-git-send-email-adam.buchbinder@gmail.com>
In-Reply-To: <1260567342-8327-2-git-send-email-adam.buchbinder@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 11 Dec 2009, Adam Buchbinder wrote:

> A string message misspells "should"; this fixes it. No change in functionality.
> 
> Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
> ---
>  fs/ext4/move_extent.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/fs/ext4/move_extent.c b/fs/ext4/move_extent.c
> index 25b6b14..6d26d89 100644
> --- a/fs/ext4/move_extent.c
> +++ b/fs/ext4/move_extent.c
> @@ -1088,7 +1088,7 @@ mext_check_arguments(struct inode *orig_inode,
>  	}
>  
>  	if (!*len) {
> -		ext4_debug("ext4 move extent: len shoudld not be 0 "
> +		ext4_debug("ext4 move extent: len should not be 0 "
>  			"[ino:orig %lu, donor %lu]\n", orig_inode->i_ino,
>  			donor_inode->i_ino);
>  		return -EINVAL;

This has been already fixed for 2.6.33-rc1.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
