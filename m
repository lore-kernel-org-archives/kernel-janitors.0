From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Sun, 19 Sep 2010 15:02:09 +0000
Subject: Re: [PATCH 08/14] regulator: fix device_register() error handling
Message-Id: <20100919150209.GA18789@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284900901-24537-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1284900901-24537-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Liam Girdwood <lrg@slimlogic.co.uk>, Jani Nikula <ext-jani.1.nikula@nokia.com>, Linus Walleij <linus.walleij@stericsson.com>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org

On Sun, Sep 19, 2010 at 04:55:01PM +0400, Vasiliy Kulikov wrote:
> If device_register() fails then call put_device().
> See comment to device_register.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
