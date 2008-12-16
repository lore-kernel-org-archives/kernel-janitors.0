From: Ben Dooks <ben-linux@fluff.org>
Date: Tue, 16 Dec 2008 15:58:22 +0000
Subject: Re: [PATCH] HID: avoid sparse warning in HID_COMPAT_LOAD_DRIVER
Message-Id: <20081216155822.GD12431@fluff.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4947a48f.08b6660a.34ca.ffffa1e8@mx.google.com>
In-Reply-To: <4947a48f.08b6660a.34ca.ffffa1e8@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: Jiri Kosina <jkosina@suse.cz>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Dec 16, 2008 at 01:31:31PM +0100, Hannes Eder wrote:
> Impact: include a prototype for the exported function in the macro
> 
> Fix about 20 of this warnings:
> 
>   drivers/hid/hid-a4tech.c:162:1: warning: symbol 'hid_compat_a4tech' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
>  include/linux/hid.h |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index 215035b..81aa84d 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -793,6 +793,8 @@ dbg_hid(const char *fmt, ...)
>  
>  #ifdef CONFIG_HID_COMPAT
>  #define HID_COMPAT_LOAD_DRIVER(name)	\
> +/* prototype to avoid sparse warning */	\
> +extern void hid_compat_##name(void);	\
>  void hid_compat_##name(void) { }	\

surely this could simply be changed to 'static void hid_compat_##name(void)'
if it is only being defined to be an empty function?

>  EXPORT_SYMBOL(hid_compat_##name)
>  #else
> -- 
> 1.5.6.3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
