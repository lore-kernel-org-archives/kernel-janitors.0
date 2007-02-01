From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 01 Feb 2007 14:48:05 +0000
Subject: Re: [KJ] the *right* way to do conditional compilation
Message-Id: <Pine.LNX.4.64.0702010947220.15085@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702010435270.11868@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702010435270.11868@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 1 Feb 2007, Matthew Wilcox wrote:

> Not.  If CONFIG_PROC_FS=y and CONFIG_ATM_MPOA=m, you just built
> mpoa_proc.o into the kernel and left it out of mpoa.ko.
> Documentation/kbuild/makefiles.txt says the right way to do this is:
>
> mpoa-y			:= mpc.o mpoa_caches.o

actually, wouldn't that be "mpoa-objs" as it is in the file currently?

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://www.fsdev.dreamhosters.com/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
