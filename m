From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jul 2012 08:02:36 +0000
Subject: Re: [staging:staging-next 93/99] drivers/staging/sm7xxfb/sm7xxfb.c:1061:1: warning: data definition
Message-Id: <20120712080235.GD6056@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120712063936.GA8979@localhost>
In-Reply-To: <20120712063936.GA8979@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jul 12, 2012 at 01:18:10PM +0545, devendra.aaru wrote:
> On Thu, Jul 12, 2012 at 12:24 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> > vim +1061 drivers/staging/sm7xxfb/sm7xxfb.c
> >   1058          .driver.pm  = SM7XX_PM_OPS,
> >   1059  };
> >   1060
> >> 1061  module_pci_driver(smtcfb_driver);
> >   1062
> >   1063  MODULE_AUTHOR("Siliconmotion ");
> >   1064  MODULE_DESCRIPTION("Framebuffer driver for SMI Graphic Cards");
> >
> Hello,
>     I think CONFIG_PCI is set to n. so that we got this warnings.
>     In Kconfig of drivers/staging/sm7xxfb if we set depends on FB &&
> PCI solves this problem oneway.
>  But i m really not-sure about if this is the valid fix.
> 

Depends on PCI is correct.  Send a patch.

regards,
dan carpenter


