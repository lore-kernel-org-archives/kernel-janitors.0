From: Samuel Ortiz <sameo@linux.intel.com>
Date: Mon, 04 Jun 2018 04:16:47 +0000
Subject: Re: [PATCH] nfc: st21nfca: use setup_timer instead of init_timer
Message-Id: <20180604041647.GA8977@zurbaran.ger.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171124133741.32371-1-colin.king@canonical.com>
In-Reply-To: <20171124133741.32371-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

On Fri, Nov 24, 2017 at 01:37:41PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Use setup_timer function instead of initializing timer with the
> function and data fields.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/nfc/st21nfca/se.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
Applied to nfc-next, thanks.

Cheers,
Samuel.
