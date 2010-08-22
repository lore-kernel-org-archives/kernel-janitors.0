From: David Miller <davem@davemloft.net>
Date: Sun, 22 Aug 2010 07:54:40 +0000
Subject: Re: [patch] tokenring: remove unneeded NULL checks
Message-Id: <20100822.005440.246513406.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100819100438.GC6674@bicker>
In-Reply-To: <20100819100438.GC6674@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Thu, 19 Aug 2010 12:04:38 +0200

> "fw_entry" is always non-NULL at this point and anyway
> release_firmware() handles NULL parameters.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks Dan.
