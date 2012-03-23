From: Greg KH <gregkh@linuxfoundation.org>
Date: Fri, 23 Mar 2012 15:41:07 +0000
Subject: Re: [PATCH] staging: wlags49_h2: Replace kmalloc+memset by kzalloc and add error handling.
Message-Id: <20120323154107.GA15516@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120323095158.GB3181@mwanda>
In-Reply-To: <20120323095158.GB3181@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Mar 23, 2012 at 09:00:19PM +0530, santosh prasad nayak wrote:
> Can you please explain whats the disadvantage of having 'unlikely()' here ?
> I have seen it at several places in driver side.

And I bet they are used wrong there.  Again, unless you are in some very
performance critical section of code, don't use unlikely().

The big thing is that it just is not needed at all.  Don't try to be
smarter than the compiler if you don't need it, _AND_ you haven't
actually measured it.

greg k-h
