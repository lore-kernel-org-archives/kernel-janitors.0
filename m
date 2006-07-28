From: Nick Piggin <nickpiggin@yahoo.com.au>
Date: Fri, 28 Jul 2006 23:49:01 +0000
Subject: Re: [KJ] audit return code handling for kernel_thread [1/11]
Message-Id: <44CAA26D.7030809@yahoo.com.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200607282007.k6SK75MK009573@ra.tuxdriver.com>
In-Reply-To: <200607282007.k6SK75MK009573@ra.tuxdriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nhorman@tuxdriver.com
Cc: kernel-janitors@osdl.org, linux-kernel@vger.kernel.org, paulus@au.ibm.com

nhorman@tuxdriver.com wrote:
> Audit/Cleanup of kernel_thread calls, specifically checking of return codes.
>     Problems seemed to fall into 3 main categories:
>     

Thanks for doing this. Nitpick: this should be all one patch, or at most 3
patches (then each of the below 3 items would become individual changelogs).

Each patch should have a unique changelog, each should have a unique subject
(sans the sequence number).

cc'ing Andrew is also a good idea, if you want them to get merged ;)

One coding style comment:
if (...)
     multi line
         statement

Could use braces around the outermost if statement, for clarity.


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
>     
>     3) callers of kernel_thread never bothered to check the return code at all.
>     This can lead to seemingly unrelated errors later in execution.  Fixed by
>     checking return code at call time and printing a warning message on failure.

-- 
SUSE Labs, Novell Inc.
Send instant messages to your online friends http://au.messenger.yahoo.com 

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
