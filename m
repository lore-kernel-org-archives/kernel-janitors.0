From: "Namjae Jeon" <namjae.jeon@samsung.com>
Date: Thu, 07 May 2020 02:50:17 +0000
Subject: RE: [PATCH -next] exfat: fix possible memory leak in exfat_find()
Message-Id: <004801d6241a$3d8da150$b8a8e3f0$@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20200506142203epcas1p1f805af350b11786d9771fb5bd12bfdd6@epcas1p1.samsung.com>
        <20200506142554.123748-1-weiyongjun1@huawei.com>
In-Reply-To: <20200506142554.123748-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Wei Yongjun' <weiyongjun1@huawei.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, 'Sungjong Seo' <sj1557.seo@samsung.com>

> 'es' is malloced from exfat_get_dentry_set() in exfat_find() and should be freed before leaving from
> the error handling cases, otherwise it will cause memory leak.
> 
> Fixes: 5f2aa075070c ("exfat: add inode operations")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Applied.
Thanks!
> ---
>  fs/exfat/namei.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c index c241dd177f1a..48f4df883f3b 100644
> --- a/fs/exfat/namei.c
> +++ b/fs/exfat/namei.c
> @@ -681,6 +681,7 @@ static int exfat_find(struct inode *dir, struct qstr *qname,
>  			exfat_fs_error(sb,
>  				"non-zero size file starts with zero cluster (size : %llu, p_dir : %u,
> entry : 0x%08x)",
>  				i_size_read(dir), ei->dir.dir, ei->entry);
> +			kfree(es);
>  			return -EIO;
>  		}
> 
> 
