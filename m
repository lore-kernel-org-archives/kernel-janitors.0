From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 13 Jul 2004 17:51:05 +0000
Subject: [Kernel-janitors] no set_current_state() before schedule_timeout()
Message-Id: <40F42109.8050304@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3184260970582482=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <40F41170.7030605@us.ibm.com>
In-Reply-To: <40F41170.7030605@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============3184260970582482==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

In continuing to replace, where appropriate, code with msleep() calls, I 
ran across the following file(s) / function(s), which do not invoke 
set_current_state() before schedule_timeout(), which causes the latter 
to return immediately:

drivers/usb/gadget/pxa2xx_udc.c::udc_enable()

If someone could tell me which state (TASK_INTERRUPTIBLE or 
TASK_UNINTERRUPTIBLE) is desired, I can fix this and perhaps replace the 
calls with msleep().

Thanks,
Nish

--===============3184260970582482==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3184260970582482==--
