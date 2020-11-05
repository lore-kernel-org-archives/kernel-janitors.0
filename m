From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Date: Thu, 05 Nov 2020 14:59:52 +0000
Subject: Re: [PATCH][next] hwmon: corsair-psu: fix unintentional sign extension issue
Message-Id: <20201105155952.1db127bd@monster.powergraphx.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201105115019.41735-1-colin.king@canonical.com>
        <20201105133233.10edda5b@monster.powergraphx.local>
        <20201105141549.GA1389@roeck-us.net>
In-Reply-To: <20201105141549.GA1389@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>
Cc: Colin King <colin.king@canonical.com>, Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 5 Nov 2020 06:15:49 -0800
Guenter Roeck <linux@roeck-us.net> wrote:

> On Thu, Nov 05, 2020 at 01:32:33PM +0100, Wilken Gottwalt wrote:
> > On Thu,  5 Nov 2020 11:50:19 +0000
> > Colin King <colin.king@canonical.com> wrote:
> > 
> > > From: Colin Ian King <colin.king@canonical.com>
> > > 
> > > The shifting of the u8 integer data[3] by 24 bits to the left will
> > > be promoted to a 32 bit signed int and then sign-extended to a
> > > long. In the event that the top bit of data[3] is set then all
> > > then all the upper 32 bits of a 64 bit long end up as also being
> > > set because of the sign-extension. Fix this by casting data[3] to
> > > a long before the shift.
> > > 
> > > Addresses-Coverity: ("Unintended sign extension")
> > > Fixes: ce15cd2cee8b ("hwmon: add Corsair PSU HID controller driver")
> > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > > ---
> > >  drivers/hwmon/corsair-psu.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> > > index e92d0376e7ac..5d19a888231a 100644
> > > --- a/drivers/hwmon/corsair-psu.c
> > > +++ b/drivers/hwmon/corsair-psu.c
> > > @@ -241,7 +241,7 @@ static int corsairpsu_get_value(struct corsairpsu_data *priv, u8 cmd, u8
> > > rail, l
> > >  	 * the LINEAR11 conversion are the watts values which are about 1200 for the
> > > strongest psu
> > >  	 * supported (HX1200i)
> > >  	 */
> > > -	tmp = (data[3] << 24) + (data[2] << 16) + (data[1] << 8) + data[0];
> > > +	tmp = ((long)data[3] << 24) + (data[2] << 16) + (data[1] << 8) + data[0];
> > >  	switch (cmd) {
> > >  	case PSU_CMD_IN_VOLTS:
> > >  	case PSU_CMD_IN_AMPS:
> > 
> > Yeah, this could happen if the uptime value in the micro-controller gets bigger
> > than 68 years (in seconds), and it is the only value which actually uses more
> > than 2 bytes for the representation. So what about architectures which are 32 bit
> > wide and where a long has 32 bits? I guess this simple cast is not enough.
> > 
> 
> The hwmon subsystem uses 'long' to pass values back to the core.
> While that may be a bit unfortunate as it doesn't support uptimes
> of more than 68 years in seconds, we are not going to change the
> hwmon core to accommodate it. If the incoming data is always
> expected to be positive, and you don't want to risk the overflow,
> feel free to either use "data[3] & 0x7f" instead, or max out the
> result at INT_MAX (from <linux/limits.h>).
> 
> Thanks,
> Guenter

And it is basically impossible to hit the 68 years. For example here are the
values for my psu, which I got about 6 years ago (2014 is the first year it
was sold) and which runs 8-20 hours nearly every day: 656 day(s), 21:26:34,
that are not even 2 years. And we are talking about gaming PSUs here, which
no sane person would put into a server where it runs 24/7. And if so, it
wouldn't survive 10 uptime years, not to mention 68 years. I'm pretty sure
that the fan in my PSU is somewhat damaged already (hence the best guess fan
value calculation). So yes, technically it is not perfect but practically it
doesn't make much sense here trying to find the perfect solution. It will
only introduce unnecessary complexity for a scenario which is so unlikely to
happen at all. I actually spent a lot of time thinking about it, and this
is the most practical solution I found - and which made Guenter happy ;-)

Though, I must admit there is a way to solve this problem - by making chained
requests and get all values at once and parse/split the response. You can
easily join all requests in this 64 bytes hid message. But this may not work
reliable for all supported devices. I already encountered issues while joining
rail select and read a rail value. It would at least increase the complexity
to quite a new level.

greetings,
Wilken
