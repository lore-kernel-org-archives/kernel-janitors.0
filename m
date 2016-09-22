From: Greg KH <gregkh@linuxfoundation.org>
Date: Thu, 22 Sep 2016 07:20:51 +0000
Subject: Re: [PATCH 03/11] staging: dgnc: missing NULL check for ioremap in
Message-Id: <20160922072051.GB4333@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160922052138.GA27193@SEL-JYOUN-D1>
In-Reply-To: <20160922052138.GA27193@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>
Cc: lidza.louina@gmail.com, devel@driverdev.osuosl.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 22, 2016 at 02:21:38PM +0900, Daeseok Youn wrote:
> The ioremap() function can be failed, so it need to have error
> handling in dgnc_do_remap(). And also the return type of
> dgnc_do_remap() should be changed from "void" to "int"
> 
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> ---
>  drivers/staging/dgnc/dgnc_driver.c | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)

Again, odd subject line, it seems to have been cut off.
