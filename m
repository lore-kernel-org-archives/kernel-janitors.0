From: Hagen Paul Pfeifer <hagen@jauu.net>
Date: Fri, 03 Nov 2006 10:50:47 +0000
Subject: Re: [KJ] [patch] net/tipc: sprintf/strcpy conversion
Message-Id: <20061103105047.GA16343@c3po.0xdef.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061101140624.GA7694@Chamillionaire.breakpoint.cc> <20061103000905.GA4957@martell.zuzino.mipt.ru>
In-Reply-To: <20061103000905.GA4957@martell.zuzino.mipt.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: kernel-janitors@lists.osdl.org, tipc-discussion@lists.sourceforge.net, netdev@vger.kernel.org

* Alexey Dobriyan | 2006-11-03 03:09:05 [+0300]:

>On Wed, Nov 01, 2006 at 03:06:24PM +0100, Florian Westphal wrote:
>> convert sprintf(a,b) to strcpy(a,b). Make tipc_bclink_name[] const.
>
>Ahhh, I missed the start of threads.
>
>Patch is useless because it changes one unbounded string function into
>another unbounded string function.

The discussion in this thread is really back-breaking!

1. To make tipc_bclink_name const there is absolutly no objection
2. Replace sprintf with strcpy

  a) First of all: If you _copy_ a string then use also strCPY()
     Thats a question of good style!

  b) If the compiler is smart enough, he realize that you want to copy 
     a string and replace the sprintf call with a
        pushl   %ebx
        call    strcpy
     Surprise - Surprise!

     Assumed you use gcc with -Os or -O2! Don't know how icc handle this 
     case. If you compile without optimization you save at least a
     "repz movsb %ds:(%esi),%es:(%edi)" instruction.

   c) Last but not least I read all the time this patch doesn't introduce
      bounds-checking. This isn't a argument because the author is aware of
      the destination length of the buffer. BTW: grep for (sprintf|strcpy) in
      /usr/src/linux and be surprised how unsecure the kernel is (thats
      ironical).

This patch is 100% OK!

HGN



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
