From: Vasiliy Kulikov <segooon@gmail.com>
Date: Tue, 31 Aug 2010 16:16:44 +0000
Subject: Re: [PATCH 1/7] drivers/macintosh/via-pmu-led.c: Add of_node_put
Message-Id: <20100831161644.GA14505@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283075566-27441-1-git-send-email-julia@diku.dk>
	<1283075566-27441-2-git-send-email-julia@diku.dk>
	<4C7D247F.4060500@bfs.de>
	<Pine.LNX.4.64.1008311807470.2668@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008311807470.2668-QfmoRoYWmW9knbxzx/v8hQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, walter harms <wharms-fPG8STNUNVg@public.gmane.org>

On Tue, Aug 31, 2010 at 18:08 +0200, Julia Lawall wrote:
> On Tue, 31 Aug 2010, walter harms wrote:
> 
> > 
> > 
> > Julia Lawall schrieb:
> > > Add a call to of_node_put in the error handling code following a call to
> > > of_find_node_by_path.
[...]
> > > --- a/drivers/macintosh/via-pmu-led.c
> > > +++ b/drivers/macintosh/via-pmu-led.c
> > > @@ -92,8 +92,10 @@ static int __init via_pmu_led_init(void)
> > >  	if (dt = NULL)
> > >  		return -ENODEV;
> > >  	model = of_get_property(dt, "model", NULL);
> > > -	if (model = NULL)
> > > +	if (model = NULL) {
> > > +		of_node_put(dt);
> > >  		return -ENODEV;
> > > +	}
> > >  	if (strncmp(model, "PowerBook", strlen("PowerBook")) != 0 &&
> > >  	    strncmp(model, "iBook", strlen("iBook")) != 0 &&
> > >  	    strcmp(model, "PowerMac7,2") != 0 &&
> > > 
> > 
> > is there any rule that says when to use strncmp ? it seems perfecly valid to use strcpy here
> > (what is done in the last cmp).
> 
> Perhaps there are some characters after eg PowerBook that one doesn't want 
> to compare with?

It seems to me that model has no '\0' in the end. If model is got from
the hardware then we should double check it - maybe harware is buggy.
Otherwise we'll overflow model.

But why strcmp(model, "PowerMac7,2")? IMO it should be replaced
with strncmp().

-- 
Vasiliy
