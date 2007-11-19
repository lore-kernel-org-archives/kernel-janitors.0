From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 19 Nov 2007 16:34:38 +0000
Subject: Re: 2.6.23.1->2.6.23.8 breaks root Makefile
Message-Id: <20071119163437.GD12494@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1195489140.21337.10.camel@ronispc.chem.mcgill.ca>
In-Reply-To: <1195489140.21337.10.camel@ronispc.chem.mcgill.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ronis <ronis@ronispc.chem.mcgill.ca>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Nov 19, 2007 at 11:19:00AM -0500, David Ronis wrote:
> The current main Makefile incorrectly identified my ld as one that
> supports --build-id (it didn't).  The problem is fixed by upgrading to
> the latest binutils, version 2.18, which does, but somehow  I suspect
> that this wasn't what was intended.  For what it's worth, I was running
> with slackware's binutils-2.17.50.0.17.

That's not something that the janitors are responsible for.  Redirecting
to linux-kernel.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
