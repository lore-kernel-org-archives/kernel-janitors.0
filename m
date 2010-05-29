From: David Miller <davem@davemloft.net>
Date: Sat, 29 May 2010 07:20:15 +0000
Subject: Re: [patch 2/2] be2net: remove superfluous externs
Message-Id: <20100529.002015.173876275.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100526144739.GM22515@bicker>
In-Reply-To: <20100526144739.GM22515@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: sathyap@serverengines.com, subbus@serverengines.com, sarveshwarb@serverengines.com, ajitk@serverengines.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Wed, 26 May 2010 16:47:39 +0200

> This fixes some sparse warnings:
> drivers/net/benet/be_cmds.c:1503:12: warning: function
> 	'be_cmd_enable_magic_wol' with external linkage has definition
> drivers/net/benet/be_cmds.c:1668:12: warning: function
> 	'be_cmd_get_seeprom_data' with external linkage has definition
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
