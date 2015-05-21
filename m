From: Jan Kara <jack@suse.cz>
Date: Thu, 21 May 2015 13:21:56 +0000
Subject: Re: [patch] udf: fix udf_load_pvoldesc()
Message-Id: <20150521132156.GG27863@quack.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150520081315.GA21948@mwanda>
In-Reply-To: <20150520081315.GA21948@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jan Kara <jack@suse.cz>, Fabian Frederick <fabf@skynet.be>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed 20-05-15 11:13:15, Dan Carpenter wrote:
> There are some missing braces here which means this function never
> succeeds.
> 
> Fixes: e9d4cf411f75 ('udf: improve error management in udf_CS0toUTF8()')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
  Thanks for the patch. Added to my tree. Actually, the missing parenthesis
don't cause any real issues since almost all volumes have volIdent and thus
ret gets set to 0 in the previous if. But it's certainly good to fix.

								Honza

> diff --git a/fs/udf/super.c b/fs/udf/super.c
> index c6a8f5f..b96f190 100644
> --- a/fs/udf/super.c
> +++ b/fs/udf/super.c
> @@ -937,12 +937,13 @@ static int udf_load_pvoldesc(struct super_block *sb, sector_t block)
>  		udf_debug("volIdent[] = '%s'\n", UDF_SB(sb)->s_volume_ident);
>  	}
>  
> -	if (!udf_build_ustr(instr, pvoldesc->volSetIdent, 128))
> +	if (!udf_build_ustr(instr, pvoldesc->volSetIdent, 128)) {
>  		ret = udf_CS0toUTF8(outstr, instr);
>  		if (ret < 0)
>  			goto out_bh;
>  
>  		udf_debug("volSetIdent[] = '%s'\n", outstr->u_name);
> +	}
>  
>  	ret = 0;
>  out_bh:
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
