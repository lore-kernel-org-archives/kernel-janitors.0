From: "Jaco Kroon" <jaco@kroon.co.za>
Date: Sat, 06 Jan 2007 11:32:30 +0000
Subject: Re: [KJ] proper casting (if any) in copy_to_user() calls?
Message-Id: <4698.192.168.0.199.1168083150.squirrel@hackerpages.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701050850140.1045@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701050850140.1045@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> On Sat, 6 Jan 2007, Jaco Kroon wrote:

>> > So Janitors, I think it's better to remove the casts _only_ when
>> > the given argument is a pointer and not an unsigned long (why do
>> > people use unsigned long and not void* in the beginning anyway ?).
>>
>> To prevent dereferencing an __user pointer?  But then imho that
>> should be standard right through the kernel and copy_(to,from)_user
>> should take unsigned long to begin with.
>
> that's a good point.  sadly, i think it's a bit late to make that
> suggestion.
>

Whilst we're on the topic, I know it's "bad" to dereference a user-space
pointer, but from what I understand the actual pointer value remains the
same, so as long as you are in the context of the userspace program that
gave you the pointer, the VMT should correctly interpret it right?

So what exactly is so bad about dereferencing userspace pointers?

Jaco
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
