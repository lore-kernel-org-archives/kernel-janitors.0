From: David Miller <davem@davemloft.net>
Date: Wed, 03 Jul 2019 18:35:52 +0000
Subject: Re: [PATCH] qlcnic: remove redundant assignment to variable err
Message-Id: <20190703.113552.1318260149256951249.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190703083214.20542-1-colin.king@canonical.com>
In-Reply-To: <20190703083214.20542-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: shshaikh@marvell.com, manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  3 Jul 2019 09:32:14 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never
> read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
