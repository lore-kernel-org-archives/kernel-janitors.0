From: David Miller <davem@davemloft.net>
Date: Tue, 13 Jul 2010 03:34:40 +0000
Subject: Re: [patch] isdn: fix strlen() usage
Message-Id: <20100712.203440.35813617.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100710143111.GA19184@bicker>
In-Reply-To: <20100710143111.GA19184@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: isdn@linux-pingi.de, shemminger@vyatta.com, hohndel@infradead.org, jkosina@suse.cz, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Sat, 10 Jul 2010 16:31:11 +0200

> There was a missing "else" statement so the original code overflowed if
> ->master->name was too long.  Also the ->slave and ->master buffers can
> hold names with 9 characters and a NULL so I cleaned it up to allow
> another character.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
