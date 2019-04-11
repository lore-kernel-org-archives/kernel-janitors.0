From: David Miller <davem@davemloft.net>
Date: Thu, 11 Apr 2019 21:02:03 +0000
Subject: Re: [PATCH] dns: remove redundant zero length namelen check
Message-Id: <20190411.140203.1367510571263899902.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190409125912.11600-1-colin.king@canonical.com>
In-Reply-To: <20190409125912.11600-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: dhowells@redhat.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue,  9 Apr 2019 13:59:12 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The zero namelen check is redundant as it has already been checked
> for zero at the start of the function.  Remove the redundant check.
> 
> Addresses-Coverity: ("Logically Dead Code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.

However it does look like two sets of semantics were considered.
In one case rejecting a zero namelen and in another having it
mean whatever the strings length is modulo the max of 256.
