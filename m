From: Matthew Wilcox <matthew@wil.cx>
Date: Wed, 09 Jan 2008 12:33:12 +0000
Subject: Re: [PATCH] Change paride driver to use unlocked_ioctl instead of ioctl
Message-Id: <20080109123311.GP16309@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4785B7BC.5040106@suse.de> <4785C7D8.2020808@suse.de>
In-Reply-To: <4785C7D8.2020808@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikanth Karthikesan <knikanth@suse.de>
Cc: grant@torque.net, tim@cyberelk.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jan 10, 2008 at 12:53:04PM +0530, Nikanth Karthikesan wrote:
>  	default:
>  		printk("%s: Unimplemented ioctl 0x%x\n", tape->name, cmd);
> +		unlock_kernel();
>  		return -EINVAL;

Surely a bug ... shouldn't this return -ENOTTY?

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
