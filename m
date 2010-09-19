From: Dominik Brodowski <linux@dominikbrodowski.net>
Date: Sun, 19 Sep 2010 13:23:47 +0000
Subject: Re: [PATCH 07/14] pcmcia: ds: fix device_register() error handling
Message-Id: <20100919132347.GC5569@isilmar-3.linta.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284900898-24495-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1284900898-24495-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-pcmcia@lists.infradead.org, linux-kernel@vger.kernel.org

On Sun, Sep 19, 2010 at 04:54:58PM +0400, Vasiliy Kulikov wrote:
> If device_register() fails then call put_device().
> See comment to device_register.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>

Thanks,
	Dominik
