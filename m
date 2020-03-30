From: David Miller <davem@davemloft.net>
Date: Mon, 30 Mar 2020 17:55:51 +0000
Subject: Re: [PATCH] net: dsa: Simplify 'dsa_tag_protocol_to_str()'
Message-Id: <20200330.105551.2176256870349576678.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200328095309.27389-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200328095309.27389-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: andrew@lunn.ch, vivien.didelot@gmail.com, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 28 Mar 2020 10:53:09 +0100

> There is no point in preparing the module name in a buffer. The format
> string can be passed diectly to 'request_module()'.
> 
> This axes a few lines of code and cleans a few things:
>    - max len for a driver name is MODULE_NAME_LEN wich is ~ 60 chars,
>      not 128. It would be down-sized in 'request_module()'
>    - we should pass the total size of the buffer to 'snprintf()', not the
>      size minus 1
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to net-next.
