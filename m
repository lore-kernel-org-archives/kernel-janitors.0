From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Date: Sun, 03 Jan 2016 00:58:18 +0000
Subject: Re: [PATCH] PowerCap: constify powercap_zone_ops and powercap_zone_constraint_ops structures
Message-Id: <2776851.fyhdtS7sMd@vostro.rjw.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1450907995-825-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1450907995-825-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On Wednesday, December 23, 2015 10:59:55 PM Julia Lawall wrote:
> The powercap_zone_ops and powercap_zone_constraint_ops structures are never
> modified, so declare them as const.
> 
> Most of the actual changes adjust indentation to accomodate the const
> keyword.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks!

