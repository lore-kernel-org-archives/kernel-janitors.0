From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Tue, 11 Dec 2007 13:22:22 +0000
Subject: Re: [PATCH 2/6] pcmcia/3c574_cs: Fix 'shadow variable' warning
Message-Id: <20071211132222.598d69ec@the-village.bc.nu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20071211043412.28518.40867.sendpatchset@thinktank.campus.ltu.se>
	<20071211043417.28518.39249.sendpatchset@thinktank.campus.ltu.se>
In-Reply-To: <20071211043417.28518.39249.sendpatchset@thinktank.campus.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Knutsson <ricknu-0@student.ltu.se>
Cc: linux-pcmcia@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 11 Dec 2007 05:32:43 +0100 (MET)
Richard Knutsson <ricknu-0@student.ltu.se> wrote:

> Fixing:
>   CHECK   drivers/net/pcmcia/3c574_cs.c
> drivers/net/pcmcia/3c574_cs.c:695:7: warning: symbol 'i' shadows an earlier one
> drivers/net/pcmcia/3c574_cs.c:636:6: originally declared here
> 
> Signed-off-by: Richard Knutson <ricknu-0@student.ltu.se>

For 2/3/4/5/6:

Acked-by: Alan Cox <alan@redhat.com>

Not sure I agree with the first patch though.
