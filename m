From: Greg KH <gregkh@linuxfoundation.org>
Date: Sat, 17 Jan 2015 23:54:58 +0000
Subject: Re: lustre/lnet/lnet/lib-move.c: memcpy with (struct iovec*)->iov_base, which is __user
Message-Id: <20150117235458.GA23280@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CANZNk80SoQZU994psVKuuGRGGHnGgO7bcFpPBQoGyg=CjW77xw@mail.gmail.com>
 <20150107083654.GK15033@mwanda>
 <D0D2667E.D2C25%andreas.dilger@intel.com>
 <CANZNk83Y5T75H86VZ4dMVigPiaVADZB60yc6QWWCWdJ=SdT+sQ@mail.gmail.com>
In-Reply-To: <CANZNk83Y5T75H86VZ4dMVigPiaVADZB60yc6QWWCWdJ=SdT+sQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: "Dilger, Andreas" <andreas.dilger@intel.com>, OSUOSL Drivers <devel@driverdev.osuosl.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Drokin, Oleg" <oleg.drokin@intel.com>, "HPDD-discuss@ml01.01.org" <HPDD-discuss@ml01.01.org>, Dan Carpenter <dan.carpenter@oracle.com>

On Wed, Jan 07, 2015 at 02:28:12PM +0200, Andrey Utkin wrote:
> 2015-01-07 13:32 GMT+02:00 Dilger, Andreas <andreas.dilger@intel.com>:
> > On 2015/01/07, 1:36 AM, "Dan Carpenter" <dan.carpenter@oracle.com> wrote:
> >> Didn't Al change these to kvec instead of iovec?  You have to look at
> >> the callers to figure out if it's actually a user space pointer or a
> >> kernel pointer.
> >
> > A patch was sent by Al on Dec 2 to replace iovec with kvec, in a thread
> > titled "[PATCH] staging:lustre:lnet: Incorrect type in assignment".  Greg
> > replied on Dec 10 in another thread (also fixing this same warning) titled
> > "[PATCH] staging: lustre: Fix the warning messages about casting without
> > __user macro" that Al's patch was in the staging tree for 3.19-rc1.
> 
> In current linux-next, I see none of the mentioned patches. Also I
> don't see them mentioned in GKH's merge commit "Merge tag
> 'staging-3.19-rc1'..."
> Is it ok?

Al's patch is now merged.
