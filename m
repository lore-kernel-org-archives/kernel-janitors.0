From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 08 Jul 2004 23:08:05 +0000
Subject: [Kernel-janitors] saa7146_i2c.c::my_wait() (msleep)
Message-Id: <40EDD3D5.70805@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30741447399755462=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============30741447399755462==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Here is the first (well, really the second after DVB) of a sequence of 
issues with my msleep() conversion process:

While trying to converte /drivers/media/common/saa7146_i2c.c::my_wait() 
to msleep(), I'm kind of stumped by the conversion being done on the 
input parameter (called ms, but I'm not sure if that means it is 
actually in milliseconds):

	((((ms + 10) / 10) * HZ) / 1000)

This seems to lead to some weird conversions...

Is that right? What is really desired there? Basically I want to know 
what I should send in to msleep, i.e. the corresponding value in 
milliseconds. Looking through the code, my_wait() is only called with 
SAA_1746_DELAY (5), 1 and 10. Are those the corresponding values in ms?

Any help would be appreciated.

-Nish

--===============30741447399755462==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30741447399755462==--
