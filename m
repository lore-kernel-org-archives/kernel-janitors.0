From: David Miller <davem@davemloft.net>
Date: Mon, 20 Dec 2010 18:43:21 +0000
Subject: Re: [patch -next] typhoon: memory corruption in
Message-Id: <20101220.104321.183048943.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101220130018.GX1936@bicker>
In-Reply-To: <20101220130018.GX1936@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: dave@thedillows.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Mon, 20 Dec 2010 16:00:18 +0300

> info->version only has space for 32 characters but my UTS_RELEASE is
> "2.6.37-rc6-next-20101217-05817-ge935fc8-dirty" so it doesn't fit.
> This is supposed to be the version of the driver, not the kernel
> version.  This driver doesn't have a version so lets just leave it
> blank.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks.
