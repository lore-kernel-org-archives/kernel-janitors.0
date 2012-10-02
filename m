From: Ohad Ben-Cohen <ohad@wizery.com>
Date: Tue, 02 Oct 2012 08:20:51 +0000
Subject: Re: [PATCH] remoteproc: Fix use of format specifyer
Message-Id: <CAK=WgbaNz_20AoKCsw53f5UiG+5AhvpnFV-aiJTMUpO5+u1bnA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1348846506-9670-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1348846506-9670-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Emil Goode <emilgoode@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Sep 28, 2012 at 5:35 PM, Emil Goode <emilgoode@gmail.com> wrote:
> The dma_addr_t type can be eigher u32 or u64 depending on
> the configuration. We should use a format specifyer for the
> larges type and explicitly cast to it.
>
> Sparse warnings:
> drivers/remoteproc/remoteproc_core.c:234:2: warning:
>         format =91%x=92 expects argument of type =91unsigned int=92,
>         but argument 6 has type =91dma_addr_t=92 [-Wformat]
>
> drivers/remoteproc/remoteproc_core.c:596:2: warning:
>         format =91%x=92 expects argument of type =91unsigned int=92,
>         but argument 5 has type =91dma_addr_t=92 [-Wformat]
>
> drivers/remoteproc/remoteproc_core.c:634:3:
>         warning: format =91%x=92 expects argument of type =91unsigned int=
=92,
>         but argument 5 has type =91dma_addr_t=92 [-Wformat]
>
> Signed-off-by: Emil Goode <emilgoode@gmail.com>

Applied (after fixing some commit log typos), thanks.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
