From: David Miller <davem@davemloft.net>
Date: Thu, 11 May 2017 18:16:23 +0000
Subject: Re: [PATCH] ethernet: aquantia: remove redundant checks on error status
Message-Id: <20170511.141623.1200573443845531222.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170511172929.12951-1-colin.king@canonical.com>
In-Reply-To: <20170511172929.12951-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: pavel.belous@aquantia.com, Dmitrii.Tarakanov@aquantia.com, Alexander.Loktionov@aquantia.com, vomlehn@texas.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 11 May 2017 18:29:29 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The error status err is initialized as zero and then being checked
> several times to see if it is less than zero even when it has not
> been updated. Since these checks are redundant we can remove these
> as well as err and the error exit label err_exit.
> 
> Detected by CoverityScan, CID#1398313 and CID#1398306 ("Logically
> dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Please enhance your commit message to also explain that the functions
being called around these checks all return void, to make it clear
that this isn't an issue of the return values not being checked.

Thanks.
