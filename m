From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Oct 2014 16:10:21 +0000
Subject: Re: [patch] ath9k: fix some debugfs output
Message-Id: <20141029161021.GH6890@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141029154805.GC5290@mwanda>
 <1414598919.11707.3.camel@perches.com>
In-Reply-To: <1414598919.11707.3.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, ath9k-devel@venema.h4ckr.net, kernel-janitors@vger.kernel.org

On Wed, Oct 29, 2014 at 09:08:39AM -0700, Joe Perches wrote:
> On Wed, 2014-10-29 at 18:48 +0300, Dan Carpenter wrote:
> > The right shift operation has higher precedence than the mask so we
> > left shift by "(i * 3)" and then immediately right shift by "(i * 3)"
> > then we mask.  It should be left shift, mask, and then right shift.
> > 
> Hey Dan.
> 
> My grep pattern doesn't like operations on the thing masked.
> 
> Did you find this by some tool or visual inspection via grep?
>

I wrote a Smatch check inspired by the i40e bug you found earlier.

regards,
dan carpenter 
