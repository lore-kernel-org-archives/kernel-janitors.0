From: Markus Lidel <Markus.Lidel@shadowconnect.com>
Date: Wed, 22 Sep 2004 09:58:53 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 2/4] message/exec-osm:
Message-Id: <41514CDD.7080907@shadowconnect.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42364075875388085=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916234647.GI1777@us.ibm.com>
In-Reply-To: <20040916234647.GI1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============42364075875388085==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Nishanth Aravamudan wrote:
> Any comments would be appreciated.
> Description: Use msleep_interruptible() instead of schedule_timeout()
> to guarantee the task delays as expected.

Thank you very much!

Have changed it.



Best regards,


Markus Lidel
------------------------------------------
Markus Lidel (Senior IT Consultant)

Shadow Connect GmbH
Carl-Reisch-Weg 12
D-86381 Krumbach
Germany

Phone:  +49 82 82/99 51-0
Fax:    +49 82 82/99 51-11

E-Mail: Markus.Lidel@shadowconnect.com
URL:    http://www.shadowconnect.com

--===============42364075875388085==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42364075875388085==--
