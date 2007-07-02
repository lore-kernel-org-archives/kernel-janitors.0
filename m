From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 02 Jul 2007 11:07:15 +0000
Subject: Re: [KJ] Why keeping lines commented out via #if 0?
Message-Id: <Pine.LNX.4.64.0707020703560.32050@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200706021359.23564.lists-receive@programmierforen.de>
In-Reply-To: <200706021359.23564.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  it's not the "#if 0"s that amuse me ... it's the "#if 1"s:

$ grep -r "^#if 1$" * | wc -l
226
$

some of them have some real entertainment value:

...
#if 1   /* XXX screw this, I can't get the VAC flushes working
         * XXX reliably... -DaveM
         */
        .globl  swift_flush_cache_all, swift_flush_cache_mm
        .globl  swift_flush_cache_range, swift_flush_cache_page
        .globl  swift_flush_page_for_dma
        .globl  swift_flush_page_to_ram

swift_flush_cache_all:
swift_flush_cache_mm:
swift_flush_cache_range:
swift_flush_cache_page:
swift_flush_page_for_dma:
swift_flush_page_to_ram:
        sethi   %hi(0x2000), %o0
1:      subcc   %o0, 0x10, %o0
        add     %o0, %o0, %o1
        sta     %g0, [%o0] ASI_M_DATAC_TAG
        bne     1b
         sta    %g0, [%o1] ASI_M_TXTC_TAG
        retl
         nop
#else
...


rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
