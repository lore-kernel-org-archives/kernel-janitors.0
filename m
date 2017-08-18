From: David Miller <davem@davemloft.net>
Date: Fri, 18 Aug 2017 17:18:35 +0000
Subject: Re: [PATCH net-next] bpf: fix a return in sockmap_get_from_fd()
Message-Id: <20170818.101835.574448732763821120.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170818071210.wyq37kura6wz6bx6@mwanda>
In-Reply-To: <20170818071210.wyq37kura6wz6bx6@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: ast@kernel.org, john.fastabend@gmail.com, daniel@iogearbox.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Aug 2017 10:27:02 +0300

> "map" is a valid pointer.  We wanted to return "err" instead.  Also
> let's return a zero literal at the end.
> 
> Fixes: 174a79ff9515 ("bpf: sockmap with sk redirect support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
