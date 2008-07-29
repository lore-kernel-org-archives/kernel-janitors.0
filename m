From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 29 Jul 2008 14:59:30 +0000
Subject: Re: [PATCH] Removal of the deprecated cli() sti() functions.
Message-Id: <20080729145929.GE28989@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1217342763-19568-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1217342763-19568-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jul 29, 2008 at 10:46:03AM -0400, Mark Asselstine wrote:
> These functions have been deprecated for some time now
> but remained until all legacy callers could be removed.
> With a few commits in 2.6.26 this has happened so now
> we can remove these deprecated functions.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>

Yay!

Reviewed-by: Matthew Wilcox <willy@linux.intel.com>

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
