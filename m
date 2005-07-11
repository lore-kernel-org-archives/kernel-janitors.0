From: walter harms <wharms@bfs.de>
Date: Mon, 11 Jul 2005 09:53:23 +0000
Subject: Re: [KJ] [PATCH] toshiba_acpi check kmalloc return value
Message-Id: <42D24193.5070604@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1121044844.3554.25.camel@localhost>
In-Reply-To: <1121044844.3554.25.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi Brandon,
keep it simple

tmp_buffer = kmalloc(count + 1, GFP_KERNEL);
if (!tmp_buffer)
	return -ENOMEM;

if ( copy_from_user(tmp_buffer, buffer, count) )
	result = -EFAULT;

tmp_buffer[count] = 0;
result = item->write_func(tmp_buffer, count);


just for the paranoid:
  should tmp_buffer be filled with \0 to avoid an information leak ?
  (schroedinger bug ?)

re,
	walter


Brandon Niemczyk wrote:
> Here it is with the stylistic fixes:
> 
> Signed-off-by: Brandon Niemczyk <brandon@snprogramming.com>
> 
> --- linux/drivers/acpi/toshiba_acpi.c.orig	2005-07-10 20:40:47.000000000 -0400
> +++ linux/drivers/acpi/toshiba_acpi.c	2005-07-10 23:00:43.000000000 -0400
> @@ -263,9 +263,11 @@ dispatch_write(struct file* file, const 
>  	 * destination so that sscanf can be used on it safely.
>  	 */
>  	tmp_buffer = kmalloc(count + 1, GFP_KERNEL);
> -	if (copy_from_user(tmp_buffer, buffer, count)) {
> +
> +	if (!tmp_buffer) 
> +		return -ENOMEM;
> +	else if (copy_from_user(tmp_buffer, buffer, count))
>  		result = -EFAULT;
> -	}
>  	else {
>  		tmp_buffer[count] = 0;
>  		result = item->write_func(tmp_buffer, count);
> 
> On Sun, 2005-07-10 at 19:32 -0700, randy_dunlap wrote:
>>On Sun, 10 Jul 2005 21:20:44 -0400 Brandon Niemczyk wrote:
>><snip>
>>Looks correct functionally, but needs a space after "if", like "if (".
>>
>>Oh, don't use braces for one-line "blocks".
>>Yes the copy_from_user() below does that too.  :(
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
