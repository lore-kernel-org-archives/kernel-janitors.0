From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 01 Oct 2019 11:54:42 +0000
Subject: Re: [PATCH] usb: typec: tcpm: Fix a signedness bug in tcpm_fw_get_caps()
Message-Id: <20191001115442.GB22609@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925110219.GN3264@mwanda>
 <20190926125310.GA9967@roeck-us.net>
In-Reply-To: <20190926125310.GA9967@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Sep 26, 2019 at 05:53:10AM -0700, Guenter Roeck wrote:
> On Wed, Sep 25, 2019 at 02:02:19PM +0300, Dan Carpenter wrote:
> > The "port->typec_caps.data" and "port->typec_caps.type" variables are
> > enums and in this context GCC will treat them as an unsigned int so they
> > can never be less than zero.
> > 
> > Fixes: ae8a2ca8a221 ("usb: typec: Group all TCPCI/TCPM code together")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > index 96562744101c..d3b63e000ae2 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -4410,7 +4410,7 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
> >  	ret = fwnode_property_read_string(fwnode, "data-role", &cap_str);
> >  	if (ret = 0) {
> >  		port->typec_caps.data = typec_find_port_data_role(cap_str);
> > -		if (port->typec_caps.data < 0)
> > +		if ((int)port->typec_caps.data < 0)
> >  			return -EINVAL;
> 
> Doesn't that also cause a warning about overwriting error return codes ?

I'm happy that you think there is a tool which generates warnings like
that but it's just people manually complaining.  :P

I'll resend though.

regards,
dan carpenter
