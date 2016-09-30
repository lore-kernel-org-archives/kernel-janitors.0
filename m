From: "Ertman, David M" <david.m.ertman@intel.com>
Date: Fri, 30 Sep 2016 16:43:57 +0000
Subject: RE: [bug report] i40e: Fix kernel panic on enable/disable LLDP
Message-Id: <2B0E3F215D1AB84DA946C8BEE234CCC9451FB079@ORSMSX101.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160930104101.GA10918@mwanda>
In-Reply-To: <20160930104101.GA10918@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan,

Nice catch!  I have submitted a patch to fix this to intel-wired-lan@lists.osuosl.org and credited you with a Reported-by.  Thanks for letting me know!  

Thanks,
Dave Ertman

-----Original Message-----
From: Dan Carpenter [mailto:dan.carpenter@oracle.com] 
Sent: Friday, September 30, 2016 3:41 AM
To: Ertman, David M <david.m.ertman@intel.com>
Cc: intel-wired-lan@lists.osuosl.org; kernel-janitors@vger.kernel.org
Subject: [bug report] i40e: Fix kernel panic on enable/disable LLDP

Hello Dave Ertman,

The patch a036244c0686: "i40e: Fix kernel panic on enable/disable LLDP" from Aug 29, 2016, leads to the following static checker
warning:

	drivers/net/ethernet/intel/i40e/i40e_main.c:10958 i40e_probe()
	warn: odd binop '0x20000000 & 0x100000'

drivers/net/ethernet/intel/i40e/i40e_main.c
 10952          pci_set_drvdata(pdev, pf);
 10953          pci_save_state(pdev);
 10954  #ifdef CONFIG_I40E_DCB
 10955          err = i40e_init_pf_dcb(pf);
 10956          if (err) {
 10957                  dev_info(&pdev->dev, "DCB init failed %d, disabled\n", err);
 10958                  pf->flags &= ~(I40E_FLAG_DCB_CAPABLE & I40E_FLAG_DCB_ENABLED);

Should this be an | instead of an &?  The current code is a no-op.

 10959                  /* Continue without DCB enabled */
 10960          }
 10961  #endif /* CONFIG_I40E_DCB */

regards,
dan carpenter
