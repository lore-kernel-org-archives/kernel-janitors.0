From: David Miller <davem@davemloft.net>
Date: Wed, 18 Jun 2008 22:42:54 +0000
Subject: Re: [PATCH] firmware: convert tg3 driver to request_firmware()
Message-Id: <20080618.154254.198893481.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1213799313.4794.20.camel@fc6.satnam>
In-Reply-To: <1213799313.4794.20.camel@fc6.satnam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 18 Jun 2008 23:39:41 +0100

> It merely adds the _option_ to load it from userspace, as is recommended
> practice for current drivers.

And the default is to not use the in-kernel copy.

At least how things were previously, the dists had to at least think
about patching out firmware and actually make a decision here.

Now they can just turn off their brains with the changes you've been
proposing lately and from a user perspective I am sure the end result
is going to suck.
