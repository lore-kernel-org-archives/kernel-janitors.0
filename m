From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 28 Feb 2006 19:32:22 +0000
Subject: Re: [KJ] kzalloc() conversion in drivers/isdn
Message-Id: <20060228193222.GA26846@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============051455466573451014=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141024983.6530.1.camel@alice>
In-Reply-To: <1141024983.6530.1.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============051455466573451014==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 27, 2006 at 08:23:03AM +0100, Eric Sesterhenn wrote:
> --- linux-2.6.16-rc4/drivers/isdn/hisax/teles_cs.c.orig
> +++ linux-2.6.16-rc4/drivers/isdn/hisax/teles_cs.c
> @@ -138,9 +138,9 @@ static int teles_attach(struct pcmcia_de
>      DEBUG(0, "teles_attach()\n");
>
>      /* Allocate space for private device-specific data */
> -    local = kmalloc(sizeof(local_info_t), GFP_KERNEL);
> -    if (!local) return -ENOMEM;
> -    memset(local, 0, sizeof(local_info_t));
> +    local = kzalloc(sizeof(local_info_t), GFP_KERNEL);
> +    if (!local)
> +	return -ENOMEM;

Don't even try to sneak in unrelated changes. I mean, really. Why bother
if I'll carefully drop them anyway?


--===============051455466573451014==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============051455466573451014==--
