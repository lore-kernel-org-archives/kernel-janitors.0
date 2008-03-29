From: Matthew Wilcox <matthew@wil.cx>
Date: Sat, 29 Mar 2008 13:49:24 +0000
Subject: Re: [PATCH] jiffies.h: Better error message and add "const" where applicable.
Message-Id: <20080329134923.GD16721@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.00.0803290930110.20145@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.00.0803290930110.20145@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Mar 29, 2008 at 09:32:39AM -0400, Robert P. J. Day wrote:
> Add a more informative error message for bad values of HZ, and add
> "const" argument qualification for a couple routines for which it's
> appropriate.

What effect do you think adding the 'const' has?  Remember, C is
pass-by-value.

More useful might be to mark the functions with __attribute_const__.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
