From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 02 Oct 2012 13:46:33 +0000
Subject: Re: [driver-core:driver-core-next 4/11] include/linux/device.h:925:12: error: 'dev_vprintk_emit' def
Message-Id: <20121002134633.GA616@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121002104127.GA31577@localhost>
In-Reply-To: <20121002104127.GA31577@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Oct 02, 2012 at 06:41:27PM +0800, Fengguang Wu wrote:
> Hi Joe,
> 
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

I can't duplicate this here, what is your .config?

And treating warnings as errors?  Good luck :)

greg k-h
