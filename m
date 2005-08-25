From: Domen Puncer <domen@coderock.org>
Date: Thu, 25 Aug 2005 08:46:34 +0000
Subject: Re: [KJ] [PATCH] add new macro BIT_S to include/linux/kernel.h
Message-Id: <20050825084634.GA2276@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64146181547460146=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42FDD89B.1010106@gmx.net>
In-Reply-To: <42FDD89B.1010106@gmx.net>
To: kernel-janitors@vger.kernel.org

--===============64146181547460146==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 14/08/05 01:11 +0200, Michael Veeck wrote:
> Alexey Dobriyan wrote:
> >On Sat, Aug 13, 2005 at 01:25:15PM +0200, Michael Veeck wrote:
> >
> >>adds a new macro for doing a bitshift. right now every subsystem defines 
> >>its own macro (which all look the same) but this one also does overflow 
> >>checking
> >
> >
> >Checking?
> >
> >$ cat -n test.c
> >     1	#define BIT(x) (1ULL << (x))
> >     2	#define BITS(x) (1ULL << ((x) % 64))
> >     3	
> >     4	int main(void)
> >     5	{
> >     6		BIT(65);
> >     7		BITS(65);
> >     8		return 0;
> >     9	}
> >$ gcc -o test test.c
> >test.c: In function `main':
> >test.c:6: warning: left shift count >= width of type
> >	<=== ???
> >
> 
> okay, good point, but does that work even when the parameter of BIT isnt 
> known at compile time?

How about something like:
#define BITS(x) (1ULL << (__builtin_constant_p(x) ? (x) : (x) % 64)

Or maybe a WARN_ON would be nice, since (x >= 64) probably means there's
a bug.


	Domen

--===============64146181547460146==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64146181547460146==--
