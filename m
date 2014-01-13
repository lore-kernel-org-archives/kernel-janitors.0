From: David Miller <davem@davemloft.net>
Date: Mon, 13 Jan 2014 19:16:39 +0000
Subject: Re: [patch] cxgb4: silence shift wrapping static checker warning
Message-Id: <20140113.111639.277633933727182124.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140109053400.GF1265@elgon.mountain>
In-Reply-To: <20140109053400.GF1265@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: dm@chelsio.com, kumaras@chelsio.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 9 Jan 2014 08:34:00 +0300

> I don't know how large "tp->vlan_shift" is but static checkers worry
> about shift wrapping bugs here.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to 'net'.

I don't think I'll be able to get this into 3.13, but on the off chance
Linus has to do another -rc I'll try to send it to him.
