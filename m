From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 May 2019 08:57:52 +0000
Subject: Re: [PATCH] kdb: do a sanity check on the cpu in kdb_per_cpu()
Message-Id: <20190508085752.GY2239@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190506125018.GA13799@mwanda>
In-Reply-To: <20190506125018.GA13799@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, May 08, 2019 at 09:48:38AM +0100, Daniel Thompson wrote:
> On Mon, May 06, 2019 at 03:50:18PM +0300, Dan Carpenter wrote:
> > The "whichcpu" comes from argv[3].  The cpu_online() macro looks up the
> > cpu in a bitmap of online cpus, but if the value is too high then it
> > could read beyond the end of the bitmap and possibly Oops.
> > 
> > Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Just out of interest... why isn't this copied to LKML? Omiting LKML makes
> the patch hard to find in a patchwork instance.

Sorry, I wasn't aware that anyone was using LKML for patchwork.

regards,
dan carpenter
