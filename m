From: David Miller <davem@davemloft.net>
Date: Tue, 11 Jul 2017 17:54:32 +0000
Subject: Re: [PATCH] cisco: enic: Fic an error handling path in 'vnic_dev_init_devcmd2()'
Message-Id: <20170711.105432.2013597475678597815.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170708045135.14753-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170708045135.14753-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: benve@cisco.com, govind@gmx.com, neepatel@cisco.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat,  8 Jul 2017 06:51:35 +0200

> if 'ioread32()' returns 0xFFFFFFF, we have to go through the error
> handling path as done everywhere else in this function.
> 
> Move the 'err_free_wq' label to better match its name and its location
> and add a new label 'err_disable_wq'.
> Update the code accordingly.
> 
> Fixes: 373fb0873d43 ("enic: add devcmd2")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Looks good, applied, thanks.
