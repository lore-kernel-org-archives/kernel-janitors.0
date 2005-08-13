From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 13 Aug 2005 23:11:08 +0000
Subject: Re: [KJ] [PATCH] add new macro BIT_S to include/linux/kernel.h
Message-Id: <42FE7E0C.90202@gmx.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <42FDD89B.1010106@gmx.net>
In-Reply-To: <42FDD89B.1010106@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Alexey Dobriyan wrote:
> On Sat, Aug 13, 2005 at 01:25:15PM +0200, Michael Veeck wrote:
> 
>>adds a new macro for doing a bitshift. right now every subsystem defines 
>>its own macro (which all look the same) but this one also does overflow 
>>checking
> 
> 
> Checking?
> 
> $ cat -n test.c
>      1	#define BIT(x) (1ULL << (x))
>      2	#define BITS(x) (1ULL << ((x) % 64))
>      3	
>      4	int main(void)
>      5	{
>      6		BIT(65);
>      7		BITS(65);
>      8		return 0;
>      9	}
> $ gcc -o test test.c
> test.c: In function `main':
> test.c:6: warning: left shift count >= width of type
> 	<== ???
> 

okay, good point, but does that work even when the parameter of BIT isnt 
known at compile time?
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
