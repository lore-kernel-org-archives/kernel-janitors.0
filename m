From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 13 Apr 2004 21:36:29 +0000
Subject: Re: [Kernel-janitors] 2.6.5-kj1 merge status
Message-Id: <20040413143629.4714ab8a.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51130922385738309=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040409090100.74e6940e.rddunlap@osdl.org>
In-Reply-To: <20040409090100.74e6940e.rddunlap@osdl.org>
To: kernel-janitors@vger.kernel.org

--===============51130922385738309==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Apr 2004 15:24:04 -0700 Randy.Dunlap wrote:

| On Mon, 12 Apr 2004 14:40:14 -0300 "Luiz Fernando N. Capitulino" <lcapitulino@prefeitura.sp.gov.br> wrote:
| 
| | Em Fri, 9 Apr 2004 09:01:00 -0700
| | "Randy.Dunlap" <rddunlap@osdl.org> escreveu:
| |  
| | | drop/	floppy_deugli_00.patch
| | | drop/	floppy_deugli_01.patch
| | | drop/	floppy_deugli_02.patch
| | | drop/	floppy_deugli_03.patch
| | | 	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
| | | 	sent to akpm: 2004.0408;
| | | 	Andrew suggested using scripts/Lindent instead, which I did;
| | | 	new patch is at:
| | | 	http://developer.osdl.org/rddunlap/patches/floppy_format_265.patch
| | 
| |  Good tip ! I didn't know about Lindent.
| | 
| |  A question: the version you sent to LKM does not have the audit patch,
| | right ? So, are you going to merge it ?
| 
| Yes, after the Lindent patch is accepted.
| 
| |  I was doing the "deugli" work for floppy98, can you run Lindent on it ?
| 
| Sure.

Nope, I have to retract that since I can't build it either before or
after making changes to it.  It looks like the (NEC) PC-9800 x86 sub-arch.
code changes are stagnating.  They don't build and there haven't been
any updates to them in quite a long time.

If any of you want a real challenge, contact the PC-9800 project
people and see if you can help them get the PC-9800 changes merged.
They are (were) at:  http://sourceforge.jp/projects/linux98/

NOTE:  you need to judge the priority of this kind of work on your own.
I'm not saying that it is high or low or medium priority, but it
is not trivial.


| Another hint:  I made sure that the code (floppy.o) was the same
| before and after the Lindent changes.  There were a few bytes that
| were different, but I tracked all of them down to __LINE__ usage
| in the source file (which generates a binary line number -- i.e.,
| not a character string).


--
~Randy

--===============51130922385738309==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51130922385738309==--
