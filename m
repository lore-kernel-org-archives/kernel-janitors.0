From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 10 Dec 2005 18:41:46 +0000
Subject: Re: [KJ] drivers/net/cassini.c: fix undefined variable
Message-Id: <20051210184146.GA2394@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70139133964820299=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <4395CF0F.9070206@bfs.de>
In-Reply-To: <4395CF0F.9070206@bfs.de>
To: kernel-janitors@vger.kernel.org

--===============70139133964820299==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 10, 2005 at 07:05:11PM +0100, walter harms wrote:
> Hi Alexey,
> lets say i tried and it worked.

On i386. On alpha you added the warning. And %llx is 4 times more common
than %Lx.

> Alexey Dobriyan wrote:
> >On Tue, Dec 06, 2005 at 06:49:03PM +0100, walter harms wrote:
> >>The variable compwb is not defined if USE_TX_COMPWB is not defined.
> >>Also fixed is a trivial format warning.
> >
> >>--- linux-2.6.14/drivers/net/cassini.c.bak
> >>+++ linux-2.6.14/drivers/net/cassini.c
> >>@@ -1922,11 +1922,12 @@
> >> 		   u32 status)
> >> {
> >>         int limit, ring;
> >>+	u64 compwb=0;
> >> #ifdef USE_TX_COMPWB
> >>-	u64 compwb = le64_to_cpu(cp->init_block->tx_compwb);
> >>+	compwb = le64_to_cpu(cp->init_block->tx_compwb);
> >> #endif
> >> 	if (netif_msg_intr(cp))
> >>-		printk(KERN_DEBUG "%s: tx interrupt, status: 0x%x, %lx\n",
> >>+		printk(KERN_DEBUG "%s: tx interrupt, status: 0x%x, %Lx\n",
> >> 			cp->dev->name, status, compwb);
> >
> >AFAICS, u64 variables are printed as "%llx", (unsigned long long)


--===============70139133964820299==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70139133964820299==--
