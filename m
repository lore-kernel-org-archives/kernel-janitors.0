From: "Maciej W. Rozycki" <macro@linux-mips.org>
Date: Wed, 01 Oct 2014 17:20:00 +0000
Subject: re: defxx: DEFEA's ESIC port I/O decoding cleanup
Message-Id: <alpine.LFD.2.11.1410011804460.21156@eddie.linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141001170107.GA11786@mwanda>
In-Reply-To: <20141001170107.GA11786@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 1 Oct 2014, Dan Carpenter wrote:

> The patch b98dfaf2b0a3: "defxx: DEFEA's ESIC port I/O decoding
> cleanup" from Sep 25, 2014, leads to the following static checker
> warning:
> 
> 	drivers/net/fddi/defxx.c:741 dfx_bus_init()
> 	warn: odd binop '0x3 & 0xfffffffffffffffc'
> 
> drivers/net/fddi/defxx.c
>    729                  val = PI_IO_CMP_M_SLOT;
>    730                  outb(val, base_addr + PI_ESIC_K_IO_ADD_MASK_0_1);
>    731                  val = (PI_ESIC_K_CSR_IO_LEN - 1) & ~3;
>    732                  outb(val, base_addr + PI_ESIC_K_IO_ADD_MASK_0_0);
>    733  
>    734                  val = 0;
>    735                  outb(val, base_addr + PI_ESIC_K_IO_ADD_CMP_1_1);
>    736                  val = PI_DEFEA_K_BURST_HOLDOFF;
>    737                  outb(val, base_addr + PI_ESIC_K_IO_ADD_CMP_1_0);
>    738  
>    739                  val = PI_IO_CMP_M_SLOT;
>    740                  outb(val, base_addr + PI_ESIC_K_IO_ADD_MASK_1_1);
>    741                  val = (PI_ESIC_K_BURST_HOLDOFF_LEN - 1) & ~3;
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This is just saying "val = 0" in a complicated way.  It's not clear what
> was intended...
> 
>    742                  outb(val, base_addr + PI_ESIC_K_IO_ADD_MASK_1_0);
>    743  

 This is self-documenting code, plus if PI_ESIC_K_BURST_HOLDOFF_LEN is 
ever set to something else to what it is now (please be aware this piece 
of hardware is not fully documented), then there'll be no need to review 
code throughout to update mask calculation.  See a similar calculation for 
PI_ESIC_K_CSR_IO_LEN and the board's other address decode register above.

 In this case the resulting mask comes out as all-zeros, meaning no 
address bits will be discarded in decoding, i.e. only a single address 
will match, which is exactly what is needed here.  This is a 32-bit 
register we don't want partial accesses to and hence the ~3 mask.

 I think your checker might be just a little bit too picky for this case, 
although I realise this pickiness may catch dumb mistakes elsewhere and 
save people trouble where a pair of disjoint mask is not really intended 
unlike here.  Thanks for the heads-up therefore, but this code is good and 
I plan to keep it like this. :)

  Maciej
