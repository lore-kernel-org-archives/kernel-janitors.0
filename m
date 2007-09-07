From: Andre Haupt <andre@finow14.de>
Date: Fri, 07 Sep 2007 13:18:21 +0000
Subject: large patches
Message-Id: <20070907131821.GA14711@ahaupt-debian-vm.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

I have a driver (drivers/atm/iphase.*) which i try to get in conformance
with CodingStyle. I started by fixing whitespace issues (by hand). The resulting
patch is about 177 kB because those whitespace issues appear on every
single line of the original file.
Is it ok to send this large patch to kernel-janitors and lkml?

BTW, this driver has *LOTS* of additional style problems. All kinds of
mixed indentation to name one.

I wonder how this driver made it into the kernel even though maintainers
usually insist on CodingStyle.

regards,

Andre
