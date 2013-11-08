From: David Miller <davem@davemloft.net>
Date: Fri, 08 Nov 2013 00:14:02 +0000
Subject: Re: [patch] isdn: icn: NULL dereference printing error message
Message-Id: <20131107.191402.296321377536769892.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107075806.GO21844@elgon.mountain>
In-Reply-To: <20131107075806.GO21844@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: netdev@vger.kernel.org, isdn@linux-pingi.de, isdn4linux@listserv.isdn4linux.de, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 7 Nov 2013 10:58:06 +0300

> "card2" is NULL here so I have changed it to use "id2" instead of
> "card2->interface.id".
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
