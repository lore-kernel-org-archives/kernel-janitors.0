From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 16 Aug 2010 08:46:30 +0000
Subject: Re: [patch] dma/shdma: move dereference below the NULL check
Message-Id: <AANLkTikU6zTFhn7cTgTXD_DirG_i8=aqn6W8p-dd3F9_@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100814090145.GW645@bicker>
In-Reply-To: <20100814090145.GW645@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Paul Mundt <lethal@linux-sh.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Magnus Damm <damm@opensource.se>, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Aug 14, 2010 at 2:01 AM, Dan Carpenter <error27@gmail.com> wrote:
> "param" can be NULL here, so only dereference it after the check.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Thanks, applied as obviously correct.

--
Dan
