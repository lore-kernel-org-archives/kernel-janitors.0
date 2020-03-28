From: Andrew Lunn <andrew@lunn.ch>
Date: Sat, 28 Mar 2020 15:44:24 +0000
Subject: Re: [PATCH] net: dsa: Simplify 'dsa_tag_protocol_to_str()'
Message-Id: <20200328154424.GW3819@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200328095309.27389-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200328095309.27389-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: vivien.didelot@gmail.com, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Mar 28, 2020 at 10:53:09AM +0100, Christophe JAILLET wrote:
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
