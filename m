From: David Miller <davem@davemloft.net>
Date: Mon, 01 May 2017 02:42:53 +0000
Subject: Re: [PATCH net] liquidio: silence a locking static checker warning
Message-Id: <20170430.224253.1115826536369554016.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170428125715.h6d5ttnfq7rdnpni@mwanda>
In-Reply-To: <20170428125715.h6d5ttnfq7rdnpni@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: derek.chickles@caviumnetworks.com, satananda.burla@caviumnetworks.com, felix.manlunas@caviumnetworks.com, raghu.vatsavayi@caviumnetworks.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Apr 2017 15:57:15 +0300

> Presumably we never hit this return, but static checkers complain that
> we need to unlock so we may as well fix that.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
