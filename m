From: Joe Perches <joe@perches.com>
Date: Tue, 28 Nov 2017 05:54:27 +0000
Subject: Re: [PATCH] atm: eni: fix several indentation issues
Message-Id: <1511848467.32426.100.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171127131510.10500-1-colin.king@canonical.com>
In-Reply-To: <20171127131510.10500-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2017-11-27 at 13:15 +0000, Colin King wrote:
> drivers/atm/eni.c

Aren't all those ++ variables unused?

They seem to be emitted in an
#if 0
	printk(...)
#endif

Maybe these should be removed or changed
to something like:

#if 0
#define DEBUG_INCR(var) do { (var)++ } while (0)
#else
#define DEBUG_INCR(var) do {} while (0)
#endif

...

	DEBUG_INCR(rx_enqueued);

