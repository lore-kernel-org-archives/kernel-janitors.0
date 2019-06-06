From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Jun 2019 10:30:55 +0000
Subject: Re: [PATCH][next] drm/amd/display: remove redundant assignment to status
Message-Id: <20190606103055.GJ31203@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190530161219.2507-1-colin.king@canonical.com>
 <a190bcd5-cda8-84c6-093a-98438a605032@amd.com>
In-Reply-To: <a190bcd5-cda8-84c6-093a-98438a605032-5C7GfCeVMHo@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <hwentlan-5C7GfCeVMHo@public.gmane.org>
Cc: "Zhou, David(ChunMing)" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, "Li,
 Sun peng (Leo)" <Sunpeng.Li-5C7GfCeVMHo@public.gmane.org>, "Wentland,
 Harry" <Harry.Wentland-5C7GfCeVMHo@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, "Deucher,
 Alexander" <Alexander.Deucher-5C7GfCeVMHo@public.gmane.org>, Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, "Koo, Anthony" <Anthony.Koo-5C7GfCeVMHo@public.gmane.org>, "Koenig,
 Christian" <Christian.Koenig-5C7GfCeVMHo@public.gmane.org>

On Fri, May 31, 2019 at 08:19:03PM +0000, Harry Wentland wrote:
> On 2019-05-30 12:12 p.m., Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The variable status is initialized with a value that is never read
> > and status is reassigned several statements later. This initialization
> > is redundant and can be removed.
> > 
> > Addresses-Coverity: ("Unused value")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > index 65d6caedbd82..cf6166a1be53 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > @@ -2367,7 +2367,7 @@ static bool retrieve_link_cap(struct dc_link *link)
> >  	union down_stream_port_count down_strm_port_count;
> >  	union edp_configuration_cap edp_config_cap;
> >  	union dp_downstream_port_present ds_port = { 0 };
> > -	enum dc_status status = DC_ERROR_UNEXPECTED;
> > +	enum dc_status status;
> 
> Not sure this improves the situation.
> 
> I'd prefer to have a default here in case someone changes the code below
> and forgets to set the status.

The dead code confuses human readers, because people naturally assume it
is not dead.

GCC has a feature to warn about uninitialized variables and we're
randomly initializing status to a bogus value to disable static
analysis...

regards,
dan carpenter
