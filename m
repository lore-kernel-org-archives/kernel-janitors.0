From: David Miller <davem@davemloft.net>
Date: Thu, 30 Nov 2017 14:23:28 +0000
Subject: Re: [PATCH] atm: firestream: use setup_timer instead of init_timer
Message-Id: <20171130.092328.64557457095748544.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171124131345.31421-1-colin.king@canonical.com>
In-Reply-To: <20171124131345.31421-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: 3chas3@gmail.com, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Nov 2017 13:13:45 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Use setup_timer function instead of initializing timer with the
> function and data fields.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Likewise about setup_timer() no longer existing.
