From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Oct 2014 15:18:20 +0000
Subject: Re: [patch] ipw2x00: shift wrap bugs setting ->rt_tsf
Message-Id: <20141027151819.GD6890@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141024081534.GA11140@mwanda>
 <1414143811.15751.14.camel@perches.com>
 <20141027095243.GA6890@mwanda>
 <1414422327.8884.8.camel@perches.com>
In-Reply-To: <1414422327.8884.8.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Stanislav Yakovlev <stas.yakovlev@gmail.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Gar...  I am stupid.  The original shift can't wrap.  I don't know what
I was thinking.  Sorry for the noise...

Thanks for checking me on this Joe.

regards,
dan carpenter

