From: Vicente Feito <vicente.feito@gmail.com>
Date: Sun, 27 Feb 2005 13:49:20 +0000
Subject: Re: [KJ] question ACPI & CMPXCHG
Message-Id: <200502271349.20737.vicente.feito@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Sorry but... isn't already a dependency?

        depends on (SMP || PREEMPT) && X86_CMPXCHG

Or a dependency where?
Besides, replacing a warning with an error directive... yaks, that hurts 
everybodies feelings isn't?

Vicente
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
