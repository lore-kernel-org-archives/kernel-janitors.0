From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 29 May 2020 05:45:38 +0000
Subject: Re: [PATCH] PCI: Fix reference count leak in pci_create_slot()
Message-Id: <4cf93f73-5bea-9748-f97b-99a6efe9ea20@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Qiushi Wu <wu000273@umn.edu>, linux-pci@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Chiang <achiang@hp.com>, Bjorn Helgaas <bhelgaas@google.com>, Jesse Barnes <jbarnes@virtuousgeek.org>, Kangjie Lu <kjlu@umn.edu>, Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>

Please add a prefix to the patch subject.


> kobject_init_and_add() takes reference even when it fails.

I suggest to extend this description another bit.
Which object is affected here?


> If this function returns an error, kobject_put() must be called to
> properly clean up the memory associated with the object.

Such a copy from the function description of this programming interface
can be helpful.


> Thus, when call of kobject_init_and_add() fail,

I propose to avoid the repetition of this condition.


> we should call kobject_put() instead of kfree().

How do you think about a wording variant like the following?

   Replace a call of the function “kfree” by “kobject_put”
   because of using kernel objects in the proper way.


> Previous commit "b8eb718348b8" fixed a similar problem.

I wonder if such information is really relevant for the commit message.

Regards,
Markus
