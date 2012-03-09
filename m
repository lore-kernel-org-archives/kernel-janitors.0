From: Chris Ball <cjb@laptop.org>
Date: Fri, 09 Mar 2012 04:27:41 +0000
Subject: Re: [PATCH] drivers/mmc/host/sdhci-s3c.c: use devm_ functions
Message-Id: <m2k42uqtz6.fsf@bob.laptop.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1329596019-19822-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1329596019-19822-1-git-send-email-Julia.Lawall@lip6.fr> (Julia
	Lawall's message of "Sat, 18 Feb 2012 21:13:39 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Ben Dooks <ben-linux@fluff.org>, kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Julia,

On Sat, Feb 18 2012, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> The various devm_ functions allocate memory that is released when a driver
> detaches.  This patch uses these functions for data that is allocated in
> the probe function of a platform device and is only freed in the remove
> function.
>
> By using devm_ioremap, it also removes a potential memory leak, because
> there was no call to iounmap in the probe function.
>
> The call to platform_get_resource was moved just to make it closer to the
> place where its result it used.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Thanks very much, pushed to mmc-next for 3.4.

- Chris.
-- 
Chris Ball   <cjb@laptop.org>   <http://printf.net/>
One Laptop Per Child
