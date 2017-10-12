From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 12 Oct 2017 14:40:59 +0000
Subject: Re: [PATCH] rtc: rv3029: Clean up error handling in rv3029_eeprom_write()
Message-Id: <20171012144059.2253ykdnm7qmrjhz@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170920214530.jusyjbnvkopsumrr@mwanda>
In-Reply-To: <20170920214530.jusyjbnvkopsumrr@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org

On 21/09/2017 at 00:45:30 +0300, Dan Carpenter wrote:
> We don't need both "ret" and "err" when they do the same thing.  All the
> functions called here return zero on success or negative error codes.
> It's more clear to return a literal zero at the end instead of
> "return ret;"
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
