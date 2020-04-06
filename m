From: David Miller <davem@davemloft.net>
Date: Mon, 06 Apr 2020 17:22:35 +0000
Subject: Re: [PATCH] qed: remove redundant assignment to variable 'rc'
Message-Id: <20200406.102235.1829438991568501793.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200405134914.382716-1-colin.king@canonical.com>
In-Reply-To: <20200405134914.382716-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: aelior@marvell.com, GR-everest-linux-l2@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sun,  5 Apr 2020 14:49:14 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable 'rc' is being assigned a value that is never read
> and it is being updated later with a new value. The assignment
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
