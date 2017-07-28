From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 28 Jul 2017 23:59:33 +0000
Subject: Re: [PATCH 1/3][staging-next] staging: pi433: Make a couple of functions static
Message-Id: <20170728235933.GA24607@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170718130400.25436-1-colin.king@canonical.com>
In-Reply-To: <20170718130400.25436-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Marcus Wolf <linux@Wolf-Entwicklungen.de>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jul 18, 2017 at 02:03:58PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The functions pi433_receive and pi433_tx_thread are local to the source
> and do not need to be in global scope, so make them static
> 
> Cleans up sparse warnings:
> symbol 'pi433_receive' was not declared. Should it be static?
> symbol 'pi433_tx_thread' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Marcus Wolf <linux@wolf-entwicklungen.de>

Only one of the patches in this series applied :(
