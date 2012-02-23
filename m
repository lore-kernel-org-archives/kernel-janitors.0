From: Johann Lombardi <johann@whamcloud.com>
Date: Thu, 23 Feb 2012 21:49:37 +0000
Subject: Re: [PATCH] ext4: MMP: Fix endianness bug.
Message-Id: <20120223214937.GC2636@granier.hd.free.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4f468ef2.4105440a.56cc.ffffa1d7@mx.google.com>
In-Reply-To: <4f468ef2.4105440a.56cc.ffffa1d7@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santoshprasadnayak@gmail.com
Cc: tytso@mit.edu, adilger@dilger.ca, andrew_perepechko@xyratex.com, nikitas_angelinas@xyratex.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Feb 24, 2012 at 12:39:05AM +0530, santoshprasadnayak@gmail.com wrote:
> @@ -257,8 +257,8 @@ int ext4_multi_mount_protect(struct super_block *sb,
>  	 * If check_interval in MMP block is larger, use that instead of
>  	 * update_interval from the superblock.
>  	 */
> -	if (mmp->mmp_check_interval > mmp_check_interval)
> -		mmp_check_interval = mmp->mmp_check_interval;
> +	if (le16_to_cpu(mmp->mmp_check_interval) > mmp_check_interval)
> +		mmp_check_interval = le16_to_cpu(mmp->mmp_check_interval);

Looks good to me.
Reviewed-by: Johann Lombardi <johann@whamcloud.com>

Johann
