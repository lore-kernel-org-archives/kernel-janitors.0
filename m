From: David Miller <davem@davemloft.net>
Date: Wed, 01 Nov 2017 03:10:04 +0000
Subject: Re: [PATCH] mkiss: remove redundant assignment of len to ax->mtu
Message-Id: <20171101.121004.1862713849418258600.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171029133025.6665-1-colin.king@canonical.com>
In-Reply-To: <20171029133025.6665-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: thomas@osterried.de, stephen@networkplumber.org, johannes.berg@intel.com, ralf@linux-mips.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sun, 29 Oct 2017 13:30:25 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable len is being assigned a value that is never read,
> hence the assignment is redundant and can be removed. Cleans
> up clang warning:
> 
> drivers/net/hamradio/mkiss.c:443:3: warning: Value stored to
> 'len' is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
