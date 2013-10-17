From: David Miller <davem@davemloft.net>
Date: Thu, 17 Oct 2013 19:54:22 +0000
Subject: Re: [patch] yam: integer underflow in yam_ioctl()
Message-Id: <20131017.155422.1244517906591812199.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131014121931.GI6247@mwanda>
In-Reply-To: <20131014121931.GI6247@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jpr@f6fbb.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 Oct 2013 15:28:38 +0300

> We cap bitrate at YAM_MAXBITRATE in yam_ioctl(), but it could also be
> negative.  I don't know the impact of using a negative bitrate but let's
> prevent it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
