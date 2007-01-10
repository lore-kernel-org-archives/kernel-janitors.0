From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Wed, 10 Jan 2007 09:24:55 +0000
Subject: Re: [KJ] what's the deal with using real "boolean" variables?
Message-Id: <45A4B0E7.2080706@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701100337460.11933@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701100337460.11933@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Robert P. J. Day wrote:
>   is there a consensus on how to use actual C99 boolean variables in
> the kernel source? C99 defines the unsigned integer type "_Bool" and,
> from that point on, it's all downhill:
>   
<snip>
> ./include/linux/types.h:typedef _Bool                   bool;
>   
This is the one that was added to replace the rest. I have not done too 
much work on this for a while but should take it up soon again (but of 
course, any help is appreciated).

There is also 'true' and 'false' defined (enum'ed) in 
include/linux/stddef.h.

A few file-systems, including ntfs, has been converted to this one.

/Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
