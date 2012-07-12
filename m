From: "devendra.aaru" <devendra.aaru@gmail.com>
Date: Thu, 12 Jul 2012 07:51:10 +0000
Subject: Re: [staging:staging-next 93/99] drivers/staging/sm7xxfb/sm7xxfb.c:1061:1: warning: data definition
Message-Id: <CAHdPZaONCBkC9yLSPtPXRWzTux+sHbJLYCHD6PEtd+3ngKLK6w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120712063936.GA8979@localhost>
In-Reply-To: <20120712063936.GA8979@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jul 12, 2012 at 12:24 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Devendra,
>
> There are new compile warnings show up in
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
> head:   d99b5ac65e7827f10ba60b1ea44d7bd041d58d1d
> commit: e6345c81b4eb20850ae4078ed3a8ff6eae584283 [93/99] staging/sm7xxfb: use module_pci_driver macro
>
> All warnings:
>
> drivers/staging/sm7xxfb/sm7xxfb.c:1061:1: warning: data definition has no type or storage class [enabled by default]
> drivers/staging/sm7xxfb/sm7xxfb.c:1061:1: warning: type defaults to 'int' in declaration of 'module_pci_driver' [-Wimplicit-int]
> drivers/staging/sm7xxfb/sm7xxfb.c:1061:1: warning: parameter names (without types) in function declaration [enabled by default]
> drivers/staging/sm7xxfb/sm7xxfb.c:765:19: warning: 'sm712vga_setup' defined but not used [-Wunused-function]
> drivers/staging/sm7xxfb/sm7xxfb.c:1053:26: warning: 'smtcfb_driver' defined but not used [-Wunused-variable]
>
> vim +1061 drivers/staging/sm7xxfb/sm7xxfb.c
>   1058          .driver.pm  = SM7XX_PM_OPS,
>   1059  };
>   1060
>> 1061  module_pci_driver(smtcfb_driver);
>   1062
>   1063  MODULE_AUTHOR("Siliconmotion ");
>   1064  MODULE_DESCRIPTION("Framebuffer driver for SMI Graphic Cards");
>
Hello,
    I think CONFIG_PCI is set to n. so that we got this warnings.
    In Kconfig of drivers/staging/sm7xxfb if we set depends on FB &&
PCI solves this problem oneway.
 But i m really not-sure about if this is the valid fix.

Thanks,

> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
