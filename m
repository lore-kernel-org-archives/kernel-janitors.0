From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Thu, 29 Mar 2007 03:28:04 +0000
Subject: Re: [KJ] [PATCH] BIT macro cleanup
Message-Id: <460B3244.9060405@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070328033309.GA9597@arun.site> <20070328190925.GC5306@martell.zuzino.mipt.ru>
In-Reply-To: <20070328190925.GC5306@martell.zuzino.mipt.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Milind Arun Choudhary <milindchoudhary@gmail.com>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org

Alexey Dobriyan wrote:
> On Wed, Mar 28, 2007 at 09:03:09AM +0530, Milind Arun Choudhary wrote:
>   
>> --- a/include/linux/bitops.h
>> +++ b/include/linux/bitops.h
>> @@ -8,6 +8,9 @@
>>   */
>>  #include <asm/bitops.h>
>>
>> +#define BIT(nr)	(1UL << ((nr) % BITS_PER_LONG))
>>     
>
> I think this would be a disaster because something like
>
> 	BIT(123)
>
> would not even generate a warning.
>   
There were a discussion on this, at KJ, when BIT was first used with a 
modular operation. I said the same thing as you do now, but a big user 
of BIT is the input-subsystem who defined their BIT as above. Also it 
was mentioned that the compiler can only find the statical errors, a 
variable input can break it in runtime.
+ if we _really_ want to check the tree for such warnings, it is easy to 
remove the modular operation temporarily (and keep away of input/)

I don't say I like this, just that it is a choose between possible errors.
Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
