From: Ritesh Harjani <riteshh@linux.ibm.com>
Date: Wed, 08 Jul 2020 11:27:11 +0000
Subject: Re: [PATCH] ext4: Delete unnecessary checks before brelse()
Message-Id: <20200708111512.97DF5A405C@b06wcsmtp001.portsmouth.uk.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0d713702-072f-a89c-20ec-ca70aa83a432@web.de>
In-Reply-To: <0d713702-072f-a89c-20ec-ca70aa83a432@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-ext4@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, Theodore Ts'o <tytso@mit.edu>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>



On 6/13/20 11:37 PM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 13 Jun 2020 19:12:24 +0200
> 
> The brelse() function tests whether its argument is NULL
> and then returns immediately.
> Thus remove the tests which are not needed around the shown calls.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Sure, LGTM. Feel free to add
Reviewed-by: Ritesh Harjani <riteshh@linux.ibm.com>


> ---
>   fs/ext4/extents.c | 6 ++----
>   fs/ext4/xattr.c   | 3 +--
>   2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
> index 221f240eae60..315276d50aa8 100644
> --- a/fs/ext4/extents.c
> +++ b/fs/ext4/extents.c
> @@ -693,10 +693,8 @@ void ext4_ext_drop_refs(struct ext4_ext_path *path)
>   		return;
>   	depth = path->p_depth;
>   	for (i = 0; i <= depth; i++, path++) {
> -		if (path->p_bh) {
> -			brelse(path->p_bh);
> -			path->p_bh = NULL;
> -		}
> +		brelse(path->p_bh);
> +		path->p_bh = NULL;
>   	}
>   }
> 
> diff --git a/fs/ext4/xattr.c b/fs/ext4/xattr.c
> index 9b29a40738ac..eb997ce21be3 100644
> --- a/fs/ext4/xattr.c
> +++ b/fs/ext4/xattr.c
> @@ -1354,8 +1354,7 @@ static int ext4_xattr_inode_write(handle_t *handle, struct inode *ea_inode,
> 
>   	block = 0;
>   	while (wsize < bufsize) {
> -		if (bh != NULL)
> -			brelse(bh);
> +		brelse(bh);
>   		csize = (bufsize - wsize) > blocksize ? blocksize :
>   								bufsize - wsize;
>   		bh = ext4_getblk(handle, ea_inode, block, 0);
> --
> 2.27.0
> 
