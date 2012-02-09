From: David Miller <davem@davemloft.net>
Date: Thu, 09 Feb 2012 01:28:35 +0000
Subject: Re: [patch] netxen_nic: signedness bug in netxen_md_entry_err_chk()
Message-Id: <20120208.202835.161468483687895578.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120208092335.GC6554@elgon.mountain>
In-Reply-To: <20120208092335.GC6554@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: sony.chacko@qlogic.com, rajesh.borundia@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 8 Feb 2012 12:23:36 +0300

> "esize" should be signed because it can be negative here.  For example,
> when we call it in netxen_parse_md_template(), it could be -1 from the
> return value of netxen_md_L2Cache().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
