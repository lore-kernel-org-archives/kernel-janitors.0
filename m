From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 29 Jul 2010 13:34:56 +0000
Subject: Re: [bug] Fixing mutex_lock() under held spinlock
Message-Id: <201007291534.57188.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100729132223.GA19715@albatros>
In-Reply-To: <20100729132223.GA19715@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, David Woodhouse <David.Woodhouse@intel.com>, Nicolas Pitre <nico@fluxnic.net>, Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>, Jiri Slaby <jslaby@suse.cz>, Stefani Seibold <stefani@seibold.net>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thursday 29 July 2010, Vasiliy Kulikov wrote:
> I've found that cfi_cmdset and lpddr_cmds call mutex_lock() under held
> spinlock(). Maybe it was designed as a special locking scheme, so I
> don't try to fix it as I might create new complex locking problem.

No, it certainly looks like a bug and it seems to have been introduced by
http://linux.derkeiler.com/Mailing-Lists/Kernel/2010-03/msg02798.html

Back in March, Stefani wrote:
| I have analyzed this drivers and IMHO i don't think there will be used
| from irq or atomic contexts. There is no request interrupt and there are
| a lot msleep and add_wait_queues/schedule calls during holding the
| mutex, which are not very useful in a irq or atomic context. But i don't
| know the whole mtd stack. 

It seems you have missed at least two places. It should be possible to
fix this by turning shared->lock into a mutex as well.

	Arnd
