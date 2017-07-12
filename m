From: David Miller <davem@davemloft.net>
Date: Wed, 12 Jul 2017 15:19:11 +0000
Subject: Re: [PATCH net] net: ipmr: ipmr_get_table() returns NULL
Message-Id: <20170712.081911.723573255148721051.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170712075647.zyz6pkppyerl4ktf@mwanda>
In-Reply-To: <20170712075647.zyz6pkppyerl4ktf@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: sharpd@cumulusnetworks.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Jul 2017 10:56:47 +0300

> The ipmr_get_table() function doesn't return error pointers it returns
> NULL on error.
> 
> Fixes: 4f75ba6982bc ("net: ipmr: Add ipmr_rtm_getroute")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
