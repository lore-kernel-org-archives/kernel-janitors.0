From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Jun 2012 13:53:19 +0000
Subject: Re: automated warning notifications
Message-Id: <20120615135319.GF4400@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120614172523.GB4400@mwanda>
 <20120615014835.GA5695@localhost>
 <20120615071222.GZ13539@mwanda>
 <20120615075810.GA13206@localhost>
 <alpine.DEB.2.02.1206150639130.1864@hadrien>
 <20120615111913.GA13539@mwanda>
 <CA+MoWDrKJwiK66zpBxQ=q+qS7n_P4qLySgBRdj2txq20wa7bvA@mail.gmail.com>
In-Reply-To: <CA+MoWDrKJwiK66zpBxQ=q+qS7n_P4qLySgBRdj2txq20wa7bvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Fengguang Wu <wfg@linux.intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Josh Triplett <josh@freedesktop.org>

Dropped the Sparse people from the CC list.

On Fri, Jun 15, 2012 at 10:33:50AM -0300, Peter Senna Tschudin wrote:
> Added git-blame support...
> 

No.  I meant that it would run git blame on the offending line, take
the hash and then do a git show $hash.

regards,
dan carpenter

