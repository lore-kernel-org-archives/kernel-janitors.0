From: David Miller <davem@davemloft.net>
Date: Sat, 07 May 2016 19:16:11 +0000
Subject: Re: [patch 1/2] netxen: fix error handling in netxen_get_flash_block()
Message-Id: <20160507.151611.103826673825266201.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160505131846.GB3038@mwanda>
In-Reply-To: <20160505131846.GB3038@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: manish.chopra@qlogic.com, sony.chacko@qlogic.com, rajesh.borundia@qlogic.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 5 May 2016 16:18:46 +0300

> My static checker complained that "v" can be used unintialized if
> netxen_rom_fast_read() returns -EIO.  That function never actually
> returns -1.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
