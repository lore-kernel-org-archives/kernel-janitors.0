From: "Winkler, Tomas" <tomas.winkler@intel.com>
Date: Sat, 06 Jan 2018 21:59:04 +0000
Subject: RE: [PATCH] mei: fix an && vs || typo
Message-Id: <5B8DA87D05A7694D9FA63FD143655C1B74A8D915@hasmsx108.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180106092650.n5jcxbazrzqlgvdt@mwanda>
In-Reply-To: <20180106092650.n5jcxbazrzqlgvdt@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Colin Ian King <colin.king@canonical.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>


> 
> ->dev_state can't be both MEI_DEV_RESETTING and
> MEI_DEV_POWER_DOWN at
> the same time.  && was clearing intended here.
> 
> Fixes: 8d52af6795c0 ("mei: speed up the power down flow")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>


Thanks Dan but this was already reported and patch was created by Colin.
https://lkml.org/lkml/2017/12/19/696
I guess Greg has missed that one.
Thanks
Tomas

