From: Rusty Russell <rusty@rustcorp.com.au>
Date: Tue, 18 Sep 2012 01:01:14 +0000
Subject: Re: [PATCH] drivers/virtio/virtio_pci.c: fix error return code
Message-Id: <878vc8qho5.fsf@rustcorp.com.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347903077-19906-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1347903077-19906-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: mst@redhat.com, virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Peter Senna Tschudin <peter.senna@gmail.com> writes:

> From: Peter Senna Tschudin <peter.senna@gmail.com>
>
> Convert a nonnegative error return code to a negative one, as returned
> elsewhere in the function.

Thanks!

Applied,
Rusty.
