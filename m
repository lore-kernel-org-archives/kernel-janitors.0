From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Thu, 05 Jan 2006 23:24:05 +0000
Subject: Re: [KJ] [PATCH] use PCI_DMA_*BIT in ioc3-eth.c
Message-Id: <20060105232405.GB1179@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79219010048135319=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1136502712.9683.2.camel@alice>
In-Reply-To: <1136502712.9683.2.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============79219010048135319==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2006-01-06 at 00:11:52 +0100, Eric Sesterhenn / snakebyte <snakebyte@gmx.de> wrote:
> this changes the 0xfff.. constants used for pci_set_dma* to
> defines in the ioc3 driver.

This one is alread in -kj [1]. Guess I did them all, they're just not all in
mainline.

[1]
http://coderock.org/kj/2.6.15-rc5-kj1/2.6.15-rc5-kj1-broken-out/drivers_net_ioc3_eth_c_use_dma_32_64_bit_mask.patch

Cheers, Tobias

--===============79219010048135319==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79219010048135319==--
