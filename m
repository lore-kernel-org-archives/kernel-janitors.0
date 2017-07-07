From: David Miller <davem@davemloft.net>
Date: Fri, 07 Jul 2017 08:28:21 +0000
Subject: Re: [PATCH] arcnet: com20020-pci: Fix an error handling path in 'com20020pci_probe()'
Message-Id: <20170707.092821.147697584429801370.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170707045616.8909-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170707045616.8909-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: m.grzeschik@pengutronix.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri,  7 Jul 2017 06:56:16 +0200

> If this memory allocation fails, we should go through the error handling
> path as done everywhere else in this function before returning.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This is really the tip of the iceberg here and this function's cleanup
really needs to be shored up more completely than this.

If the allocation of 'card' succeeds, and one of the "goto out_port"
paths are taken, 'card' is leaked because the last thing performed
is linking it into the list inside of 'priv'.

Anyways, I'll apply this but there are so many more leaks here.
