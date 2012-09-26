From: Vyacheslav Dubeyko <slava@dubeyko.com>
Date: Wed, 26 Sep 2012 17:57:39 +0000
Subject: Re: [next:akpm 342/412] fs/hfsplus/ioctl.c:249:2: error: implicit declaration of function 'hfsplus_a
Message-Id: <8A3D8B3C-ED72-4278-A103-07108A79AC60@dubeyko.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120926160738.GC14447@localhost>
In-Reply-To: <20120926160738.GC14447@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Fengguang,

Sorry, I can't reproduce your issue.

I clone linux-next repository then "git checkout remotes/origin/akpm". I can compile kernel successfully with your .config files without any errors or warnings. I use gcc (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3.

With the best regards,
Vyacheslav Dubeyko.

On Sep 26, 2012, at 8:07 PM, Fengguang Wu wrote:

> Hi Vyacheslav,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
> head:   dad0019944369f58c193c1991c39ffda7ff584d2
> commit: 910b5a60f4229643fb0e21d26d6ba61de24e5df8 [342/412] hfsplus: rework functionality of getting, setting and deleting of extended attributes
> config: x86_64-randconfig-s007 (attached as .config)
> 
> All error/warnings:
> 
> fs/hfsplus/ioctl.c: In function 'hfsplus_setxattr':
> fs/hfsplus/ioctl.c:249:2: error: implicit declaration of function 'hfsplus_attr_exists' [-Werror=implicit-function-declaration]
> fs/hfsplus/ioctl.c:255:3: error: implicit declaration of function 'hfsplus_delete_attr' [-Werror=implicit-function-declaration]
> fs/hfsplus/ioctl.c:258:3: error: implicit declaration of function 'hfsplus_create_attr' [-Werror=implicit-function-declaration]
> fs/hfsplus/ioctl.c: In function 'hfsplus_getxattr':
> fs/hfsplus/ioctl.c:378:2: error: implicit declaration of function 'hfsplus_alloc_attr_entry' [-Werror=implicit-function-declaration]
> fs/hfsplus/ioctl.c:378:8: warning: assignment makes pointer from integer without a cast [enabled by default]
> fs/hfsplus/ioctl.c:390:2: error: implicit declaration of function 'hfsplus_find_attr' [-Werror=implicit-function-declaration]
> fs/hfsplus/ioctl.c:439:2: error: implicit declaration of function 'hfsplus_destroy_attr_entry' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors
> 
> vim +249 fs/hfsplus/ioctl.c
>   243	
>   244		if (!HFSPLUS_SB(inode->i_sb)->attr_tree) {
>   245			err = -EOPNOTSUPP;
>   246			goto end_setxattr;
>   247		}
>   248	
>> 249		if (hfsplus_attr_exists(inode, name)) {
>   250			if (flags & XATTR_CREATE) {
>   251				printk(KERN_ERR "hfs: xattr exists yet\n");
>   252				err = -EOPNOTSUPP;
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu, Yuanhan Liu                              Intel Corporation
> <.config.txt>

