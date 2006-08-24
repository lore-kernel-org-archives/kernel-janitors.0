From: ville palo <ville.palo@vi64pa.net>
Date: Thu, 24 Aug 2006 05:38:26 +0000
Subject: Re: [KJ] [PATCH] Fixed couple of unreachable code
Message-Id: <1156397906.3639.9.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1156358895.5368.13.camel@localhost.localdomain>
In-Reply-To: <1156358895.5368.13.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 2006-08-24 at 03:00 +0400, Alexey Dobriyan wrote:
> On Thu, Aug 24, 2006 at 02:56:03AM +0400, Alexey Dobriyan wrote:
> > On Wed, Aug 23, 2006 at 09:48:15PM +0300, ville palo wrote:
> > > Fixed couple of unreachable code segments:
> >
> > But it _should_ be reachable!

Yes, it should :)

> >
> > parse_arg() returns errors
> >
> > 	static int parse_arg(const char __user * buf, unsigned long count, int *val)
> > 	{
> > 		char s[32];
> > 		if (!count)
> > 			return 0;
> > 		if (count > 31)
> > 			return -EINVAL;
> > 		if (copy_from_user(s, buf, count))
> > 			return -EFAULT;
> > 		s[count] = 0;
> > 		if (sscanf(s, "%i", val) != 1)
> > 			return -EINVAL;
> > 		return count;
> > 	}
> >
> > I have a gut feeling someone already send a patch correcting the
> > situation...
> 
> Here it is, will send to akpm in a minute
> 
> [KJ][Patch] corrset useage of negative number in an unsigned long in asus_acpi.c (sic)
> Darren Jenkins
> 

Only difference between these patches is that when parse_arg returns an
error, in Darren Jenkins patch it is written to the log, but not
returned to the caller. And proc_write_led function was not corrected 
in Darrens patch.
 

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
