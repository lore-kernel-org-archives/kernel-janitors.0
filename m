From: David Miller <davem@davemloft.net>
Date: Mon, 10 Jan 2011 00:45:48 +0000
Subject: Re: [patch] phonet: some signedness bugs
Message-Id: <20110109.164548.58428218.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110107203755.GB1959@bicker>
In-Reply-To: <20110107203755.GB1959@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: remi.denis-courmont@nokia.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, dan.j.rosenberg@gmail.com

From: Dan Carpenter <error27@gmail.com>
Date: Fri, 7 Jan 2011 23:37:55 +0300

> Dan Rosenberg pointed out that there were some signed comparison bugs
> in the phonet protocol.
> 
> http://marc.info/?l=full-disclosure&m9424528425330&w=2
> 
> If you have already have CAP_SYS_ADMIN then you could use the bugs to
> get root, or someone could cause an oops by mistake.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied and queued up for -stable, thanks Dan.
