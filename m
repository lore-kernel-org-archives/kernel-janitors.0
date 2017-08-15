From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 15 Aug 2017 06:23:07 +0000
Subject: Re: [PATCH] sound: emu8000: constify emu8000_ops
Message-Id: <s5h60dpjqno.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502730806-11637-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502730806-11637-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>

On Mon, 14 Aug 2017 19:13:26 +0200,
Julia Lawall wrote:
> 
> The structure emu8000_ops is only copied into another structure, so
> it can be const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks.


Takashi
