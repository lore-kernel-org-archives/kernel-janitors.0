From: David Miller <davem@davemloft.net>
Date: Tue, 27 Jul 2010 04:05:15 +0000
Subject: Re: [patch] caif: handle snprintf() return
Message-Id: <20100726.210515.27818376.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100726072358.GK26313@bicker>
In-Reply-To: <20100726072358.GK26313@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: sjur.brandeland@stericsson.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Mon, 26 Jul 2010 09:23:59 +0200

> snprintf() returns the number of bytes that would have been written.  It
> can be larger than the size of the buffer.  The current code won't
> overflow, but people cut and paste this stuff so lets do it right and
> also make the static checkers happy.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
