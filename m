From: David Miller <davem@davemloft.net>
Date: Mon, 14 Aug 2017 03:10:08 +0000
Subject: Re: [PATCH] virtio-net: make array guest_offloads static
Message-Id: <20170813.201008.318311086414456095.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170812214553.6073-1-colin.king@canonical.com>
In-Reply-To: <20170812214553.6073-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: mst@redhat.com, jasowang@redhat.com, virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sat, 12 Aug 2017 22:45:53 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The array guest_offloads is local to the source and does not need to
> be in global scope, so make it static. Also tweak formatting.
> 
> Cleans up sparse warnings:
> symbol 'guest_offloads' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
