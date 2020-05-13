From: David Miller <davem@davemloft.net>
Date: Wed, 13 May 2020 22:20:28 +0000
Subject: Re: [PATCH][next] sfc: fix dereference of table before it is null checked
Message-Id: <20200513.152028.653894441720284438.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200512171355.221810-1-colin.king@canonical.com>
In-Reply-To: <20200512171355.221810-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: linux-net-drivers@solarflare.com, ecree@solarflare.com, mhabets@solarflare.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 12 May 2020 18:13:55 +0100

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

Applied, thanks.
