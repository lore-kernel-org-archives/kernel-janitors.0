From: Harini Katakam <harinikatakamlinux@gmail.com>
Date: Tue, 12 May 2015 18:40:17 +0000
Subject: Re: [patch -next] net: macb: OR vs AND typos
Message-Id: <CAFcVECKzDsO9kFD8R0NvAb0aQErpopQ7jf0DP35x3iGpZedRdw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150512181524.GE5672@mwanda>
In-Reply-To: <20150512181524.GE5672@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, Harini Katakam <harini.katakam@xilinx.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

On Tue, May 12, 2015 at 11:45 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> The bitwise tests are always true here because it uses '|' where '&' is
> intended.

Yes. I'm sorry about that.
It slipped through my testing as well because I was using an SoC with
jumbo support.

Regards,
Harini
