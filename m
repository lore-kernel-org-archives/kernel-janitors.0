From: David Miller <davem@davemloft.net>
Date: Mon, 28 Jan 2013 01:38:51 +0000
Subject: Re: [patch] qlcnic: silence false positive overflow warning
Message-Id: <20130127.203851.2157088853751625559.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130125064141.GB4882@elgon.mountain>
In-Reply-To: <20130125064141.GB4882@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jitendra.kalsaria@qlogic.com, sony.chacko@qlogic.com, linux-driver@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Jan 2013 09:41:42 +0300

> We actually store the MAC address as well as the board_name here.  The
> longest board_name is 75 characters so there is more than enough room
> to hold the 17 character MAC and the ": " divider.  But making this
> buffer larger silences a static checker warning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

This patch doesn't apply cleanly to any of my trees.
