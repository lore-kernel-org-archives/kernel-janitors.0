From: Jeff Garzik <jgarzik@pobox.com>
Date: Tue, 11 Jan 2005 03:56:31 +0000
Subject: [KJ] Re: [UPDATE PATCH] net/sb1000: replace nicedelay() with
Message-Id: <41E34E6F.70002@pobox.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============08069834457035352=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050110164703.GD14307@nd47.coderock.org> <20050111003908.GJ9186@us.ibm.com>
In-Reply-To: <20050111003908.GJ9186@us.ibm.com>
To: Nishanth Aravamudan <nacc@us.ibm.com>
Cc: kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>

--===============08069834457035352==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Nishanth Aravamudan wrote:
> @@ -475,7 +467,7 @@ sb1000_reset(const int ioaddr[], const c
>  	udelay(1000);
>  	outb(0x0, port);
>  	inb(port);
> -	nicedelay(60000);
> +	ssleep(1);
>  	outb(0x4, port);
>  	inb(port);
>  	udelay(1000);
> @@ -537,7 +529,7 @@ sb1000_activate(const int ioaddr[], cons
>  	const unsigned char Command0[6] = {0x80, 0x11, 0x00, 0x00, 0x00, 0x00};
>  	const unsigned char Command1[6] = {0x80, 0x16, 0x00, 0x00, 0x00, 0x00};
>  
> -	nicedelay(50000);
> +	ssleep(1);
>  	if ((status = card_send_command(ioaddr, name, Command0, st)))
>  		return status;
>  	if ((status = card_send_command(ioaddr, name, Command1, st)))
> @@ -944,7 +936,7 @@ sb1000_open(struct net_device *dev)
>  	/* initialize sb1000 */
>  	if ((status = sb1000_reset(ioaddr, name)))
>  		return status;
> -	nicedelay(200000);
> +	ssleep(1);
>  	if ((status = sb1000_check_CRC(ioaddr, name)))
>  		return status;


Your conversion of nicedelay() -> ssleep() values is imprecise.

The author clearly intended the values to be different, right?

	Jeff



--===============08069834457035352==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============08069834457035352==--
