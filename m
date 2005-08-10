From: Oliver Korpilla <Oliver.Korpilla@gmx.de>
Date: Wed, 10 Aug 2005 11:10:17 +0000
Subject: [KJ] Log2 all through the kernel?
Message-Id: <42F9E099.4090404@gmx.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============486102848745539=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============486102848745539==
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hello!

Upon looking for a function/macro for computing the logarithm to the 
base 2 I found multiple implementations in the kernel source 
(2.6.10-rc3), but none fitting my requirements:

* generic (will compute logarithm instead of a table lookup)
* portable (unlike e.g. ceil_log2 only in asm-alpha)

It kind of looks like everyone is reinventing the wheel with several 
implementations under differing names are within the kernel. Sometimes 
they are hardcoded (results already put in as constant), sometimes a 
lookup table is used, and several slightly different algorithms with bit 
shift are used.

Is this desirable? While it may be some reduction for special cases 
using a table (like in the log2_2048 function I found - it computes only 
a certain of log2 and multiplies this with 2048), wouldn't a more 
generic implementation like ceil_log2 and floor_log2 not be desirable 
for all platforms?

Or have I simply overlooked the right function?

Thanks and with kind regards,
Oliver Korpilla

--===============486102848745539==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============486102848745539==--
