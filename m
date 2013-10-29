From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 29 Oct 2013 13:36:09 +0000
Subject: Re: [PATCH 0/14] JANITOR: Remove include/linux/sys.h
Message-Id: <20131029133609.GQ5871@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131029095347.GA12832@nbf-011.seri.co.uk>
In-Reply-To: <20131029095347.GA12832@nbf-011.seri.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Oct 29, 2013 at 11:53:48AM +0200, Mika Kukkonen wrote:
> Hello,
> 
> File include/linux/sys.h has a comment stating that the "file is no longer used or needed",
> but it is still included in multiple places under several architectures. It does contain
> bunch of #define's but those have been #ifdef'd out, and grepping did not show any uses
> of those #define's in the source tree outside this file.
> 
> The uses of the file seem partially be accidental remains of some old use, but almost all
> are in architecture specific code with only one outside in file net/core/pktgen.c. So this
> patchset has been divided to 14 parts, addressing 12 architectures (c6x, cris, frv, h8300,
> microblaze, mips, mn10300, parisc, powerpc, sh, unicore32 and x86) and the outlier in net
> and then the final patch removes the file itself. All patches can be applied invidually
> with the obvious exception of the last one which actually removes the file and should be
> last.
> 

Kernel Janitors doesn't have an a patch tree.  In theory these could all
go through trivial@kernel.org or they could go to the subsystem
maintainers.  You pretty much have broken it up by subsystem already.

The subjects need to be different.  Each should reflect the subsystem
conventions.  Find the correct subject by doing:
git log --oneline arch/c6x/
git log --oneline arch/cris/

The complication with doing it by the subsystem is that the last patch
as to go in last.  I would suggest sending the first 13 patches right
away and holding off until v3.13-rc1 has been released in 4 weeks time.
By then the earlier patches should have been merged.  Otherwise wait
until v3.14 to apply the last patch.  It's not a race, and it will make
it easiest if the 13 have gone to Linus before we take the final step.

regards,
dan carpenter

