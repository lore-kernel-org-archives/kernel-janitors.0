From: Yoann Padioleau <padator@wanadoo.fr>
Date: Wed, 23 May 2007 07:46:14 +0000
Subject: Re: [KJ] [PATCH] potential parse error in ifdef
Message-Id: <87fy5o0ypl.fsf@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87fy5q5dxr.fsf@wanadoo.fr>
In-Reply-To: <87fy5q5dxr.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

"Håkon Løvdal" <hlovdal@gmail.com> writes:

> On 21/05/07, Matthew Wilcox <matthew@wil.cx> wrote:
>> On Mon, May 21, 2007 at 06:39:12PM +0200, Yoann Padioleau wrote:
>> > I have made a tool to parse the kernel that does not pre-process the
>> > source. That means that my parser tries to parse all the code, including
>> > code in the #else branch or code that is not often compiled because
>> > the driver is not very used (or not used at all). So, my parser
>> > sometimes reports parse error not originally detected by gcc.
>> > Here is my (first) patch.
>>
>> These all look good to me.
>
> But one question. His tool has found some code segments
> that obviously never have been compiled 

I think so

> and most likely are
> not included in the kernel in any way (because otherwise
> I would assume that allyesconfig would have caught them).

Allyesconfig does not compile everything. It does not compile for
example source code for other architectures, nor drivers made for other
architectures and it does not try all the ifdef combinaisons.

>
> Dead, unused code that theoretically would compile is
> probably better than dead, unused code that would not
> compile, 

Except my patch can only improve the situation. 

> but if the code in question is indeed dead and
> unused I would assume that the best option would be to
> remove it?
>
> BR Håkon Løvdal
>
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.linux-foundation.org
> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
