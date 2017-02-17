From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Fri, 17 Feb 2017 10:22:41 +0000
Subject: Re: [bug report] net: Prepare gro for packet consuming gro callbacks
Message-Id: <20170217102241.GC30338@gauss.secunet.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170216201127.GA11170@mwanda>
In-Reply-To: <20170216201127.GA11170@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Feb 17, 2017 at 01:13:05PM +0300, Dan Carpenter wrote:
> On Fri, Feb 17, 2017 at 09:18:25AM +0100, Steffen Klassert wrote:
> > Hi Dan.
> > 
> > On Thu, Feb 16, 2017 at 11:11:27PM +0300, Dan Carpenter wrote:
> > > Hello Steffen Klassert,
> > > 
> > > The patch 25393d3fc055: "net: Prepare gro for packet consuming gro
> > > callbacks" from Feb 15, 2017, leads to the following Smatch
> > > warning:
> > > 
> > > 	net/core/dev.c:4522 dev_gro_receive()
> > > 	error: 'pp' dereferencing possible ERR_PTR()
> > > 
> > > net/core/dev.c
> > >   4510          if (&ptype->list = head)
> > >   4511                  goto normal;
> > >   4512  
> > >   4513          if (IS_ERR(pp) && PTR_ERR(pp) = -EINPROGRESS) {
> > > 
> > > 
> > > Smatch sees this and assumes that it's possible for "pp" to be an error
> > > pointer that's not -EINPROGRESS.
> > 
> > pp can be either a vaild pointer, NULL or -EINPROGRESS,
> > nothing else. So I guess this is ok.
> 
> Could you change it to:
> 
> 	if (PTR_ERR(pp) = -EINPROGRESS) {
> 
> That would silence the warning and make the code more clear I think.

I had it like that, but some other code checking tool
complained that I check -EINPROGRESS without checking
if this is an error pointer. So I changed it to that
what I have now.


