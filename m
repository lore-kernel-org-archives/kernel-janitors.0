From: Johan Hedberg <johan.hedberg@gmail.com>
Date: Fri, 28 Jul 2017 16:31:21 +0000
Subject: Re: [PATCH] Bluetooth: btrtl: Fix a error code in rtl_load_config()
Message-Id: <20170728163121.GA1151@x1c.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170728144111.chywkq2527puieo6@mwanda>
In-Reply-To: <20170728144111.chywkq2527puieo6@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Larry Finger <Larry.Finger@lwfinger.net>, Gustavo Padovan <gustavo@padovan.org>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Fri, Jul 28, 2017, Dan Carpenter wrote:
> We accidentally return success if the kmemdup() fails.  It results in
> a NULL dereference in the caller.
> 
> Fixes: 1110a2dbe698 ("Bluetooth: btrtl: Add RTL8822BE Bluetooth device")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to bluetooth-next. Thanks.

Johan
