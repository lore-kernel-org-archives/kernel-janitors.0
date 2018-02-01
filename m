From: David Miller <davem@davemloft.net>
Date: Thu, 01 Feb 2018 19:54:44 +0000
Subject: Re: [PATCH] net: jme: remove unused initialization of 'rxdesc'
Message-Id: <20180201.145444.1341243515146963119.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180201165842.21906-1-colin.king@canonical.com>
In-Reply-To: <20180201165842.21906-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: cooldavid@cooldavid.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  1 Feb 2018 16:58:42 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer rxdesc is assigned a value that is never read, it is overwritten
> by a new assignment inside a while loop hence the initial assignment
> is redundant and can be removed.
> 
> Cleans up clang warning:
> drivers/net/ethernet/jme.c:1074:17: warning: Value stored to 'rxdesc'
> during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
