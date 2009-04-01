From: Henne <henne@nachtwindheim.de>
Date: Wed, 01 Apr 2009 11:15:16 +0000
Subject: TODO-List: removing/updating old tasks
Message-Id: <49D34CC4.4000509@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi there,

I looked through the TODO-List and noticed that some task are out of date:

This one refers to the OSS maestro3 driver which was removed 10-2006, but the can still exist for 
a) drivers for multiple devices on one bus (e.g. USB-Controllers as multiple PCI-devices) and
b) drivers for multiple devices on different busses (e.g. OPL3 or es18xx as ISAPNP-Cards and PNPBIOS-devices) 

<cite>
- drivers that try to find multiple boards, possibly successfully allocating 

    *

      for the first ones, then failing for, lets say, the third board, then it
      just returns failure for init_module, the module is unloaded but the resources
      remain allocated... in these cases we need to rollback the allocations,
      freeing it before returning from init_module or equivalent. 

- sound/oss/maestro3.c doesn't pci_free_consistent any buffers if 

    *

      one allocation fails, but others succeeded. 

</cite>

Here's another one that seems outdates, since CONFIG_ISAPNP_MODULE can only be found in
include/linux/pnp.h, but nowhere else, which tells me that every efford to build ISAPNP
as a module died out long ago.
 
<cite>
From: Jeff Garzik 

> It is highly recommended to always compile with CONFIG_ISAPNP=y due
> to these differences.  If you grep around for CONFIG_ISAPNP versus
> CONFIG_ISAPNP_MODULE, you'll see that many drivers are woefully_
> unprepared for isapnp support compiled as a module. 

Yep..  grep for CONFIG_ISAPNP, look at the code, and evaluate it to make
sure that isapnp works for that drivers regardless of whether CONFIG_ISAPNP -or-
CONFIG_ISAPNP_MODULE is defined. 
</cite>

So I would reformulate the first task and remove the second task and
maybe the last CONFIG_ISAPNP_MODULE from pnp.h.
Any objections?


Henrik Kretzschmar

