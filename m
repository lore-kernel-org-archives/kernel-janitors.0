From: Jaco Kroon <jaco@kroon.co.za>
Date: Tue, 29 May 2007 23:18:37 +0000
Subject: Re: [KJ] Re: [PATCH ARRAY_SIZE 1/4] kernel 2.6 size macro clean ups
Message-Id: <465CB4CD.7030109@kroon.co.za>
List-Id: <kernel-janitors.vger.kernel.org>
References: <465C99C3.4030802@gmail.com>
In-Reply-To: <465C99C3.4030802@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Randy Dunlap wrote:
> On Wed, 30 May 2007 00:17:15 +0200 Jaco Kroon wrote:
> 
>> Aaron Cripps wrote:
>>> Jaco Kroon wrote:
>>>> This patch includes a bunch of white-space changes.  I recommend 
>>>> passing -B to the diff command.
> 
> We really don't want to risk mis-applying a patch.

-B and -b does two different things.  -B will simply ignore the diff 
between two lines IFF the only changes is whitespace.  In other words, 
if the destination line is the same as the source except for whitespace 
it'll pretend the destination is the same in terms of whitespace as well.

-b however is dangerous.  It breaks things.  Avoid.

Jaco
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
