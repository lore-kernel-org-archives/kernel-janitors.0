From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 30 Apr 2016 11:35:30 +0000
Subject: Re: [patch] pinctrl: baytrail: fix some error handling in debugfs
Message-Id: <CACRpkdagyyeTTieGNNdT-O2pQAZBAnKtUkTBzAc_0Fdq_w-7aA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160427080835.GB22469@mwanda>
In-Reply-To: <20160427080835.GB22469@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Cristina Ciocan <cristina.ciocan@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Apr 27, 2016 at 10:08 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> We need to unlock before continuing.  Also the continue was accidentally
> left out on one error path which would lead to a NULL dereference.
>
> Fixes: 86e3ef812fe3 ('pinctrl: baytrail: Update gpio chip operations')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
