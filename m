From: Keith Owens <kaos@ocs.com.au>
Date: Mon, 01 Mar 2004 06:22:48 +0000
Subject: [Kernel-janitors] Re: finding unused globals in the kernel
Message-Id: <5418.1078122168@kao2.melbourne.sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: Your message of "Mon, 01 Mar 2004 17:11:12 +1100."
             <5138.1078121472@kao2.melbourne.sgi.com> 
References: <5138.1078121472@kao2.melbourne.sgi.com>
In-Reply-To: <5138.1078121472@kao2.melbourne.sgi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

On Mon, 01 Mar 2004 17:11:12 +1100, 
Keith Owens <kaos@ocs.com.au> wrote:
>namespace.pl below handles all the special cases on kernels from 2.0
>through 2.4.  It needs updating for 2.6 kernels, enjoy.

>my $nm = "/usr/bin/nm -p";	# in case somebody moves nm
>$nm = "/sw/sdev/gcc+bin-ia64/as3-gcc323-bin2.14.90.0.4/bin/nm -p";	# in case somebody moves nm

Oops, testing line left in.  Delete the line that uses /sw/sdev.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
