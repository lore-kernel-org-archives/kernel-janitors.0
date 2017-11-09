From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Thu, 09 Nov 2017 18:34:22 +0000
Subject: Re: [PATCH] staging: pi433: fix missing break in switch statement.
Message-Id: <20171109183422.GA21978@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171109171955.10911-1-colin.king@canonical.com>
In-Reply-To: <20171109171955.10911-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcus Wolf <linux@Wolf-Entwicklungen.de>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 09, 2017 at 05:19:55PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The PI433_IOC_WR_RX_CFG case is missing a break and will fall through
> to the default case and errorenously return -EINVAL. Fix this by
> adding in missing break.

Folded and pushed...
