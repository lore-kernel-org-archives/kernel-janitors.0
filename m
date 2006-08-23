From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 23 Aug 2006 22:56:03 +0000
Subject: Re: [KJ] [PATCH] Fixed couple of unreachable code segments
Message-Id: <20060823225603.GA5203@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1156358895.5368.13.camel@localhost.localdomain>
In-Reply-To: <1156358895.5368.13.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Aug 23, 2006 at 09:48:15PM +0300, ville palo wrote:
> Fixed couple of unreachable code segments:

But it _should_ be reachable!

parse_arg() returns errors

	static int parse_arg(const char __user * buf, unsigned long count, int *val)
	{
		char s[32];
		if (!count)
			return 0;
		if (count > 31)
			return -EINVAL;
		if (copy_from_user(s, buf, count))
			return -EFAULT;
		s[count] = 0;
		if (sscanf(s, "%i", val) != 1)
			return -EINVAL;
		return count;
	}

I have a gut feeling someone already send a patch correcting the
situation...

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
