From: Boaz Harrosh <bharrosh@panasas.com>
Date: Tue, 22 Nov 2011 00:57:23 +0000
Subject: Re: [patch] exofs: fix endian conversion in exofs_sync_fs()
Message-Id: <4ECAF373.1060708@panasas.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111121144311.GA19025@elgon.mountain>
In-Reply-To: <20111121144311.GA19025@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11/21/2011 06:43 AM, Dan Carpenter wrote:
> fscb->s_numfiles is an __le64 field so we need to use cpu_to_le64()
> to get a little endian 64 bit on big endian systems.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is a static checker fix.  Untested.
> 

Will apply. s_numfiles is never used but should be loaded
correctly regardless.

Thanks
Boaz

> diff --git a/fs/exofs/super.c b/fs/exofs/super.c
> index e6085ec..53b55a3 100644
> --- a/fs/exofs/super.c
> +++ b/fs/exofs/super.c
> @@ -390,7 +390,7 @@ static int exofs_sync_fs(struct super_block *sb, int wait)
>  	ios->length = offsetof(struct exofs_fscb, s_dev_table_oid);
>  	memset(fscb, 0, ios->length);
>  	fscb->s_nextid = cpu_to_le64(sbi->s_nextid);
> -	fscb->s_numfiles = cpu_to_le32(sbi->s_numfiles);
> +	fscb->s_numfiles = cpu_to_le64(sbi->s_numfiles);
>  	fscb->s_magic = cpu_to_le16(sb->s_magic);
>  	fscb->s_newfs = 0;
>  	fscb->s_version = EXOFS_FSCB_VER;

