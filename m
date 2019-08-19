From: Paul Burton <paul.burton@mips.com>
Date: Mon, 19 Aug 2019 21:17:06 +0000
Subject: Re: [PATCH] MIPS: Octeon: Fix a typo in #define OCTOEN_SERIAL_LEN
Message-Id: <MWHPR2201MB1277135EF8A78FC49EACA957C1A80@MWHPR2201MB1277.namprd22.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190818155124.3750-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190818155124.3750-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "ralf@linux-mips.org" <ralf@linux-mips.org>, Paul Burton <pburton@wavecomp.com>, "jhogan@kernel.org" <jhogan@kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>

Hello,

Christophe JAILLET wrote:
> It should be OCTEON_SERIAL_LEN.
> Update the #define and use it accordingly

Applied to mips-next.

> commit 3becd97e032a
> https://git.kernel.org/mips/c/3becd97e032a
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
