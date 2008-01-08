From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 08 Jan 2008 20:00:45 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <20080108200044.GI16309@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org> <4d8e3fd30801081158j3e7292d0i939776342015b12d@mail.gmail.com>
In-Reply-To: <4d8e3fd30801081158j3e7292d0i939776342015b12d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, gorcunov@gmail.com

On Tue, Jan 08, 2008 at 08:58:04PM +0100, Paolo Ciarrocchi wrote:
> -static const struct file_operations rtc_fops = {
> +static long rtc_fioctl(struct file_operations rtc_fops)
> +{
> +	lock_kernel();
>  	.owner		= THIS_MODULE,

You should probably restrict yourself to files that you can at least
compile ...

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
