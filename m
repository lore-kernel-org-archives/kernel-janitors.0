From: David Miller <davem@davemloft.net>
Date: Thu, 17 Oct 2013 19:54:28 +0000
Subject: Re: [patch] yam: remove a no-op in yam_ioctl()
Message-Id: <20131017.155428.869400734081327430.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131014123726.GA17034@mwanda>
In-Reply-To: <20131014123726.GA17034@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jpr@f6fbb.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 Oct 2013 15:46:15 +0300

> We overwrite the ->bitrate with the user supplied information on the
> next line.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
