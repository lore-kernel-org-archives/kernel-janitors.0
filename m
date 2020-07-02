From: David Miller <davem@davemloft.net>
Date: Thu, 02 Jul 2020 21:37:47 +0000
Subject: Re: [PATCH][next] xen-netfront: remove redundant assignment to variable 'act'
Message-Id: <20200702.143747.827041018046186172.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200702142223.48178-1-colin.king@canonical.com>
In-Reply-To: <20200702142223.48178-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org, kuba@kernel.org, xen-devel@lists.xenproject.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  2 Jul 2020 15:22:23 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable act is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.
