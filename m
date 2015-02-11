From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Feb 2015 10:23:07 +0000
Subject: Re: [PATCH 1/1] staging: unisys: Remove allocation from declaration line
Message-Id: <20150211102306.GB26542@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150210130214.GA18429@sloth>
 <20150210222627.GC27072@kroah.com>
In-Reply-To: <20150210222627.GC27072@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Quentin Lambert <lambert.quentin@gmail.com>, devel@driverdev.osuosl.org, sparmaintainer@unisys.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Romer <benjamin.romer@unisys.com>, David Kershner <david.kershner@unisys.com>

On Wed, Feb 11, 2015 at 06:26:27AM +0800, Greg Kroah-Hartman wrote:
> On Tue, Feb 10, 2015 at 02:02:14PM +0100, Quentin Lambert wrote:
> > This patch removes allocation from declaration line because
> > people are known to gloss over declarations.
> 
> Again, who are these lazy people, and why are they reading kernel code?
> 

From my work with smatch:
1) Probably 70-80% of inconsistent NULL checking is when done in the
   initializer.  I'm sending a patch for one of these today.
2) If there is an allocation in the initializer then it's more likely
   that the NULL check will be missing.
Initializers are a blind spot that people do not read.  It's not just
one maintainer, it's consistent across the board.

Also if you put an allocation in the initializer then it almost always
has to be mangled to fit in 80 characters and it looks ugly.  But after
these patches then all the allocations fit naturally.

Plus you have to have that blank line to separate the initialization
paragraph from the paragraph with the check for allocation failure.

Really, it is fairly uncommon to put an allocation in the initalizer.

regards,
dan carpenter
