From: Sjur BRENDELAND <sjur.brandeland@stericsson.com>
Date: Tue, 01 Jun 2010 07:19:06 +0000
Subject: RE: [patch 1/2] caif: remove unneeded variable from caif_net_open()
Message-Id: <81C3A93C17462B4BBD7E272753C10579169C3C247B@EXDCVYMBSTM005.EQ1STM.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100601070855.GD5483@bicker>
In-Reply-To: <20100601070855.GD5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Dan Carpenter wrote:
> We don't use the "ser" variable so I've removed it.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Looks good thanks,
Acked-by: Sjur Braendeland <sjur.brandeland@stericsson.com>
