From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Wed, 30 Oct 2013 10:59:33 +0000
Subject: Re: [PATCH 0/14] JANITOR: Remove include/linux/sys.h
Message-Id: <20131030105933.GC26766@nbf-011.seri.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131029095347.GA12832@nbf-011.seri.co.uk>
In-Reply-To: <20131029095347.GA12832@nbf-011.seri.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Oct 29, 2013 at 01:36:09PM +0000, Dan Carpenter wrote:
> 
> Kernel Janitors doesn't have an a patch tree.  In theory these could all
> go through trivial@kernel.org or they could go to the subsystem
> maintainers.  You pretty much have broken it up by subsystem already.

Yes, but I chickened out and did not want to CC 14 subsystem maintainers. ;-)

> The complication with doing it by the subsystem is that the last patch
> as to go in last.  I would suggest sending the first 13 patches right
> away and holding off until v3.13-rc1 has been released in 4 weeks time.
> By then the earlier patches should have been merged.  Otherwise wait
> until v3.14 to apply the last patch.  It's not a race, and it will make
> it easiest if the 13 have gone to Linus before we take the final step.

Well, this is in no way urgent issue, so I'll revisit it in the next release
cycle if nothing happends before that. Thanks for your feedback!

--MiKu
