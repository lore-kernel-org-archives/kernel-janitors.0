From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 21 Oct 2019 19:00:34 +0000
Subject: sysfs.txt: Checking the documentation status for the directory layout
Message-Id: <5781c1ca-1558-48f0-84f1-678985832eed@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-doc@vger.kernel.org, netdev@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Nicholas Mc Guire <hofrat@osadl.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hello,

I have taken another look also at this text file.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/filesystems/sysfs.txt?id=a6fcdcd94927a1b24dea6a9951ffa7c64545ecfb#n276

The following information is provided at the moment.

…
Top Level Directory Layout
~~~~~~~~~~~~~~~~~~~~~~~~~~

The sysfs directory arrangement exposes the relationship of kernel
data structures.
…
firmware/
net/
fs/
…
TODO: Finish this section.
…


The directory “/sys/net” is not listed on my Linux 5.x system.
Will this documentation get an update?

Regards,
Markus
