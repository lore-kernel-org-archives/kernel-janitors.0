From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 21 Apr 2012 15:13:06 +0000
Subject: Re: [patch] wireless: at76c50x: allocating too much data
Message-Id: <alpine.DEB.2.02.1204211712270.1987@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120420064705.GE22649@elgon.mountain> <CAGRGNgVgtAYknmpB_8Q0OpcUWFjTxBistG+RNs1ORDZeckGsWw@mail.gmail.com> <20120420091449.GI27101@mwanda> <87vcku9sob.fsf@purkki.adurom.net> <20120421124523.GS6498@mwanda> <alpine.DEB.2.02.1204211548090.1987@hadrien>
 <20120421145140.GU6498@mwanda> <20120421151235.GM27101@mwanda>
In-Reply-To: <20120421151235.GM27101@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Kalle Valo <kvalo@adurom.com>, Julian Calaby <julian.calaby@gmail.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org



On Sat, 21 Apr 2012, Dan Carpenter wrote:

> On Sat, Apr 21, 2012 at 05:51:41PM +0300, Dan Carpenter wrote:
>> On Sat, Apr 21, 2012 at 03:51:44PM +0200, Julia Lawall wrote:
>>> Looking for x = ... sizeof(x) ... I get 9 reports.  In most cases it
>>> looks like sizeof(x) is coincidentally the same as the size that is
>>> wanted.  Two cases that look like they could have some noticible
>>> effect are:
>>>
>>> arch/xtensa/platforms/iss/network.c, line 789
>>> drivers/block/cciss.c, line 4211
>>>
>>
>> Clever.  You'd need to restrict it to places where x was a  pointer.
>> That's better than my check which was specific to kmalloc().  (So
>> uh...  I'm going to rewrite mine as well to be more generic.  :P)
>>
>
> Hm...  Smatch is not really the right tool here.  By the time Sparse
> gives you the sizeof(foo) information, it just looks like a number
> 8.
>
> I hacked up Sparse a bit so it works for simple expressions which
> are one token in from the c tokenizer.  So:
>
> 	foo = kmalloc(sizeof(foo), GFP_KERNEL); => error.
> 	foo->bar = kmalloc(sizeof(foo->bar), GFP_KERNEL); => tricky.
>
> It's not ideal.  Coccinelle is better for this.

On the other hand, Coccinelle has no idea what the size is, so it doesn't 
know how important the problem is.

julia
