From: Edward Cree <ecree@solarflare.com>
Date: Wed, 13 May 2020 09:39:43 +0000
Subject: Re: [PATCH][next] sfc: fix dereference of table before it is null checked
Message-Id: <680245f9-e26d-87e1-6e52-138302950e06@solarflare.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200512171355.221810-1-colin.king@canonical.com>
In-Reply-To: <20200512171355.221810-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Solarflare linux maintainers <linux-net-drivers@solarflare.com>, Martin Habets <mhabets@solarflare.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/05/2020 18:13, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently pointer table is being dereferenced on a null check of
> table->must_restore_filters before it is being null checked, leading
> to a potential null pointer dereference issue.  Fix this by null
> checking table before dereferencing it when checking for a null
> table->must_restore_filters.
>
> Addresses-Coverity: ("Dereference before null check")
> Fixes: e4fe938cff04 ("sfc: move 'must restore' flags out of ef10-specific nic_data")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Acked-by: Edward Cree <ecree@solarflare.com>
