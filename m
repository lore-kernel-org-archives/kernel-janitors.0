From: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, 27 Dec 2017 12:45:37 +0000
Subject: Re: [PATCH 1/3] staging: irda: fix type from "unsigned" to "unsigned int"
Message-Id: <20171227124537.GA2914@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171227055250.GA32718@MacBook-Air>
In-Reply-To: <20171227055250.GA32718@MacBook-Air>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JI-HUN KIM <jihuun.k@gmail.com>
Cc: samuel@sortiz.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, shreeya.patel23498@gmail.com, netdev@vger.kernel.org, davem@davemloft.net

On Tue, Dec 26, 2017 at 09:52:54PM -0800, JI-HUN KIM wrote:
> Clean up checkpatch warning:
> WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> 
> Signed-off-by: JI-HUN KIM <jihuun.k@gmail.com>
> ---
>  drivers/staging/irda/drivers/esi-sir.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Please read drivers/staging/irda/TODO

sorry.

greg k-h
