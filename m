From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 30 Nov 2015 15:48:34 +0000
Subject: Re: [PATCH] mailbox: constify mbox_chan_ops structure
Message-Id: <CABb+yY2G5p_-aHVXfP6TP0tKhVgWyUbdFkkR4YSfm9fF_kE7FQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1448801402-27540-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1448801402-27540-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Nov 29, 2015 at 6:20 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> This mbox_chan_ops structure is never modified, so declare it as const,
> like all the other mbox_chan_ops structures.
>
> Done with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
Applied, Thanks.
