From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 30 May 2020 13:03:28 +0000
Subject: Re: [PATCH v5] virtio_vsock: Fix race condition in virtio_transport_recv_pkt()
Message-Id: <7972c279-19a7-3573-647c-749122c90b81@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200530123206.63335-1-justin.he@arm.com>
 <20200530123936.63480-1-justin.he@arm.com>
In-Reply-To: <20200530123936.63480-1-justin.he@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jia He <justin.he@arm.com>, kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Asias He <asias@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Kaly Xin <Kaly.Xin@arm.com>, Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>

> ---
> v5: sorry, MIME type in the previous commit message
>
>  net/vmw_vsock/virtio_transport_common.c | 8 ++++++++

Is it helpful to keep the patch version information complete here?
(Will another fine-tuning follow for the proposed change?)

Regards,
Markus
