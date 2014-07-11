From: Ian Abbott <abbotti@mev.co.uk>
Date: Fri, 11 Jul 2014 12:01:03 +0000
Subject: Re: [PATCH] drivers/staging/comedi/drivers/ni_atmio16d.c: remove pointless condition
Message-Id: <53BFD1FF.20309@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405073603-21468-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1405073603-21468-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org
Cc: gregkh@linuxfoundation.org, hsweeten@visionengravers.com, dcb314@hotmail.com

On 2014-07-11 11:13, Andrey Utkin wrote:
> The issue was discovered with static analysis and has two instances in
> this file. The code looks like this
> if (x < 65536000) {
> 	...
> } else if (x < 655360000) {
> 	...
> } else if (x <= 0xffffffff /* 6553600000 */) {
> 	...
> } else if (x <= 0xffffffff /* 65536000000 */) {
> 	...
> }
>
> The meaning of this block is to select appropriate clock frequency for
> interval timer basing on "x", which is amount of time.
>
> Notes:
> 1. That last condition matches previous one - that's the issue.
> 2. Decimal numbers in comments don't match hex numbers in expressions.
> But in first case the numbers have same order, while in the second case
> the hex number is the same, and the decimal one is 10 times bigger.
> 3. Actually type of "x" is "unsigned int", so its exact upper limit is
> not obviously known.
> 4. There's no "else" block.
>
> So it makes sense to make an "else" block from last "else if" case. The
> code inside the block seems correct for such usage.
>
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?idy871
> Reported-by: David Binderman <dcb314@hotmail.com>
> Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
> ---
>   drivers/staging/comedi/drivers/ni_atmio16d.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/comedi/drivers/ni_atmio16d.c b/drivers/staging/comedi/drivers/ni_atmio16d.c
> index 6ad27f5..895b56d 100644
> --- a/drivers/staging/comedi/drivers/ni_atmio16d.c
> +++ b/drivers/staging/comedi/drivers/ni_atmio16d.c
> @@ -338,7 +338,7 @@ static int atmio16d_ai_cmd(struct comedi_device *dev,
>   	} else if (cmd->convert_arg <= 0xffffffff /* 6553600000 */) {
>   		base_clock = CLOCK_10_KHZ;
>   		timer = cmd->convert_arg / 100000;
> -	} else if (cmd->convert_arg <= 0xffffffff /* 65536000000 */) {
> +	} else {
>   		base_clock = CLOCK_1_KHZ;
>   		timer = cmd->convert_arg / 1000000;
>   	}

Since 0xffffffff is the maximum value 'cmd->convert_arg' can be, the 
final else can be moved to the 'base_clock = CLOCK_10_KHZ' block and the 
'base_clock = CLOCK_1_KHZ' block can be removed altogether.

> @@ -406,7 +406,7 @@ static int atmio16d_ai_cmd(struct comedi_device *dev,
>   		} else if (cmd->scan_begin_arg < 0xffffffff /* 6553600000 */) {
>   			base_clock = CLOCK_10_KHZ;
>   			timer = cmd->scan_begin_arg / 100000;
> -		} else if (cmd->scan_begin_arg < 0xffffffff /* 65536000000 */) {
> +		} else {
>   			base_clock = CLOCK_1_KHZ;
>   			timer = cmd->scan_begin_arg / 1000000;
>   		}
>

Same here as well for 'cmd->scan_begin_arg'.  (And I think the original 
code should have used '<= 0xffffffff' rather than '< 0xffffffff'.)

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk>        )=-
-=( Tel: +44 (0)161 477 1898   FAX: +44 (0)161 718 3587         )=-
