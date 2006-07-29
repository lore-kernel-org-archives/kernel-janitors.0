From: Russell King <rmk+lkml@arm.linux.org.uk>
Date: Sat, 29 Jul 2006 09:37:04 +0000
Subject: Re: [KJ] audit return code handling for kernel_thread [2/11]
Message-Id: <20060729093704.GD26956@flint.arm.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200607282007.k6SK7DhX009584@ra.tuxdriver.com>
In-Reply-To: <200607282007.k6SK7DhX009584@ra.tuxdriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nhorman@tuxdriver.com
Cc: kernel-janitors@osdl.org, linux-kernel@vger.kernel.org, schwidefsky@de.ibm.com

On Fri, Jul 28, 2006 at 04:07:13PM -0400, nhorman@tuxdriver.com wrote:
> Audit/Cleanup of kernel_thread calls, specifically checking of return codes.
>     Problems seemed to fall into 3 main categories:
>     
>     1) callers of kernel_thread were inconsistent about meaning of a zero return
>     code.  Some callers considered a zero return code to mean success, others took
>     it to mean failure.  a zero return code, while not actually possible in the
>     current implementation, should be considered a success (pid 0 is/should be
>     valid). fixed all callers to treat zero return as success
>     
>     2) caller of kernel_thread saved return code of kernel_thread for later use
>     without ever checking its value.  Callers who did this tended to assume a
>     non-zero return was success, and would often wait for a completion queue to be
>     woken up, implying that an error (negative return code) from kernel_thread could
>     lead to deadlock.  Repaired by checking return code at call time, and setting
>     saved return code to zero in the event of an error.

This is inconsistent with your assertion that pid 0 "is/should be valid"
above.  If you want '0' to mean "not valid" then it's not a valid return
value from kernel_thread() (and arguably that's true, since pid 0 is
permanently allocated to the idle thread.)

I don't particularly care whether you decide to that returning pid 0 from
kernel_thread is valid or not, just that your two points above are at least
consistent with each other.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 Serial core
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
