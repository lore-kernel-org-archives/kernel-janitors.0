From: David Miller <davem@davemloft.net>
Date: Mon, 27 Apr 2020 18:14:28 +0000
Subject: Re: [PATCH] net: rtnetlink: remove redundant assignment to variable err
Message-Id: <20200427.111428.371576843109032987.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200425112814.137857-1-colin.king@canonical.com>
In-Reply-To: <20200425112814.137857-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sat, 25 Apr 2020 12:28:14 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initializeed with a value that is never read
> and it is being updated later with a new value. The initialization
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
