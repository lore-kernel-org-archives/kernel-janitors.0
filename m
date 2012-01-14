From: Szymon Janc <szymon@janc.net.pl>
Date: Sat, 14 Jan 2012 22:20:56 +0000
Subject: Re: [PATCH v2 15/17] Staging: quickstart: Use pr_err and pr_info for logs
Message-Id: <201201142320.56320.szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326320574-11220-17-git-send-email-szymon@janc.net.pl>
In-Reply-To: <1326320574-11220-17-git-send-email-szymon@janc.net.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,
 
> > +#define pr_fmt(fmt) KBUILD_MODNAME": " fmt
> 
> Add a space please between KBUILD_MODNAME and the quoted string.
> #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

Will fix that in V3. (I'll wait few more days to see if there are some more 
comments from other people)

> > @@ -207,9 +209,8 @@ static int quickstart_acpi_ghid(struct
> > quickstart_acpi *quickstart)
> > 
> >  		quickstart->button->id = *(uint64_t *)buffer.pointer;
> >  		break;
> >  	
> >  	default:
> > -		printk(KERN_ERR "quickstart: %s GHID method returned buffer "
> > -				"of unexpected length %u\n",
> > -				quickstart->button->name, buffer.length);
> > +		pr_err("%s GHID method returned buffer of unexpected length %u"
> > +				"\n", quickstart->button->name, buffer.length);
> 
> Please try not to break format strings into multiple bits.
> It's very error prone and can make it harder to grep.
> It's OK to have the line with the format exceed 80 chars.

ditto :)

-- 
Szymon K. Janc
szymon@janc.net.pl

