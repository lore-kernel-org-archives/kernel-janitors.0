From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 08 Jul 2004 23:52:17 +0000
Subject: [Kernel-janitors] sb1000.c::nicedelay() (msleep)
Message-Id: <40EDDE31.2090301@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34736341188510478=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============34736341188510478==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

So, this function (drivers/net/sb1000.c::nicedelay()) takes as parameter 
some value in usecs (which is also the name of the parameter). Then, it 
sleeps for 1 second (schedule_timeout(HZ)) regardless of the parameter. 
Is this desired? If so, I will replace the calls (all 3 of them) with 
msleep(). Or, should the passed in values (60000, 30000 and 200000) 
actually be being used and not ignored? Thanks.

-Nish

--===============34736341188510478==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34736341188510478==--
