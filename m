From: David Miller <davem@davemloft.net>
Date: Tue, 02 Jul 2019 19:02:34 +0000
Subject: Re: [PATCH] nfc: st-nci: remove redundant assignment to variable r
Message-Id: <20190702.120234.492147786406295758.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190702131642.9865-1-colin.king@canonical.com>
In-Reply-To: <20190702131642.9865-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: tglx@linutronix.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue,  2 Jul 2019 14:16:42 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable r is being initialized with a value that is never
> read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
