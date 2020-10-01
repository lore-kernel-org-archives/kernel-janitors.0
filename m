From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 01 Oct 2020 13:24:11 +0000
Subject: Re: [PATCH 05/18] bcma: use semicolons rather than commas to separate statements
Message-Id: <20201001132411.C6DF9C433FE@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-6-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-6-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, =?utf-8?q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org

Julia Lawall <Julia.Lawall@inria.fr> wrote:

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

Patch applied to wireless-drivers-next.git, thanks.

703314b2db3b bcma: use semicolons rather than commas to separate statements

-- 
https://patchwork.kernel.org/patch/11802381/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
