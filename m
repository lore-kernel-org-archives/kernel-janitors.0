From: Badari Pulavarty <pbadari@us.ibm.com>
Date: Thu, 28 Sep 2006 16:04:15 +0000
Subject: [KJ] few questions on mxser driver (cleanups)
Message-Id: <1159459455.1709.66.camel@dyn9047017100.beaverton.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org, linux-serial@vger.kernel.org
Cc: alan@redhat.com, rmk+serial@arm.linux.org.uk

Hi,

I was fixing request_region() error checks and realized few things
about mxser driver (char/mxser.c) - I want to confirm before fixing
them.

1) mxser_get_PCI_conf() and mxser_get_ISA_conf() doesn't check
errors of request_region(). I think these should be checked and
return failures. Can we treat request_region() failures as corresponding
MXSER_ERR_* failures, instead of returning new error code (like -EIO)?

2) mxser_get_PCI_conf() currently doesn't return error - but the
caller checks for various error codes. Is this a oversight or it can't
happen with PCI ? If so, can we nix error checking at the caller ?

Thanks,
Badari

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
