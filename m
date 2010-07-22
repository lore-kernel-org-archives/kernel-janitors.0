From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Thu, 22 Jul 2010 18:16:30 +0000
Subject: Re: [PATCH 3/3] Correct: fix staging/spectra: don't use locked_ioctl
Message-Id: <AANLkTik7E7JTwTq_tK7b05h6U7tX8a76WWQRdWifLNlx@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278734855.1725.52.camel@lenovo>
In-Reply-To: <1278734855.1725.52.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Thu, Jul 22, 2010 at 1:58 PM, Greg KH <greg@kroah.com> wrote:
>> +     lock_kernel();
>
> No, we are trying to get rid of the lock_kernel() calls, care to just
> make this a local lock instead?
>

Since I'm not the driver author I thought that the idea of moving the
BKL from block ioctl to the driver code would be a first step to get
rid of the lock_kernel() call.

This patch at least could make the driver compile again and someone
who better understands the driver code could make a finner (local)
lock.

But I will figure out what needs to be protect and send a new patch
that uses some sincronization primitive to make a local lock.

Thanks a lot.

-----------------------------------------
Javier Martínez Canillas
+595 981 88 66 58
