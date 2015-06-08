From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 08 Jun 2015 08:39:40 +0000
Subject: Re: [5/9] wl1251: drop unneeded goto
Message-Id: <20150608083940.110201406B9@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1432846944-7122-6-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org


> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Delete jump to a label on the next line, when that label is not
> used elsewhere.
> 
> A simplified version of the semantic patch that makes this change is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r@
> identifier l;
> @@
> 
> -if (...) goto l;
> -l:
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
