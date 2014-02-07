From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Feb 2014 11:21:56 +0000
Subject: Re: [patch 2/2] staging: r8188eu: overflow in rtw_p2p_get_go_device_address()
Message-Id: <20140207112156.GV26776@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140203223835.GB28874@elgon.mountain>
In-Reply-To: <20140203223835.GB28874@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Feb 07, 2014 at 11:46:26AM +0100, walter harms wrote:
> 
> 
> Am 03.02.2014 23:38, schrieb Dan Carpenter:
> > The go_devadd_str[] array is two characters too small to hold the
> > address so we corrupt memory.
> > 
> > I've changed the user space API slightly and I don't have a way to test
> > if this breaks anything.  In the original code we truncated away the
> > last digit of the address and the NUL terminator so it was already a bit
> > broken.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
> > index dec992569476..4ad80ae1067f 100644
> > --- a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
> > +++ b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
> > @@ -3164,9 +3164,7 @@ static int rtw_p2p_get_go_device_address(struct net_device *dev,
> >  	u8 *p2pie;
> >  	uint p2pielen = 0, attr_contentlen = 0;
> >  	u8 attr_content[100] = {0x00};
> > -
> > -	u8 go_devadd_str[17 + 10] = {0x00};
> > -	/*  +10 is for the str "go_devadd =", we have to clear it at wrqu->data.pointer */
> > +	u8 go_devadd_str[17 + 12] = {};
> 
> 
> you are deleting the explanation for the magic numbers here,
> - intentionally  ?
> 

Yes.  The old explanation was misleading because the string is
"\n\ndev_add =" and not "go_devadd =".  The buffer is only used in one
location so the size is obvious and there is no need for a comment.

regards,
dan carpenter

