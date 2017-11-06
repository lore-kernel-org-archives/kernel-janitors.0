From: Samuel Ortiz <sameo@linux.intel.com>
Date: Mon, 06 Nov 2017 00:06:20 +0000
Subject: Re: [PATCH] NFC: fdp: make struct nci_ops static
Message-Id: <20171106000620.GD27831@zurbaran.ger.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171005094712.28627-1-colin.king@canonical.com>
In-Reply-To: <20171005094712.28627-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "David S . Miller" <davem@davemloft.net>, Stephen Hemminger <stephen@networkplumber.org>, Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 05, 2017 at 10:47:12AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The structure nci_ops is local to the source and does not need to
> be in global scope, so make it static.
> 
> Cleans up sparse warning:
> symbol 'nci_ops' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/nfc/fdp/fdp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
Applied as well, thanks.

Cheers,
Samuel.
