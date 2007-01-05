From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 05 Jan 2007 15:28:59 +0000
Subject: Re: [KJ] [PATCH] kmalloc -> kzalloc conversion in Documentation
Message-Id: <Pine.LNX.4.64.0701051027310.4101@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070102130813.GA7459@unknown-00-0d-60-79-ca-00.lan>
In-Reply-To: <20070102130813.GA7459@unknown-00-0d-60-79-ca-00.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 5 Jan 2007, tom hisch wrote:

> On 1/5/07, Alexey Dobriyan <adobriyan@gmail.com> wrote:
> > On Tue, Jan 02, 2007 at 08:34:44AM -0500, Robert P. J. Day wrote:
> > > On Tue, 2 Jan 2007, Thomas Hisch wrote:
> > > > --- a/Documentation/connector/cn_test.c
> > > > +++ b/Documentation/connector/cn_test.c
> > > > @@ -124,10 +124,8 @@ static void cn_test_timer_func(unsigned long
> > __data)
> > > >     struct cn_msg *m;
> > > >     char data[32];
> > > >
> > > > -   m = kmalloc(sizeof(*m) + sizeof(data), GFP_ATOMIC);
> > > > +   m = kzalloc(sizeof(*m) + sizeof(data), GFP_ATOMIC);
> > > >     if (m) {
> > > > -           memset(m, 0, sizeof(*m) + sizeof(data));
> > > > -
> > > >             memcpy(&m->id, &cn_test_id, sizeof(m->id));
> > > >             m->seq = cn_test_timer_counter;
> > > >             m->len = sizeof(data);
> > > > diff --git a/Documentation/filesystems/configfs/configfs_example.c
> > b/Documentation/filesystems/configfs/configfs_example.c
> > > > index 2d6a14a..473433c 100644
> > > > --- a/Documentation/filesystems/configfs/configfs_example.c
> > > > +++ b/Documentation/filesystems/configfs/configfs_example.c
> > > > @@ -277,12 +277,10 @@ static struct config_item
> > *simple_children_make_item(struct config_group *group,
> > > >  {
> > > >     struct simple_child *simple_child;
> > > >
> > > > -   simple_child = kmalloc(sizeof(struct simple_child), GFP_KERNEL);
> > > > +   simple_child = kzalloc(sizeof(struct simple_child), GFP_KERNEL);
> > >
> > > while you're making changes like this, you should also change the
> > > sizeof() usage to reflect what's recommended in the CodingStyle
> > > document:
> > >
> > >       simple_child = kzalloc(sizeof(*simple_child), GFP_KERNEL);
> >
> > No, you shouldn't! This particular coding style generated a long thread
> > on l-k with folks being pro and against.
>
> ok. but this should be mentioned in the CodingStyle document, to avoid
> other patches having the same sizeof* coding style.

i don't think you're ever going to get universal agreement on this.  a
while back, i was told (in no uncertain terms) that if i *didn't* add
that cleanup to a patch i was submitting, that patch would be dropped.

and today, it appears that, if that cleanup *is* added, the subsequent
patch will be rejected in some circumstances.

go figure.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
