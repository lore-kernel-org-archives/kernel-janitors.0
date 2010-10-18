From: David Miller <davem@davemloft.net>
Date: Mon, 18 Oct 2010 08:55:28 +0000
Subject: Re: [patch] gianfar: fix double lock typo
Message-Id: <20101018.015528.71129771.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101013191954.GE6060@bicker>
In-Reply-To: <20101013191954.GE6060@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: Sandeep.Kumar@freescale.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Wed, 13 Oct 2010 21:19:55 +0200

> This should be a _restore() instead of a _save().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Good find, applied, thanks!
