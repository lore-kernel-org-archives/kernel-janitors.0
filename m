From: David Miller <davem@davemloft.net>
Date: Thu, 16 Nov 2017 01:50:09 +0000
Subject: Re: [PATCH] qed: use kzalloc instead of kmalloc and memset
Message-Id: <20171116.105009.319510434232160095.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171115140320.14174-1-colin.king@canonical.com>
In-Reply-To: <20171115140320.14174-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: Ariel.Elior@cavium.com, everest-linux-l2@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed, 15 Nov 2017 14:03:20 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Replace kmalloc followed by a memset with kzalloc
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
