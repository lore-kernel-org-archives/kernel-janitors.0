From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Feb 2017 14:42:56 +0000
Subject: Re: [patch] pinctrl: intel: unlock on error in intel_config_set_pull()
Message-Id: <CACRpkda2EDT6TC96jBVBTmWjRg04TroVtuhb6w+Rw42V3wa=6A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207132008.GD31552@mwanda>
In-Reply-To: <20170207132008.GD31552@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Feb 7, 2017 at 2:20 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We need to unlock before returning -EINVAL on this error path.
>
> Fixes: 04cc058f0c52 ("pinctrl: intel: Add support for 1k additional pull-down")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied as obviously correct.

Yours,
Linus Walleij
