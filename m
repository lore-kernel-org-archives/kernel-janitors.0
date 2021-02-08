From: Ioana Ciornei <ioana.ciornei@nxp.com>
Date: Mon, 08 Feb 2021 15:49:16 +0000
Subject: Re: [PATCH] bus: fsl-mc: Fix test for end of loop
Message-Id: <20210208154914.h6lunbjxwmdb2bvu@skbuf>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YBf0Br9obNGZTcNI@mwanda> <20210208141803.bqbnbgvprtlo3vs6@skbuf>
 <20210208151129.GJ2696@kadam>
In-Reply-To: <20210208151129.GJ2696@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, Feb 08, 2021 at 06:11:29PM +0300, Dan Carpenter wrote:
> On Mon, Feb 08, 2021 at 02:18:04PM +0000, Ioana Ciornei wrote:
> > On Mon, Feb 01, 2021 at 03:28:54PM +0300, Dan Carpenter wrote:
> > > The "desc" pointer can't possibly be NULL here.  If we can't find the
> > > correct "desc" then tt points to the last element of the
> > > fsl_mc_accepted_cmds[] array.  Fix this by testing if
> > > "i == FSL_MC_NUM_ACCEPTED_CMDS" instead.
> > > 
> > > Fixes: 2cf1e703f066 ("bus: fsl-mc: add fsl-mc userspace support")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > Hi,
> > 
> > I just noticed that Greg wasn't copied on the initial email.
> > 
> > If you don't mind I will re-submit your patch along with other updates
> > to the fsl-mc bus so that you don't have to bother.
> > 
> 
> Thanks for doing that!
> 
> Was Greg supposed to have been copied, though?  He's not listed in the
> ./scripts/get_maintainer.pl output.
> 

Huh, he's not listed indeed. I didn't check this before since the fsl-mc
bus changes have always been pushed through Greg's char-misc tree.
