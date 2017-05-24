From: Manuel Lauss <manuel.lauss@gmail.com>
Date: Wed, 24 May 2017 17:42:41 +0000
Subject: Re: [PATCH] MIPS: Alchemy: Delete an error message for a failed memory allocation in alchemy_pci_pro
Message-Id: <CAOLZvyHq-7q0XxiBsyX3q0g0J3kjfFv4SU7amX1hpjRDyK+feQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6ebb5193-239f-5c34-c5f6-2be8a2fa79a5@users.sourceforge.net>
In-Reply-To: <6ebb5193-239f-5c34-c5f6-2be8a2fa79a5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, =?UTF-8?B?UmFsZiBCw6RjaGxl?= <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, May 24, 2017 at 6:42 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 24 May 2017 18:32:21 +0200
>
> Omit an extra message for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/mips/pci/pci-alchemy.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/mips/pci/pci-alchemy.c b/arch/mips/pci/pci-alchemy.c
> index e99ca7702d8a..a58c3290bd4e 100644
> --- a/arch/mips/pci/pci-alchemy.c
> +++ b/arch/mips/pci/pci-alchemy.c
> @@ -377,7 +377,6 @@ static int alchemy_pci_probe(struct platform_device *pdev)
>
>         ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>         if (!ctx) {
> -               dev_err(&pdev->dev, "no memory for pcictl context\n");
>                 ret = -ENOMEM;
>                 goto out;
>         }
> --
> 2.13.0

Why are you removing just this one dev_err()?  What issue are you
trying to address?

Manuel
