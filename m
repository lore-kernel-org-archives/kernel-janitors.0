From: "Luis R. Rodriguez" <mcgrof@suse.com>
Date: Fri, 29 May 2015 16:52:52 +0000
Subject: Re: firmware: fix possible use after free on name on asynchronous request
Message-Id: <20150529165252.GB23057@wotan.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150528090227.GA13248@mwanda>
In-Reply-To: <20150528090227.GA13248@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, May 29, 2015 at 09:24:39AM +0200, walter harms wrote:
> 
> 
> Am 29.05.2015 02:45, schrieb Luis R. Rodriguez:
> > On Thu, May 28, 2015 at 12:02:27PM +0300, Dan Carpenter wrote:
> >> Hello Luis R. Rodriguez,
> >>
> >> The patch f9692b2699bd: "firmware: fix possible use after free on
> >> name on asynchronous request" from May 12, 2015, leads to the
> >> following static checker warning:
> >>
> >> 	drivers/base/firmware_class.c:1311 request_firmware_nowait()
> >> 	warn: possible memory leak of 'fw_work'
> >>
> >> drivers/base/firmware_class.c
> >>   1296  int
> >>   1297  request_firmware_nowait(
> >>   1298          struct module *module, bool uevent,
> >>   1299          const char *name, struct device *device, gfp_t gfp, void *context,
> >>   1300          void (*cont)(const struct firmware *fw, void *context))
> >>   1301  {
> >>   1302          struct firmware_work *fw_work;
> >>   1303  
> >>   1304          fw_work = kzalloc(sizeof(struct firmware_work), gfp);
> >>   1305          if (!fw_work)
> >>   1306                  return -ENOMEM;
> >>   1307  
> >>   1308          fw_work->module = module;
> >>   1309          fw_work->name = kstrdup_const(name, gfp);
> >>   1310          if (!fw_work->name)
> >>
> >> kfree(fw_work).
> >>
> >>   1311                  return -ENOMEM;
> >>   1312          fw_work->device = device;
> >>   1313          fw_work->context = context;
> >>   1314          fw_work->cont = cont;
> >>   1315          fw_work->opt_flags = FW_OPT_NOWAIT | FW_OPT_FALLBACK |
> >>   1316                  (uevent ? FW_OPT_UEVENT : FW_OPT_USERHELPER);
> >>   1317  
> >>   1318          if (!try_module_get(module)) {
> >>   1319                  kfree_const(fw_work->name);
> >>   1320                  kfree(fw_work);
> >>   1321                  return -EFAULT;
> >>   1322          }
> >>   1323  
> >>   1324          get_device(fw_work->device);
> >>   1325          INIT_WORK(&fw_work->work, request_firmware_work_func);
> >>   1326          schedule_work(&fw_work->work);
> >>   1327          return 0;
> >>   1328  }
> > 
> > Bleh, thanks, I'm submitting this next:
> > 
> >>From 30da66c4bb1da33f1a789099e4b02e479332f4a2 Mon Sep 17 00:00:00 2001
> > From: "Luis R. Rodriguez" <mcgrof@suse.com>
> > Date: Thu, 28 May 2015 17:43:30 -0700
> > Subject: [PATCH] firmware: add missing kfree for work on async call
> > 
> > The recent fix to use kstrdup_const() failed to add a
> > kfree upon failure of name allocation...
> > 
> > Cc: Ming Lei <ming.lei@canonical.com>
> > Cc: Seth Forshee <seth.forshee@canonical.com>
> > Cc: Kyle McMartin <kyle@kernel.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Luis R. Rodriguez <mcgrof@suse.com>
> > ---
> >  drivers/base/firmware_class.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/base/firmware_class.c b/drivers/base/firmware_class.c
> > index 8c3aa3c..9c42883 100644
> > --- a/drivers/base/firmware_class.c
> > +++ b/drivers/base/firmware_class.c
> > @@ -1307,8 +1307,10 @@ request_firmware_nowait(
> >  
> >  	fw_work->module = module;
> >  	fw_work->name = kstrdup_const(name, gfp);
> > -	if (!fw_work->name)
> > +	if (!fw_work->name) {
> > +		kfree(fw_work);
> >  		return -ENOMEM;
> > +	}
> >  	fw_work->device = device;
> >  	fw_work->context = context;
> >  	fw_work->cont = cont;
> 
> 
> Hi Luis,
> if it is possible to change firmware_work
> and make char *name a name[] you could alloc via.
> 
> kzalloc(sizeof(struct firmware_work)+strlen(name)+1, gfp);
> 
> perhaps that zero length can make thinks more easy.
> (at least you need only one free).

Indeed, that is how we used to condify this but this was recently changed since
we will be using two strings within the struct, since we have a slab cache
for file names though its then best to just use that as other filesystem
code does as well. By using kstrdup_const() we then also get the gain
to not have to allocate anything if the caller did the right thing to
use .rodata on the kernel.

  Luis
