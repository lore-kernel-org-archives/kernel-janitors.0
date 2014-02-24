From: Ohad Ben-Cohen <ohad@wizery.com>
Date: Mon, 24 Feb 2014 15:07:57 +0000
Subject: Re: [PATCH 24/29] drivers/remoteproc/da8xx_remoteproc.c: simplify use of devm_ioremap_resource
Message-Id: <CAK=WgbZum43gEHQ56EYX-WzsEtpGRJyWaZg-tUseuMxkuP9qxw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr> <1376471493-22215-25-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376471493-22215-25-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Aug 14, 2013 at 12:11 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Remove unneeded error handling on the result of a call to
> platform_get_resource when the value is passed to devm_ioremap_resource.
>
> Move the call to platform_get_resource adjacent to the call to
> devm_ioremap_resource to make the connection between them more clear.
>
...
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied and pushed to remoteproc-next, thanks!
