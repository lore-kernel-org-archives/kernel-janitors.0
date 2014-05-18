From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 18 May 2014 10:43:14 +0000
Subject: Re: [PATCH RFC] Remove useless return variables
Message-Id: <20140518104314.GK15585@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400379310-10214-1-git-send-email-peter.senna@gmail.com>
	<87y4xzpti4.fsf@tassilo.jf.intel.com>
In-Reply-To: <87y4xzpti4.fsf@tassilo.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On Sat, May 17, 2014 at 10:04:35PM -0700, Andi Kleen wrote:
> Peter Senna Tschudin <peter.senna@gmail.com> writes:
> 
> > This patch remove variables that are initialized with a constant,
> > are never updated, and are only used as parameter of return.
> > Return the constant instead of using a variable.
> 
> This ret variable pattern is pretty standard in Linux, as it makes it
> easier to add new code that may trigger new errors
> (using the usual "goto forest" error handling pattern)
> 
> I don't see any benefit in whole-sale removing it. The compiler
> doesn't care about it and will generate the same code in any
> case.

Peter is not selling this in the right way, it's not about saving
memory.  The patch is good because:

	return IRQ_HANDLED;

is clearer to read than:

	return ret;

And then when you remove the one user, you may as well remove the unused
variable.  You could leave it there for future work but really it's not
hard to add it back if it's needed.

regards,
dan carpenter

