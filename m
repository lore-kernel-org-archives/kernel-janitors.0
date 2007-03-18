From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 18 Mar 2007 03:39:39 +0000
Subject: Re: [KJ] is there a kernel standard for assertions?
Message-Id: <45FCB47B.3000506@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703171550100.8121@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0703171550100.8121@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Robert P. J. Day wrote:
> On Sat, 17 Mar 2007, Adrian Bunk wrote:
>
>   
>> On Sat, Mar 17, 2007 at 02:39:25PM -0600, Matthew Wilcox wrote:
>>     
>>> On Sat, Mar 17, 2007 at 03:51:49PM -0400, Robert P. J. Day wrote:
>>>       
>>>>   it seems like lots of kernel code is re-inventing the idea of an
>>>> assertion.  is there no single basic standard for assertions in the
>>>> kernel?
>>>>         
>>> BUG_ON().
>>>       
>> Or WARN_ON() if it's considered non-fatal.
>>     
>
> i'm aware of both of those macros, which is why i'm wondering why so
> many developers insist on inventing their own version of an "assert"
> routine.  given all of the *existing* debugging routines, shouldn't
> inventing your own be discouraged?  is that something that could be
> turned into a KJ project of some kind?
>   
Is there any way to just enable the debugging for one sub-system and not 
the whole tree?

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
