From: David Miller <davem@davemloft.net>
Date: Thu, 02 Nov 2017 06:49:39 +0000
Subject: Re: [PATCH] wan: wanxl: remove redundant assignment to stat
Message-Id: <20171102.154939.1255946060288828393.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171101084945.14653-1-colin.king@canonical.com>
In-Reply-To: <20171101084945.14653-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: khc@pm.waw.pl, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  1 Nov 2017 08:49:45 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> stat set to zero and the value is never read, instead stat is
> set again in the do-loop. Hence the setting to zero is redundant
> and can be removed. Cleans up clang warning:
> 
> drivers/net/wan/wanxl.c:737:2: warning: Value stored to 'stat'
> is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
