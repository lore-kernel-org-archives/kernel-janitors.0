From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 05 Jul 2004 17:22:50 +0000
Subject: [Kernel-janitors] Fw: [RFP] better io-apic messages
Message-Id: <20040705102250.79e0b767.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4537415404828673=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============4537415404828673==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit



Begin forwarded message:

Date: Sun, 04 Jul 2004 23:59:59 -0400
From: Jeff Garzik <jgarzik@pobox.com>
To: Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [RFP] better io-apic messages


Any janitor want to tackle this request-for-patch?  :)


There exists two problems:
a) default io-apic boot messages are quite verbose
b) io-apic bugs and anomalies are common enough that it would be nice to 
enable additional messages when the user requests them

My preferred solution is
apic=verbose -- enable verbose boot messages (seen in current kernels)
apic=debug -- enable all messages, including ones normally hidden by 
APIC_DEBUG

And the default, without any apic=xxx, would be not to show either set 
of messages.

This solution hides the messages for those who would rather not see 
them, but ensures they are available via a boot parameter when kernel 
developers wish to request additional debug info from a user.

-
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/


--
~Randy

--===============4537415404828673==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4537415404828673==--
