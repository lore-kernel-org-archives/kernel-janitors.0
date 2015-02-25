From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Feb 2015 18:30:41 +0000
Subject: Re: [patch] hfsplus: add missing curly braces in hfsplus_delete_cat()
Message-Id: <20150225183041.GG5116@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150225133644.GW19745@mwanda>
 <CABikg9yk7BoL36FMW3sxXOY5MUb-TRDWB_Me3pAjMkpRAU-8ow@mail.gmail.com>
 <20150225171303.GF5116@mwanda>
 <CABikg9y_MC7gGm_qyTM1nQF0M+nmdt_c1qw+w4BAh-GQ6nTVbg@mail.gmail.com>
In-Reply-To: <CABikg9y_MC7gGm_qyTM1nQF0M+nmdt_c1qw+w4BAh-GQ6nTVbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergei Antonov <saproj@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vyacheslav Dubeyko <slava@dubeyko.com>, Sougata Santra <sougata@tuxera.com>, Christoph Hellwig <hch@lst.de>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Gar.  No, I don't care about "if (unlikely(err < 0)" or
"if (unlikely(err)) ".  Those seem like petty things to me so I'm not
getting involved with the argument between the two of you.  (My secret
real opinion, is that I doubt anyone benchmarked it so probably the
unlikely() annotations hurt readability for no good reason.  In other
words, "if (err)" is correct.)

regards,
dan carpenter

