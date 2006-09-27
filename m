From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 27 Sep 2006 21:22:09 +0000
Subject: Re: [KJ] [RFC] request_region() error handling fixes
Message-Id: <20060927212209.GK7457@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1159387194.1709.40.camel@dyn9047017100.beaverton.ibm.com>
In-Reply-To: <1159387194.1709.40.camel@dyn9047017100.beaverton.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 27.09.2006 [14:04:25 -0700], Badari Pulavarty wrote:
> On Wed, 2006-09-27 at 13:48 -0700, Nishanth Aravamudan wrote:
> > On 27.09.2006 [12:59:54 -0700], Badari Pulavarty wrote:
> > > Hi,
> > > 
> > > I started working on request_region() error handling fixes.
> > > Before I got too far, want to make sure its following approach
> > > is acceptable. (not happy with too many "goto" statements). 
> > > Is there a better way to do this ?
> > 
> > I don't think there is any better way to do multiple stacked failures
> > than many gotos. At least, if the goal is to avoid code duplication
> > (which I would say it is).
> 
> Okay. Do you think I should add unlikely() for these to get better
> code ?

iirc, the LKML consensus on unlikely() was only add it if it truly is
very unlikely and actually makes a significant difference. Most of what
you're patching is init code, which will only be run once, it seems. I
don't think unlikely() is necessary (unless you can show a significant
performance difference, I guess).

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
