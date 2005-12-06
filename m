From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Tue, 06 Dec 2005 17:03:06 +0000
Subject: Re: [KJ] rfc: print mac addr
Message-Id: <Pine.LNX.4.58.0512060847240.1727@shark.he.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22968952295807643=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <43956CB7.2060904@bfs.de>
In-Reply-To: <43956CB7.2060904@bfs.de>
To: kernel-janitors@vger.kernel.org

--===============22968952295807643==
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 6 Dec 2005, walter harms wrote:

> hi list,
>
> must (if not all) net drivers contain something like this to print a mac
> addr:

If that's so, then yes, a helper function is a good idea IMO.

> for (i = 0; i < 6; i++)
>    printk("%2.2x%c", dev->dev_addr[i],i == 5 ? '\n' : ':');
>
> I think it would be usefull to add a helper function.
> simple question:
> 1. is there such a function ?

If your claim that most drivers do it on their own, then I hope/guess
that there is not already such a helper function...
I don't see one in include/linux/*.h.

> 2. where to add ? each driver ? or is there a common place i do not know
> about ?

Either
(1) inline in include/linux/{if_ether.h or etherdevice.h or netdevice.h}
although I prefer one of the first two since this looks ethernet-specific
(due to the "i < 6").
And change the 6 to ETH_ALEN if this is for ethernet MAC addresses.
And put a space between comma and i:  ",i" should be ", i".

or
(2) in net/core/dev.c.

-- 
~Randy

--===============22968952295807643==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22968952295807643==--
