From: Dan Carpenter <error27@gmail.com>
Date: Tue, 13 Jul 2010 19:24:26 +0000
Subject: Re: [PATCH]trivial: clear the comment on parameters for
Message-Id: <20100713192426.GQ5658@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4C3C8043.3030700@gmail.com>
In-Reply-To: <4C3C8043.3030700@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wang Sheng-Hui <crosslonelyover@gmail.com>
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>, linux-ext4 <linux-ext4@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Tue, Jul 13, 2010 at 11:03:31PM +0800, Wang Sheng-Hui wrote:
> diff --git a/fs/ext2/xattr.c b/fs/ext2/xattr.c
> index 5ecbbd8..f56b599 100644
> --- a/fs/ext2/xattr.c
> +++ b/fs/ext2/xattr.c
> @@ -355,7 +355,7 @@ static void ext2_xattr_update_super_block(struct
> super_block *sb)
> /*
> * ext2_xattr_set()
> *
> - * Create, replace or remove an extended attribute for this inode. Buffer
> + * Create, replace or remove an extended attribute for this inode. Value
> * is NULL to remove an existing extended attribute, and non-NULL to

It is talking about the "value" parameter, but your email client mangled
this patch so it doesn't apply.

regards,
dan carpenter

