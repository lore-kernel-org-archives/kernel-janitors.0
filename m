From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Date: Wed, 26 May 2010 18:43:58 +0000
Subject: Re: [PATCH 7/17] arch/arm/common: Add missing
Message-Id: <20100526184358.GC6232@n2100.arm.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005261756000.23743@ask.diku.dk>
	<201005261907.06198.marek.vasut@gmail.com>
In-Reply-To: <201005261907.06198.marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, May 26, 2010 at 07:07:06PM +0200, Marek Vasut wrote:
> Why are "readl"s protected by spinlock anyway ? Can't we just move the locking 
> past the code above ?

Good question - and there seems to be a deadlock waiting to happen -
sa1111_wake() re-takes the same lock.

I think we should kill all the spinlock in sa1111_resume().
