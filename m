From: Joe Perches <joe@perches.com>
Date: Tue, 02 Oct 2012 13:54:13 +0000
Subject: Re: [driver-core:driver-core-next 4/11] include/linux/device.h:925:12: error: 'dev_vprintk_emit' def
Message-Id: <1349186053.7740.36.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121002104127.GA31577@localhost>
In-Reply-To: <20121002104127.GA31577@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2012-10-02 at 18:41 +0800, Fengguang Wu wrote:
> Hi Joe,

Hi Fengguang.

> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-next
> head:   e0f21e6d52cc245e7d4f7e02ca4b7b6571660ec2
> commit: 05e4e5b87aab74f994acf9dd4bed4a8f1367cd09 [4/11] dev: Add dev_vprintk_emit and dev_printk_emit
> config: sh-allnoconfig
> 
> All error/warnings:
> 
> include/linux/device.h:925:12: error: 'dev_vprintk_emit' defined but not used [-Werror=unused-function]
> cc1: all warnings being treated as errors

My fault, sorry.  It was fixed in a later commit.

commit 0a18b05043acc01d1d6a4bac459e62c79628881c
Author: Joe Perches <joe@perches.com>
Date:   Tue Sep 25 18:19:57 2012 -0700

    device.h: Add missing inline to #ifndef CONFIG_PRINTK dev_vprintk_emit



