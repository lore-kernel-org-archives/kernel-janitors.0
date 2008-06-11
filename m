From: Boaz Harrosh <bharrosh@panasas.com>
Date: Wed, 11 Jun 2008 09:50:34 +0000
Subject: Re: [ANNOUNCE] linux-staging tree created
Message-Id: <484F9FEA.7000407@panasas.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080610190540.GA25066@kroah.com> <484F9A7B.4080004@panasas.com>
In-Reply-To: <484F9A7B.4080004@panasas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benny Halevy <bhalevy@panasas.com>
Cc: Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

Benny Halevy wrote:
> Greg,
> 
> The OSD initiator (see
> http://git.open-osd.org/gitweb.cgi?p=open-osd.git;a=summary)
> looks in principle like a great fit for linux-staging.
> 

The patches are not yet there, Benny. They are currently 
out-of-tree here:
http://git.open-osd.org/gitweb.cgi?p=osd-lib.git;a=summary

It will take me until end of next week to separate them into
a consumable patchset. Which will also move them in-tree.
 
> What would be the mechanics of including it?
> 

I want to send them to linux-scsi-ml and also To: Greg KH
Requesting to be included in "linux-staging tree". Is that
sufficient?

> Benny
> 

Boaz

> On Jun. 10, 2008, 22:05 +0300, Greg KH <greg@kroah.com> wrote:
>> Oh great, not yet-another-kernel-tree, just what the world needs...
>>
>> Yes, this is an announcement of a new kernel tree, linux-staging.  It is
>> a quilt series of patches that can be found at:
>> 	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
>>
>>
<snip>

