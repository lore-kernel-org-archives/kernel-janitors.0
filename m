From: Guenter Roeck <linux@roeck-us.net>
Date: Wed, 02 Apr 2014 14:08:59 +0000
Subject: Re: [PATCH 3/3] watchdog: via_wdt: replace del_timer by del_timer_sync
Message-Id: <533C19FB.8090302@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1396360159-16244-1-git-send-email-Julia.Lawall@lip6.fr> <1396360159-16244-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1396360159-16244-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Wim Van Sebroeck <wim@iguana.be>
Cc: kernel-janitors@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/01/2014 06:49 AM, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Use del_timer_sync to ensure that the timer is stopped on all CPUs before
> the driver exits.
>
> This change was suggested by Thomas Gleixner.
>
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @r@
> identifier i,t,ex;
> @@
> struct t i = { .remove = ex, };
>
> @@
> identifier r.ex;
> @@
> ex(...) {
>    <...
> - del_timer
> + del_timer_sync
>      (...)
>    ...>
> }
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


