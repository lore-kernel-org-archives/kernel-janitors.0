From: Bin Liu <b-liu@ti.com>
Date: Mon, 07 Jan 2019 20:21:34 +0000
Subject: Re: [PATCH] USB: musb: fix indentation issue on a return statement
Message-Id: <20190107202134.GE25910@uda0271908>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190104175941.9669-1-colin.king@canonical.com>
In-Reply-To: <20190104175941.9669-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,


On Fri, Jan 04, 2019 at 05:59:41PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> A return statement is indented one level too far, fix this by removing
> a tab.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/usb/musb/musb_host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

Regards,
-Bin.
