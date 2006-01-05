From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 05 Jan 2006 23:34:20 +0000
Subject: Re: [KJ] [PATCH] use PCI_DMA_*BIT in ioc3-eth.c
Message-Id: <1136504060.9774.4.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92942648836297437=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1136502712.9683.2.camel@alice>
In-Reply-To: <1136502712.9683.2.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============92942648836297437==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2006-01-06 at 00:24 +0100, Tobias Klauser wrote:
> On 2006-01-06 at 00:11:52 +0100, Eric Sesterhenn / snakebyte <snakebyte@gmx.de> wrote:
> > this changes the 0xfff.. constants used for pci_set_dma* to
> > defines in the ioc3 driver.
> 
> This one is alread in -kj [1]. Guess I did them all, they're just not all in
> mainline.

Nice, this saves some work. guess we can remove this from the TODO
list then. same should apply to MOD_{DEC,INC}_USE_COUNT after
the two patches i send last month get into -kj or mainline.

Eric


--===============92942648836297437==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92942648836297437==--
