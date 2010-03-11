From: Dan Carpenter <error27@gmail.com>
Date: Thu, 11 Mar 2010 09:59:40 +0000
Subject: Re: smatch_scripts/whitespace_only.sh
Message-Id: <20100311095940.GK6321@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100310101224.GC6321@bicker> <Pine.LNX.4.64.1003101113330.24684@ask.diku.dk> <20100310142759.GG6321@bicker> <Pine.LNX.4.64.1003101537040.27249@ask.diku.dk> <1268244709.1545.392.camel@Joe-Laptop.home>
In-Reply-To: <1268244709.1545.392.camel@Joe-Laptop.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Julia Lawall <julia@diku.dk>, linux-kernel@vger.kernel.org, gregkh@suse.de, kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org

On Wed, Mar 10, 2010 at 10:11:49AM -0800, Joe Perches wrote:
> On Wed, 2010-03-10 at 15:38 +0100, Julia Lawall wrote:
> > > > On Wed, 10 Mar 2010, Dan Carpenter wrote:
> > > > > I wrote a script to check that a patch only changes white space.
> 
> Perhaps you could use #define __LINE__ 0 to avoid
> any vertical line position comparison checks?
> 

I tried something similar to that at first but I found that line 
numbers were used in other ways.  In the end, I added a -no-lineno to
sparse so it thinks everything is on line 123456.

It might be better to just right a perl script that strips out all the
whitespace and compares the result blobs before and after the patch.  
That would handle the #if 0 code as well.

regards,
dan carpenter

> > Maybe checkpatch could be changed to not complain about > 80 characters 
> > when the line contains a string?
> 
> That's been at least partially done in commit
> 691e669ba8c64d31ac08d87b1751e6acfa3ff65e
