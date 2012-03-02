From: "David Laight" <David.Laight@ACULAB.COM>
Date: Fri, 02 Mar 2012 09:05:10 +0000
Subject: RE: Resend [PATCH] netfilter: Fix copy_to_user too small size parametre.
Message-Id: <AE90C24D6B3A694183C094C60CF0A2F6026B6E87@saturn3.aculab.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1330621743-12883-1-git-send-email-santoshprasadnayak@gmail.com>
References: <1330621743-12883-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1330621743-12883-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santosh nayak <santoshprasadnayak@gmail.com>, bart.de.schuymer@pandora.be
Cc: pablo@netfilter.org, kaber@trash.net, shemminger@vyatta.com, davem@davemloft.net, netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

 
> -	if (copy_to_user(hlp, m->u.match->name, 
> EBT_FUNCTION_MAXNAMELEN))
> +	char name[EBT_FUNCTION_MAXNAMELEN] = {};
> +
> +	strncpy(name, m->u.match->name, sizeof(name));
> +	if (copy_to_user(hlp, name, EBT_FUNCTION_MAXNAMELEN))
>  		return -EFAULT;

strncpy() is very rarely the function you are looking for.
In this case it MIGHT be right (since you do a fixed size
copy_to_user).
OTOH there is no need to also initialise name[].
And it isn't entirely clear whether the application
is allowed to be given a non-terminated string.

	David


