From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 03 Jun 2020 06:50:24 +0000
Subject: Re: [PATCH] cxl: Fix kobject memory leak in cxl_sysfs_afu_new_cr()
Message-Id: <20200603065024.GA587198@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b9791ff3-8397-f6e9-ca88-59c9bbe8c78f@web.de>
 <25ad528b-beaf-820f-9738-ea304dcbc0d7@huawei.com>
 <20200603061443.GB531505@kroah.com>
 <20ae5516-7e41-f706-46ba-955e1936f183@huawei.com>
In-Reply-To: <20ae5516-7e41-f706-46ba-955e1936f183@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "wanghai (M)" <wanghai38@huawei.com>
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Markus Elfring <Markus.Elfring@web.de>, Ian Munsie <imunsie@au1.ibm.com>, Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org

On Wed, Jun 03, 2020 at 02:34:07PM +0800, wanghai (M) wrote:
> 
> 在 2020/6/3 14:14, Greg Kroah-Hartman 写道:
> > On Wed, Jun 03, 2020 at 09:42:41AM +0800, wanghai (M) wrote:
> > > 在 2020/6/3 1:20, Markus Elfring 写道:
> > > > > Fix it by adding a call to kobject_put() in the error path of
> > > > > kobject_init_and_add().
> > > > Thanks for another completion of the exception handling.
> > > > 
> > > > Would an other patch subject be a bit nicer?
> > > Thanks for the guidance, I will perfect this description and send a v2
> > Please note that you are responding to someone that a lot of kernel
> > developers and maintainers have blacklisted as being very annoying and
> > not helpful at all.
> > 
> > Please do not feel that you need to respond to, or change any patch in
> > response to their emails at all.
> > 
> > I strongly recommend you just add them to your filters to not have to
> > see their messages.  That's what I have done.
> > 
> > thanks,
> > 
> > greg k-h
> > 
> > .
> 
> Okay, so I don’t have to send the v2 patch.

No, all should be fine, I'll review the patch when after 5.8-rc1 is out,
and if I find any problems with it, will let you know then.

thanks,

greg k-h
