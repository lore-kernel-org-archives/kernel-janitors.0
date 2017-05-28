From: Fabian Frederick <fabf@skynet.be>
Date: Sun, 28 May 2017 12:03:40 +0000
Subject: Re: [PATCH] fs/affs: fix an error code in affs_write_end_ofs()
Message-Id: <588695707.435876.1495973020877.open-xchange@webmail.nmp.proximus.be>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170520094946.o6l7rmizlvwq7mjg@mwanda>
In-Reply-To: <20170520094946.o6l7rmizlvwq7mjg@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org

Hi Dan,

> On 20 May 2017 at 11:49 Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
>
> "prev_bh" is a valid pointer.  "bh" is an error pointer.  "written" is
> either an error pointer, or a the number of bytes we have written.  If
> we haven't written any bytes then we want to return the error code
> stored in "bh".  So we need to that before resetting "bh" to a valid
> pointer.
>
> This bug is older than git.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Fabian Frederick <fabf@skynet.be>

>
> diff --git a/fs/affs/file.c b/fs/affs/file.c
> index 196ee7f6fdc4..99610050199c 100644
> --- a/fs/affs/file.c
> +++ b/fs/affs/file.c
> @@ -800,9 +800,9 @@ static int affs_write_end_ofs(struct file *file, struct
> address_space *mapping,
>       return written;
> 
>  err_bh:
> -     bh = prev_bh;
>       if (!written)
>               written = PTR_ERR(bh);
> +     bh = prev_bh;
>       goto done;
>  }
> 
