From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 May 2015 13:52:35 +0000
Subject: Re: [PATCH] staging: lustre: code cleanup - variable declaration spacing
Message-Id: <20150506135235.GC14154@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430913775-28350-1-git-send-email-shuey@purdue.edu>
In-Reply-To: <1430913775-28350-1-git-send-email-shuey@purdue.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Shuey <shuey@purdue.edu>
Cc: oleg.drokin@intel.com, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org

On Wed, May 06, 2015 at 08:02:55AM -0400, Mike Shuey wrote:
> Clean up spacing in some variable declarations, to be more consistent.
> 
> It's small, but I need to start somewhere.  Please let me know if I'm not
> adhering to proper procedure for trivial cleanups.

Don't put these "aside" comments in the permanent kernel changelog.

Otherwise I like this patch, lining up the variables can look ok in
struct definitions in headers but in functions we can never keep it
consistent so it just looks whacky.

regards,
dan carpenter

