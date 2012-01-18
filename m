From: Asim <linkasim@gmail.com>
Date: Wed, 18 Jan 2012 04:15:05 +0000
Subject: busy loops in kernel
Message-Id: <CAFTXME+fNAqqZjO4oRmbwt2cFbaDgbLW9gg94tzJvF4bwy7DtQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

I was just wanted to send a message to janitors -

We've identified a set of busy loops, waiting on hardware in the Linux
kernel. These are perhaps not the best way to wait for a device to
become ready and can occasionally freeze the system. These need to be
fixed by adding timeouts (for example by using rdtscll to wait for 2
clock cycles).

The list is here => http://pages.cs.wisc.edu/~kadav/busy_waits.txt  I
have added some caveats to be on the safe side. I will also add/update
this list as time passes by and as these are fixed (or as I identify
more).

Thanks,
Asim
