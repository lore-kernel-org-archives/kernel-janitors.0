From: Julia Lawall <julia@diku.dk>
Date: Sun, 31 Aug 2008 20:35:55 +0000
Subject: code after return
Message-Id: <Pine.LNX.4.64.0808312231550.5157@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Below is a list of some places (file and function name) where there is 
some code after a return or goto.  Most of the time, the return is in a 
switch case, and the code after the return is a break.  I was wondering 
whether it would be useful to do something about these?  Or is the thought 
that it has no impact on the compiled code, so it doesn't matter?  Or is 
it actually desirable to have a break in every switch case, even if it 
amounts to dead code?

thanks,
julia


drivers/infiniband/hw/amso1100/c2_provider.c
c2_create_op
break after return

drivers/media/common/tuners/tuner-simple.c
simple_tuner_attach
break after return

fs/namespace.c
dup_mnt_ns
; after return

net/atm/lec.c
lec_arp_resolve
break after return

drivers/media/common/tuners/tda18271-fe.c
tda18271_attach
break after goto

drivers/media/common/tuners/mxl5007t.c
mxl5007t_attach
break after goto

drivers/dma/ioat_dma.c
ioat_dma_get_next_descriptor
break after return

drivers/infiniband/hw/nes/nes_verbs.c
nes_reg_user_mr
break after return

drivers/media/common/tuners/tda9887.c
tda9887_attach
break after return
----------------------
