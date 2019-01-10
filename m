From: David Miller <davem@davemloft.net>
Date: Thu, 10 Jan 2019 14:31:31 +0000
Subject: Re: [PATCH] net: cxgb3: fix various indentation issues
Message-Id: <20190110.063131.806023297365839327.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190107233924.14076-1-colin.king@canonical.com>
In-Reply-To: <20190107233924.14076-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: arjun@chelsio.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon,  7 Jan 2019 23:39:24 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> There are handful of lines that have indentation issues, fix these.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Definitely makes the code impossible to properly audit.

Applied, thanks for fixing this.
