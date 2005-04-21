From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Thu, 21 Apr 2005 16:13:08 +0000
Subject: Re: [KJ] Status of TODO item jiffies towards end
Message-Id: <29495f1d050421091379f3cae1@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 4/21/05, blm@woodheap.org <blm@woodheap.org> wrote:
> I am new at this but am very keen to contribute.  I
> thought I would start at the end of the TODO on the
> web site (hoping noone else thought of the same thing)
> and see what happens.
> 
> The item:
> 
> Some drivers do:
> 
>         if ((jiffies - data->last_updated > HZ * 2) ||
>             (jiffies < data->last_updated))
> 
> Should be:
> 
>         #include <linux/jiffies.h>
>         if (time_after(jiffies, data->last_updated + HZ * 2))
> 
> Have a patch for drivers/i2c/chips/*.
> 
> It seems this has been fixed because I only found the
> problem code in drivers/i2c/chips/* in kernel source 2.6.10.

Yes, many of these have been fixed. Marcelo Parisi has been posting a
number of patches to KJML recently (check archives).

> Are there any items that need attention that it is known that
> noone is working on?  What kernel tree should I be looking at?

I'm not sure there is any way to verify this without asking about
specific TODO entries. As far as a tree to base on, it's always
whatever current mainline is (2.6.12-rc3 currently).

Thanks,
Nish

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
