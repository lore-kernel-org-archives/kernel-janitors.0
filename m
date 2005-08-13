From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 13 Aug 2005 20:26:31 +0000
Subject: Re: [KJ] [PATCH] add new macro BIT_S to include/linux/kernel.h
Message-Id: <20050813202631.GA13933@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52735215963287962=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42FDD89B.1010106@gmx.net>
In-Reply-To: <42FDD89B.1010106@gmx.net>
To: kernel-janitors@vger.kernel.org

--===============52735215963287962==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 13, 2005 at 01:25:15PM +0200, Michael Veeck wrote:
> adds a new macro for doing a bitshift. right now every subsystem defines 
> its own macro (which all look the same) but this one also does overflow 
> checking

Checking?

$ cat -n test.c
     1	#define BIT(x) (1ULL << (x))
     2	#define BITS(x) (1ULL << ((x) % 64))
     3	
     4	int main(void)
     5	{
     6		BIT(65);
     7		BITS(65);
     8		return 0;
     9	}
$ gcc -o test test.c
test.c: In function `main':
test.c:6: warning: left shift count >= width of type
	<=== ???


--===============52735215963287962==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52735215963287962==--
