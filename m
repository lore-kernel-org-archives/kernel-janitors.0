From: walter harms <wharms@bfs.de>
Date: Fri, 30 Nov 2012 09:19:06 +0000
Subject: Re: [patch] staging: panel: pass correct lengths to keypad_send_key()
Message-Id: <50B87A0A.70808@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121129143835.GC12199@elgon.mountain>
In-Reply-To: <20121129143835.GC12199@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 29.11.2012 15:38, schrieb Dan Carpenter:
> We changed the sizeof() statements in 429ccf058b "staging:panel: Fixed
> coding conventions." so that they could fit inside the 80 character
> line limit.  Unfortunately, the new sizeof() statements are a smaller
> size.  This reverts it.
> 
> There isn't a nice way to stay within the 80 character limit without
> a re-work so I've gone over.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Untested.  The ->u.kbd.press_str and friends are funny data types.  I'm
> not sure how this code, works but the stuff we have is wrong and I've
> reverted it back to the original.
> 
> diff --git a/drivers/staging/panel/panel.c b/drivers/staging/panel/panel.c
> index d9fec5b..dca42ce 100644
> --- a/drivers/staging/panel/panel.c
> +++ b/drivers/staging/panel/panel.c
> @@ -1758,7 +1758,7 @@ static inline int input_state_high(struct logical_input *input)
>  				char *press_str = input->u.kbd.press_str;
>  				if (press_str[0])
>  					keypad_send_key(press_str,
> -							sizeof(press_str));
> +							sizeof(input->u.kbd.press_str));
>  			}
yep, this looks like the original intention.
NTL i would like to question the use of  press_str and friends.
Moving the if (press_str[0]) into keypad_send_key() seems
more sensible.

just my two cents,

re,
 wh


>  
>  			if (input->u.kbd.repeat_str[0]) {
> @@ -1766,7 +1766,7 @@ static inline int input_state_high(struct logical_input *input)
>  				if (input->high_timer >= KEYPAD_REP_START) {
>  					input->high_timer -= KEYPAD_REP_DELAY;
>  					keypad_send_key(repeat_str,
> -							sizeof(repeat_str));
> +							sizeof(input->u.kbd.repeat_str));
>  				}
>  				/* we will need to come back here soon */
>  				inputs_stable = 0;
> @@ -1805,7 +1805,7 @@ static inline void input_state_falling(struct logical_input *input)
>  				if (input->high_timer >= KEYPAD_REP_START)
>  					input->high_timer -= KEYPAD_REP_DELAY;
>  					keypad_send_key(repeat_str,
> -							sizeof(repeat_str));
> +							sizeof(input->u.kbd.repeat_str));
>  				/* we will need to come back here soon */
>  				inputs_stable = 0;
>  			}
> @@ -1824,7 +1824,7 @@ static inline void input_state_falling(struct logical_input *input)
>  			char *release_str = input->u.kbd.release_str;
>  			if (release_str[0])
>  				keypad_send_key(release_str,
> -						sizeof(release_str));
> +						sizeof(input->u.kbd.release_str));
>  		}
>  
>  		input->state = INPUT_ST_LOW;
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
