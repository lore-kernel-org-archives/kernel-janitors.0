From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Fri, 09 Jan 2004 01:18:09 +0000
Subject: Re: [Kernel-janitors] [PATCH] Check return code in mm/pdflush.c
Message-Id: <20040109011809.GB8820@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040103132524.GA21909@eugeneteo.net>
In-Reply-To: <20040103132524.GA21909@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

<quote sender="Randy.Dunlap">
> On Sat, 3 Jan 2004 21:26:56 +0800 Eugene Teo <eugene.teo@eugeneteo.net> wrote:
> 
> | http://www.anomalistic.org/patches/pdflush-check-ret-kernel_thread-fix-2.6.1-rc1-mm1.patch
> | 
> | diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/mm/pdflush.c 2.6.1-rc1-mm1-fix/mm/pdflush.c
> | --- 2.6.1-rc1-mm1/mm/pdflush.c	2004-01-03 17:58:11.000000000 +0800
> | +++ 2.6.1-rc1-mm1-fix/mm/pdflush.c	2004-01-03 20:25:30.000000000 +0800
> | @@ -223,7 +223,11 @@
> |  
> |  static void start_one_pdflush_thread(void)
> |  {
> | -	kernel_thread(pdflush, NULL, CLONE_KERNEL);
> | +	int ret;
> | +	
> | +	ret = kernel_thread(pdflush, NULL, CLONE_KERNEL);
> | +	if (ret < 0) 
> | +		printk("%s: unable to start kernel thread\n", __FUNCTION__);
> 
> This patch adds trailing whitespace (on the "if" line).
> Please be more careful about that -- we don't want that.
> I fixed this one.
> 
> I run a simple script that searches for gotchas like this:
> grep -nH "^+.*[ 	]$" $1 | more
> 
> (that's SPACE and TAB inside the square brackets)

Useful regexp. Will be careful.

Eugene

> 
> --
> ~Randy
> MOTD:  Always include version info.
> 

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
