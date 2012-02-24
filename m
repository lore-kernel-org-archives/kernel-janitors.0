From: Andreas Dilger <aedilger@gmail.com>
Date: Fri, 24 Feb 2012 17:10:50 +0000
Subject: Re: [PATCH] ext4: MMP: Fix endianness bug.
Message-Id: <8AC30AEF-F9A3-4CD2-B2C0-398A87ABD20F@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4f468ef2.4105440a.56cc.ffffa1d7@mx.google.com>
In-Reply-To: <4f468ef2.4105440a.56cc.ffffa1d7@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "santoshprasadnayak@gmail.com" <santoshprasadnayak@gmail.com>
Cc: "tytso@mit.edu" <tytso@mit.edu>, "adilger@dilger.ca" <adilger@dilger.ca>, "andrew_perepechko@xyratex.com" <andrew_perepechko@xyratex.com>, "nikitas_angelinas@xyratex.com" <nikitas_angelinas@xyratex.com>, "johann@whamcloud.com" <johann@whamcloud.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 2012-02-23, at 12:09, santoshprasadnayak@gmail.com wrote:

> From: Santosh Nayak <santoshprasadnayak@gmail.com>
> 
> Sparse complaint this endian bug in ext4: mmp.
> 
> Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>

Looks good. 

Reviewed-by: Andreas Dilger <adilger@dilger.ca>

> ---
> fs/ext4/mmp.c |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ext4/mmp.c b/fs/ext4/mmp.c
> index 7ea4ba4..ed6548d 100644
> --- a/fs/ext4/mmp.c
> +++ b/fs/ext4/mmp.c
> @@ -257,8 +257,8 @@ int ext4_multi_mount_protect(struct super_block *sb,
>     * If check_interval in MMP block is larger, use that instead of
>     * update_interval from the superblock.
>     */
> -    if (mmp->mmp_check_interval > mmp_check_interval)
> -        mmp_check_interval = mmp->mmp_check_interval;
> +    if (le16_to_cpu(mmp->mmp_check_interval) > mmp_check_interval)
> +        mmp_check_interval = le16_to_cpu(mmp->mmp_check_interval);
> 
>    seq = le32_to_cpu(mmp->mmp_seq);
>    if (seq = EXT4_MMP_SEQ_CLEAN)
> -- 
> 1.7.4.4
> 
