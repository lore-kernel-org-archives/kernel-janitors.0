From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Feb 2015 10:10:23 +0000
Subject: Re: [PATCH 1/1] staging: ozwpan: Remove allocation from delaration line
Message-Id: <20150210101023.GF5206@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150210085503.GA10872@sloth>
In-Reply-To: <20150210085503.GA10872@sloth>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: Shigekatsu Tateno <shigekatsu.tateno@atmel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Feb 10, 2015 at 09:55:03AM +0100, Quentin Lambert wrote:
>  static struct oz_endpoint *oz_ep_alloc(int buffer_size, gfp_t mem_flags)
>  {
> -	struct oz_endpoint *ep > -		kzalloc(sizeof(struct oz_endpoint)+buffer_size, mem_flags);
> +	struct oz_endpoint *ep;
> +
> +	ep = kzalloc(sizeof(struct oz_endpoint)+buffer_size, mem_flags);
> +
>  	if (ep) {

Don't put a blank line between the function and the test.  They are part
of the same thing.

Also in a later patch, could you reverse the "if (ep) " to

	if (!ep)
		return NULL;

The original code is "success handling" not "error handling".

regards,
dan carpenter

