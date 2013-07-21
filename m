From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 21 Jul 2013 09:36:25 +0000
Subject: Re: [patch] virtio: console: fix error handling for debugfs_create_dir()
Message-Id: <201307211136.25989.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130719055049.GD9729@elgon.mountain>
In-Reply-To: <20130719055049.GD9729@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Saturday 20 July 2013, Dan Carpenter wrote:
> On Fri, Jul 19, 2013 at 12:28:41PM +0200, Arnd Bergmann wrote:
> > On Friday 19 July 2013, Dan Carpenter wrote:
> > > debugfs_create_dir() returns ERR_PTR(-ENODEV) if debugfs is disabled.
> > > Also my static checker doesn't like it when we print the error code, but
> > > it's always just NULL.
> > > 
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > This looks wrong.  debugfs_create_dir intentionally returns non-NULL so
> > failing to create the directory does not trigger an error condition if
> > debugfs is disabled.
> > 
> 
> Yeah.  You're right.  But the original code is still wrong and will
> oops if debugfs is disabled.  We should set the pointer to NULL if
> we get a ERR_PTR().
> 
> I will send a v2 patch.

I don't see where that oops would happen. In the code I'm looking at,
all uses of ->debugfs_dir only ever get passed into other debugfs
functions that are stubbed out to empty inline functions.

It's not the most obvious interface design, but this all seems intentional
and correct to me.

	Arnd
