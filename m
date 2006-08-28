From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 28 Aug 2006 17:51:36 +0000
Subject: Re: [KJ] [PATCH] Removed unreachable code and fixed one compiler
Message-Id: <20060828175136.GJ5195@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1156784251.4195.7.camel@localhost.localdomain>
In-Reply-To: <1156784251.4195.7.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 28.08.2006 [20:49:58 +0300], ville palo wrote:
> On Mon, 2006-08-28 at 10:26 -0700, Nishanth Aravamudan wrote:
> > On 28.08.2006 [19:57:31 +0300], ville palo wrote:
> > > 
> > > 
> > > There were some unreachable code segments in drivers/cdrom.
> > > This patch removes them and fixes one compiler warning: 
> > > "gscd.c:269: warning: unsigned int format, long unsigned int arg"
> > 
> > Should be separate patches then. Please read tpp
> > (http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt) and
> > Documentation/SubmittingPatches if you haven't already (reread them, if
> > you have).
> 
> Ok, I'll reread them :)
> 
> > Perhapse move the xtrace (which is presumably useful) to before the
> > goto?
> > 
> > >  	}
> > >  
> > >  	goto again;
> > > @@ -1710,11 +1707,7 @@ static int mcdx_tray_move(struct cdrom_d
> > >  	if (!(stuffp->present & DOOR))
> > >  		return -ENOSYS;
> > >  
> > > -	if (position)		/* 1: eject */
> > > -		return mcdx_talk(stuffp, "\xf6", 1, NULL, 1, 5 * HZ, 3);
> > > -	else			/* 0: close */
> > > -		return mcdx_talk(stuffp, "\xf8", 1, NULL, 1, 5 * HZ, 3);
> > > -	return 1;
> > > +	return mcdx_talk(stuffp, position ? "\xf6" : "\xf8", 1, NULL, 1, 5 * HZ, 3);
> > 
> > As mentioned elsewhere the comments are useful. This also doesn't seem
> > to fit into either category of your description and thus should have
> > been in a different patch (Have you (re)read tpp or SubmittingPatches yet?).
> 
> I already fixed the comments part but I have to disagree about the
> description part. IMHO this fits in "removed unreachable code"
> category, because 'return 1;' was unreachable.

Only the return 1; removal does. The other is code rearrangement, and
is a distinct (and unnecessary) logical change.

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
