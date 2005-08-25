From: Michael Veeck <michael.veeck@gmx.net>
Date: Thu, 25 Aug 2005 19:37:23 +0000
Subject: Re: [KJ] [PATCH] add new macro BIT_S to include/linux/kernel.h
Message-Id: <430E1DF3.7010009@gmx.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <42FDD89B.1010106@gmx.net>
In-Reply-To: <42FDD89B.1010106@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Domen Puncer wrote:
> On 14/08/05 01:11 +0200, Michael Veeck wrote:
> 
>>Alexey Dobriyan wrote:
>>
>>>On Sat, Aug 13, 2005 at 01:25:15PM +0200, Michael Veeck wrote:
>>>
>>>
>>>>adds a new macro for doing a bitshift. right now every subsystem defines 
>>>>its own macro (which all look the same) but this one also does overflow 
>>>>checking
>>>
>>>
>>>Checking?
>>>
>>>$ cat -n test.c
>>>    1	#define BIT(x) (1ULL << (x))
>>>    2	#define BITS(x) (1ULL << ((x) % 64))
>>>    3	
>>>    4	int main(void)
>>>    5	{
>>>    6		BIT(65);
>>>    7		BITS(65);
>>>    8		return 0;
>>>    9	}
>>>$ gcc -o test test.c
>>>test.c: In function `main':
>>>test.c:6: warning: left shift count >= width of type
>>>	<== ???
>>>
>>
>>okay, good point, but does that work even when the parameter of BIT isnt 
>>known at compile time?
> 
> 
> How about something like:
> #define BITS(x) (1ULL << (__builtin_constant_p(x) ? (x) : (x) % 64)
> 
> Or maybe a WARN_ON would be nice, since (x >= 64) probably means there's
> a bug.
> 
> 
> 	Domen

I would put your warning around BIT. When it is used wrongly (x to high) 
then it really seems to be a bug. Since most definitions use this, it 
maybe unravels one or two bugs.

BIT_S does not check, that might be misleading word, but rather do a 
wrap. Everybody who will use BIT_S should know that. Maybe BIT_WRAP 
would be a better word for the macro then.

Veeck

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
