From: David Miller <davem@davemloft.net>
Date: Sat, 17 Mar 2012 06:18:56 +0000
Subject: Re: [PATCH] isdn: Return -EINTR in gigaset_start() if locking attempts fails.
Message-Id: <20120316.231856.1071253468993560433.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331903413-11426-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1331903413-11426-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santoshprasadnayak@gmail.com
Cc: hjlipp@web.de, tilman@imap.cc, isdn@linux-pingi.de, gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Fri, 16 Mar 2012 18:40:13 +0530

> We have 3 callers: gigaset_probe(), gigaset_tty_open() and
> gigaset_probe(). Each caller tries to free allocated memory
> if lock fails. This is possible if we returns -EINTR.

Look again at the callers.

They interpret "0" as an error, so your patch would break the driver.
