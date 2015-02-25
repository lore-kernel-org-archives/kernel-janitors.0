From: Sergei Antonov <saproj@gmail.com>
Date: Wed, 25 Feb 2015 14:50:19 +0000
Subject: Re: [patch] hfsplus: add missing curly braces in hfsplus_delete_cat()
Message-Id: <CABikg9yk7BoL36FMW3sxXOY5MUb-TRDWB_Me3pAjMkpRAU-8ow@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150225133644.GW19745@mwanda>
In-Reply-To: <20150225133644.GW19745@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vyacheslav Dubeyko <slava@dubeyko.com>, Sougata Santra <sougata@tuxera.com>, Christoph Hellwig <hch@lst.de>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 25 February 2015 at 14:36, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> This doesn't change how the code works, but clearly the curly braces
> were intended.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/fs/hfsplus/catalog.c b/fs/hfsplus/catalog.c
> index 7892e6f..022974a 100644
> --- a/fs/hfsplus/catalog.c
> +++ b/fs/hfsplus/catalog.c
> @@ -350,10 +350,11 @@ int hfsplus_delete_cat(u32 cnid, struct inode *dir, struct qstr *str)
>                         &fd.search_key->cat.name.unicode,
>                         off + 2, len);
>                 fd.search_key->key_len = cpu_to_be16(6 + len);
> -       } else
> +       } else {
>                 err = hfsplus_cat_build_key(sb, fd.search_key, dir->i_ino, str);
>                 if (unlikely(err))
>                         goto out;
> +       }
>
>         err = hfs_brec_find(&fd, hfs_find_rec_by_key);
>         if (err)

Right you are.
I would also add 2 things:
1. CC the author of the last patch (the one which introduced it).
2. Unify the way the return code from hfsplus_cat_build_key() is
checked. Now it has two flavours: "if (unlikely(err < 0))" and "if
(unlikely(err))". The latter is better.
If you do so and resubmit, then it is Reviewed-by: Sergei Antonov
<saproj@gmail.com>
