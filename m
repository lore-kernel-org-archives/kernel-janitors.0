From: "Luis R. Rodriguez" <mcgrof@gmail.com>
Date: Wed, 23 Feb 2011 18:40:50 +0000
Subject: Re: [patch 2/2] staging: ath6kl: buffer overflow in SEND_FRAME ioctl
Message-Id: <AANLkTi=hjM7fnSjz0M9Jj3_yhMTxBACoW-LhrxhToJET@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110220124953.GB1898@bicker>
In-Reply-To: <20110220124953.GB1898@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Feb 20, 2011 at 7:18 AM, Vipin Mehta <vmehta@atheros.com> wrote:

> Acked-by: Vipin Mehta <vipin.mehta@atheros.com>

Greg, Joe is not sure if these patches will be applied as-is and his
cleanup depends on code being static, I think they would be there is a
chance you might muck them a bit and this would break any cleanup
work. Will these patches be merged as-is, can Joe for example git am
these into his tree as-is and work off of the assumption that they
will reflect the top of staging-next + these patches?

  Luis
