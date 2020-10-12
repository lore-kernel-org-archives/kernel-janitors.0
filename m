From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 12 Oct 2020 06:52:43 +0000
Subject: Re: [PATCH 2/8] ALSA: hda: use semicolons rather than commas to separate statements
Message-Id: <s5ho8l8q6kk.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1602407979-29038-1-git-send-email-Julia.Lawall@inria.fr>
 <1602407979-29038-3-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1602407979-29038-3-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: alsa-devel@alsa-project.org, Valdis =?UTF-8?B?S2zEk3RuaWVrcw==?= <valdis.kletnieks@vt.edu>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>

On Sun, 11 Oct 2020 11:19:33 +0200,
Julia Lawall wrote:
> 
> Replace commas with semicolons.  What is done is essentially described by
> the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):
> 
> // <smpl>
> @@ expression e1,e2; @@
> e1
> -,
> +;
> e2
> ... when any
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Applied now.  Thanks.


Takashi
