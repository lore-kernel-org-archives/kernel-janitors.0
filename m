From: Matt Mackall <mpm@selenic.com>
Date: Fri, 06 Apr 2007 18:50:11 +0000
Subject: Re: [KJ] [RFC]NAME_OFFSET macro
Message-Id: <20070406185011.GW10459@waste.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070406085813.GA12105@arun.site>
In-Reply-To: <20070406085813.GA12105@arun.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Milind Arun Choudhary <milindchoudhary@gmail.com>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

On Fri, Apr 06, 2007 at 02:28:13PM +0530, Milind Arun Choudhary wrote:
> 
> milind@arun:~/src/linux> egrep -rin "#define.*NAME_?OFFSET" .
> ./arch/alpha/kernel/osf_sys.c:95:#define NAME_OFFSET    offsetof (struct osf_dirent, d_name)
> ./arch/mips/kernel/sysirix.c:1738:#define NAME_OFFSET32(de) ((int) ((de)->d_name - (char *) (de)))
> ./arch/mips/kernel/sysirix.c:1840:#define NAME_OFFSET64(de) ((int) ((de)->d_name - (char *) (de)))
> ./arch/parisc/hpux/fs.c:72:#define NAME_OFFSET(de) ((int) ((de)->d_name - (char __user *) (de)))
> ./arch/parisc/kernel/sys_parisc32.c:315:#define NAME_OFFSET(de) ((int) ((de)->d_name - (char __user *) (de)))
> ./arch/powerpc/kernel/sys_ppc32.c:57:#define NAME_OFFSET(de) ((int) ((de)->d_name - (char __user *) (de)))
> ./arch/sparc/kernel/sys_sunos.c:324:#define NAME_OFFSET(de) ((int) ((de)->d_name - (char __user *) (de)))
> ./arch/sparc64/kernel/sys_sunos32.c:275:#define NAME_OFFSET(de) ((int) ((de)->d_name - (char __user *) (de)))
> ./drivers/isdn/hardware/eicon/s_4bri.c:184:#define FPGA_NAME_OFFSET         0x10
> ./fs/compat.c:903:#define NAME_OFFSET(de) ((int) ((de)->d_name - (char __user *) (de)))
> ./fs/readdir.c:54:#define NAME_OFFSET(de) ((int) ((de)->d_name - (char __user *) (de)))
> ./include/linux/fuse.h:342:#define FUSE_NAME_OFFSET ((unsigned) ((struct fuse_dirent *) 0)->name)
> 
> 
> just working out different options before putting it in kernel.h
> 
> as all the dirent structures have used the 
> same name for the d_name member,so we can use
> 
> #define NAME_OFFSET(dirent) ((int) ((dirent)->d_name - (char __user *) (dirent)))
> 
> but then it becomes binding on the future users
>  to maintain the same naming  convention.
> 
> #define NAME_OFFSET(dirent,d_name) ((int) ((dirent)->d_name - (char __user *) (dirent)))
> 
> #define NAME_OFFSET(dirent,d_name) offsetof(struct dirent,d_name)
> 
> though ..the first one seem to be just fine
> 
> thoughts

Delete all instances of the macro. Replace all uses of it with
offsetof(foo, name). You wouldn't wrap a simple sizeof in a macro like
this, there's no reason to do so with offsetof except for ignorance of
offsetof's existence.

Actually most of the above are probably copy and paste of code predating the
kernel having a global offsetof definition.

-- 
Mathematics is the supreme nostalgia of our time.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
