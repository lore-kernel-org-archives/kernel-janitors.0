From: Jason Wang <jasowang@redhat.com>
Date: Fri, 03 Feb 2017 02:57:29 +0000
Subject: Re: [PATCH 0/3] Virtio: Fine-tuning for two function implementations
Message-Id: <02d56f89-263e-3bda-9543-90e4c82df75b@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <61829748-a13d-42e4-8f6c-103ee5ca2c88@users.sourceforge.net>
In-Reply-To: <61829748-a13d-42e4-8f6c-103ee5ca2c88@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, virtualization@lists.linux-foundation.org, "Michael S. Tsirkin" <mst@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



On 2017年01月27日 05:44, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 26 Jan 2017 22:40:02 +0100
>
> A few update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (3):
>    virtio_pci: Use kcalloc() in vp_request_msix_vectors()
>    virtio_pci: Use kmalloc_array() in vp_request_msix_vectors()
>    virtio_ring: Use kmalloc_array() in alloc_indirect()
>
>   drivers/virtio/virtio_pci_common.c | 8 ++++----
>   drivers/virtio/virtio_ring.c       | 3 +--
>   2 files changed, 5 insertions(+), 6 deletions(-)
>

Acked-by: Jason Wang <jasowang@redhat.com>
