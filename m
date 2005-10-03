From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 03 Oct 2005 08:21:15 +0000
Subject: [KJ] Re: [PATCH 0/13] fix all sparse gfp 'nocast' warnings
Message-Id: <20051003082115.GC737@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51653219726212196=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============51653219726212196==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 02, 2005 at 10:44:51PM -0700, Randy.Dunlap wrote:
> I have 13 patches for 'nocast' warnings from sparse.

> Fix all warnings of the type
> 
>   warning: implicit cast to nocast type
> 
> that are for gfp_flags not being 'unsigned int'
> (lots of places declared them as plain 'int').

Ouch... It should be:

	unsigned int __nocast gfp

"__nocast" was the point. Otherwise you absolutely defeat sparse:

$ cat -n test.c
     1	#define __nocast __attribute__((nocast))
     2	
     3	static void f(unsigned int __nocast gfp)
     4	{
     5	}
     6	
     7	static void g(unsigned int gfp)
     8	{
     9	}
    10	
    11	static void h(void)
    12	{
    13		f(0);
    14		f(1);
    15		g(0);
    16		g(1);
    17	}
$ sparse test.c
test.c:13:4: warning: implicit cast to nocast type
test.c:14:4: warning: implicit cast to nocast type
	<= line 15 ?
	<= line 16 ?


--===============51653219726212196==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51653219726212196==--
