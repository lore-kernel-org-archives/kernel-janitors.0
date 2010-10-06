From: David Daney <ddaney@caviumnetworks.com>
Date: Wed, 06 Oct 2010 17:54:11 +0000
Subject: Re: [PATCH 07/28] Staging: comedi: drivers.c: Edit file so that checkpatch.pl
Message-Id: <4CACB7C3.9030000@caviumnetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286326843-6170-1-git-send-email-tdent48227@gmail.com> <1286326843-6170-7-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286326843-6170-7-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tracey Dent <tdent48227@gmail.com>
Cc: greg@kroah.com, abbotti@mev.co.uk, fmhess@users.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/05/2010 06:00 PM, Tracey Dent wrote:
> Changed a few lines that made checkpatch.pl complain. Could not get ever warning but
> I got it down to to just 4, WARNING: line over 80 characters.

The overall goal is to improve the code, not placate checkpatch.pl

[...]
>   				printk
> -				    (KERN_WARNING "BUG! detaching device with use_count=%d\n",
> -				     dev->use_count);
> +				    (KERN_WARNING "BUG! detaching device     \
> +							with use_count=%d\n",
> +							dev->use_count);

Is that really an improvement?

And even if it were, is that really how strings should be split up?

Hint:
	pr_warning("BUG! detaching device with use_count=%d\n",
		   dev->use_count);


David Daney
