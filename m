From: David Miller <davem@davemloft.net>
Date: Mon, 14 Aug 2017 03:11:13 +0000
Subject: Re: [PATCH] tap: make struct tap_fops static
Message-Id: <20170813.201113.1487220436668237112.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170812215231.6272-1-colin.king@canonical.com>
In-Reply-To: <20170812215231.6272-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: sainath.grandhi@intel.com, jasowang@redhat.com, rolf.neugebauer@docker.com, willemb@google.com, zhangshengju@cmss.chinamobile.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sat, 12 Aug 2017 22:52:31 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The structure tap_fops is local to the source and does not need to
> be in global scope, so make it static.
> 
> Cleans up sparse warning:
> symbol 'tap_fops' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
