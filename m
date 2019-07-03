From: David Miller <davem@davemloft.net>
Date: Wed, 03 Jul 2019 20:53:28 +0000
Subject: Re: [PATCH][next] gve: fix -ENOMEM null check on a page allocation
Message-Id: <20190703.135328.756462803106168925.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190703165037.3041-1-colin.king@canonical.com>
In-Reply-To: <20190703165037.3041-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: csully@google.com, sagis@google.com, jonolson@google.com, willemb@google.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  3 Jul 2019 17:50:37 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the check to see if a page is allocated is incorrect
> and is checking if the pointer page is null, not *page as
> intended.  Fix this.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: f5cedc84a30d ("gve: Add transmit and receive support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
