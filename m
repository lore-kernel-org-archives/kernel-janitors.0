From: David Miller <davem@redhat.com>
Date: Tue, 12 Nov 2019 06:05:37 +0000
Subject: Re: [PATCH][next] cxgb4: remove redundant assignment to hdr_len
Message-Id: <20191111.220537.2202321483530744698.davem@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191111124413.68782-1-colin.king@canonical.com>
In-Reply-To: <20191111124413.68782-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: vishal@chelsio.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 11 Nov 2019 12:44:13 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable hdr_len is being assigned a value that is never read.
> The assignment is redundant and hence can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
