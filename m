From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 12 Apr 2004 22:24:04 +0000
Subject: Re: [Kernel-janitors] 2.6.5-kj1 merge status
Message-Id: <20040412152404.37a46f21.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52125767279878588=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040409090100.74e6940e.rddunlap@osdl.org>
In-Reply-To: <20040409090100.74e6940e.rddunlap@osdl.org>
To: kernel-janitors@vger.kernel.org

--===============52125767279878588==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Apr 2004 14:40:14 -0300 "Luiz Fernando N. Capitulino" <lcapitulino@prefeitura.sp.gov.br> wrote:

| Em Fri, 9 Apr 2004 09:01:00 -0700
| "Randy.Dunlap" <rddunlap@osdl.org> escreveu:
|  
| | drop/	floppy_deugli_00.patch
| | drop/	floppy_deugli_01.patch
| | drop/	floppy_deugli_02.patch
| | drop/	floppy_deugli_03.patch
| | 	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
| | 	sent to akpm: 2004.0408;
| | 	Andrew suggested using scripts/Lindent instead, which I did;
| | 	new patch is at:
| | 	http://developer.osdl.org/rddunlap/patches/floppy_format_265.patch
| 
|  Good tip ! I didn't know about Lindent.
| 
|  A question: the version you sent to LKM does not have the audit patch,
| right ? So, are you going to merge it ?

Yes, after the Lindent patch is accepted.

|  I was doing the "deugli" work for floppy98, can you run Lindent on it ?

Sure.

Another hint:  I made sure that the code (floppy.o) was the same
before and after the Lindent changes.  There were a few bytes that
were different, but I tracked all of them down to __LINE__ usage
in the source file (which generates a binary line number -- i.e.,
not a character string).

--
~Randy

--===============52125767279878588==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52125767279878588==--
