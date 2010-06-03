From: David Miller <davem@davemloft.net>
Date: Thu, 03 Jun 2010 10:29:08 +0000
Subject: Re: [patch] isdn/kcapi: return -EFAULT on copy_from_user errors
Message-Id: <20100603.032908.38313177.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100603095613.GP5483@bicker>
	<4C078362.1080005@web.de>
In-Reply-To: <4C078362.1080005@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jan.kiszka@web.de
Cc: error27@gmail.com, isdn@linux-pingi.de, tilman@imap.cc, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Jan Kiszka <jan.kiszka@web.de>
Date: Thu, 03 Jun 2010 12:26:42 +0200

> No need to assign retval anymore, it is overwritten in all non-error cases.

I'm still going to apply this fix as-is since it's easier to validate
and provably won't introduce new compiler warnings.
