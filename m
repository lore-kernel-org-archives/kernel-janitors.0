From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 11 Jan 2008 14:01:02 +0000
Subject: Re: [PATCH] Random number driver: make random_ioctl as an unlocked_ioctl function
Message-Id: <20080111140101.GL18741@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1200051592.3844.63.camel@nikanth-laptop.blr.novell.com>
In-Reply-To: <1200051592.3844.63.camel@nikanth-laptop.blr.novell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikanth Karthikesan <knikanth@suse.de>
Cc: mpm@selenic.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 11, 2008 at 05:09:52PM +0530, Nikanth Karthikesan wrote:
> The random_ioctl is registered as an ioctl function but it does not
> require BKL to be held when called. Changing it as an unlocked_ioctl
> function.
> 
> Signed-off-by: Nikanth Karthikesan <knikanth@suse.de>

Acked-by: Matthew Wilcox <willy@linux.intel.com>

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
