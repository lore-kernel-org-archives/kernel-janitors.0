From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Wed, 15 Mar 2006 12:57:12 +0000
Subject: Re: [KJ][Patch] check return value of request_region and request_irq
Message-Id: <20060315125712.GB1198@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41007711998064167=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141029654.7765.6.camel@localhost.localdomain>
In-Reply-To: <1141029654.7765.6.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============41007711998064167==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2006-03-15 at 13:46:54 +0100, Darren Jenkins" <darrenrjenkins@gmail.com> wrote:
> --- linux-2.6.16-rc6/drivers/pcmcia/m32r_pcc.c.orig	2006-03-14 20:55:44.000000000 +1100
> +++ linux-2.6.16-rc6/drivers/pcmcia/m32r_pcc.c	2006-03-15 23:32:00.000000000 +1100
> @@ -312,7 +312,7 @@ static int __init is_alive(u_short sock)
>  	return 0;
>  }
>  
> -static void add_pcc_socket(ulong base, int irq, ulong mapaddr, kio_addr_t ioaddr)
> +static int add_pcc_socket(ulong base, int irq, ulong mapaddr, kio_addr_t ioaddr)
>  {
>    	pcc_socket_t *t = &socket[pcc_sockets];
>  
> @@ -330,7 +330,8 @@ static void add_pcc_socket(ulong base, i
>  
>  	/* add pcc */
>  	if (t->base > 0) {
> -		request_region(t->base, 0x20, "m32r-pcc");
> +		if ( request_region(t->base, 0x20, "m32r-pcc")== 0)

Whitespaces again

Cheers, Tobias

--===============41007711998064167==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41007711998064167==--
