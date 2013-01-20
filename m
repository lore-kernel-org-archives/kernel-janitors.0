From: Sergei Shtylyov <sshtylyov@mvista.com>
Date: Sun, 20 Jan 2013 17:10:24 +0000
Subject: Re: [patch] usb: gadget: precedence bug in show_requests()
Message-Id: <50FC2500.7060205@mvista.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130120145044.GA32551@elgon.mountain>
In-Reply-To: <20130120145044.GA32551@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello.

On 20-01-2013 18:50, Dan Carpenter wrote:

> The mod operation has higher precedence than the divide

   They are of the same priority AFAIR, but that doesn't matter since these 
operations are executed left to right.

> but the intent
> was to divide first.  It's supposed to count through one time for RX
> and a second time for TX but instead of doing "0 1 2 0 1 2" it does
> "0 0 1 1 2 2".

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static checker stuff.  Untested.

> diff --git a/drivers/usb/chipidea/debug.c b/drivers/usb/chipidea/debug.c
> index 3bc244d..3cd223c 100644
> --- a/drivers/usb/chipidea/debug.c
> +++ b/drivers/usb/chipidea/debug.c
> @@ -709,7 +709,7 @@ static ssize_t show_requests(struct device *dev, struct device_attribute *attr,
>
>   			n += scnprintf(buf + n, PAGE_SIZE - n,
>   					"EP=%02i: TD=%08X %s\n",
> -					i % ci->hw_ep_max/2, (u32)req->dma,
> +					i % (ci->hw_ep_max / 2), (u32)req->dma,
>   					((i < ci->hw_ep_max/2) ? "RX" : "TX"));
>
>   			for (j = 0; j < qSize; j++)

WBR, Sergei

