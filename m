From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Jan 2013 07:44:25 +0000
Subject: Re: [patch 2/2] staging: sb105x: clean up interface type test
Message-Id: <20130109074425.GU7247@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130109071214.GC2454@elgon.mountain>
In-Reply-To: <20130109071214.GC2454@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jan 09, 2013 at 10:12:14AM +0300, Dan Carpenter wrote:
> IIR_RS232 is zero so "if (IIR_RS232 = (b_ret & IIR_RS232))" is always
> true so RS232 was always chosen by default.  The test should be
> "if (0 = (b_ret & 0x30)) { ".  The other tests should also be in that
> format.
> 
> My patch doesn't change how the code works.  I've left the RS232 as the
> default and cleaned up the other checks.
> 

Sorry that was a bad change log.  My patch actually does change how
the code works...  If 0x30 is set then it now defaults to RS232
instead of RS485.

But I think it's the right thing to do.

regards,
dan carpenter

