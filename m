From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 11 May 2020 14:32:50 +0000
Subject: Re: [PATCH] vfio/pci: Fix memory leaks of eventfd context in vfio_pci_release()
Message-Id: <4b456734-f3f1-0e41-eb3b-ad1b06068dac@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Qian Cai <cai@lca.pw>, kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>

> Finished a qemu-kvm (-device vfio-pci,host=0001:01:00.0) triggers a few
> memory leaks after a while because vfio_pci_set_ctx_trigger_single()
> calls eventfd_ctx_fdget() without the matching eventfd_ctx_put() later.
> Fix it by calling eventfd_ctx_put() for those memory in
> vfio_pci_release() before vfio_device_release().
…

Will a wording fine-tuning become helpful for this change description?

Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
