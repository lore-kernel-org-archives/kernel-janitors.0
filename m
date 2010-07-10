From: Dan Carpenter <error27@gmail.com>
Date: Sat, 10 Jul 2010 09:07:36 +0000
Subject: Re: [PATCH] avoid NULL deference in ext2_xattr_get
Message-Id: <20100710090736.GR19184@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTimwrORk9yfJlSMpVdn1V0sg0tssKhxc-3q1xoMX@mail.gmail.com>
In-Reply-To: <AANLkTimwrORk9yfJlSMpVdn1V0sg0tssKhxc-3q1xoMX@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: shenghui <crosslonelyover@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org


Good catch.  Your change is correct but can you resend it?

On Sat, Jul 10, 2010 at 04:07:28PM +0800, shenghui wrote:
> >From adc1fa6535034db3b6d8deebda6ec7eaa8bfd2f8 Mon Sep 17 00:00:00 2001
> From: Wang Sheng-Hui <crosslonelyover@gmail.com>
> Date: Sat, 10 Jul 2010 16:05:53 +0800
> Subject: [PATCH] avoid NULL deference in ext2_xattr_get
> 

The longer description of the bug should go here.

> 
> Signed-off-by: Wang Sheng-Hui <crosslonelyover@gmail.com>
> ---
>  fs/ext2/xattr.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ext2/xattr.c b/fs/ext2/xattr.c
> index 7c39157..81ec1c6 100644
> --- a/fs/ext2/xattr.c
> +++ b/fs/ext2/xattr.c
> @@ -156,11 +156,12 @@ ext2_xattr_get(struct inode *inode, int
> name_index, const char *name,
^^^^^^

Your email client line wrapped the patch.  Please send it to yourself
and then save the email including headers and everything.
	cd linux-2.6
	cat ~/your-email-text | patch -p1 

If it applies cleanly then resend it to the list.

regards,
dan carpenter


