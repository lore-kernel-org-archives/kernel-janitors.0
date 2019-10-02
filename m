From: Paul Burton <paul.burton@mips.com>
Date: Wed, 02 Oct 2019 22:54:08 +0000
Subject: Re: [PATCH] mips: Loongson: Fix the link time qualifier of 'serial_exit()'
Message-Id: <MWHPR2201MB12775BCFABEBAC5426879C41C19C0@MWHPR2201MB1277.namprd22.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190910035907.6430-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190910035907.6430-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "chenhc@lemote.com" <chenhc@lemote.com>, "ralf@linux-mips.org" <ralf@linux-mips.org>, Paul Burton <pburton@wavecomp.com>, "jhogan@kernel.org" <jhogan@kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>

Hello,

Christophe JAILLET wrote:
> 'exit' functions should be marked as __exit, not __init.

Applied to mips-fixes.

> commit 25b69a889b63
> https://git.kernel.org/mips/c/25b69a889b63
> 
> Fixes: 85cc028817ef ("mips: make loongsoon serial driver explicitly modular")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
