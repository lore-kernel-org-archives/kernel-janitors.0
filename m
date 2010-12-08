From: David Miller <davem@davemloft.net>
Date: Wed, 08 Dec 2010 18:14:24 +0000
Subject: Re: [patch] econet: unlock on -EPERM path
Message-Id: <20101208.101424.189706549.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101207110138.GM10623@bicker>
In-Reply-To: <20101207110138.GM10623@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: netdev@vger.kernel.org, philb@gnu.org, eric.dumazet@gmail.com, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Tue, 7 Dec 2010 14:01:38 +0300

> We need to do a mutex_unlock() and a put_dev() before returning.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Nelson Elhage beat you to this one, so I integrates his version.

Thanks.
