From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 20 Feb 2006 22:12:50 +0000
Subject: Re: [KJ][Patch] printk KERN_ annotations
Message-Id: <20060220221250.GI29791@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============097206920094071059=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140167667.7789.7.camel@localhost.localdomain>
In-Reply-To: <1140167667.7789.7.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============097206920094071059==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 17, 2006 at 08:14:26PM +1100, Darren Jenkins" wrote:
> --- rc3-clean/net/802/hippi.c
> +++ rc3-net-fixes/net/802/hippi.c
> @@ -55,7 +55,7 @@ static int hippi_header(struct sk_buff *
>
>  	if (!len){
>  		len = skb->len - HIPPI_HLEN;
> -		printk("hippi_header(): length not supplied\n");
> +		printk(KERN_DEBUG "hippi_header(): length not supplied\n");

I really don't know if this a debugging leftover.

> --- rc3-clean/net/8021q/vlan_dev.c
> +++ rc3-net-fixes/net/8021q/vlan_dev.c
> @@ -673,10 +673,10 @@ int vlan_dev_set_mac_address(struct net_
> -	printk("%s: Setting MAC address to ", dev->name);
> +	printk(KERN_INFO "%s: Setting MAC address to ", dev->name);
>  	for (i = 0; i < 6; i++)
> -		printk(" %2.2x", dev->dev_addr[i]);
> -	printk(".\n");
> +		printk(KERN_INFO " %2.2x", dev->dev_addr[i]);
> +	printk(KERN_INFO ".\n");

No, of course not. Reread TODO entry. ;-)

> @@ -1814,7 +1816,7 @@ make_entry(struct lec_priv *priv, unsign
>
>          to_return = kmalloc(sizeof(struct lec_arp_table), GFP_ATOMIC);
>          if (!to_return) {
> -                printk("LEC: Arp entry kmalloc failed\n");
> +                printk(KERN_WARNING "LEC: Arp entry kmalloc failed\n");

kmalloc failures are usually flagged as KERN_ERR


--===============097206920094071059==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============097206920094071059==--
