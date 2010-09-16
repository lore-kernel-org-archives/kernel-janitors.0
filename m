From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu, 16 Sep 2010 12:59:08 +0000
Subject: Re: [PATCH 04/14] staging: ath6kl: check return code of get_user
Message-Id: <20100916125908.GA4491@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283711550-7246-1-git-send-email-segooon@gmail.com>
 <35B17FE5076C7040809188FBE7913F983F2381DB98@SC1EXMB-MBCL.global.atheros.com>
In-Reply-To: <35B17FE5076C7040809188FBE7913F983F2381DB98@SC1EXMB-MBCL.global.atheros.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vipin Mehta <Vipin.Mehta@Atheros.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Sep 08, 2010 at 22:59 -0700, Vipin Mehta wrote:
> Hi Vasiliy,
>     You mentioned in your email that you were unable to compile the driver. Can you pls reproduce a log of the errors you observed?

vasya@albatros:~/linux$ make allyesconfig && make drivers/staging/ath6kl/
  HOSTCC  scripts/kconfig/conf.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf --allyesconfig arch/x86/Kconfig
#
# configuration written to .config
#
scripts/kconfig/conf --silentoldconfig arch/x86/Kconfig
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  UPD     include/generated/utsrelease.h
  CC      kernel/bounds.s
  GEN     include/generated/bounds.h
  CC      arch/x86/kernel/asm-offsets.s
  GEN     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh
  LD      drivers/staging/ath6kl/built-in.o

I think there should be more CC ath6kl/*.o lines :)


Thanks,
-- 
Vasiliy
