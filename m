From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Sun, 16 Jan 2005 19:25:57 +0000
Subject: [KJ] Re: [PATCH 0/13] remove cli()/sti() in drivers/char/*
Message-Id: <41EABFC5.3060002@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050116135223.30109.26479.55757@localhost.localdomain>
In-Reply-To: <20050116135223.30109.26479.55757@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Nelson <james4765@cwazy.co.uk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, akpm@osdl.org

James Nelson wrote:
> This series of patches removes the last cli()/sti()/save_flags()/restore_flags()
> function calls in drivers/char.

to what end?

I guess I don't get it.  What makes these drivers SMP-safe now?

Or is this series of patches only done to kill off the use
of deprecated functions?  If that's the case, they could
easily give someone the (false) expectation that the drivers
are SMP-safe, couldn't they?  Well, ftape (for one) is still
marked as BROKEN_ON_SMP, but will people know why it's
marked that way?

Have you read Documentation/cli-sti-removal.txt ?

-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
