From: Greg KH <gregkh@linuxfoundation.org>
Date: Thu, 22 Sep 2016 07:21:18 +0000
Subject: Re: [PATCH 04/11] staging: dgnc: kfree for board structure in
Message-Id: <20160922072118.GC4333@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160922052203.GA27209@SEL-JYOUN-D1>
In-Reply-To: <20160922052203.GA27209@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>
Cc: lidza.louina@gmail.com, devel@driverdev.osuosl.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 22, 2016 at 02:22:03PM +0900, Daeseok Youn wrote:
> The board structure should be freed when any function was failed
> in dgnc_found_board(). And the board strucure will be stored
> into dgnc_board array when the dgnc_found_board() function has no error.
> 
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> ---
>  drivers/staging/dgnc/dgnc_driver.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)

Another shortened subject line.

Please look at all of the subjects in this series, fix them up, and
resend.

thanks,

greg k-h
