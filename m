From: David Miller <davem@davemloft.net>
Date: Tue, 26 Jul 2016 22:26:24 +0000
Subject: Re: [patch] ide: missing break statement in set_timings_mdma()
Message-Id: <20160726.152624.1129190524778208462.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160714104802.GI18175@mwanda>
In-Reply-To: <20160714104802.GI18175@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, linux-ide@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Jul 2016 13:48:02 +0300

> There was clearly supposed to be a break statement here.  Currently we
> use the k2 ata timings instead of sh ata ones we intended.  Probably no
> one has this hardware anymore so it likely doesn't make a difference
> beyond the static checker warning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
