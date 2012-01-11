From: Joe Perches <joe@perches.com>
Date: Wed, 11 Jan 2012 23:58:00 +0000
Subject: Re: [PATCH v2 15/17] Staging: quickstart: Use pr_err and pr_info for logs
Message-Id: <1326326280.7886.6.camel@joe2Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326320574-11220-17-git-send-email-szymon@janc.net.pl>
In-Reply-To: <1326320574-11220-17-git-send-email-szymon@janc.net.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 2012-01-11 at 23:22 +0100, Szymon Janc wrote:
> Signed-off-by: Szymon Janc <szymon@janc.net.pl>

trivia:

> diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
[]
> @@ -25,6 +25,8 @@
[]
> +#define pr_fmt(fmt) KBUILD_MODNAME": " fmt

Add a space please between KBUILD_MODNAME and the quoted string.
#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

[]
> @@ -207,9 +209,8 @@ static int quickstart_acpi_ghid(struct quickstart_acpi *quickstart)
>  		quickstart->button->id = *(uint64_t *)buffer.pointer;
>  		break;
>  	default:
> -		printk(KERN_ERR "quickstart: %s GHID method returned buffer "
> -				"of unexpected length %u\n",
> -				quickstart->button->name, buffer.length);
> +		pr_err("%s GHID method returned buffer of unexpected length %u"
> +				"\n", quickstart->button->name, buffer.length);

Please try not to break format strings into multiple bits.
It's very error prone and can make it harder to grep.
It's OK to have the line with the format exceed 80 chars.

		pr_err("%s GHID method returned buffer of unexpected length %u\n",
		       quickstart->button->name, buffer.length);


