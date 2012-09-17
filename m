From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 17 Sep 2012 12:18:31 +0000
Subject: Re: [PATCH v2 5/9] drivers/staging/gdm72xx/gdm_sdio.c: Remove useless kfree
Message-Id: <20120917121831.GA23117@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347610518-3099-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1347610518-3099-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: wharms@bfs.de, kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Fri, Sep 14, 2012 at 10:15:18AM +0200, Peter Senna Tschudin wrote:
> From: Peter Senna Tschudin <peter.senna@gmail.com>
> 
> Remove useless kfree() and clean up code related to the removal.

As I already applid your first patch, care to just send an incremental
patch that makes the change you did here?

thanks,

greg k-h
