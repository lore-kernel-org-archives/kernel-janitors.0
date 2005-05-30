From: Jesse Millan <jesse.millan@gmail.com>
Date: Mon, 30 May 2005 00:14:24 +0000
Subject: Re: [KJ] [PATCH] Fix misleading gcc4 warning,
Message-Id: <429A5AE0.6070001@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <42966B18.6020802@cs.pdx.edu>
In-Reply-To: <42966B18.6020802@cs.pdx.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


[jessem@sc]$ /usr/local/gcc4/bin/gcc --version
gcc (GCC) 4.0.0

[jessem@sc]$ uname -a
Linux system-calls 2.6.8.1-20mdk #1 Wed Nov 3 04:24:32 EST 2004 x86_64
AMD Athlon(tm) 64 Processor 3000+ unknown GNU/Linux


Adrian Bunk wrote:
> On Thu, May 26, 2005 at 08:52:14PM -0700, randy_dunlap wrote:
> 
>>On Thu, 26 May 2005 17:34:32 -0700 Jesse Millan wrote:
>>
>>| 
>>| This warning is a false alarm.
>>| 
>>| This patch eliminates the warning that addr may be used uninitialized in
>>| the function it87_find. addr is not used uninitialized.
>>
>>It's 'address', not 'addr'.
>>
>>
>>--- linux-2.6.12-rc5/drivers/i2c/chips/it87.c~	2005-05-26 16:35:24.852065714 -0700
>>+++ linux-2.6.12-rc5/drivers/i2c/chips/it87.c	2005-05-26 17:20:31.311097793 -0700
>>@@ -718,6 +718,10 @@ static int it87_find(int *address)
>> {
>> 	int err = -ENODEV;
>>
>>+	/* Suppress misleading GCC warning:
>>+	 * 'address' may be used uninitialized in this function. */
>>+	*address = 0;
>>+
>>
>>Lose the comments.  Just use patch comments (saved in the SCM) for such
>>comments, not source files.
>>
>>If I knew enough about compilers, I would just blame this on the compiler
>>and not fix it in the Linux source code (which just covers up the
>>compiler bug IMO).
> 
> 
> I'm not seeing this warning.
> 
> Which gcc version are you using?
> 
> 
>>~Randy
> 
> 
> cu
> Adrian
> 

-- 
Jesse Millan
CNS Unix Team
Portland State University
Phone: (503) 725-9151
Mobile: (503) 453-0748
GPG key: www.system-calls.com/gpg.php

grep --recursive --ignore-case 'SHOULD WORK' /usr/src/linux/* | wc
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
