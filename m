From: Greg KH <gregkh@linuxfoundation.org>
Date: Mon, 09 May 2016 12:09:02 +0000
Subject: Re: [PATCH 2/3] staging: dgnc: remove useless assigned error value in
Message-Id: <20160509120902.GB5302@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160504051326.GA21217@certreview.com>
In-Reply-To: <20160504051326.GA21217@certreview.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>
Cc: devel@driverdev.osuosl.org, lidza.louina@gmail.com, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 04, 2016 at 02:13:26PM +0900, Daeseok Youn wrote:
> the result in dgnc_get_mstat() was initialized with -EIO but
> there are no use of EIO as a result in this function.
> 
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> ---
>  drivers/staging/dgnc/dgnc_tty.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Same Subject: problem here too, it doesn't make sense.
