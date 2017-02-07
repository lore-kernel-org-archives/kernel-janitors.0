From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2017 14:15:54 +0000
Subject: Re: [patch] Staging: bcm2835-audio: fix an uninitialized return value
Message-Id: <20170207141553.GD11154@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207131734.GC27416@mwanda>
In-Reply-To: <20170207131734.GC27416@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Feb 07, 2017 at 03:01:23PM +0100, Arnd Bergmann wrote:
> On Tue, Feb 7, 2017 at 2:17 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > "ret" isn't necessarily initialized on the success path.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> 
> The patch seems correct, but do you have any idea why gcc-7 didn't
> warn about this?

Heh...  I'm not a gcc dev.  Checking for uninitialized variables is
harder than I would have thought though..

> I assume that you found it with smatch, and nobody else did.

Yep.  I'm getting close to releasing my uninitialized variable check.

I guess the one thing holding me back is that I still have tons of false
positives caused by mismatches between "if (ret)" and "if (ret < 0)"
where the function assumes that non-zero is an error but the caller
assumes that errors are negative.

regards,
dan carpenter

