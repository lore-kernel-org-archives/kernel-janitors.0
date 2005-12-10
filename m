From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 10 Dec 2005 15:53:01 +0000
Subject: Re: [KJ] drivers/net/cassini.c: fix undefined variable
Message-Id: <20051210155300.GC2003@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0028695617307394894=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <4395CF0F.9070206@bfs.de>
In-Reply-To: <4395CF0F.9070206@bfs.de>
To: kernel-janitors@vger.kernel.org

--===============0028695617307394894==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 06, 2005 at 06:49:03PM +0100, walter harms wrote:
> The variable compwb is not defined if USE_TX_COMPWB is not defined.
> Also fixed is a trivial format warning.

> --- linux-2.6.14/drivers/net/cassini.c.bak
> +++ linux-2.6.14/drivers/net/cassini.c
> @@ -1922,11 +1922,12 @@
>  		   u32 status)
>  {
>          int limit, ring;
> +	u64 compwb=0;
>  #ifdef USE_TX_COMPWB
> -	u64 compwb = le64_to_cpu(cp->init_block->tx_compwb);
> +	compwb = le64_to_cpu(cp->init_block->tx_compwb);
>  #endif
>  	if (netif_msg_intr(cp))
> -		printk(KERN_DEBUG "%s: tx interrupt, status: 0x%x, %lx\n",
> +		printk(KERN_DEBUG "%s: tx interrupt, status: 0x%x, %Lx\n",
>  			cp->dev->name, status, compwb);

AFAICS, u64 variables are printed as "%llx", (unsigned long long)


--===============0028695617307394894==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0028695617307394894==--
