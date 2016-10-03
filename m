From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 03 Oct 2016 09:11:22 +0000
Subject: Re: [PATCH 1/4] virtio_blk: Use kmalloc_array() in init_vq()
Message-Id: <CAJSP0QUcGXsNgcEyi-PPpPL2fJz5NvLuJ9M_WBfN6wx_szHARA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net> <02054675-8395-ac81-6863-e3a5cbfc9032@users.sourceforge.net>
 <7a8dd874-3700-1445-2143-2a604cd043ab@users.sourceforge.net>
In-Reply-To: <7a8dd874-3700-1445-2143-2a604cd043ab@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Linux Virtualization <virtualization@lists.linux-foundation.org>, "Michael S. Tsirkin" <mst@redhat.com>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Sep 13, 2016 at 1:12 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 13 Sep 2016 11:32:22 +0200
>
> Multiplications for the size determination of memory allocations
> indicated that array data structures should be processed.
> Thus use the corresponding function "kmalloc_array".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/block/virtio_blk.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
