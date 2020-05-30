From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 30 May 2020 10:40:42 +0000
Subject: Re: [PATCH v3] virtio_vsock: Fix race condition in virtio_transport_recv_pkt()
Message-Id: <7edeff0b-2dd8-aeae-aa96-73c98d581ece@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jia He <justin.he@arm.com>, kvm@vger.kernel.org, netdev@vger.kernel.org, virtualization@lists.linux-foundation.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Kaly Xin <Kaly.Xin@arm.com>, Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>

> This fixes it by checking sk->sk_shutdown(suggested by Stefano) after
> lock_sock since sk->sk_shutdown is set to SHUTDOWN_MASK under the
> protection of lock_sock_nested.

How do you think about a wording variant like the following?

  Thus check the data structure member “sk_shutdown” (suggested by Stefano)
  after a call of the function “lock_sock” since this field is set to
  “SHUTDOWN_MASK” under the protection of “lock_sock_nested”.


Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
