From: Andi Drebes <webmaster@programmierforen.de>
Date: Sun, 03 Jun 2007 10:47:24 +0000
Subject: Re: [KJ] Why keeping lines commented out via #if 0?
Message-Id: <200706031247.24340.webmaster@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200706021359.23564.lists-receive@programmierforen.de>
In-Reply-To: <200706021359.23564.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

<snip>
> Ofcourse, noone should go overboard with it but people don't. If something has 
> no value anymore, it's deleted. It's only kept as a comment when it _is_ seen to 
> have value in some or other form and as such deleting it is not a janitorial 
> task but something that needs a maintainer. If the code sees active maintainance 
> it still being there already means it's seen to still have value and if the code 
> does not, it should most certainly be left alone as documentation for a possible 
> next person stepping in.
> 
> A suggestion that any #if 0 code should preferably have a comment describing why 
> it's there would ofcourse not be bad.
Yes, I totally agree with that. Especially for people that are new to kernel stuff (me, for example)
are quite confused about the fact that there's so much code commented out. Just a
short and descriptive line that tells people why this was commented out would be very
nice and helpful.

	Andi
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
