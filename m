From: David Miller <davem@davemloft.net>
Date: Thu, 23 May 2019 00:22:30 +0000
Subject: Re: [PATCH] mISDN: make sure device name is NUL terminated
Message-Id: <20190522.172230.230166759225525041.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190522084513.GA2129@mwanda>
In-Reply-To: <20190522084513.GA2129@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: isdn@linux-pingi.de, zhongjiang@huawei.com, deepa.kernel@gmail.com, penguin-kernel@I-love.SAKURA.ne.jp, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 May 2019 11:45:13 +0300

> The user can change the device_name with the IMSETDEVNAME ioctl, but we
> need to ensure that the user's name is NUL terminated.  Otherwise it
> could result in a buffer overflow when we copy the name back to the user
> with IMGETDEVINFO ioctl.
> 
> I also changed two strcpy() calls which handle the name to strscpy().
> Hopefully, there aren't any other ways to create a too long name, but
> it's nice to do this as a kernel hardening measure.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
