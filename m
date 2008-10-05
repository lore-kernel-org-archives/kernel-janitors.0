From: walter harms <wharms@bfs.de>
Date: Sun, 05 Oct 2008 16:08:37 +0000
Subject: Re: [patch 001/001] input: fix read past array bounds
Message-Id: <48E8E685.2090800@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <BB078233-B65F-457C-A999-6C5B0CBF620B@roszkowski.org>
In-Reply-To: <BB078233-B65F-457C-A999-6C5B0CBF620B@roszkowski.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

nice catch,
just to improve readablility .... and reduce the change of an other error ...



 if (keycode < ARRAY_SIZE(key_map) )	
	keysym = key_map[keycode];
 else {
	      if (keycode >= KEY_BRL_DOT1 && keycode <= KEY_BRL_DOT8)
                        keysym = K(KT_BRL, keycode - KEY_BRL_DOT1 + 1);
               else
                       return;
	}



re,
 wh

Michal Roszkowski schrieb:
> 
> ---
> 
> Trivial fix for read past end of key_map[] when keycode = NR_KEYS.
> 
> --- linux-2.6.26.5/drivers/char/keyboard.c.orig    2008-10-05
> 15:51:09.000000000 +1030
> +++ linux-2.6.26.5/drivers/char/keyboard.c    2008-10-05
> 15:52:17.000000000 +1030
> @@ -1247,7 +1247,7 @@ static void kbd_keycode(unsigned int key
>         return;
>     }
> 
> -    if (keycode > NR_KEYS)
> +    if (keycode >= NR_KEYS)
>         if (keycode >= KEY_BRL_DOT1 && keycode <= KEY_BRL_DOT8)
>             keysym = K(KT_BRL, keycode - KEY_BRL_DOT1 + 1);
>         else
> 
> -- 
> To unsubscribe from this list: send the line "unsubscribe
> kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
