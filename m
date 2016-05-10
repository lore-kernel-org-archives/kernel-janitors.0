From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Tue, 10 May 2016 08:05:34 +0000
Subject: Re: [patch] phy: bcm-ns-usb2: checking the wrong variable
Message-Id: <CACna6ry62zaReDRTmnYjpXQijvEF9SAqWTRVr0dXQ7NqHujh0Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160510080133.GA4191@mwanda>
In-Reply-To: <20160510080133.GA4191@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 10 May 2016 at 10:01, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We intended to test "usb2->phy" here instead of "dev".
>
> Fixes: d3feb4067335 ('phy: bcm-ns-usb2: new driver for USB 2.0 PHY on Northstar')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks!
