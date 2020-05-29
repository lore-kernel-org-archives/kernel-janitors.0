From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 29 May 2020 08:45:08 +0000
Subject: Re: [PATCH] edac: Fix reference count leak in edac_device_register_sysfs_main_kobj()
Message-Id: <77d6b960-aedc-c7ce-5df9-f3653bfd500a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Qiushi Wu <wu000273@umn.edu>, linux-edac@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Doug Thompson <dougthompson@xmission.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, James Morse <james.morse@arm.com>, Kangjie Lu <kjlu@umn.edu>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Richter <rrichter@marvell.com>, Tony Luck <tony.luck@intel.com>

> object_init_and_add() should be handled when it return an error,
> because kobject_init_and_add() takes reference even when it fails.

I find this wording approach improvable.


> Previous commit "b8eb718348b8" fixed a similar problem.

Would you like to indicate with such information (according to
the topic “net-sysfs: Fix reference count leak in rx|netdev_queue_add_kobject”)
that your issue was detected also with the help of the kernel fuzzing
tool “syzkaller”?


How do you think about to add an imperative wording to the change description?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=b0c3ba31be3e45a130e13b278cf3b90f69bda6f6#n151


Will it be helpful to combine this update step together with
“edac: Fix reference count leak in edac_pci_main_kobj_setup”
into a small patch series?
https://lore.kernel.org/lkml/20200528202238.18078-1-wu000273@umn.edu/
https://lore.kernel.org/patchwork/patch/1249351/

Regards,
Markus
