From: Dan Carpenter <error27@gmail.com>
Date: Wed, 28 Jul 2010 18:01:38 +0000
Subject: Re: [PATCH 01/10] arm: leds: check return value of request_region()
Message-Id: <20100728180138.GO26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280335127-23145-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280335127-23145-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, Jul 28, 2010 at 08:38:47PM +0400, Kulikov Vasiliy wrote:
> request_region() may fail, if so return -ENOMEM.

I think -EBUSY is more normal, although some people return -ENODEV or
-EIO.  But I would think -EBUSY is the right one.

regards,
dan carpenter


