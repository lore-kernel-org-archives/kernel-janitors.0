From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Date: Mon, 19 May 2014 23:23:56 +0000
Subject: Re: [patch v2]  PM / hibernate: memory corruption in resumedelay_setup()
Message-Id: <2786765.WX3MDcC33j@vostro.rjw.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140514155602.GA9723@amd.pavel.ucw.cz> <20140514160845.GA5273@mwanda> <20140514202947.GA5855@amd.pavel.ucw.cz>
In-Reply-To: <20140514202947.GA5855@amd.pavel.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Len Brown <len.brown@intel.com>, Fabian Frederick <fabf@skynet.be>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wednesday, May 14, 2014 10:29:47 PM Pavel Machek wrote:
> On Wed 2014-05-14 19:08:46, Dan Carpenter wrote:
> > In the original code "resume_delay" is an int so on 64 bits, the call to
> > kstrtoul() will cause memory corruption.  We may as well fix a style
> > issue here as well and make "resume_delay" unsigned int, since that's
> > what we pass to ssleep().
> 
> > Fixes: 317cf7e5e85e ('PM / hibernate: convert simple_strtoul to kstrtoul')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>

Queued up for 3.16, thanks!


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
