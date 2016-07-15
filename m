From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Jul 2016 19:23:48 +0000
Subject: [bug report] x86/sfi: Enable enumeration of SD devices
Message-Id: <20160715192348.GA6521@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Andy Shevchenko,

The patch 05f310e26fe9: "x86/sfi: Enable enumeration of SD devices"
from Jul 12, 2016, leads to the following static checker warning:

	arch/x86/platform/intel-mid/sfi.c:427 sfi_handle_sd_dev()
	warn: 'pdata' isn't an ERR_PTR

arch/x86/platform/intel-mid/sfi.c
   416          memset(&sd_info, 0, sizeof(sd_info));
   417          strncpy(sd_info.name, pentry->name, SFI_NAME_LEN);
   418          sd_info.bus_num = pentry->host_num;
   419          sd_info.max_clk = pentry->max_freq;
   420          sd_info.addr = pentry->addr;
   421          pr_debug("SD bus = %d, name = %16.16s, max_clk = %d, addr = 0x%x\n",
   422                   sd_info.bus_num,
   423                   sd_info.name,
   424                   sd_info.max_clk,
   425                   sd_info.addr);
   426          pdata = intel_mid_sfi_get_pdata(dev, &sd_info);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is a macro calling a function pointer.  None of the functions
return error pointers.  Some return NULL on error but some return NULL
on success.

   427          if (IS_ERR(pdata))
   428                  return;
   429  
   430          /* Nothing we can do with this for now */
   431          sd_info.platform_data = pdata;
   432  

regards,
dan carpenter
