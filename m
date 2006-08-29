From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 29 Aug 2006 17:30:58 +0000
Subject: Re: [KJ] Fwd: [Patch] Add HZ values and time_after() macros in
Message-Id: <20060829173058.GE11548@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <82faac5b0608290944o2452a904x4826da8bbd944daa@mail.gmail.com>
In-Reply-To: <82faac5b0608290944o2452a904x4826da8bbd944daa@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Aug 29, 2006 at 10:00:08AM -0700, Nishanth Aravamudan wrote:
> Yes, that is true. I support your changes in general, but given that
> HZ00 in original 2.6, I would suggest that 50 jiffies is not the same
> as HZ/2. It should either be HZ/20 or, preferably, msecs_to_jiffies(50).
> If the maintainer then replies saying they had never changed the code
> from 2.4's HZ to 2.6, then we can proceed accordingly and your current
> change is more appropriate, but I wouldn't assume that to be the case.

It's easy enough to look at 2.4:

  if(((jiffies - timer)>50)||((dev->ffL.tcq_rd=dev->host_tcq_wr))){      

So the patch is a bugfix.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
