From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 16 Aug 2012 23:30:55 +0000
Subject: Re: [driver-core:driver-core-next 23/25] ERROR: "device_pm_lock" [drivers/base/firmware_class.ko] un
Message-Id: <20120816233055.GA16115@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 17, 2012 at 07:22:51AM +0800, Fengguang Wu wrote:
> Hi Ming,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-next
> head:   b47a81dcc5a806efb6d970608299129771588289
> commit: 07646d9c0938d40b943c592dd1c6435ab24c4e2f [23/25] firmware loader: cache devices firmware during suspend/resume cycle
> config: x86_64-allmodconfig (attached as .config)
> 
> Build errors:
> 
> ERROR: "device_pm_lock" [drivers/base/firmware_class.ko] undefined!
> ERROR: "dpm_list" [drivers/base/firmware_class.ko] undefined!
> ERROR: "device_pm_unlock" [drivers/base/firmware_class.ko] undefined!
> 
> The errors also happen in the branch HEAD.

Ah, I think this happens when CONFIG_FW_LOADER=m, I have it set to =y in
my tree.

Ming, care to send me a patch to fix this up?

thanks,

greg k-h
