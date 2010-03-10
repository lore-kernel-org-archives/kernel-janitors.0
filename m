From: Joe Perches <joe@perches.com>
Date: Wed, 10 Mar 2010 18:11:49 +0000
Subject: Re: smatch_scripts/whitespace_only.sh
Message-Id: <1268244709.1545.392.camel@Joe-Laptop.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100310101224.GC6321@bicker>
	 <Pine.LNX.4.64.1003101113330.24684@ask.diku.dk>
	 <20100310142759.GG6321@bicker>
	 <Pine.LNX.4.64.1003101537040.27249@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1003101537040.27249@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Dan Carpenter <error27@gmail.com>, linux-kernel@vger.kernel.org, gregkh@suse.de, kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org

On Wed, 2010-03-10 at 15:38 +0100, Julia Lawall wrote:
> > > On Wed, 10 Mar 2010, Dan Carpenter wrote:
> > > > I wrote a script to check that a patch only changes white space.

Perhaps you could use #define __LINE__ 0 to avoid
any vertical line position comparison checks?

> Maybe checkpatch could be changed to not complain about > 80 characters 
> when the line contains a string?

That's been at least partially done in commit
691e669ba8c64d31ac08d87b1751e6acfa3ff65e


