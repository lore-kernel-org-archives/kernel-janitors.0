From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 May 2015 09:21:42 +0000
Subject: Re: [PATCH v4 00/13] staging: lustre: lnet: code cleanups
Message-Id: <20150522092142.GJ4150@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
In-Reply-To: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Shuey <shuey@purdue.edu>
Cc: oleg.drokin@intel.com, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, lustre-deve@lists.lustre.org

On Thu, May 21, 2015 at 03:50:23PM -0400, Mike Shuey wrote:
> This patch series cleans up code in staging/lustre/lnet - mostly spacing
> and dead function cleanup.  Should apply against linux-next 20150518.

Why are you sending a v4 of this?  We don't actually enjoy reviewing the
same patchset over and over...

Update:  I have investigated and it is because you add a few new patches
to this set which were not in the original.  Just assume that the
original patchset will be merge and send the additional patches as a new
set.

Also since no one replied to the v3 patchset and Greg has a 5000 patches
in between v3 and v4 he will not seen v4 until days after he has applied
v3 so it causes confusion.

Also you sent a v5 of this patchset but without a v5 label...

regards,
dan carpenter

