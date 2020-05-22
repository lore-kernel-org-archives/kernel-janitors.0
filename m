From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 22 May 2020 09:42:14 +0000
Subject: Re: [PATCH] vfio/pci: Avoid a null pointer dereference in vfio_config_free()
Message-Id: <74c0fac5-fe3f-e1f6-672d-3be4a8945426@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Qian Cai <cai@lca.pw>, kvm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>

> It is possible vfio_config_init() does not call vfio_cap_len(), and then
> vdev->msi_perm = NULL. Later, in vfio_config_free(), it could trigger a
> null-ptr-deref.

I suggest to add an imperative wording to the commit message.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id1143e1602d90ea71887d92363edd539d411de5#n151

Regards,
Markus
