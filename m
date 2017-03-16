From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 16 Mar 2017 22:01:58 +0000
Subject: Re: [PATCH] rtc: cpcap: kfreeing devm allocated memory
Message-Id: <20170316220158.c3e2l6gv3jrplsbx@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170314075319.GB6111@mwanda>
In-Reply-To: <20170314075319.GB6111@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Sebastian Reichel <sre@kernel.org>, rtc-linux@googlegroups.com, kernel-janitors@vger.kernel.org

On 14/03/2017 at 10:56:30 +0300, Dan Carpenter wrote:
> We shouldn't kfree(rtc) because is devm_ managed memory.  It leads to a
> double free.
> 
> Fixes: dd3bf50b35e3 ("rtc: cpcap: new rtc driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
