From: "Thomas Surrel" <thomas.surrel@gmail.com>
Date: Thu, 19 Jul 2007 15:57:36 +0000
Subject: Re: netdev_priv()
Message-Id: <d858bca40707190857j5afb57fbhb082d8a504610025@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
In-Reply-To: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> You mean that the name of the variable change ? But
> my semantic path, or more precisly the transformation tool
> handles that (unless my_own_private_netdevice has not
> the struct net_device*  type in which case you are right).
> I have written 'dev' in the semantic patch but it's a "metavariable".

Ok, I didn't know.

> I think I have found why I was too restrictive. Some people
> use alloc_etherdev which calls alloc_netdev. So I just
> have to relax the condition. There are multiple "alias"
> to alloc_netdev.

Exactly. Could you also add all the other alias to your tool ? There are:
- alloc_fcdev
- alloc_fddidev
- alloc_hippi_dev
- alloc_trdev
- alloc_ltalkdev
- alloc_irdadev
- alloc_irlandev

(not sure I have them all ...)

So to sum up, your tool is now handling everything except when the
driver is split in multiple files (and in more tricky cases like
airo). That's much less work then before anyway.

A lot of drivers are doing useless casting (e.g. struct private_net
*pn = (struct private_net *) dev->priv;). Is it something semantic
patch can handle ?

Best regards,

Thomas
