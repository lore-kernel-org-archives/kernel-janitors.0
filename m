From: David Miller <davem@davemloft.net>
Date: Wed, 08 Nov 2017 04:46:52 +0000
Subject: Re: [PATCH] rtnetlink: fix missing size for IFLA_IF_NETNSID
Message-Id: <20171108.134652.824700033777729554.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171106150454.9623-1-colin.king@canonical.com>
In-Reply-To: <20171106150454.9623-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: dsahern@gmail.com, jbenc@redhat.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon,  6 Nov 2017 15:04:54 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The size for IFLA_IF_NETNSID is missing from the size calculation
> because the proceeding semicolon was not removed. Fix this by removing
> the semicolon.
> 
> Detected by CoverityScan, CID#1461135 ("Structurally dead code")
> 
> Fixes: 79e1ad148c84 ("rtnetlink: use netnsid to query interface")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thank you!
