From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 29 May 2008 16:19:19 +0000
Subject: TODO: Converting drivers to use request_firmware()
Message-Id: <1212077959.26088.86.camel@shinybook.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

One of the reasons we haven't yet converted all drivers to use
request_firmware() is because it would have forced people to use an
initrd or udev in some cases where it wouldn't have been necessary
before.

At git.infradead.org/users/dwmw2/firmware-2.6.git I've fixed that, by
adding support for including firmware files directly in the kernel
image, and letting request_firmware() find them there.

So now it would be useful for people to help out by finding drivers
which have their firmware built in by some other means, and converting
them to use request_firmware() instead. 

A convenient list of such drivers can be found at
http://www.fsfla.org/svn/fsfla/software/linux-libre/scripts/deblob-2.6.25 -- although a few of those seem to be false positives; the two 'offending' video drivers, at least, seem to be just a table of {register,value} settings for initialisation.

For now, we're converting the firmware to ihex files in the firmware/
directory -- I'm hoping to move the entire firmware/ directory out into
a separate tarball at some point in the future.

If anyone feels like following the examples in the above git tree and
cleaning up some extra drivers, that would be greatly appreciated.

-- 
dwmw2

