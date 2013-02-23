From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 23 Feb 2013 15:05:21 +0000
Subject: Re: [PATCH] scripts/coccinelle: find constant additions that could be bit ors
Message-Id: <20130223150521.GK9138@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1359821995-27910-1-git-send-email-Julia.Lawall@lip6.fr>
 <20130222104431.GF12402@pobox.suse.cz>
In-Reply-To: <20130222104431.GF12402@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Marek <mmarek@suse.cz>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org

On Fri, Feb 22, 2013 at 11:44:31AM +0100, Michal Marek wrote:
> On Sat, Feb 02, 2013 at 05:19:55PM +0100, Julia Lawall wrote:
> > From: Julia Lawall <Julia.Lawall@lip6.fr>
> > 
> > Semantic patch (http://coccinelle.lip6.fr/) to check for constants that are
> > added but are used elsewhere as bitmasks.
> > 
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Applied to kbuild.git#misc.
> 

I'm not sure we want to do this.  The one patch which was sent with
this script wasn't applied.

regards,
dan carpenter

