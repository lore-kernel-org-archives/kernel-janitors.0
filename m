From: "FarSite Support" <support@farsite.co.uk>
Date: Fri, 16 Jul 2004 10:01:42 +0000
Subject: [Kernel-janitors] RE: no set_current_state() before
Message-Id: <7C078C66B7752B438B88E11E5E20E72EE13F1F@general.hq.farsitecommunications.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73258566255197599=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <40F42291.5010202@us.ibm.com>
In-Reply-To: <40F42291.5010202@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============73258566255197599==
content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 8bit

Hi,
	sorry for the delay in responding to this e-mail, I have been
out of the office for a couple of days.

	In answer to your question TASK_UNINTERRUPTIBLE would be
appropriate for this call.  Thank you for pointing it out.  I assume
that you will be making the change in the Kernel source tree.


Kind Regards

Kevin Curtis
Linux Development
FarSite Communications Ltd
http://www.farsite.co.uk
tel:  +44 1256 330461
fax:  +44 1256 854931

-----Original Message-----
From: Nishanth Aravamudan [mailto:nacc@us.ibm.com] 
Sent: 13 July 2004 18:21
To: kevin.curtis@farsite.co.uk
Cc: kernel-janitors@lists.osdl.org
Subject: no set_current_state() before schedule_timeout()


Hi,

In continuing to replace, where appropriate, code with msleep() calls, I

ran across the following file(s) / function(s), which do not invoke 
set_current_state() before schedule_timeout(), which causes the latter 
to return immediately:

drivers/net/wan/farsync.c::fst_issue_cmd()

If someone could tell me which state (TASK_INTERRUPTIBLE or 
TASK_UNINTERRUPTIBLE) is desired, I can fix this and perhaps replace the

calls with msleep().

Thanks,
Nish



--===============73258566255197599==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73258566255197599==--
