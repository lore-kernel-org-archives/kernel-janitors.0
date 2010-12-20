From: Dan Carpenter <error27@gmail.com>
Date: Mon, 20 Dec 2010 20:30:04 +0000
Subject: Re: [patch -next] power/gpio-charger: check for kzalloc() failure
Message-Id: <20101220203004.GB1936@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101220130856.GZ1936@bicker>
 <4D0FB6E6.2060608@metafoo.de>
In-Reply-To: <4D0FB6E6.2060608@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Anton Vorontsov <cbouatmailru@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Dec 20, 2010 at 09:04:54PM +0100, Lars-Peter Clausen wrote:
> This is now the 4th patch or so fixing this issue.

Haha.  No one can resist the easy one liners.  If I had had to kfree() a
single variable before returning then you can know for a fact I'd be too
lazy to fix it.  :P

regards,
dan carpenter

