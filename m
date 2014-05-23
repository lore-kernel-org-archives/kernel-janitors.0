From: Greg KH <gregkh@linuxfoundation.org>
Date: Fri, 23 May 2014 12:09:15 +0000
Subject: Re: [PATCH] staging: lustre: lnet: klnds: Remove prohibited space in socklnd.c
Message-Id: <20140523120915.GA7924@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400711013-15957-1-git-send-email-massa.nomura@gmail.com>
In-Reply-To: <1400711013-15957-1-git-send-email-massa.nomura@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Masaru Nomura <massa.nomura@gmail.com>
Cc: andreas.dilger@intel.com, green@linuxhacker.ru, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 21, 2014 at 11:23:33PM +0100, Masaru Nomura wrote:
> Remove prohibited space between function name and open parenthesis
> to meet kernel coding style. Also, fix indenting due to changes.
> 
> Signed-off-by: Masaru Nomura <massa.nomura@gmail.com>
> ---
>  .../staging/lustre/lnet/klnds/socklnd/socklnd.c    |  230 ++++++++++----------
>  1 file changed, 116 insertions(+), 114 deletions(-)

This patch doesn't apply either, please refresh and resend.

thanks,

greg k-h
