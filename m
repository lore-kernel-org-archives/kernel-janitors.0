From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Wed, 21 Feb 2007 11:28:54 +0000
Subject: Re: [KJ] BIT macro cleanup
Message-Id: <45DC2CF6.3070409@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45CADD09.70809@bfs.de>
In-Reply-To: <45CADD09.70809@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Milind Choudhary wrote:
> On 2/21/07, Richard Knutsson <ricknu-0@student.ltu.se> wrote:
>> > so that gcc only will guide them whether to use  BIT or LLBIT
>> > depending  upon size of long  & the "nr" value .
>> How do you mean, gcc "will guide them"?
>>
> I mean if somebody blindly passes a value greater than BITS_PER_LONG
> [on architectures where long & long long aren't of same size]
> gcc would complain with
> :warning: left shift count >= width of type
> so they will backtrack & come to see whats cooking inside BIT
> & on the very next line they notice that there is LLBIT
> which they can use & live happily ever after.
Ok, I took it first as gcc were suppose to choose between them.

BTW, (out of curiosity) is there still much work before releasing the 
BIT-patch?

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
