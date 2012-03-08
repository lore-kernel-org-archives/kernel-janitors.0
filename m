From: David Miller <davem@davemloft.net>
Date: Thu, 08 Mar 2012 08:29:03 +0000
Subject: Re: [patch] atl1c: set ATL1C_WORK_EVENT_RESET bit correctly
Message-Id: <20120308.002903.2204810112948469308.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120307100204.GB25452@elgon.mountain>
In-Reply-To: <20120307100204.GB25452@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jcliburn@gmail.com, chris.snook@gmail.com, ian.campbell@citrix.com, eric.dumazet@gmail.com, jpirko@redhat.com, mirq-linux@rere.qmqm.pl, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 7 Mar 2012 13:02:04 +0300

> ATL1C_WORK_EVENT_RESET is zero so the original code here is a nop.  The
> intent was to set the zero bit.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
