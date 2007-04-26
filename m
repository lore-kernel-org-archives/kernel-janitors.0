From: Randy Dunlap <rdunlap@xenotime.net>
Date: Thu, 26 Apr 2007 07:12:50 +0000
Subject: Re: [KJ] min/max removal done?
Message-Id: <20070426001250.a212ed7b.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 19 Dec 2006 11:59:41 -0600 Steve Fox wrote:

> I was looking at the TODO and saw the hand-coded MIN/MAX removal listed.
> But it looks like Amol Lad's patch from September must have already
> gotten in?
> 
> [drfickle@flooterbu linux-2.6]$ grep -r "^#define MAX(" *
> fs/xfs/linux-2.6/xfs_linux.h:#define MAX(a,b)   (max(a,b))
> scripts/kconfig/lxdialog/dialog.h:#define MAX(x,y) (x > y ? x : y)
> [drfickle@flooterbu linux-2.6]$ grep -r "^#define MIN(" *
> arch/um/drivers/mconsole_user.c:#define MIN(a,b) ((a)<(b) ? (a):(b))
> fs/xfs/linux-2.6/xfs_linux.h:#define MIN(a,b)   (min(a,b))
> scripts/kconfig/lxdialog/dialog.h:#define MIN(x,y) (x < y ? x : y)
> 
> The macros in fs/xfs/linux-2.6/xfs_linux.h simply call the new 'good'
> macros. 
> 
> arch/um/drivers/mconsole_user.c is some sort of user-space thingy?
> 
> scripts/kconfig/lxdialog/dialog.h shouldn't be of concern.
> 
> Can this item be crossed off the TODO list? 

Yep, now gone.  Thanks.  and sorry about the delay.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
