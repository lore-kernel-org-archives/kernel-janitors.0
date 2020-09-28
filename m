From: David Lechner <david@lechnology.com>
Date: Mon, 28 Sep 2020 15:37:28 +0000
Subject: Re: [PATCH 15/18] counter: use semicolons rather than commas to separate statements
Message-Id: <be1d59c5-fd0c-821e-0357-441c26c3d16c@lechnology.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <1601233948-11629-16-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-16-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org

On 9/27/20 2:12 PM, Julia Lawall wrote:
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
> 
> ---
Reviewed-by: David Lechner <david@lechnology.com>
