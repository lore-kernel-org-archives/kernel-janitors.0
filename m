From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Thu, 26 Sep 2013 03:48:28 +0000
Subject: Re: checkpatch guide for newbies
Message-Id: <20130926034828.GJ13318@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAErSpo5XgvuG=75nExa7yCa7C+Bxhk+1LwruxY8pv2DU+r-_aA@mail.gmail.com>
 <5241CB44.8080004@ahsoftware.de>
 <CA+MoWDpnNjeEN+Crzh2kQ7DPJ_DqEOP4z-9n3=EqP7hiPgZRXg@mail.gmail.com>
 <CAErSpo4X0-PEYtZrY2r4GKmzTJhHK3eKdXrbccJhB7wVkVCYLA@mail.gmail.com>
 <52420DF1.7060108@ahsoftware.de>
 <20130926021130.GD13318@ZenIV.linux.org.uk>
 <5243A165.2060204@ahsoftware.de>
 <5243A29C.6080009@ahsoftware.de>
 <20130926030448.GG13318@ZenIV.linux.org.uk>
 <5243A993.9070108@ahsoftware.de>
In-Reply-To: <5243A993.9070108@ahsoftware.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Holler <holler@ahsoftware.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Sep 26, 2013 at 05:27:15AM +0200, Alexander Holler wrote:

> Oh, personally I don't have any limit there. ;) I like descriptive
> function and variable names whenever they make sense. And often they
> make comments uneccessary and therefor prevent errors because those
> descriptive names are visible whenever the function or variable is
> used, and comments usually appear only once and get forgotten when
> scrolled out of the screen.
> 
> But just take a function like
> 
> void get_xtime_and_monotonic_and_sleep_offset(struct timespec *xtim,
>                                 struct timespec *wtom, struct
> timespec *sleep);

Charming...  Now, try to tell one such name from another, when the
only difference is buried in the middle of long phrase.  And yes,
I've seen mistakes clearly of that origin.  Made them myself, actually.
