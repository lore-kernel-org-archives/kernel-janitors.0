From: David Miller <davem@davemloft.net>
Date: Mon, 20 Dec 2010 18:44:32 +0000
Subject: Re: [patch -next] vmxnet3: locking problems in xmit
Message-Id: <20101220.104432.39185982.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101220130315.GY1936@bicker>
In-Reply-To: <20101220130315.GY1936@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: sbhatewara@vmware.com, pv-drivers@vmware.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Mon, 20 Dec 2010 16:03:15 +0300

> There were several paths that didn't release their locks.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
