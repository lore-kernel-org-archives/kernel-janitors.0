From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Aug 2014 11:04:07 +0000
Subject: Re: [PATCH 0/6] Remove various orphaned header files
Message-Id: <20140827110407.GJ5046@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1403630855-29186-1-git-send-email-linux@rasmusvillemoes.dk>
 <1403631263.29061.17.camel@joe-AO725>
 <8761hksfnf.fsf@rasmusvillemoes.dk>
In-Reply-To: <8761hksfnf.fsf@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Joe Perches <joe@perches.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Aug 22, 2014 at 05:33:24PM +0200, Rasmus Villemoes wrote:
> Joe Perches <joe@perches.com> writes:
> 
> > On Tue, 2014-06-24 at 19:27 +0200, Rasmus Villemoes wrote:
> >> AFAICT, these headers are not used anywhere, and are just accidental
> >> leftovers from past cleanups.
> >
> > Thanks.
> 
> Did anyone pick these [1] up? All six files still seem to be present.

Greg is not the right maintainer for most of these.  Resend them to the
correct people.

patch 1 I never received it
patch 2 netdev and Dave M.
patch 3 Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>
patch 4 Greg or Dave M, netdev
patch 5 <linux-tegra@vger.kernel.org>
patch 6 netdev and Dave M.

regards,
dan carpenter

