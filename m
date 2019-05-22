From: David Miller <davem@davemloft.net>
Date: Wed, 22 May 2019 19:14:51 +0000
Subject: Re: [PATCH net] mISDN: Fix indenting in dsp_cmx.c
Message-Id: <20190522.121451.712557703691236298.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190521094256.GA11899@mwanda>
In-Reply-To: <20190521094256.GA11899@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: isdn@linux-pingi.de, joe@perches.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 May 2019 12:42:56 +0300

> We used a script to indent this code back in 2012, but I guess it got
> confused by the ifdefs and added some extra tabs.  This patch removes
> them.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
