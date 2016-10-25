From: Richard Kuo <rkuo@codeaurora.org>
Date: Tue, 25 Oct 2016 21:37:35 +0000
Subject: Re: Hexagon-setup: Combine four seq_printf() calls into one call in show_cpuinfo()
Message-Id: <20161025213735.GA27715@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c19c69d5-600c-f08b-f448-0420e677db63@users.sourceforge.net>
 <alpine.DEB.2.10.1610210918420.3212@hadrien>
 <e9daa136-c6ab-2f96-3d20-6e143fa1170b@users.sourceforge.net>
 <20161021154624.maiwbgjmzlzhin2l@thunk.org>
 <48d54097-6be3-d39d-2af9-d4ad90c3c417@users.sourceforge.net>
 <20161021175317.nnb2keq7m3phwgbv@thunk.org>
 <20c77dde-a1a0-8383-f344-a6f788af68d9@users.sourceforge.net>
In-Reply-To: <20c77dde-a1a0-8383-f344-a6f788af68d9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Theodore Ts'o <tytso@mit.edu>, Julia Lawall <julia.lawall@lip6.fr>, linux-hexagon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

I wrote it the original way precisely for readability; it's easier, at least
to me, to read and modify the old way.

However, in my development version I happen to be printing a lot more
stuff.

To test, I collapsed 18 of my seq_printf's into one call.  That reduced the
function size by a couple hundred bytes.  (Didn't do anything for the final
kernel size though.)

If it makes things better, even if only slightly, doesn't introduce bugs, 
and doesn't otherwise violate any other rules (correct me if I'm wrong), I
would personally accept the minor readability tradeoff in this case.


Acked-by: Richard Kuo <rkuo@codeaurora.org>



On Fri, Oct 21, 2016 at 08:50:11PM +0200, SF Markus Elfring wrote:
> > When the author of the semantic patch language is telling you to stand down,
> 
> The collaboration evolved between Julia and me during the years somehow.
> Different software development opinions occur then as usual.
> Further opinions from contributors like you can eventually show variations
> between disagreement and acceptance.
> 
> 
> > and you still want to try to argue for blind application of patches,
> 
> I guess that we have got different views about "blind" tries.
> 
> 
> > we have a really big problem.
> 
> I hope that potential communication difficulties can still be resolved.
> 
> 
> > Especially when some of your patches have actually introduced bugs.
> 
> I assume that these incidents could be clarified further, couldn't they?
> 
> Regards,
> Markus
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hexagon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
