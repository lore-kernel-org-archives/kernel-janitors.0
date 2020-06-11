From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 11 Jun 2020 08:00:55 +0000
Subject: Re: [PATCH v2] exfat: add missing brelse() calls on error paths
Message-Id: <6e64100a-b623-a4d2-c5d0-cc9235669cdf@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200610172213.GA90634@mwanda>
In-Reply-To: <20200610172213.GA90634@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Namjae Jeon <namjae.jeon@samsung.com>, Sungjong Seo <sj1557.seo@samsung.com>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, Tetsuhiro Kohada <kohada.t2@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>

…
> +++ b/fs/exfat/namei.c
> @@ -1077,10 +1077,14 @@ static int exfat_rename_file(struct inode *inode, struct exfat_chain *p_dir,
>
>  		epold = exfat_get_dentry(sb, p_dir, oldentry + 1, &old_bh,
>  			&sector_old);
> +		if (!epold)
> +			return -EIO;
…

Can it become helpful to annotate such null pointer checks for branch prediction?
Would you like to indicate a likelihood in any way?

Regards,
Markus
