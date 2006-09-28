From: Alan Cox <alan@redhat.com>
Date: Thu, 28 Sep 2006 16:20:34 +0000
Subject: Re: [KJ] few questions on mxser driver (cleanups)
Message-Id: <20060928162034.GA11165@devserv.devel.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1159459455.1709.66.camel@dyn9047017100.beaverton.ibm.com>
In-Reply-To: <1159459455.1709.66.camel@dyn9047017100.beaverton.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Badari Pulavarty <pbadari@us.ibm.com>
Cc: kernel-janitors@lists.osdl.org, linux-serial@vger.kernel.org, rmk+serial@arm.linux.org.uk, alan@redhat.com

On Thu, Sep 28, 2006 at 09:04:15AM -0700, Badari Pulavarty wrote:
> 1) mxser_get_PCI_conf() and mxser_get_ISA_conf() doesn't check
> errors of request_region(). I think these should be checked and
> return failures. Can we treat request_region() failures as corresponding
> MXSER_ERR_* failures, instead of returning new error code (like -EIO)?

I've as much idea as you do, and no hardware to test sorry


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
