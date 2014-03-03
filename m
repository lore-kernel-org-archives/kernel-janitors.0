From: David Miller <davem@davemloft.net>
Date: Mon, 03 Mar 2014 20:30:15 +0000
Subject: Re: [patch] hsr: off by one sanity check in hsr_register_frame_in()
Message-Id: <20140303.153015.1785335562028272449.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140228231857.GD22115@elgon.mountain>
In-Reply-To: <20140228231857.GD22115@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: arvid.brodin@alten.se, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 1 Mar 2014 02:18:57 +0300

> This is a sanity check and we never pass invalid values so this patch
> doesn't change anything.  However the node->time_in[] array has
> HSR_MAX_SLAVE (2) elements and not HSR_MAX_DEV (3).
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
