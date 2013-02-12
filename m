From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Feb 2013 11:26:18 +0000
Subject: Re: Preparing btier for kernel inclusion
Message-Id: <20130212112618.GO4937@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5119FBC9.7030308@gmail.com>
In-Reply-To: <5119FBC9.7030308@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Feb 12, 2013 at 11:09:00AM +0100, Mark Ruijter wrote:
> 
> Hi Dan,
> 
> Thanks for your elaborate and fast response.
> I will change things as suggested and get back afterwards.
> 
> On quick question about indenting:
> Is there a set of options to indent that can produce indented code
> that is acceptable?
> Like : indent -npro -kr -i8 -ts8 -sob -l80 -ss -ncs -cp1 *.c
> 
> Or is manual labour a requirement? ;-)

Don't look for shortcuts.  Just go through it manually and rewrite
every function slightly.

Starting from the top with tier_sysfs_init().  Change it to:

static int tier_sysfs_init(struct tier_device *dev)
{
	return sysfs_create_group(&disk_to_dev(dev->gd)->kobj,
				  &tier_attribute_group);
}

Next function read_device_magic():

1) Use sizeof(*dmagic) instead of sizeof(struct devicemagic).  This
   means we don't have to look up how "struct devicemagic" and
   *dmagic are related.
2) There is no error handling for the kzalloc().
3) Space after comma in "dev,count".
4) The "(char *)dmagic" cast is ugly.  tier_file_read() should take
   a void pointer instead of a char pointer.
5) Use sizeof(*dmagic) instead of sizoef(struct devicemagic) again.
6) The call to tier_file_read() is less than 80 characters long so
   it can fit on one line.
7) Why does the call to tier_file_read() not have error handling?
8) tier_file_read() should take a pointer to dev->backdev[count]
   instead of count.  It's ugly how count is passed to the lowest
   levels.

Just do it slowly and methodically.  There is about 40 hours of
cleanup here before it can go for review to the block dev people.
If that seems like a lot, then you might want to ask the block
layer people to review the idea and see if it's worth investing the
time to tidy up the code.

Btw, my thinking is that after cleanup you should send this directly
to the block dev people instead of trying to merge it through
staging.  When it's in staging then it's mostly Greg KH and I who
review those patches.  I'm not able to review block layer code
properly and that's where the more important and difficult review
will happen.

regards,
dan carpenter
