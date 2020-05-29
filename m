From: Borislav Petkov <bp@alien8.de>
Date: Fri, 29 May 2020 09:08:24 +0000
Subject: Re: [PATCH] edac: Fix reference count leak in edac_device_register_sysfs_main_kobj()
Message-Id: <20200529090824.GB9011@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <77d6b960-aedc-c7ce-5df9-f3653bfd500a@web.de>
In-Reply-To: <77d6b960-aedc-c7ce-5df9-f3653bfd500a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Qiushi Wu <wu000273@umn.edu>
Cc: linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Doug Thompson <dougthompson@xmission.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, James Morse <james.morse@arm.com>, Kangjie Lu <kjlu@umn.edu>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Richter <rrichter@marvell.com>, Tony Luck <tony.luck@intel.com>

On Fri, May 29, 2020 at 10:45:08AM +0200, Markus Elfring wrote:
> Would you like to indicate with such information (according to
> the topic “net-sysfs: Fix reference count leak in rx|netdev_queue_add_kobject”)
> that your issue was detected also with the help of the kernel fuzzing
> tool “syzkaller”?

There's no need for any commt reference - there's text over
kobject_init_and_add() explaining what you need to do when that function
fails.

> How do you think about to add an imperative wording to the change description?

His commit message is fine.

> Will it be helpful to combine this update step together with
> “edac: Fix reference count leak in edac_pci_main_kobj_setup”
> into a small patch series?

Just combine them into one patch.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
