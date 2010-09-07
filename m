From: Dan Carpenter <error27@gmail.com>
Date: Tue, 07 Sep 2010 21:38:18 +0000
Subject: Re: [patch] pm_qos_params: cleanup: terminate a string
Message-Id: <20100907213818.GA5351@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100903124105.GJ5437@bicker> <20100907062227.GB25651@gvim.org> <20100907133805.GA20050@gvim.org>
In-Reply-To: <20100907133805.GA20050@gvim.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mark gross <markgross@thegnar.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, James Bottomley <James.Bottomley@suse.de>, Frederic Weisbecker <fweisbec@gmail.com>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Sep 07, 2010 at 06:38:05AM -0700, mark gross wrote:
> >  	spin_unlock_irqrestore(&pm_qos_lock, flags);
> > @@ -374,10 +374,12 @@ static ssize_t pm_qos_power_write(struct file *filp, const char __user *buf,
> >  	} else if (count = 11) { /* len('0x12345678/0') */
> >  		if (copy_from_user(ascii_value, buf, 11))
> >  			return -EFAULT;
> > +		if (strlen(ascii_value) > 10)
>                          should be !> 
> > +			return -EINVAL;
> >  		x = sscanf(ascii_value, "%x", &value);
> >  		if (x != 1)
> >  			return -EINVAL;

With the original code you could do:
	char buf[11];  /* must be 11 chars */

	snprintf(buf, sizeof(buf), "0x%x", 42);
	write(fd, buf, sizeof(buf));

But the new code is stricter so the number would have to be zero padded.

regards,
dan carpenter
