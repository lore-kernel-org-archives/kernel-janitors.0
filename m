From: Dan Carpenter <error27@gmail.com>
Date: Mon, 12 Jul 2010 16:40:43 +0000
Subject: Re: [PATCH] remove unnecesary while loop in ext2_xattr_get
Message-Id: <20100712164018.GC5658@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201007122309063128435@gmail.com>
In-Reply-To: <201007122309063128435@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: crosslonelyover <crosslonelyover@gmail.com>
Cc: linux-ext4 <linux-ext4@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

On Mon, Jul 12, 2010 at 11:09:09PM +0800, crosslonelyover wrote:
> Hi,
>      In ext2_xattr_get, we'll check the xattr entry one 
> by one in the following loop:
>          entry = FIRST_ENTRY(bh);
>          while (!IS_LAST_ENTRY(entry)) {
>                  struct ext2_xattr_entry *next >                          EXT2_XATTR_NEXT(entry);
>                  if ((char *)next >= end)
>                          goto bad_block;
>                  if (name_index = entry->e_name_index &&
>                      name_len = entry->e_name_len &&
>                      memcmp(name, entry->e_name, name_len) = 0)
>                          goto found;
>                  entry = next;
>          }
> We can only execute the code immediately following 
> the loop when !IS_LAST_ENTRY(entry) is true. So the
> followed while loop seems unnecessary. I think we can
> remove it.
>       Following is my patch. It's against 2.6.35-rc4.
> Please check it.
> 

Yes.  This is dead code.  This stuff is from the days before git
so we'll never know who to blame for it.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

