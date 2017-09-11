From: Hans Verkuil <hansverk@cisco.com>
Date: Mon, 11 Sep 2017 07:21:25 +0000
Subject: Re: [PATCH] media: v4l2-pci-skeleton: Fix error handling path in 'skeleton_probe()'
Message-Id: <9b00047e-ce61-bd72-9bf2-c248a87eb013@cisco.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170910115322.15482-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170910115322.15482-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, mchehab@kernel.org, hans.verkuil@cisco.com, Julia.Lawall@lip6.fr
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 09/10/2017 01:53 PM, Christophe JAILLET wrote:
> If this memory allocation fails, we must release some resources, as
> already done in the code below and above.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Please repost and add the linux-media mailinglist to the CC list. That way it ends up
in our patchwork system and it won't be forgotten.

Regards,

	Hans

> ---
>  samples/v4l/v4l2-pci-skeleton.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/samples/v4l/v4l2-pci-skeleton.c b/samples/v4l/v4l2-pci-skeleton.c
> index 483e9bca9444..f520e3aef9c6 100644
> --- a/samples/v4l/v4l2-pci-skeleton.c
> +++ b/samples/v4l/v4l2-pci-skeleton.c
> @@ -772,8 +772,10 @@ static int skeleton_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  
>  	/* Allocate a new instance */
>  	skel = devm_kzalloc(&pdev->dev, sizeof(struct skeleton), GFP_KERNEL);
> -	if (!skel)
> -		return -ENOMEM;
> +	if (!skel) {
> +		ret = -ENOMEM;
> +		goto disable_pci;
> +	}
>  
>  	/* Allocate the interrupt */
>  	ret = devm_request_irq(&pdev->dev, pdev->irq,
> 

