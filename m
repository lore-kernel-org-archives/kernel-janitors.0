From: randy_dunlap <rdunlap@xenotime.net>
Date: Sat, 04 Jun 2005 16:38:53 +0000
Subject: Re: [KJ] [patch] wireless: char* -> char[] conversion in airo.c
Message-Id: <20050604093853.5da4f16d.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66774253349917245=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050604150603.GD9687@nd47.coderock.org>
In-Reply-To: <20050604150603.GD9687@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============66774253349917245==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 4 Jun 2005 20:05:33 +0400 Alexey Dobriyan wrote:

| 2.95.3:
| 	   text	   data	    bss	    dec	    hex	filename
| before	  51118	   2156	    160	  53434	   d0ba	drivers/net/wireless/airo.o
| after	  51118	   2156	    160	  53434	   d0ba	drivers/net/wireless/airo.o
| 
| You won't fool him. :-)
| 
| 3.3.5-20050130:
| before	  46999	   2156	    160	  49315	   c0a3	drivers/net/wireless/airo.o
| after	  46994	   2156	    160	  49310	   c09e	drivers/net/wireless/airo.o
| 
| 4.1.0-20050522:
| before	  45555	   2220	    160	  47935	   bb3f	drivers/net/wireless/airo.o
| after	  45550	   2220	    160	  47930	   bb3a	drivers/net/wireless/airo.o


Alexey,

For those of us who don't routinely have multiple gcc versions
available, is there any trick to doing that?  Could give a small
explanation?

Thanks,
---
~Randy

--===============66774253349917245==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66774253349917245==--
