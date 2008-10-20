From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 20 Oct 2008 16:57:18 +0000
Subject: Re: [PATCH] kernel: a few readability changes for nice values
Message-Id: <20081020165717.GH26184@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a91986340810162050n6cdfe617nf9aa90620cc79084@mail.gmail.com>
In-Reply-To: <a91986340810162050n6cdfe617nf9aa90620cc79084@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Oct 16, 2008 at 08:50:51PM -0700, Mike Steiner wrote:
> -	if (increment < -40)
> -		increment = -40;
> -	if (increment > 40)
> -		increment = 40;
> +	increment = CONSTRAIN_TO_RANGE(-40, increment, 40);

I'm sorry, I just don't see this as a 'readability improvement'.  I can
tell exactly what the original does; the second one looks complex.

Even writing it as:

	increment = max(min(increment, 40), -40)

doesn't really improve it.

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
