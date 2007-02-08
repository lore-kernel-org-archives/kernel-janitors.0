From: walter harms <wharms@bfs.de>
Date: Thu, 08 Feb 2007 08:19:21 +0000
Subject: Re: [KJ] BIT macro cleanup
Message-Id: <45CADD09.70809@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Milind Choudhary wrote:
> Hi all
> 
> I would like to take up the BIT macro cleanup.
> http://www.fsdev.net/wiki/index.php?title=BIT
> 
> I think include/linux/bitops.h would be the best place to add the BIT macro.
> Let me know if this is fine.
> 

sounds obvious

> There are different variants of BIT using (long|unsigned
> long|unsigned|unsigned char) etc.
> Do we need to create different macros for each type
> Or a single one which takes type as input?

bit operations make only sense on integer, so why not stay with long
and cast it down if needed ? so you have only one function doing so.

please what ever you do do not forget to document that and write some
examples. the linux kernal is large and imho the bigest problem is that
the programmers do not know what nice supportfunctions are available.


my 2 cents,
walter

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
