From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 Feb 2019 19:18:56 +0000
Subject: Re: [PATCH 2/2] test_firmware: silence underflow warning in test_dev_config_update_u8()
Message-Id: <20190221191855.GB1737@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190221183700.GA1737@kadam>
 <20190221183826.GA30993@kadam>
 <20190221105458.409d1968961962079c54b815@linux-foundation.org>
In-Reply-To: <20190221105458.409d1968961962079c54b815@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Luis R. Rodriguez" <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Thu, Feb 21, 2019 at 10:54:58AM -0800, Andrew Morton wrote:
> On Thu, 21 Feb 2019 21:38:26 +0300 Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> > We put an upper bound on "new" but we don't check for negatives.
> 
> U8_MAX has unsigned type, so `if (new > U8_MAX)' does check for negative.
> 

No, doesn't work in this case.

#define U8_MAX          ((u8)~0U)

It would need to unsigned long for the type promotion to prevent
negatives, but it starts as unsigned int, then unsigned char, which is
type promoted to int.

It would be more clear to just write it as:

#define U8_MAX 0xff

> > In
> > this case the underflow doesn't matter very much, but we may as well
> > make the static checker happy.
> > 
> > ...
> >
> > --- a/lib/test_firmware.c
> > +++ b/lib/test_firmware.c
> > @@ -326,15 +326,12 @@ static ssize_t test_dev_config_show_int(char *buf, int cfg)
> >  static int test_dev_config_update_u8(const char *buf, size_t size, u8 *cfg)
> >  {
> >  	int ret;
> > -	long new;
> > +	u8 new;
> >  
> > -	ret = kstrtol(buf, 10, &new);
> > +	ret = kstrtou8(buf, 10, &new);
> >  	if (ret)
> >  		return ret;
> >  
> > -	if (new > U8_MAX)
> > -		return -EINVAL;
> > -
> >  	mutex_lock(&test_fw_mutex);
> >  	*(u8 *)cfg = new;
> >  	mutex_unlock(&test_fw_mutex);
> 
> if *buf="257",
> 
> previous behavior: -EINVAL
> new behavior: *cfg = 1
> 
> yes?

No.  The kstrtou8() check the limit so it will return -ERANGE.  I should
have probably spelled that out better in the commit message.  I'll
resend tomorrow.

regard,
dan carpenter
