From: Jaco Kroon <jaco@kroon.co.za>
Date: Sat, 03 Feb 2007 20:10:20 +0000
Subject: Re: [KJ] [RFC] Regarding min/max
Message-Id: <45C4EC2C.4030007@kroon.co.za>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45C3E402.3000307@student.ltu.se>
In-Reply-To: <45C3E402.3000307@student.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Srdjan Todorovic wrote:
> Hi,
> 
> On Sat, 3 Feb 2007, Jaco Kroon wrote:
> 
> 
>>from include/linux/kernel.h:
>>
>>/*
>> * min()/max() macros that also do
>> * strict type-checking.. See the
>> * "unnecessary" pointer comparison.
>> */
>>#define min(x,y) ({ \
>>    typeof(x) _x = (x); \
>>    typeof(y) _y = (y); \
>>    (void) (&_x = &_y);        \
>>    _x < _y ? _x : _y; })
> 
> I don't quite understand that macro, specificaly the (void) (&_x = &_y); line.
> The comment says that this macro does strict type-checking. From what I
> can see, it does a comparison on the two automatic variables, but throws
> away the result. So thus is essentially a no-op.

Exactly.  But it verifies that a pointer to each of the two can be
compared, and that can only happen if the pointer types are identical.
Whilst a int can automatically be "upgraded" to long (for example), int*
and long* are two distinct types.  So the pointer comparison is thrown
away, since that really isn't the comparison we're after, then _x < _y
actually compares the data and returns the appropriate one.


> If x and y are two different types, the compiler would complain with a
> warning/error because there was no cast. Is that the strict type-checking
> that the comment mentions, and did I understand this correctly?

Jaco
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
