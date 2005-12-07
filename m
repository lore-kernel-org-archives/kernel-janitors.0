From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Wed, 07 Dec 2005 01:07:46 +0000
Subject: Re: [KJ] rfc: print mac addr
Message-Id: <20051206170746.79da5ee2.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78994323567798808=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <43956CB7.2060904@bfs.de>
In-Reply-To: <43956CB7.2060904@bfs.de>
To: kernel-janitors@vger.kernel.org

--===============78994323567798808==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 06 Dec 2005 18:11:48 +0100 walter harms wrote:

> Paolo Teti wrote:
> > Hi walter
> > 
> >> for (i = 0; i < 6; i++)
> >>    printk("%2.2x%c", dev->dev_addr[i],i == 5 ? '\n' : ':');
> >>
> > 
> > 1. Please post an example or the file name!
> 
> cd linux/drivers/net
> grep dev_addr *.c | grep printk
> 
> > 
> > 2. Are you sure that this portion of code isn't into a DEBUG block
> > (something like #ifdef DEBUG_xx)?
> 
> i did not check every file but looked into a few and the pattern is all 
> the same. maybe some of them are inside a #ifdef debug the few i looked 
> are not.
> 
> i know gregKH added a few dev helper macros but i can not find them 
> anymore. The idea is to provide a function like:

see include/linux/device.h: dev_printk() and friends.

> void print_mac(struct net_device *dev)
> {
>     int i;
>     printk(KERN_INFO);
>     for (i = 0; i < MAX_ADDR_LEN; i++)
>          printk("%2.2x%c", dev->dev_addr[i],i == (MAX_ADDR_LEN-1) ? '\n' 
> : ':');
> 
> }
> may you like to return a string ?

I would just print it (like you did) instead of return a string
(I think).

MAX_ADDR_LEN may want to be a variable in this function so that
differing MAC address lengths can be supported.
And put a space between ",i".

Thanks.
---
~Randy

--===============78994323567798808==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78994323567798808==--
