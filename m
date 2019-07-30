From: Kees Cook <keescook@chromium.org>
Date: Tue, 30 Jul 2019 17:11:19 +0000
Subject: Re: [PATCH] randstruct: fix a bug in is_pure_ops_struct()
Message-Id: <201907301008.622218EE5@keescook>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190727155841.GA13586@host>
In-Reply-To: <20190727155841.GA13586@host>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joonwon Kang <kjw1627@gmail.com>
Cc: re.emese@gmail.com, kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Jul 28, 2019 at 12:58:41AM +0900, Joonwon Kang wrote:
> Before this, there were false negatives in the case where a struct
> contains other structs which contain only function pointers because
> of unreachable code in is_pure_ops_struct().

Ah, very true. Something like:

struct internal {
	void (*callback)(void);
};

struct wrapper {
	struct internal foo;
	void (*other_callback)(void);
};

would have not been detected as is_pure_ops_struct()?

How did you notice this? (Are there cases of this in the kernel?)

> Signed-off-by: Joonwon Kang <kjw1627@gmail.com>

Applied; thanks!

-Kees

> ---
>  scripts/gcc-plugins/randomize_layout_plugin.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/gcc-plugins/randomize_layout_plugin.c b/scripts/gcc-plugins/randomize_layout_plugin.c
> index 6d5bbd31db7f..a123282a4fcd 100644
> --- a/scripts/gcc-plugins/randomize_layout_plugin.c
> +++ b/scripts/gcc-plugins/randomize_layout_plugin.c
> @@ -443,13 +443,12 @@ static int is_pure_ops_struct(const_tree node)
>  		if (node = fieldtype)
>  			continue;
>  
> -		if (!is_fptr(fieldtype))
> -			return 0;
> -
> -		if (code != RECORD_TYPE && code != UNION_TYPE)
> -			continue;
> +		if (code = RECORD_TYPE || code = UNION_TYPE) {
> +			if (!is_pure_ops_struct(fieldtype))
> +				return 0;
> +		}
>  
> -		if (!is_pure_ops_struct(fieldtype))
> +		if (!is_fptr(fieldtype))
>  			return 0;
>  	}
>  
> -- 
> 2.17.1
> 

-- 
Kees Cook
