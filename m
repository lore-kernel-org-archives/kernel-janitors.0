From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Thu, 07 Sep 2006 13:16:48 +0000
Subject: Re: [KJ] [PATCH] MIN/MAX cleanup
Message-Id: <9a8748490609070616t600e01fey87268b3b443eeaf5@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1157631741.2452.30.camel@amol.teneoris.com>
In-Reply-To: <1157631741.2452.30.camel@amol.teneoris.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 07/09/06, Amol Lad <amol@verismonetworks.com> wrote:
> Cleanups done to use min/max macros from kernel.h. Handcrafted MIN/MAX
> macros in some drivers are changed to use macros from kernel.h
>
> Tested for allmodconfig and allnoconfig configurations.
>

Please submit patches inline in the mail, not as attachment. It's a
pain to have to download attachment, then cut'n'paste instead of just
being able to reply when commenting on a patch.
See http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt


> -    if ((to_copy = MIN(strlen(clients[id].drvName), data_length-1))) {
> +    if ((to_copy = MIN(strlen(clients[id].drvName), (size_t) (data_length-1)))) {

Please don't put spaces after casts - just use
"(size_t)(data_length-1)". You do this in several places, I won't
point them all out.


>  #ifndef	MIN
> -#define MIN(a,b)	((a)>(b) ? (b) : (a))
> +#define MIN(a,b)	(min(a,b))
>  #endif

Why?   Why not simply replace all uses of "MIN" with "min"? there's
absolutely no reason to keep "MIN" around just implemented in terms of
"min" - just kill it.

>  #ifndef	MAX
> -#define MAX(a,b)	((a)>(b) ? (a) : (b))
> +#define MAX(a,b)    (max(a,b))
>  #endif

ditto.

>  #ifndef MAX
> -#define MAX(a,b) (((a) > (b)) ? (a) : (b))
> +#define MAX(a,b) (max(a,b))
>  #endif
>
>  #ifndef MIN
> -#define MIN(a,b) (((a) < (b)) ? (a) : (b))
> +#define MIN(a,b) (min(a,b))
>  #endif

ditto.

...

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
