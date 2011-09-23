From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Sep 2011 07:30:04 +0000
Subject: Re: [patch] agp: potential info leak in compat_agpioc_info_wrap()
Message-Id: <20110923073004.GE29426@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110923061945.GC4387@elgon.mountain>
 <1316761455.2560.15.camel@edumazet-laptop>
In-Reply-To: <1316761455.2560.15.camel@edumazet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Sep 23, 2011 at 09:04:15AM +0200, Eric Dumazet wrote:
> > The agp_info32 struct has a 4 byte hole in it so we need to clear
> > that before copying it to userspace.
> > 
> > struct agp_info32 {
> >         struct agp_version         version;              /*     0     0 */
> > 
> >         /* XXX 4 bytes hole, try to pack */
> > 
> 
> This makes no sense :
> 
> Why should we have a 32bit hole before an u32 field ?
> 

Crap.  You're right.  It saw the agp_version struct as a hole.

Sorry for the noise.

regards,
dan carpenter
