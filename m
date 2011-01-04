From: Joe Perches <joe@perches.com>
Date: Tue, 04 Jan 2011 06:58:50 +0000
Subject: Re: [patch] checkpatch: putting the && or || on the wrong line
Message-Id: <1294124330.6617.15.camel@Joe-Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110104055900.GA5062@bicker>
In-Reply-To: <20110104055900.GA5062@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2011-01-04 at 08:59 +0300, Dan Carpenter wrote:
> This patch makes checkpatch.pl complain if you break up conditions in
> the wrong way.
> 
> Wrong:
> 	if ((really_long_condition)
> 		&& (second_condition)) { ...
> Right:
> 	if ((really_long_condition) &&
> 		(second_condition)) { ...
> 
> If you do it in the wrong way the message is:  "put the && or || at the
> end of the previous line"
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index e3c7fc0..0a813db 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1509,6 +1509,11 @@ sub process {
>  			WARN("please, no space before tabs\n" . $herevet);
>  		}
>  
> +# check for && or || at the start of a line
> +		if ($rawline =~ /^\+\W+(&&|\|\|)/) {

This should be /^\+[ \t]*(&&|\|\|)/

> +			WARN("put the && or || at the end of the previous line\n" . $herecurr);

I've submitted something like this a couple of times and gotten
various objections but I think it's sensible.

https://lkml.org/lkml/2009/12/5/65
https://lkml.org/lkml/2010/7/11/92


