From: Krzysztof Halasa <khc@pm.waw.pl>
Date: Mon, 22 Dec 2008 00:18:03 +0000
Subject: Re: [PATCH 7/13] drivers/net/wan: Remove redundant test
Message-Id: <m33aghrrk4.fsf@maximus.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812211638550.9555@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812211638550.9555@pc-004.diku.dk> (Julia Lawall's message of "Sun\, 21 Dec 2008 16\:39\:15 +0100 \(CET\)")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: jgarzik@pobox.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall <julia@diku.dk> writes:

> arg is checked not to be NULL a few lines before.
>
> A simplified version of the semantic patch that makes this change is as
> follows: (http://www.emn.fr/x-info/coccinelle/)

> ---
>  drivers/net/wan/pc300_drv.c         |    5 ++---

Impressive. Thanks.
-- 
Krzysztof Halasa
