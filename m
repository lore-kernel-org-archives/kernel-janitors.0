From: David Miller <davem@davemloft.net>
Date: Tue, 14 Nov 2017 13:00:47 +0000
Subject: Re: [PATCH net-next] xdp: sample: Missing curly braces in read_route()
Message-Id: <20171114.220047.264915982235633364.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171114061202.bzxl6fhw3bdmqp7h@mwanda>
In-Reply-To: <20171114061202.bzxl6fhw3bdmqp7h@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: ast@kernel.org, Christina.Jacob@cavium.com, daniel@iogearbox.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Nov 2017 09:12:03 +0300

> The assert statement is supposed to be part of the else branch but the
> curly braces were accidentally left off.
> 
> Fixes: 3e29cd0e6563 ("xdp: Sample xdp program implementing ip forward")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
